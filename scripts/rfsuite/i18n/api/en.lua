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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Note. Some icons have been sourced from https://www.flaticon.com/
]] --

local en = {
    ACC_TRIM = {
        pitch = "Use to trim if the heli drifts in one of the stabilized modes (angle, horizon, etc.).",
        roll = "Use to trim if the heli drifts in one of the stabilized modes (angle, horizon, etc.).",
    },
    BATTERY_CONFIG = {
        batteryCapacity = "The milliamp hour capacity of your battery.",
        batteryCellCount = "The number of cells in your battery.",
        vbatmincellvoltage = "The minimum voltage per cell before the low voltage alarm is triggered.",
        vbatmaxcellvoltage = "The maximum voltage per cell before the high voltage alarm is triggered.",
        vbatfullcellvoltage = "The nominal voltage of a fully charged cell.",
        vbatwarningcellvoltage = "The voltage per cell at which the low voltage alarm will start to sound.",
    },
    ESC_SENSOR_CONFIG  = {
        half_duplex = "Half duplex mode for ESC telemetry",
        update_hz = "ESC telemetry update rate",
        current_offset = "Current sensor offset adjustment",
        hw4_current_offset = "Hobbywing v4 current offset adjustment",
        hw4_current_gain = "Hobbywing v4 current gain adjustment",
        hw4_voltage_gain = "Hobbywing v4 voltage gain adjustment",
        pin_swap = "Swap the TX and RX pins for the ESC telemetry",
        voltage_correction = "Adjust the voltage correction",
        current_correction = "Adjust current correction",
        consumption_correction = "Adjust the consumption correction",
        tbl_on = "On",
        tbl_off = "Off",
    },
    FILTER_CONFIG = {
        gyro_lpf1_static_hz = "Lowpass filter cutoff frequency in Hz.",
        gyro_lpf2_static_hz = "Lowpass filter cutoff frequency in Hz.",
        gyro_soft_notch_hz_1 = "Center frequency to which the notch is applied.",
        gyro_soft_notch_cutoff_1 = "Width of the notch filter in Hz.",
        gyro_soft_notch_hz_2 = "Center frequency to which the notch is applied.",
        gyro_soft_notch_cutoff_2 = "Width of the notch filter in Hz.",
        gyro_lpf1_dyn_min_hz = "Dynamic filter min cutoff in Hz.",
        gyro_lpf1_dyn_max_hz = "Dynamic filter max cutoff in Hz.",
        dyn_notch_count = "Number of notches to apply.",
        dyn_notch_q = "Quality factor of the notch filter.",
        dyn_notch_min_hz = "Minimum frequency to which the notch is applied.",
        dyn_notch_max_hz = "Maximum frequency to which the notch is applied.",
        rpm_min_hz = "Minimum frequency for the RPM filter.",
        tbl_none = "NONE",
        tbl_1st = "1ST",
        tbl_2nd = "2ND",
        tbl_custom = "CUSTOM",
        tbl_low = "LOW",     
        tbl_medium = "MEDIUM",
        tbl_high = "HIGH",       
    },
    GOVERNOR_CONFIG = {
        gov_startup_time = "Time constant for slow startup, in seconds, measuring the time from zero to full headspeed.",
        gov_spoolup_time = "Time constant for slow spoolup, in seconds, measuring the time from zero to full headspeed.",
        gov_tracking_time = "Time constant for headspeed changes, in seconds, measuring the time from zero to full headspeed.",
        gov_recovery_time = "Time constant for recovery spoolup, in seconds, measuring the time from zero to full headspeed.",
        gov_handover_throttle = "Governor activates above this %. Below this the input throttle is passed to the ESC.",
        gov_spoolup_min_throttle = "Minimum throttle to use for slow spoolup, in percent. For electric motors the default is 5%, for nitro this should be set so the clutch starts to engage for a smooth spoolup 10-15%.",           
        tbl_govmode_off = "OFF", 
        tbl_govmode_passthrough = "PASSTHROUGH", 
        tbl_govmode_standard = "STANDARD", 
        tbl_govmode_mode1 = "MODE1", 
        tbl_govmode_mode2 = "MODE2",
    },
    GOVERNOR_PROFILE = {
        governor_headspeed = "Target headspeed for the current profile.",
        governor_gain = "Master PID loop gain.",
        governor_p_gain = "PID loop P-term gain.",
        governor_i_gain = "PID loop I-term gain.",
        governor_d_gain = "PID loop D-term gain.",
        governor_f_gain = "Feedforward gain.",
        governor_tta_gain = "TTA gain applied to increase headspeed to control the tail in the negative direction (e.g. motorised tail less than idle speed).",
        governor_tta_limit = "TTA max headspeed increase over full headspeed.",
        governor_yaw_ff_weight = "Yaw precompensation weight - how much yaw is mixed into the feedforward.",
        governor_cyclic_ff_weight = "Cyclic precompensation weight - how much cyclic is mixed into the feedforward.",
        governor_collective_ff_weight = "Collective precompensation weight - how much collective is mixed into the feedforward.",
        governor_max_throttle = "Maximum output throttle the governor is allowed to use.",
        governor_min_throttle = "Minimum output throttle the governor is allowed to use."            
    },
    MIXER_CONFIG = {
        tail_motor_idle = "Minimum throttle signal sent to the tail motor. This should be set just high enough that the motor does not stop.",
        tail_center_trim = "Sets tail rotor trim for 0 yaw for variable pitch, or tail motor throttle for 0 yaw for motorized.",
        swash_phase = "Phase offset for the swashplate controls.",
        swash_pitch_limit = "Maximum amount of combined cyclic and collective blade pitch.",
        swash_trim_0 = "Swash trim to level the swash plate when using fixed links.",
        swash_trim_1 = "Swash trim to level the swash plate when using fixed links.",
        swash_trim_2 = "Swash trim to level the swash plate when using fixed links.",
        swash_tta_precomp = "Mixer precomp for 0 yaw.",
        swash_geo_correction = "Adjust if there is too much negative collective or too much positive collective.",
        collective_tilt_correction_pos = "Adjust the collective tilt correction scaling for positive collective pitch.",
        collective_tilt_correction_neg = "Adjust the collective tilt correction scaling for negative collective pitch.",    
        tbl_cw = "CW",
        tbl_ccw = "CCW",        
    },
    MOTOR_CONFIG = {
        minthrottle = "This PWM value is sent to the ESC/Servo at low throttle",
        maxthrottle = "This PWM value is sent to the ESC/Servo at full throttle",
        mincommand = "This PWM value is sent when the motor is stopped",
        motor_pwm_protocol = "The protocol used to communicate with the ESC",
        motor_pwm_rate = "The frequency at which the ESC sends PWM signals to the motor",
        motor_pole_count_0 = "The number of magnets on the motor bell.",
        main_rotor_gear_ratio_0 = "Motor Pinion Gear Tooth Count",
        main_rotor_gear_ratio_1 = "Main Gear Tooth Count",
        tail_rotor_gear_ratio_0 = "Tail Gear Tooth Count",
        tail_rotor_gear_ratio_1 = "Autorotation Gear Tooth Count"            
    },
    PID_PROFILE = {
        error_decay_time_ground = "Bleeds off the current controller error when the craft is not airborne to stop the craft tipping over.",
        error_decay_time_cyclic = "Time constant for bleeding off cyclic I-term. Higher will stabilize hover, lower will drift.",
        error_decay_limit_cyclic = "Maximum bleed-off speed for cyclic I-term.",
        error_rotation = "Rotates the current roll and pitch error terms around yaw when the craft rotates. This is sometimes called Piro Compensation.",
        error_limit_0 = "Hard limit for the angle error in the PID loop. The absolute error and thus the I-term will never go above these limits.",
        error_limit_1 = "Hard limit for the angle error in the PID loop. The absolute error and thus the I-term will never go above these limits.",
        error_limit_2 = "Hard limit for the angle error in the PID loop. The absolute error and thus the I-term will never go above these limits.",
        gyro_cutoff_0 = "PID loop overall bandwidth in Hz.",
        gyro_cutoff_1 = "PID loop overall bandwidth in Hz.",
        gyro_cutoff_2 = "PID loop overall bandwidth in Hz.",
        dterm_cutoff_0 = "D-term cutoff in Hz.",
        dterm_cutoff_1 = "D-term cutoff in Hz.",
        dterm_cutoff_2 = "D-term cutoff in Hz.",
        iterm_relax_type = "Choose the axes in which this is active. RP: Roll, Pitch. RPY: Roll, Pitch, Yaw.",
        iterm_relax_cutoff_0 = "Helps reduce bounce back after fast stick movements. Can cause inconsistency in small stick movements if too low.",
        iterm_relax_cutoff_1 = "Helps reduce bounce back after fast stick movements. Can cause inconsistency in small stick movements if too low.",
        iterm_relax_cutoff_2 = "Helps reduce bounce back after fast stick movements. Can cause inconsistency in small stick movements if too low.",
        yaw_cw_stop_gain = "Stop gain (PD) for clockwise rotation.",
        yaw_ccw_stop_gain = "Stop gain (PD) for counter-clockwise rotation.",
        yaw_precomp_cutoff = "Frequency limit for all yaw precompensation actions.",
        yaw_cyclic_ff_gain = "Cyclic feedforward mixed into yaw (cyclic-to-yaw precomp).",
        yaw_collective_ff_gain = "Collective feedforward mixed into yaw (collective-to-yaw precomp).",
        yaw_collective_dynamic_gain = "An extra boost of yaw precomp on collective input.",
        yaw_collective_dynamic_decay = "Decay time for the extra yaw precomp on collective input.",
        pitch_collective_ff_gain = "Increasing will compensate for the pitching up motion caused by tail drag when climbing.",
        angle_level_strength = "Determines how aggressively the helicopter tilts back to level while in Angle Mode.",
        angle_level_limit = "Limit the maximum angle the helicopter will pitch/roll to while in Angle mode.",
        horizon_level_strength = "Determines how aggressively the helicopter tilts back to level while in Horizon Mode.",
        trainer_gain = "Determines how aggressively the helicopter tilts back to the maximum angle (if exceeded) while in Acro Trainer Mode.",
        trainer_angle_limit = "Limit the maximum angle the helicopter will pitch/roll to while in Acro Trainer Mode.",
        cyclic_cross_coupling_gain = "Amount of compensation applied for pitch-to-roll decoupling.",
        cyclic_cross_coupling_ratio = "Amount of roll-to-pitch compensation needed, vs. pitch-to-roll.",
        cyclic_cross_coupling_cutoff = "Frequency limit for the compensation. Higher value will make the compensation action faster.",
        offset_limit_0 = "Hard limit for the High Speed Integral offset angle in the PID loop. The O-term will never go over these limits.",
        offset_limit_1 = "Hard limit for the High Speed Integral offset angle in the PID loop. The O-term will never go over these limits.",
        bterm_cutoff_0 = "B-term cutoff in Hz.",
        bterm_cutoff_1 = "B-term cutoff in Hz.",
        bterm_cutoff_2 = "B-term cutoff in Hz.",
        yaw_inertia_precomp_gain = "Scalar gain. The strength of the main rotor inertia. Higher value means more precomp is applied to yaw control.",
        yaw_inertia_precomp_cutoff = "Cutoff. Derivative cutoff frequency in 1/10Hz steps. Controls how sharp the precomp is. Higher value is sharper.",
        tbl_off = "OFF",
        tbl_on = "ON",
        tbl_rp = "RP",
        tbl_rpy = "RPY",           
    },
    PID_TUNING = {
        pid_0_P = "How tightly the system tracks the desired setpoint.",
        pid_0_I = "How tightly the system holds its position.",
        pid_0_D = "Strength of dampening to any motion on the system, including external influences. Also reduces overshoot.",
        pid_0_F = "Helps push P-term based on stick input. Increasing will make response more sharp, but can cause overshoot.",
    
        pid_1_P = "How tightly the system tracks the desired setpoint.",
        pid_1_I = "How tightly the system holds its position.",
        pid_1_D = "Strength of dampening to any motion on the system, including external influences. Also reduces overshoot.",
        pid_1_F = "Helps push P-term based on stick input. Increasing will make response more sharp, but can cause overshoot.",
    
        pid_2_P = "How tightly the system tracks the desired setpoint.",
        pid_2_I = "How tightly the system holds its position.",
        pid_2_D = "Strength of dampening to any motion on the system, including external influences. Also reduces overshoot.",
        pid_2_F = "Helps push P-term based on stick input. Increasing will make response more sharp, but can cause overshoot.",
    
        pid_0_B = "Additional boost on the feedforward to make the heli react more to quick stick movements.",
        pid_1_B = "Additional boost on the feedforward to make the heli react more to quick stick movements.",
        pid_2_B = "Additional boost on the feedforward to make the heli react more to quick stick movements.",
    
        pid_0_O = "Used to prevent the craft from rolling when using high collective.",
        pid_1_O = "Used to prevent the craft from pitching when using high collective."           
    },
    RC_CONFIG = {
        rc_center = "Stick center in microseconds (us).",
        rc_deflection = "Stick deflection from center in microseconds (us).",
        rc_arm_throttle = "Throttle must be at or below this value in microseconds (us) to allow arming. Must be at least 10us lower than minimum throttle.",
        rc_min_throttle = "Minimum throttle (0% throttle output) expected from radio, in microseconds (us).",
        rc_max_throttle = "Maximum throttle (100% throttle output) expected from radio, in microseconds (us).",
        rc_deadband = "Deadband for cyclic control in microseconds (us).",
        rc_yaw_deadband = "Deadband for yaw control in microseconds (us)."           
    },
    RC_TUNING = {
        response_time_1 = "Increase or decrease the response time of the rate to smooth heli movements.",
        accel_limit_1 = "Maximum acceleration of the craft in response to a stick movement.",
        response_time_2 = "Increase or decrease the response time of the rate to smooth heli movements.",
        accel_limit_2 = "Maximum acceleration of the craft in response to a stick movement.",
        response_time_3 = "Increase or decrease the response time of the rate to smooth heli movements.",
        accel_limit_3 = "Maximum acceleration of the craft in response to a stick movement.",
        response_time_4 = "Increase or decrease the response time of the rate to smooth heli movements.",
        accel_limit_4 = "Maximum acceleration of the craft in response to a stick movement."
    },
    RESCUE_PROFILE = {
        rescue_flip_mode = "If rescue is activated while inverted, flip to upright - or remain inverted.",
        rescue_flip_gain = "Determine how aggressively the heli flips during inverted rescue.",
        rescue_level_gain = "Determine how aggressively the heli levels during rescue.",
        rescue_pull_up_time = "When rescue is activated, helicopter will apply pull-up collective for this time period before moving to flip or climb stage.",
        rescue_climb_time = "Length of time the climb collective is applied before switching to hover.",
        rescue_flip_time = "If the helicopter is in rescue and is trying to flip to upright and does not within this time, rescue will be aborted.",
        rescue_exit_time = "This limits rapid application of negative collective if the helicopter has rolled during rescue.",
        rescue_pull_up_collective = "Collective value for pull-up climb.",
        rescue_climb_collective = "Collective value for rescue climb.",
        rescue_hover_collective = "Collective value for hover.",
        rescue_max_setpoint_rate = "Limit rescue roll/pitch rate. Larger helicopters may need slower rotation rates.",
        rescue_max_setpoint_accel = "Limit how fast the helicopter accelerates into a roll/pitch. Larger helicopters may need slower acceleration.",
        tbl_off = "OFF",
        tbl_on = "ON",
        tbl_flip = "FLIP",
        tbl_noflip = "NO FLIP",            
    },
    ESC_PARAMETERS_FLYROTOR = {
        throttle_min = "Minimum throttle value",
        throttle_max = "Maximum throttle value",
        cell_count = "Number of cells in the battery",
        low_voltage_protection = "Voltage at which we cut power by 50%",
        temperature_protection = "Temperature at which we cut power by 50%",
        timing_angle = "Timing angle for the motor",
        starting_torque = "Starting torque for the motor",
        response_speed = "Response speed for the motor",
        buzzer_volume = "Buzzer volume",
        current_gain = "Gain value for the current sensor",
        soft_start = "Soft start value",
        gov_p = "Proportional value for the governor",
        gov_i = "Integral value for the governor",
        gov_d = "Derivative value for the governor",
        motor_erpm_max = "Maximum RPM",
        tbl_extgov = "External Governor",
        tbl_escgov = "Esc Governor",
        tbl_cw = "CW",
        tbl_ccw = "CCW",
        tbl_automatic = "Automatic",
        tbl_alwayson = "Always On",
        tbl_disabled = "Disabled",
    },
    ESC_PARAMETERS_HW5 = {
        tbl_fixedwing = "Fixed Wing", 
        tbl_heliext   = "Heli Ext Governor", 
        tbl_heligov   = "Heli Governor", 
        tbl_helistore = "Heli Governor Store",
        tbl_cw = "CW",
        tbl_ccw = "CCW",
        tbl_autocalculate = "Auto Calculate",
        tbl_softcutoff = "Soft Cutoff",
        tbl_hardcutoff = "Hard Cutoff",
        tbl_enabled = "Enabled",
        tbl_disabled = "Disabled",
        tbl_normal = "Normal",
        tbl_reverse = "Reverse",
        tbl_proportional = "Proportional",
    },
    ESC_PARAMETERS_SCORPION = {
        tbl_heligov = "Heli Governor", 
        tbl_helistore = "Heli Governor (stored)", 
        tbl_vbargov = "VBar Governor", 
        tbl_extgov = "External Governor", 
        tbl_airplane = "Airplane mode", 
        tbl_boat = "Boat mode", 
        tbl_quad = "Quad mode",
        tbl_cw = "CW",
        tbl_ccw = "CCW",
        tbl_standard = "Standard", 
        tbl_vbar = "VBar", 
        tbl_exbus = "Jeti Exbus", 
        tbl_unsolicited = "Unsolicited", 
        tbl_futsbus = "Futaba SBUS",
        tbl_on = "On",
        tbl_off = "Off",
    },
    ESC_PARAMETERS_XDFLY = {
        tbl_fmheli = "Helicopter",
        tbl_fmfw = "Fixed Wing",
        tbl_cw = "CW",
        tbl_ccw = "CCW",
        tbl_low = "Low",
        tbl_medium = "Medium",
        tbl_high = "High",
        tbl_on = "On",
        tbl_off = "Off",
        tbl_red = "Red",
        tbl_yellow = "YELOW",
        tbl_orange = "ORANGE",
        tbl_green = "GREEN",
        tbl_jadegreen = "JADE GREEN",
        tbl_blue = "BLUE",
        tbl_cyan = "CYAN",
        tbl_purple = "PURPLE",
        tbl_pink = "PINK",
        tbl_white = "WHITE",
        tbl_auto = "Auto", 
        tbl_fast = "Fast", 
        tbl_normal = "Normal", 
        tbl_slow = "Slow", 
        tbl_vslow = "Very Slow",
        tbl_reverse = "Reverse",
        tbl_escgov = "ESC Governor", 
        tbl_extgov = "External Governor" , 
        tbl_fwgov = "Fixed Wing"
    },
    ESC_PARAMETERS_YGE = {
        tbl_modefree = "Free (Attention!)", 
        tbl_modeext = "Heli Ext Governor", 
        tbl_modeheli = "Heli Governor", 
        tbl_modestore = "Heli Governor Store", 
        tbl_modeglider = "Aero Glider", 
        tbl_modeair = "Aero Motor", 
        tbl_modef3a = "Aero F3A",
        tbl_normal = "Normal",
        tbl_smooth = "Smooth",
        tbl_reverse = "Reverse",
        tbl_on = "On",
        tbl_off = "Off",
        tbl_slowdown = "Slowdown",
        tbl_cutoff = "Cutoff",
        tbl_slow = "Slow",
        tbl_medium = "Medium",
        tbl_fast = "Fast",
        tbl_custom = "Custom (PC Defined)",
        tbl_autonorm = "Auto Normal", 
        tbl_autoefficient = "Auto Efficient", 
        tbl_autopower = "Auto Power", 
        tbl_autoextreme = "Auto Extreme",
        tbl_auto = "Auto",
        tbl_unused = "*Unused*",
        tbl_alwayson = "Always On",
    }       
}


return en