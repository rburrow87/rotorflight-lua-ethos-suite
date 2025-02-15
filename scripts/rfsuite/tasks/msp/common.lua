--[[
 * Copyright (C) Rotorflight Project
 *
 * License GPLv3: https://www.gnu.org/licenses/gpl-3.0.en.html
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * Note: Some icons have been sourced from https://www.flaticon.com/
]] -- Protocol constants
local MSP_VERSION = (1 << 5)
local MSP_STARTFLAG = (1 << 4)

-- Sequence number for next MSP packet
local mspSeq = 0
local mspRemoteSeq = 0
local mspRxBuf = {}
local mspRxError = false
local mspRxSize = 0
local mspRxCRC = 0
local mspRxReq = 0
local mspStarted = false
local mspLastReq = 0
local mspTxBuf = {}
local mspTxIdx = 1
local mspTxCRC = 0

local function deepCopy(original)
    if type(original) ~= "table" then return original end
    local copy = {}
    for key, value in pairs(original) do copy[deepCopy(key)] = deepCopy(value) end
    return setmetatable(copy, getmetatable(original))
end

function mspProcessTxQ()
    if #mspTxBuf == 0 then return false end

    rfsuite.utils.log("Sending mspTxBuf size " .. tostring(#mspTxBuf) .. " at Idx " .. tostring(mspTxIdx) .. " for cmd: " .. tostring(mspLastReq),"debug")

    local payload = {}
    payload[1] = mspSeq + MSP_VERSION
    mspSeq = (mspSeq + 1) & 0x0F
    if mspTxIdx == 1 then payload[1] = payload[1] + MSP_STARTFLAG end

    local i = 2
    while (i <= rfsuite.bg.msp.protocol.maxTxBufferSize) and mspTxIdx <= #mspTxBuf do
        payload[i] = mspTxBuf[mspTxIdx]
        mspTxIdx = mspTxIdx + 1
        mspTxCRC = mspTxCRC ~ payload[i]
        i = i + 1
    end

    if i <= rfsuite.bg.msp.protocol.maxTxBufferSize then
        payload[i] = mspTxCRC
        for j = i + 1, rfsuite.bg.msp.protocol.maxTxBufferSize do payload[j] = 0 end
        mspTxBuf = {}
        mspTxIdx = 1
        mspTxCRC = 0
        rfsuite.bg.msp.protocol.mspSend(payload)
        return false
    end
    rfsuite.bg.msp.protocol.mspSend(payload)
    return true
end

function mspSendRequest(cmd, payload)
    if not cmd or type(payload) ~= "table" then
        rfsuite.utils.log("Invalid command or payload","debug")
        return nil
    end
    if #mspTxBuf ~= 0 then
        rfsuite.utils.log("Existing mspTxBuf still sending, failed to send cmd: " .. tostring(cmd),"debug")
        return nil
    end
    mspTxBuf[1] = #payload
    mspTxBuf[2] = cmd & 0xFF
    for i = 1, #payload do mspTxBuf[i + 2] = payload[i] & 0xFF end
    mspLastReq = cmd
end

local function mspReceivedReply(payload)
    local idx = 1
    local status = payload[idx]
    local version = (status & 0x60) >> 5
    local start = (status & 0x10) ~= 0
    local seq = status & 0x0F
    idx = idx + 1

    if start then
        mspRxBuf = {}
        mspRxError = (status & 0x80) ~= 0
        mspRxSize = payload[idx]
        mspRxReq = mspLastReq
        idx = idx + 1
        if version == 1 then
            mspRxReq = payload[idx]
            idx = idx + 1
        end
        mspRxCRC = mspRxSize ~ mspRxReq
        if mspRxReq == mspLastReq then mspStarted = true end
    elseif not mspStarted or ((mspRemoteSeq + 1) & 0x0F) ~= seq then
        mspStarted = false
        return nil
    end

    while (idx <= rfsuite.bg.msp.protocol.maxRxBufferSize) and (#mspRxBuf < mspRxSize) do
        mspRxBuf[#mspRxBuf + 1] = payload[idx]
        mspRxCRC = mspRxCRC ~ payload[idx]
        idx = idx + 1
    end

    if idx > rfsuite.bg.msp.protocol.maxRxBufferSize then
        mspRemoteSeq = seq
        return false
    end

    mspStarted = false
    if mspRxCRC ~= payload[idx] and version == 0 then
        rfsuite.utils.log("Payload checksum incorrect, message failed!","debug")
        return nil
    end
    return true
end

function mspPollReply()
    local startTime = os.clock()
    while os.clock() - startTime < 0.1 do
        local mspData = rfsuite.bg.msp.protocol.mspPoll()
        if mspData and mspReceivedReply(mspData) then
            mspLastReq = 0
            return mspRxReq, mspRxBuf, mspRxError
        end
    end
    return nil, nil, nil
end

function mspClearTxBuf()
    mspTxBuf = {}
end
