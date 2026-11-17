#define window_command_hook
/// window_command_hook(command:int)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_command_hook_raw(buffer_get_address(_buf), 8, argument0);

#define window_command_unhook
/// window_command_unhook(command:int)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_command_unhook_raw(buffer_get_address(_buf), 8, argument0);

#define window_command_check
/// window_command_check(command:int)->bool
// no buffer!
return window_command_check_raw(argument0);

#define window_command_run
/// window_command_run(wParam:int, lParam:int = 0)->int
var _buf; _buf = window_command_hook_prepare_buffer(9);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_command_run_raw(buffer_get_address(_buf), 9, argument[0], argument[1]);

#define window_command_get_active
/// window_command_get_active(command:int)->int
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_command_get_active_raw(buffer_get_address(_buf), 8, argument0);

#define window_command_set_active
/// window_command_set_active(command:int, value:bool)->int
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_command_set_active_raw(buffer_get_address(_buf), 8, argument0, argument1);

#define window_get_background_redraw
/// window_get_background_redraw()->bool
// no buffer!
return window_get_background_redraw_raw();

#define window_set_background_redraw
/// window_set_background_redraw(enable:bool)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_set_background_redraw_raw(buffer_get_address(_buf), 8, argument0);

#define window_get_topmost
/// window_get_topmost()->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_get_topmost_raw(buffer_get_address(_buf), 8);

#define window_set_topmost
/// window_set_topmost(enable:bool)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_set_topmost_raw(buffer_get_address(_buf), 8, argument0);

#define window_get_taskbar_button_visible
/// window_get_taskbar_button_visible()->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_get_taskbar_button_visible_raw(buffer_get_address(_buf), 8);

#define window_set_taskbar_button_visible
/// window_set_taskbar_button_visible(show_button:bool)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_set_taskbar_button_visible_raw(buffer_get_address(_buf), 8, argument0);

#define window_get_clickthrough
/// window_get_clickthrough()->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_get_clickthrough_raw(buffer_get_address(_buf), 8);

#define window_set_clickthrough
/// window_set_clickthrough(enable_clickthrough:bool)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_set_clickthrough_raw(buffer_get_address(_buf), 8, argument0);

#define window_get_noactivate
/// window_get_noactivate()->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_get_noactivate_raw(buffer_get_address(_buf), 8);

#define window_set_noactivate
/// window_set_noactivate(disable_activation:bool)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_set_noactivate_raw(buffer_get_address(_buf), 8, argument0);

#define window_set_visible_w
/// window_set_visible_w(visible:bool)->bool
var _buf; _buf = window_command_hook_prepare_buffer(8);
// GMS >= 1:
buffer_write(_buf, buffer_u64, int64(window_handle()));
/*/
external_call(global.f_window_command_hook_gmkb_write_ptr, window_handle());
//*/
return window_set_visible_w_raw(buffer_get_address(_buf), 8, argument0);

