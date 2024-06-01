package main

import gi ".."
import "core:fmt"

main :: proc() {
	game_input: ^gi.IGameInput
	assert(gi.GameInputCreate(&game_input) == 0)

	fmt.println("GameInput timestamp:", game_input.GetCurrentTimestamp(game_input))

	// https://learn.microsoft.com/en-us/gaming/gdk/_content/gc/reference/input/gameinput/interfaces/igameinput/methods/igameinput_registerdevicecallback
	token: gi.GameInputCallbackToken

	if game_input.RegisterDeviceCallback(
		   game_input,
		   nil,
		   {.GameInputKindMouse, .GameInputKindKeyboard},
		   {.GameInputDeviceConnected},
		   .GameInputBlockingEnumeration,
		   nil,
		   gi.GameInputDeviceCallback(device_callback),
		   &token,
	   ) ==
	   0 {
		game_input.UnregisterCallback(game_input, token, 5000)
	}
}

device_callback :: proc(
	callbackToken: gi.GameInputCallbackToken,
	ctx: rawptr,
	device: ^gi.IGameInputDevice,
	timestamp: u64,
	currentStatus: gi.GameInputDeviceStatus,
	previousStatus: gi.GameInputDeviceStatus,
) {
	fmt.println(device.GetDeviceInfo(device)^)
}
