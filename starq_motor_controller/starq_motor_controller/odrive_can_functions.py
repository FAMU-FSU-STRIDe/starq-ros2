import can
import cantools
import signal
import math

# Global objects
_caninit = True
_candb = cantools.db.load_file("/starq_ws/src/docs/odrive-cansimple.dbc")
_logger = None
try:
    _canbus = can.Bus("can0", bustype="socketcan")
except Exception:
    _caninit = False

# Set debug logger
def set_logger(logger):
    _logger = logger

# Send a odrive message to CAN
def send_can_msg(can_id : int, msg_name : str, msg_data):
    if not _caninit:
        return
    can_msg = _candb.get_message_by_name("Axis0_" + msg_name)
    can_data = can_msg.encode(msg_data)
    can_msg = can.Message(arbitration_id=((can_id << 5) | can_msg.frame_id), is_extended_id=False, data=can_data)
    _canbus.send(can_msg)

# Recieve a odrive message from CAN
def recieve_can_msg(can_id : int, msg_name : str):
    if not _caninit:
        return None
    def timeout_handler(signum, frame):
        raise TimeoutError(f"Failed to retrieve CAN message for {msg_name} on CAN id {can_id}.")
    signal.signal(signal.SIGALRM, timeout_handler)
    signal.setitimer(signal.ITIMER_REAL, 0.020)
    try:
        can_msg = _candb.get_message_by_name("Axis0_" + msg_name)
        for msg in _canbus:
            if msg.arbitration_id == ((can_id << 5) | can_msg.frame_id):
                return _candb.decode_message("Axis0_" + msg_name, msg.data)
    finally:
        signal.setitimer(signal.ITIMER_REAL, 0)

# Clear motor errors
def clear_errors(can_id : int):
    send_can_msg(can_id, 'Clear_Errors', {})

# Emergency stop
def emergency_stop(can_id : int):
    send_can_msg(can_id, 'Estop', {})

## MOTOR COMMANDS

# Closed Loop Position Control
def set_position(can_id : int, position : float, velocity_ff : float = 0.0, torque_ff : float = 0.0):
    send_can_msg(can_id, 'Set_Input_Pos', {'Input_Pos': position, 'Vel_FF': velocity_ff, 'Torque_FF': torque_ff})

# Closed Loop Velocity Control
def set_velocity(can_id : int, velocity: float, torque_ff : float = 0.0):
    send_can_msg(can_id, 'Set_Input_Vel', {'Input_Vel': velocity, 'Input_Torque_FF': torque_ff})

# Closed Loop Torque Control
def set_torque(can_id : int, torque: float):
    send_can_msg(can_id, 'Set_Input_Torque', {'Input_Torque': torque})


## MOTOR CONFIGS

# Set State
def set_state(can_id : int, state : int):
    send_can_msg(can_id, 'Set_Axis_State', {'Axis_Requested_State': state})

# Set Control Type
def set_control_mode(can_id : int, cmode : int, imode : int):
    send_can_msg(can_id, 'Set_Controller_Mode', {'Control_Mode': cmode, 'Input_Mode': imode})

# Set Limits
def set_limits(can_id : int, vel_lim : float, curr_lim : float):
    send_can_msg(can_id, 'Set_Limits', {'Velocity_Limit': vel_lim, 'Current_Limit': curr_lim})

# Set Trap Traj Velocity, Acceleration Limits + Inertia
def set_trap_traj_limits(can_id : int, vel_lim : float, accel_lim : float, decel_lim : float, inertia : float):
    send_can_msg(can_id, 'Set_Traj_Vel_Limit', {'Traj_Vel_Limit': vel_lim})
    send_can_msg(can_id, 'Set_Traj_Accel_Limits', {'Traj_Accel_Limit': accel_lim, 'Traj_Decel_Limit': decel_lim})
    send_can_msg(can_id, 'Set_Traj_Inertia', {'Traj_Inertia': inertia})
    
# Set Gains
def set_gains(can_id : int, pos_gain : float, vel_gain : float, vel_int_gain : float):
    send_can_msg(can_id, 'Set_Pos_Gain', {'Pos_Gain' : pos_gain})
    send_can_msg(can_id, 'Set_Vel_Gains', {'Vel_Gain' : vel_gain, 'Vel_Integrator_Gain': vel_int_gain})

## MOTOR INFO

# Heartbeat (Error + State info)
def get_error_and_state(can_id : int):
    try:
        can_msg = recieve_can_msg(can_id, 'Heartbeat')
        return can_msg['Axis_Error'].value, can_msg['Axis_State'].value
    except TimeoutError as te:
        _logger.warn(str(te))
        return math.nan, math.nan

# Encoder data (Position + Velocity)
def get_position_and_velocity_estimates(can_id : int):
    try:
        can_msg = recieve_can_msg(can_id, 'Get_Encoder_Estimates')
        return can_msg['Pos_Estimate'], can_msg['Vel_Estimate']
    except TimeoutError as te:
        _logger.warn(str(te))
        return math.nan, math.nan

# Torque estimate + target
def get_torque_target_and_estimate(can_id : int):
    try:
        can_msg = recieve_can_msg(can_id, 'Get_Torques')
        return can_msg['Torque_Target'], can_msg['Torque_Estimate']
    except TimeoutError as te:
        _logger.warn(str(te))
        return math.nan, math.nan

# QCurrent data
def get_qcurrent_setpoint_and_measured(can_id : int):
    try:
        can_msg = recieve_can_msg(can_id, 'Get_Iq')
        return can_msg['Iq_Setpoint'], can_msg['Iq_Measured']
    except TimeoutError as te:
        _logger.warn(str(te))
        return math.nan, math.nan

# Temperature data (FET + Motor)
def get_temperatures(can_id : int):
    try:
        can_msg = recieve_can_msg(can_id, 'Get_Temperature')
        return can_msg['FET_Temperature'], can_msg['Motor_Temperature']
    except TimeoutError as te:
        _logger.warn(str(te))
        return math.nan, math.nan

# Bus Voltage + Current
def get_bus_voltage_and_current(can_id : int):
    try:
        can_msg = recieve_can_msg(can_id, 'Get_Bus_Voltage_Current')
        return can_msg['Bus_Voltage'], can_msg['Bus_Current']
    except TimeoutError as te:
        _logger.warn(str(te))
        return math.nan, math.nan