//--Teclado

global.input[0][CONTROLE.LEFT] =	keyboard_check(left_keyboard);
global.input[0][CONTROLE.RIGHT] =	keyboard_check(right_keyboard);
global.input[0][CONTROLE.UP] =		keyboard_check(up_keyboard);
global.input[0][CONTROLE.DOWN] =	keyboard_check(down_keyboard);
global.input[0][CONTROLE.JUMP] = keyboard_check_pressed(jump_keyboard);
global.input[0][CONTROLE.JUMP_S] = keyboard_check_released(jump_keyboard);
global.input[0][CONTROLE.DASH] = keyboard_check_pressed(dash_keyboard);
global.input[0][CONTROLE.REPLAY] = keyboard_check_pressed(replay_keyboard);
global.input[0][CONTROLE.UP_MENU] = keyboard_check_pressed(up_keyboard);
global.input[0][CONTROLE.DOWN_MENU] = keyboard_check_pressed(down_keyboard);
global.input[0][CONTROLE.LEFT_MENU] = keyboard_check_pressed(left_keyboard);
global.input[0][CONTROLE.RIGHT_MENU] = keyboard_check_pressed(right_keyboard);

global.input[0][CONTROLE.PAUSE] = keyboard_check_pressed(vk_enter) or keyboard_check_pressed(vk_escape);

//--Controle

global.input[1][CONTROLE.LEFT]   =		gamepad_axis_value(global.controle,gp_axislh) < -0.25 or gamepad_button_check(global.controle,gp_padl)
global.input[1][CONTROLE.RIGHT]  =		gamepad_axis_value(global.controle,gp_axislh) > 0.25  or gamepad_button_check(global.controle,gp_padr)
global.input[1][CONTROLE.UP]     =		gamepad_axis_value(global.controle,gp_axislv) < 0.25  or gamepad_button_check(global.controle,gp_padu)
global.input[1][CONTROLE.DOWN]   =		gamepad_axis_value(global.controle,gp_axislv) > -0.25 or gamepad_button_check(global.controle,gp_padd)
global.input[1][CONTROLE.JUMP]   =		gamepad_button_check_pressed(global.controle,gp_face1);
global.input[1][CONTROLE.JUMP_S] =		gamepad_button_check_released(global.controle,gp_face1);
global.input[1][CONTROLE.DASH]   =		gamepad_button_check_pressed(global.controle,gp_face3);
global.input[1][CONTROLE.REPLAY] =		gamepad_button_check_pressed(global.controle,gp_face2);
global.input[1][CONTROLE.UP_MENU] =		gamepad_button_check_pressed(global.controle,gp_padu);
global.input[1][CONTROLE.DOWN_MENU] =	gamepad_button_check_pressed(global.controle,gp_padd);

global.input[1][CONTROLE.PAUSE] =	gamepad_button_check_pressed(global.controle,gp_start);


global.input[0][CONTROLE.JUMP_IN] = keyboard_check(jump_keyboard);
global.input[1][CONTROLE.JUMP_IN] =	gamepad_button_check(global.controle,gp_face1);

//Corrigindo

if (gamepad_is_connected(global.controle)) global.tipo_controle = 1;
else global.tipo_controle = 0;

