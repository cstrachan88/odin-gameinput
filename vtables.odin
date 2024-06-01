// Odin bindings for Microsoft GameInput SDK
// by Courtney Strachan <courtney.strachan@gmail.com>
// Github Link: [odin-gameinput](https://github.com/cstrachan88/odin-gameinput)

package game_input

import win "core:sys/windows"

IGameInput_UUID_STRING :: "11BE2A7E-4254-445A-9C09-FFC40F006918"
IGameInput_UUID := &win.IID{0x11be2a7e, 0x4254, 0x445a, {0x9c, 0x09, 0xff, 0xc4, 0x0f, 0x00, 0x69, 0x18}}
IGameInput_VTable :: struct {
	using iUnknown_vtable:          win.IUnknownVtbl,
	GetCurrentTimestamp:            proc "system" (this: ^IGameInput) -> u64,
	GetCurrentReading:              proc "system" (this: ^IGameInput, inputKind: GameInputKind, device: ^IGameInputDevice, reading: ^^IGameInputReading) -> win.HRESULT,
	GetNextReading:                 proc "system" (this: ^IGameInput, referenceReading: ^IGameInputReading, inputKind: GameInputKind, device: ^IGameInputDevice, reading: ^^IGameInputReading) -> win.HRESULT,
	GetPreviousReading:             proc "system" (this: ^IGameInput, referenceReading: ^IGameInputReading, inputKind: GameInputKind, device: ^IGameInputDevice, reading: ^^IGameInputReading) -> win.HRESULT,
	GetTemporalReading:             proc "system" (this: ^IGameInput, timestamp: u64, device: ^IGameInputDevice, reading: ^^IGameInputReading) -> win.HRESULT,
	RegisterReadingCallback:        proc "system" (this: ^IGameInput, device: ^IGameInputDevice, inputKind: GameInputKind, analogThreshold: f32, ctx: rawptr, callbackFunc: GameInputReadingCallback, callbackToken: ^GameInputCallbackToken) -> win.HRESULT,
	RegisterDeviceCallback:         proc "system" (this: ^IGameInput, device: ^IGameInputDevice, inputKind: GameInputKind, statusFilter: GameInputDeviceStatus, enumerationKind: GameInputEnumerationKind, ctx: rawptr, callbackFunc: GameInputDeviceCallback, callbackToken: ^GameInputCallbackToken) -> win.HRESULT,
	RegisterGuideButtonCallback:    proc "system" (this: ^IGameInput, device: ^IGameInputDevice, ctx: rawptr, callbackFunc: GameInputGuideButtonCallback, callbackToken: ^GameInputCallbackToken) -> win.HRESULT,
	RegisterKeyboardLayoutCallback: proc "system" (this: ^IGameInput, device: ^IGameInputDevice, ctx: rawptr, callbackFunc: GameInputKeyboardLayoutCallback, callbackToken: ^GameInputCallbackToken) -> win.HRESULT,
	StopCallback:                   proc "system" (this: ^IGameInput, callbackToken: GameInputCallbackToken),
	UnregisterCallback:             proc "system" (this: ^IGameInput, callbackToken: GameInputCallbackToken, timeoutInMicroseconds: u64) -> bool,
	CreateDispatcher:               proc "system" (this: ^IGameInput, dispatcher: ^^IGameInputDispatcher) -> win.HRESULT,
	CreateAggregateDevice:          proc "system" (this: ^IGameInput, inputKind: GameInputKind, device: ^^IGameInputDevice) -> win.HRESULT,
	FindDeviceFromId:               proc "system" (this: ^IGameInput, value: ^APP_LOCAL_DEVICE_ID, device: ^^IGameInputDevice) -> win.HRESULT,
	FindDeviceFromObject:           proc "system" (this: ^IGameInput, value: ^win.IUnknown, device: ^^IGameInputDevice) -> win.HRESULT,
	FindDeviceFromPlatformHandle:   proc "system" (this: ^IGameInput, value: win.HANDLE, device: ^^IGameInputDevice) -> win.HRESULT,
	FindDeviceFromPlatformString:   proc "system" (this: ^IGameInput, value: win.LPCWSTR, device: ^^IGameInputDevice) -> win.HRESULT,
	EnableOemDeviceSupport:         proc "system" (this: ^IGameInput, vendorId: u16, productId: u16, interfaceNumber: u8, collectionNumber: u8) -> win.HRESULT,
	SetFocusPolicy:                 proc "system" (this: ^IGameInput, policy: GameInputFocusPolicy),
}

IGameInputReading_UUID_STRING :: "2156947A-E1FA-4DE0-A30B-D812931DBD8D"
IGameInputReading_UUID := &win.IID{0x2156947a, 0xe1fa, 0x4de0, {0xa3, 0x0b, 0xd8, 0x12, 0x93, 0x1d, 0xbd, 0x8d}}
IGameInputReading_VTable :: struct {
	using iUnknown_vtable:    win.IUnknownVtbl,
	GetInputKind:             proc "system" (this: ^IGameInputReading) -> GameInputKind,
	GetSequenceNumber:        proc "system" (this: ^IGameInputReading, inputKind: GameInputKind) -> u64,
	GetTimestamp:             proc "system" (this: ^IGameInputReading) -> u64,
	GetDevice:                proc "system" (this: ^IGameInputReading, device: ^^IGameInputDevice),
	GetRawReport:             proc "system" (this: ^IGameInputReading, report: ^^IGameInputRawDeviceReport) -> bool,
	GetControllerAxisCount:   proc "system" (this: ^IGameInputReading) -> u32,
	GetControllerAxisState:   proc "system" (this: ^IGameInputReading, stateArrayCount: u32, stateArray: [^]f32) -> u32,
	GetControllerButtonCount: proc "system" (this: ^IGameInputReading) -> u32,
	GetControllerButtonState: proc "system" (this: ^IGameInputReading, stateArrayCount: u32, stateArray: [^]bool) -> u32,
	GetControllerSwitchCount: proc "system" (this: ^IGameInputReading) -> u32,
	GetControllerSwitchState: proc "system" (this: ^IGameInputReading, stateArrayCount: u32, stateArray: [^]GameInputSwitchPosition) -> u32,
	GetKeyCount:              proc "system" (this: ^IGameInputReading) -> u32,
	GetKeyState:              proc "system" (this: ^IGameInputReading, stateArrayCount: u32, stateArray: [^]GameInputKeyState) -> u32,
	GetMouseState:            proc "system" (this: ^IGameInputReading, state: ^GameInputMouseState) -> bool,
	GetTouchCount:            proc "system" (this: ^IGameInputReading) -> u32,
	GetTouchState:            proc "system" (this: ^IGameInputReading, stateArrayCount: u32, stateArray: [^]GameInputTouchState) -> u32,
	GetMotionState:           proc "system" (this: ^IGameInputReading, state: ^GameInputMotionState) -> bool,
	GetArcadeStickState:      proc "system" (this: ^IGameInputReading, state: ^GameInputArcadeStickState) -> bool,
	GetFlightStickState:      proc "system" (this: ^IGameInputReading, state: ^GameInputFlightStickState) -> bool,
	GetGamepadState:          proc "system" (this: ^IGameInputReading, state: ^GameInputGamepadState) -> bool,
	GetRacingWheelState:      proc "system" (this: ^IGameInputReading, state: ^GameInputRacingWheelState) -> bool,
	GetUiNavigationState:     proc "system" (this: ^IGameInputReading, state: ^GameInputUiNavigationState) -> bool,
}

IGameInputDevice_UUID_STRING :: "31DD86FB-4C1B-408A-868F-439B3CD47125"
IGameInputDevice_UUID := &win.IID{0x31dd86fb, 0x4c1b, 0x408a, {0x86, 0x8f, 0x43, 0x9b, 0x3c, 0xd4, 0x71, 0x25}}
IGameInputDevice_VTable :: struct {
	using iunknown_vtable:           win.IUnknownVtbl,
	GetDeviceInfo:                   proc "system" (this: ^IGameInputDevice) -> ^GameInputDeviceInfo,
	GetDeviceStatus:                 proc "system" (this: ^IGameInputDevice) -> GameInputDeviceStatus,
	GetBatteryState:                 proc "system" (this: ^IGameInputDevice, state: ^GameInputBatteryState),
	CreateForceFeedbackEffect:       proc "system" (this: ^IGameInputDevice, motorIndex: u32, params: [^]GameInputForceFeedbackParams, effect: ^^IGameInputForceFeedbackEffect) -> win.HRESULT,
	IsForceFeedbackMotorPoweredOn:   proc "system" (this: ^IGameInputDevice, motorIndex: u32) -> bool,
	SetForceFeedbackMotorGain:       proc "system" (this: ^IGameInputDevice, motorIndex: u32, masterGain: f32),
	SetHapticMotorState:             proc "system" (this: ^IGameInputDevice, motorIndex: u32, params: [^]GameInputHapticFeedbackParams) -> win.HRESULT,
	SetRumbleState:                  proc "system" (this: ^IGameInputDevice, params: [^]GameInputRumbleParams),
	SetInputSynchronizationState:    proc "system" (this: ^IGameInputDevice, enabled: bool),
	SendInputSynchronizationHint:    proc "system" (this: ^IGameInputDevice),
	PowerOff:                        proc "system" (this: ^IGameInputDevice),
	CreateRawDeviceReport:           proc "system" (this: ^IGameInputDevice, reportId: u32, reportKind: GameInputRawDeviceReportKind, report: ^^IGameInputRawDeviceReport) -> win.HRESULT,
	GetRawDeviceFeature:             proc "system" (this: ^IGameInputDevice, reportId: u32, report: ^^IGameInputRawDeviceReport) -> win.HRESULT,
	SetRawDeviceFeature:             proc "system" (this: ^IGameInputDevice, report: ^IGameInputRawDeviceReport) -> win.HRESULT,
	SendRawDeviceOutput:             proc "system" (this: ^IGameInputDevice, report: ^IGameInputRawDeviceReport) -> win.HRESULT,
	SendRawDeviceOutputWithResponse: proc "system" (this: ^IGameInputDevice, requestReport: ^IGameInputRawDeviceReport, responseReport: ^^IGameInputRawDeviceReport) -> win.HRESULT,
	ExecuteRawDeviceIoControl:       proc "system" (this: ^IGameInputDevice, controlCode: u32, inputBufferSize: win.size_t, inputBuffer: rawptr, outputBufferSize: win.size_t, outputBuffer: rawptr, outputSize: ^win.size_t) -> win.HRESULT, // TODO: make sure this works for output buffer
	AcquireExclusiveRawDeviceAccess: proc "system" (this: ^IGameInputDevice, timeoutInMicroseconds: u64) -> bool,
	ReleaseExclusiveRawDeviceAccess: proc "system" (this: ^IGameInputDevice),
}

IGameInputDispatcher_UUID_STRING :: "415EED2E-98CB-42C2-8F28-B94601074E31"
IGameInputDispatcher_UUID := &win.IID{0x415eed2e, 0x98cb, 0x42c2, {0x8f, 0x28, 0xb9, 0x46, 0x01, 0x07, 0x4e, 0x31}}
IGameInputDispatcher_VTable :: struct {
	using iunknown_vtable: win.IUnknownVtbl,
	Dispatch:              proc "system" (this: ^IGameInputDispatcher, quotaInMicroseconds: u64) -> bool,
	OpenWaitHandle:        proc "system" (this: ^IGameInputDispatcher, waitHandle: ^win.HANDLE) -> win.HRESULT,
}

IGameInputForceFeedbackEffect_UUID_STRING :: "51BDA05E-F742-45D9-B085-9444AE48381D"
IGameInputForceFeedbackEffect_UUID := &win.IID{0x51bda05e, 0xf742, 0x45d9, {0xb0, 0x85, 0x94, 0x44, 0xae, 0x48, 0x38, 0x1d}}
IGameInputForceFeedbackEffect_VTable :: struct {
	using iunknown_vtable: win.IUnknownVtbl,
	GetDevice:             proc "system" (this: ^IGameInputForceFeedbackEffect, device: ^^IGameInputDevice),
	GetMotorIndex:         proc "system" (this: ^IGameInputForceFeedbackEffect) -> u32,
	GetGain:               proc "system" (this: ^IGameInputForceFeedbackEffect) -> f32,
	SetGain:               proc "system" (this: ^IGameInputForceFeedbackEffect, gain: f32),
	GetParams:             proc "system" (this: ^IGameInputForceFeedbackEffect, params: [^]GameInputForceFeedbackParams), // _Out_ GameInputForceFeedbackParams * params
	SetParams:             proc "system" (this: ^IGameInputForceFeedbackEffect, params: [^]GameInputForceFeedbackParams) -> bool, // _In_ GameInputForceFeedbackParams const * params
	GetState:              proc "system" (this: ^IGameInputForceFeedbackEffect) -> GameInputFeedbackEffectState,
	SetState:              proc "system" (this: ^IGameInputForceFeedbackEffect, state: GameInputFeedbackEffectState),
}

IGameInputRawDeviceReport_UUID_STRING :: "61F08CF1-1FFC-40CA-A2B8-E1AB8BC5B6DC"
IGameInputRawDeviceReport_UUID := &win.IID{0x61f08cf1, 0x1ffc, 0x40ca, {0xa2, 0xb8, 0xe1, 0xab, 0x8b, 0xc5, 0xb6, 0xdc}}
IGameInputRawDeviceReport_VTable :: struct {
	using iunknown_vtable: win.IUnknownVtbl,
	GetDevice:             proc "system" (this: ^IGameInputRawDeviceReport, device: ^^IGameInputDevice),
	GetReportInfo:         proc "system" (this: ^IGameInputRawDeviceReport) -> ^GameInputRawDeviceReportInfo,
	GetRawDataSize:        proc "system" (this: ^IGameInputRawDeviceReport) -> win.size_t,
	GetRawData:            proc "system" (this: ^IGameInputRawDeviceReport, bufferSize: win.size_t, buffer: rawptr) -> win.size_t, // _Out_writes_(bufferSize) void * buffer
	SetRawData:            proc "system" (this: ^IGameInputRawDeviceReport, bufferSize: win.size_t, buffer: rawptr) -> bool, // _In_reads_(bufferSize) void const * buffer
	GetItemValue:          proc "system" (this: ^IGameInputRawDeviceReport, itemIndex: u32, value: ^i64) -> bool,
	SetItemValue:          proc "system" (this: ^IGameInputRawDeviceReport, itemIndex: u32, value: i64) -> bool,
	ResetItemValue:        proc "system" (this: ^IGameInputRawDeviceReport, itemIndex: u32) -> bool,
	ResetAllItems:         proc "system" (this: ^IGameInputRawDeviceReport) -> bool,
}
