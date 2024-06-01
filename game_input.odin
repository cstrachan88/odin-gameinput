// Odin bindings for Microsoft GameInput SDK
// by Courtney Strachan <courtney.strachan@gmail.com>
// Github Link: [odin-gameinput](https://github.com/cstrachan88/odin-gameinput)

package game_input

import win "core:sys/windows"

#assert(ODIN_OS == .Windows)
#assert(ODIN_ARCH == .amd64)

// From windef.h
APP_LOCAL_DEVICE_ID_SIZE :: 32
APP_LOCAL_DEVICE_ID :: struct {
	value: [APP_LOCAL_DEVICE_ID_SIZE]u8,
}

/* ========================================================================= */
/*                                GameInput.h                                */
/* ========================================================================= */
// Microsoft.GameInput 0.2303.22621.3038
// https://www.nuget.org/packages/Microsoft.GameInput

foreign import lib "GameInput/GameInput.lib"

GameInputKind :: distinct bit_set[GameInputKind_FLAG;u32]
GameInputKind_FLAG :: enum {
	GameInputKindRawDeviceReport  = 0,
	GameInputKindControllerAxis   = 1,
	GameInputKindControllerButton = 2,
	GameInputKindControllerSwitch = 3,
	GameInputKindKeyboard         = 4,
	GameInputKindMouse            = 5,
	GameInputKindTouch            = 8,
	GameInputKindMotion           = 12,
	GameInputKindArcadeStick      = 16,
	GameInputKindFlightStick      = 17,
	GameInputKindGamepad          = 18,
	GameInputKindRacingWheel      = 19,
	GameInputKindUiNavigation     = 24,
}
// GameInputKindUnknown          = 0x00000000,
// GameInputKindController       = 0x0000000E,
GAME_INPUT_KIND_CONTROLLER :: GameInputKind{.GameInputKindControllerAxis, .GameInputKindControllerButton, .GameInputKindControllerSwitch}

GameInputEnumerationKind :: enum {
	GameInputNoEnumeration       = 0,
	GameInputAsyncEnumeration    = 1,
	GameInputBlockingEnumeration = 2,
}

GameInputFocusPolicy :: distinct bit_set[GameInputFocusPolicy_FLAG;u32]
GameInputFocusPolicy_FLAG :: enum {
	GameInputDisableBackgroundInput   = 0,
	GameInputExclusiveForegroundInput = 1,
}
// GameInputDefaultFocusPolicy       = 0x00000000,

GameInputSwitchKind :: enum {
	GameInputUnknownSwitchKind = -1,
	GameInput2WaySwitch        = 0,
	GameInput4WaySwitch        = 1,
	GameInput8WaySwitch        = 2,
}

GameInputSwitchPosition :: enum {
	GameInputSwitchCenter    = 0,
	GameInputSwitchUp        = 1,
	GameInputSwitchUpRight   = 2,
	GameInputSwitchRight     = 3,
	GameInputSwitchDownRight = 4,
	GameInputSwitchDown      = 5,
	GameInputSwitchDownLeft  = 6,
	GameInputSwitchLeft      = 7,
	GameInputSwitchUpLeft    = 8,
}

GameInputKeyboardKind :: enum {
	GameInputUnknownKeyboard = -1,
	GameInputAnsiKeyboard    = 0,
	GameInputIsoKeyboard     = 1,
	GameInputKsKeyboard      = 2,
	GameInputAbntKeyboard    = 3,
	GameInputJisKeyboard     = 4,
}

GameInputMouseButtons :: distinct bit_set[GameInputMouseButtons_FLAG;u32]
GameInputMouseButtons_FLAG :: enum {
	GameInputMouseLeftButton     = 0,
	GameInputMouseRightButton    = 1,
	GameInputMouseMiddleButton   = 2,
	GameInputMouseButton4        = 3,
	GameInputMouseButton5        = 4,
	GameInputMouseWheelTiltLeft  = 5,
	GameInputMouseWheelTiltRight = 6,
}
// GameInputMouseNone           = 0x00000000,

GameInputTouchShape :: enum {
	GameInputTouchShapeUnknown       = -1,
	GameInputTouchShapePoint         = 0,
	GameInputTouchShape1DLinear      = 1,
	GameInputTouchShape1DRadial      = 2,
	GameInputTouchShape1DIrregular   = 3,
	GameInputTouchShape2DRectangular = 4,
	GameInputTouchShape2DElliptical  = 5,
	GameInputTouchShape2DIrregular   = 6,
}

GameInputMotionAccuracy :: enum {
	GameInputMotionAccuracyUnknown = -1,
	GameInputMotionUnavailable     = 0,
	GameInputMotionUnreliable      = 1,
	GameInputMotionApproximate     = 2,
	GameInputMotionAccurate        = 3,
}

GameInputArcadeStickButtons :: distinct bit_set[GameInputArcadeStickButtons_FLAG;u32]
GameInputArcadeStickButtons_FLAG :: enum {
	GameInputArcadeStickMenu     = 0,
	GameInputArcadeStickView     = 1,
	GameInputArcadeStickUp       = 2,
	GameInputArcadeStickDown     = 3,
	GameInputArcadeStickLeft     = 4,
	GameInputArcadeStickRight    = 5,
	GameInputArcadeStickAction1  = 6,
	GameInputArcadeStickAction2  = 7,
	GameInputArcadeStickAction3  = 8,
	GameInputArcadeStickAction4  = 9,
	GameInputArcadeStickAction5  = 10,
	GameInputArcadeStickAction6  = 11,
	GameInputArcadeStickSpecial1 = 12,
	GameInputArcadeStickSpecial2 = 13,
}
// GameInputArcadeStickNone     = 0x00000000,

GameInputFlightStickButtons :: distinct bit_set[GameInputFlightStickButtons_FLAG;u32]
GameInputFlightStickButtons_FLAG :: enum {
	GameInputFlightStickMenu          = 0,
	GameInputFlightStickView          = 1,
	GameInputFlightStickFirePrimary   = 2,
	GameInputFlightStickFireSecondary = 3,
}
// GameInputFlightStickNone          = 0x00000000,

GameInputGamepadButtons :: distinct bit_set[GameInputGamepadButtons_FLAG;u32]
GameInputGamepadButtons_FLAG :: enum {
	GameInputGamepadMenu            = 0,
	GameInputGamepadView            = 1,
	GameInputGamepadA               = 2,
	GameInputGamepadB               = 3,
	GameInputGamepadX               = 4,
	GameInputGamepadY               = 5,
	GameInputGamepadDPadUp          = 6,
	GameInputGamepadDPadDown        = 7,
	GameInputGamepadDPadLeft        = 8,
	GameInputGamepadDPadRight       = 9,
	GameInputGamepadLeftShoulder    = 10,
	GameInputGamepadRightShoulder   = 11,
	GameInputGamepadLeftThumbstick  = 12,
	GameInputGamepadRightThumbstick = 13,
}
// GameInputGamepadNone            = 0x00000000,

GameInputRacingWheelButtons :: distinct bit_set[GameInputRacingWheelButtons_FLAG;u32]
GameInputRacingWheelButtons_FLAG :: enum {
	GameInputRacingWheelMenu         = 0,
	GameInputRacingWheelView         = 1,
	GameInputRacingWheelPreviousGear = 2,
	GameInputRacingWheelNextGear     = 3,
	GameInputRacingWheelDpadUp       = 4,
	GameInputRacingWheelDpadDown     = 5,
	GameInputRacingWheelDpadLeft     = 6,
	GameInputRacingWheelDpadRight    = 7,
}
// GameInputRacingWheelNone         = 0x00000000,

GameInputUiNavigationButtons :: distinct bit_set[GameInputUiNavigationButtons_FLAG;u32]
GameInputUiNavigationButtons_FLAG :: enum {
	GameInputUiNavigationMenu        = 0,
	GameInputUiNavigationView        = 1,
	GameInputUiNavigationAccept      = 2,
	GameInputUiNavigationCancel      = 3,
	GameInputUiNavigationUp          = 4,
	GameInputUiNavigationDown        = 5,
	GameInputUiNavigationLeft        = 6,
	GameInputUiNavigationRight       = 7,
	GameInputUiNavigationContext1    = 8,
	GameInputUiNavigationContext2    = 9,
	GameInputUiNavigationContext3    = 10,
	GameInputUiNavigationContext4    = 11,
	GameInputUiNavigationPageUp      = 12,
	GameInputUiNavigationPageDown    = 13,
	GameInputUiNavigationPageLeft    = 14,
	GameInputUiNavigationPageRight   = 15,
	GameInputUiNavigationScrollUp    = 16,
	GameInputUiNavigationScrollDown  = 17,
	GameInputUiNavigationScrollLeft  = 18,
	GameInputUiNavigationScrollRight = 19,
}
// GameInputUiNavigationNone        = 0x00000000,

GameInputDeviceStatus :: distinct bit_set[GameInputDeviceStatus_FLAG;u32]
GameInputDeviceStatus_FLAG :: enum {
	GameInputDeviceConnected     = 0,
	GameInputDeviceInputEnabled  = 1,
	GameInputDeviceOutputEnabled = 2,
	GameInputDeviceRawIoEnabled  = 3,
	GameInputDeviceAudioCapture  = 4,
	GameInputDeviceAudioRender   = 5,
	GameInputDeviceSynchronized  = 6,
	GameInputDeviceWireless      = 7,
	GameInputDeviceUserIdle      = 20,
}
// GameInputDeviceNoStatus      = 0x00000000,
// GameInputDeviceAnyStatus     = 0x00FFFFFF,
GAME_INPUT_DEVICE_ANY_STATUS := transmute(GameInputDeviceStatus)u32(0x00FFFFFF)
// FIXME

GameInputBatteryStatus :: enum {
	GameInputBatteryUnknown     = -1,
	GameInputBatteryNotPresent  = 0,
	GameInputBatteryDischarging = 1,
	GameInputBatteryIdle        = 2,
	GameInputBatteryCharging    = 3,
}

GameInputDeviceFamily :: enum {
	GameInputFamilyVirtual   = -1,
	GameInputFamilyAggregate = 0,
	GameInputFamilyXboxOne   = 1,
	GameInputFamilyXbox360   = 2,
	GameInputFamilyHid       = 3,
	GameInputFamilyI8042     = 4,
}

GameInputDeviceCapabilities :: distinct bit_set[GameInputDeviceCapabilities_FLAG;u32]
GameInputDeviceCapabilities_FLAG :: enum {
	GameInputDeviceCapabilityAudio           = 0,
	GameInputDeviceCapabilityPluginModule    = 1,
	GameInputDeviceCapabilityPowerOff        = 2,
	GameInputDeviceCapabilitySynchronization = 3,
	GameInputDeviceCapabilityWireless        = 4,
}
// GameInputDeviceCapabilityNone            = 0x00000000,

GameInputRawDeviceReportKind :: enum {
	GameInputRawInputReport   = 0,
	GameInputRawOutputReport  = 1,
	GameInputRawFeatureReport = 2,
}

GameInputRawDeviceReportItemFlags :: distinct bit_set[GameInputRawDeviceReportItemFlags_FLAG;u32]
GameInputRawDeviceReportItemFlags_FLAG :: enum {
	GameInputConstantItem   = 0,
	GameInputArrayItem      = 1,
	GameInputRelativeItem   = 2,
	GameInputWraparoundItem = 3,
	GameInputNonlinearItem  = 4,
	GameInputStableItem     = 5,
	GameInputNullableItem   = 6,
	GameInputVolatileItem   = 7,
	GameInputBufferedItem   = 8,
}
// GameInputDefaultItem    = 0x00000000,

GameInputRawDeviceItemCollectionKind :: enum {
	GameInputUnknownItemCollection       = -1,
	GameInputPhysicalItemCollection      = 0,
	GameInputApplicationItemCollection   = 1,
	GameInputLogicalItemCollection       = 2,
	GameInputReportItemCollection        = 3,
	GameInputNamedArrayItemCollection    = 4,
	GameInputUsageSwitchItemCollection   = 5,
	GameInputUsageModifierItemCollection = 6,
}

GameInputRawDevicePhysicalUnitKind :: enum {
	GameInputPhysicalUnitUnknown             = -1,
	GameInputPhysicalUnitNone                = 0,
	GameInputPhysicalUnitTime                = 1,
	GameInputPhysicalUnitFrequency           = 2,
	GameInputPhysicalUnitLength              = 3,
	GameInputPhysicalUnitVelocity            = 4,
	GameInputPhysicalUnitAcceleration        = 5,
	GameInputPhysicalUnitMass                = 6,
	GameInputPhysicalUnitMomentum            = 7,
	GameInputPhysicalUnitForce               = 8,
	GameInputPhysicalUnitPressure            = 9,
	GameInputPhysicalUnitAngle               = 10,
	GameInputPhysicalUnitAngularVelocity     = 11,
	GameInputPhysicalUnitAngularAcceleration = 12,
	GameInputPhysicalUnitAngularMass         = 13,
	GameInputPhysicalUnitAngularMomentum     = 14,
	GameInputPhysicalUnitAngularTorque       = 15,
	GameInputPhysicalUnitElectricCurrent     = 16,
	GameInputPhysicalUnitElectricCharge      = 17,
	GameInputPhysicalUnitElectricPotential   = 18,
	GameInputPhysicalUnitEnergy              = 19,
	GameInputPhysicalUnitPower               = 20,
	GameInputPhysicalUnitTemperature         = 21,
	GameInputPhysicalUnitLuminousIntensity   = 22,
	GameInputPhysicalUnitLuminousFlux        = 23,
	GameInputPhysicalUnitIlluminance         = 24,
}

GameInputLabel :: enum {
	GameInputLabelUnknown                  = -1,
	GameInputLabelNone                     = 0,
	GameInputLabelXboxGuide                = 1,
	GameInputLabelXboxBack                 = 2,
	GameInputLabelXboxStart                = 3,
	GameInputLabelXboxMenu                 = 4,
	GameInputLabelXboxView                 = 5,
	GameInputLabelXboxA                    = 7,
	GameInputLabelXboxB                    = 8,
	GameInputLabelXboxX                    = 9,
	GameInputLabelXboxY                    = 10,
	GameInputLabelXboxDPadUp               = 11,
	GameInputLabelXboxDPadDown             = 12,
	GameInputLabelXboxDPadLeft             = 13,
	GameInputLabelXboxDPadRight            = 14,
	GameInputLabelXboxLeftShoulder         = 15,
	GameInputLabelXboxLeftTrigger          = 16,
	GameInputLabelXboxLeftStickButton      = 17,
	GameInputLabelXboxRightShoulder        = 18,
	GameInputLabelXboxRightTrigger         = 19,
	GameInputLabelXboxRightStickButton     = 20,
	GameInputLabelXboxPaddle1              = 21,
	GameInputLabelXboxPaddle2              = 22,
	GameInputLabelXboxPaddle3              = 23,
	GameInputLabelXboxPaddle4              = 24,
	GameInputLabelLetterA                  = 25,
	GameInputLabelLetterB                  = 26,
	GameInputLabelLetterC                  = 27,
	GameInputLabelLetterD                  = 28,
	GameInputLabelLetterE                  = 29,
	GameInputLabelLetterF                  = 30,
	GameInputLabelLetterG                  = 31,
	GameInputLabelLetterH                  = 32,
	GameInputLabelLetterI                  = 33,
	GameInputLabelLetterJ                  = 34,
	GameInputLabelLetterK                  = 35,
	GameInputLabelLetterL                  = 36,
	GameInputLabelLetterM                  = 37,
	GameInputLabelLetterN                  = 38,
	GameInputLabelLetterO                  = 39,
	GameInputLabelLetterP                  = 40,
	GameInputLabelLetterQ                  = 41,
	GameInputLabelLetterR                  = 42,
	GameInputLabelLetterS                  = 43,
	GameInputLabelLetterT                  = 44,
	GameInputLabelLetterU                  = 45,
	GameInputLabelLetterV                  = 46,
	GameInputLabelLetterW                  = 47,
	GameInputLabelLetterX                  = 48,
	GameInputLabelLetterY                  = 49,
	GameInputLabelLetterZ                  = 50,
	GameInputLabelNumber0                  = 51,
	GameInputLabelNumber1                  = 52,
	GameInputLabelNumber2                  = 53,
	GameInputLabelNumber3                  = 54,
	GameInputLabelNumber4                  = 55,
	GameInputLabelNumber5                  = 56,
	GameInputLabelNumber6                  = 57,
	GameInputLabelNumber7                  = 58,
	GameInputLabelNumber8                  = 59,
	GameInputLabelNumber9                  = 60,
	GameInputLabelArrowUp                  = 61,
	GameInputLabelArrowUpRight             = 62,
	GameInputLabelArrowRight               = 63,
	GameInputLabelArrowDownRight           = 64,
	GameInputLabelArrowDown                = 65,
	GameInputLabelArrowDownLLeft           = 66,
	GameInputLabelArrowLeft                = 67,
	GameInputLabelArrowUpLeft              = 68,
	GameInputLabelArrowUpDown              = 69,
	GameInputLabelArrowLeftRight           = 70,
	GameInputLabelArrowUpDownLeftRight     = 71,
	GameInputLabelArrowClockwise           = 72,
	GameInputLabelArrowCounterClockwise    = 73,
	GameInputLabelArrowReturn              = 74,
	GameInputLabelIconBranding             = 75,
	GameInputLabelIconHome                 = 76,
	GameInputLabelIconMenu                 = 77,
	GameInputLabelIconCross                = 78,
	GameInputLabelIconCircle               = 79,
	GameInputLabelIconSquare               = 80,
	GameInputLabelIconTriangle             = 81,
	GameInputLabelIconStar                 = 82,
	GameInputLabelIconDPadUp               = 83,
	GameInputLabelIconDPadDown             = 84,
	GameInputLabelIconDPadLeft             = 85,
	GameInputLabelIconDPadRight            = 86,
	GameInputLabelIconDialClockwise        = 87,
	GameInputLabelIconDialCounterClockwise = 88,
	GameInputLabelIconSliderLeftRight      = 89,
	GameInputLabelIconSliderUpDown         = 90,
	GameInputLabelIconWheelUpDown          = 91,
	GameInputLabelIconPlus                 = 92,
	GameInputLabelIconMinus                = 93,
	GameInputLabelIconSuspension           = 94,
	GameInputLabelHome                     = 95,
	GameInputLabelGuide                    = 96,
	GameInputLabelMode                     = 97,
	GameInputLabelSelect                   = 98,
	GameInputLabelMenu                     = 99,
	GameInputLabelView                     = 100,
	GameInputLabelBack                     = 101,
	GameInputLabelStart                    = 102,
	GameInputLabelOptions                  = 103,
	GameInputLabelShare                    = 104,
	GameInputLabelUp                       = 105,
	GameInputLabelDown                     = 106,
	GameInputLabelLeft                     = 107,
	GameInputLabelRight                    = 108,
	GameInputLabelLB                       = 109,
	GameInputLabelLT                       = 110,
	GameInputLabelLSB                      = 111,
	GameInputLabelL1                       = 112,
	GameInputLabelL2                       = 113,
	GameInputLabelL3                       = 114,
	GameInputLabelRB                       = 115,
	GameInputLabelRT                       = 116,
	GameInputLabelRSB                      = 117,
	GameInputLabelR1                       = 118,
	GameInputLabelR2                       = 119,
	GameInputLabelR3                       = 120,
	GameInputLabelP1                       = 121,
	GameInputLabelP2                       = 122,
	GameInputLabelP3                       = 123,
	GameInputLabelP4                       = 124,
}

GameInputLocation :: enum {
	GameInputLocationUnknown  = -1,
	GameInputLocationChassis  = 0,
	GameInputLocationDisplay  = 1,
	GameInputLocationAxis     = 2,
	GameInputLocationButton   = 3,
	GameInputLocationSwitch   = 4,
	GameInputLocationKey      = 5,
	GameInputLocationTouchPad = 6,
}

GameInputFeedbackAxes :: distinct bit_set[GameInputFeedbackAxes_FLAG;u32]
GameInputFeedbackAxes_FLAG :: enum {
	GameInputFeedbackAxisLinearX  = 0,
	GameInputFeedbackAxisLinearY  = 1,
	GameInputFeedbackAxisLinearZ  = 2,
	GameInputFeedbackAxisAngularX = 3,
	GameInputFeedbackAxisAngularY = 4,
	GameInputFeedbackAxisAngularZ = 5,
	GameInputFeedbackAxisNormal   = 6,
}
// GameInputFeedbackAxisNone     = 0x00000000,

GameInputFeedbackEffectState :: enum {
	GameInputFeedbackStopped = 0,
	GameInputFeedbackRunning = 1,
	GameInputFeedbackPaused  = 2,
}

GameInputForceFeedbackEffectKind :: enum {
	GameInputForceFeedbackConstant         = 0,
	GameInputForceFeedbackRamp             = 1,
	GameInputForceFeedbackSineWave         = 2,
	GameInputForceFeedbackSquareWave       = 3,
	GameInputForceFeedbackTriangleWave     = 4,
	GameInputForceFeedbackSawtoothUpWave   = 5,
	GameInputForceFeedbackSawtoothDownWave = 6,
	GameInputForceFeedbackSpring           = 7,
	GameInputForceFeedbackFriction         = 8,
	GameInputForceFeedbackDamper           = 9,
	GameInputForceFeedbackInertia          = 10,
}

GameInputRumbleMotors :: distinct bit_set[GameInputRumbleMotors_FLAG;u32]
GameInputRumbleMotors_FLAG :: enum {
	GameInputRumbleLowFrequency  = 0,
	GameInputRumbleHighFrequency = 1,
	GameInputRumbleLeftTrigger   = 2,
	GameInputRumbleRightTrigger  = 3,
}
// GameInputRumbleNone          = 0x00000000,

IGameInput :: struct #raw_union {
	#subtype iUnknown:       win.IUnknown,
	using iGameInput_vtable: ^IGameInput_VTable,
}
IGameInputReading :: struct #raw_union {
	#subtype iUnknown:              win.IUnknown,
	using iGameInputReading_vtable: ^IGameInputReading_VTable,
}
IGameInputDevice :: struct #raw_union {
	#subtype iUnknown:             win.IUnknown,
	using iGameInputDevice_vtable: ^IGameInputDevice_VTable,
}
IGameInputDispatcher :: struct #raw_union {
	#subtype iUnknown:                 win.IUnknown,
	using iGameInputDispatcher_vtable: ^IGameInputDispatcher_VTable,
}
IGameInputForceFeedbackEffect :: struct #raw_union {
	#subtype iUnknown:                          win.IUnknown,
	using iGameInputForceFeedbackEffect_vtable: ^IGameInputForceFeedbackEffect_VTable,
}
IGameInputRawDeviceReport :: struct #raw_union {
	#subtype iUnknown:                      win.IUnknown,
	using iGameInputRawDeviceReport_vtable: ^IGameInputRawDeviceReport_VTable,
}

GameInputCallbackToken :: u64

GAMEINPUT_CURRENT_CALLBACK_TOKEN_VALUE: win.c_ulonglong : 0xFFFFFFFFFFFFFFFF
GAMEINPUT_INVALID_CALLBACK_TOKEN_VALUE: win.c_ulonglong : 0x0000000000000000

GameInputReadingCallback :: #type proc "system" (
	callbackToken: GameInputCallbackToken,
	ctx: rawptr,
	reading: ^IGameInputReading,
	hasOverrunOccurred: bool,
)

GameInputDeviceCallback :: #type proc "system" (
	callbackToken: GameInputCallbackToken,
	ctx: rawptr,
	device: ^IGameInputDevice,
	timestamp: u64,
	currentStatus: GameInputDeviceStatus,
	previousStatus: GameInputDeviceStatus,
)

GameInputGuideButtonCallback :: #type proc "system" (
	callbackToken: GameInputCallbackToken,
	ctx: rawptr,
	device: ^IGameInputDevice,
	timestamp: u64,
	isPressed: bool,
)

GameInputKeyboardLayoutCallback :: #type proc "system" (
	callbackToken: GameInputCallbackToken,
	ctx: rawptr,
	device: ^IGameInputDevice,
	timestamp: u64,
	currentLayout: u32,
	previousLayout: u32,
)

GameInputKeyState :: struct {
	scanCode:   u32,
	codePoint:  u32,
	virtualKey: u8,
	isDeadKey:  bool,
}

GameInputMouseState :: struct {
	buttons:   GameInputMouseButtons,
	positionX: i64,
	positionY: i64,
	wheelX:    i64,
	wheelY:    i64,
}

GameInputTouchState :: struct {
	touchId:           u64,
	sensorIndex:       u32,
	positionX:         f32,
	positionY:         f32,
	pressure:          f32,
	proximity:         f32,
	contactRectTop:    f32,
	contactRectLeft:   f32,
	contactRectRight:  f32,
	contactRectBottom: f32,
}

GameInputMotionState :: struct {
	accelerationX:         f32,
	accelerationY:         f32,
	accelerationZ:         f32,
	angularVelocityX:      f32,
	angularVelocityY:      f32,
	angularVelocityZ:      f32,
	magneticFieldX:        f32,
	magneticFieldY:        f32,
	magneticFieldZ:        f32,
	orientationW:          f32,
	orientationX:          f32,
	orientationY:          f32,
	orientationZ:          f32,
	accelerometerAccuracy: GameInputMotionAccuracy,
	gyroscopeAccuracy:     GameInputMotionAccuracy,
	magnetometerAccuracy:  GameInputMotionAccuracy,
	orientationAccuracy:   GameInputMotionAccuracy,
}

GameInputArcadeStickState :: struct {
	buttons: GameInputArcadeStickButtons,
}

GameInputFlightStickState :: struct {
	buttons:   GameInputFlightStickButtons,
	hatSwitch: GameInputSwitchPosition,
	roll:      f32,
	pitch:     f32,
	yaw:       f32,
	throttle:  f32,
}

GameInputGamepadState :: struct {
	buttons:          GameInputGamepadButtons,
	leftTrigger:      f32,
	rightTrigger:     f32,
	leftThumbstickX:  f32,
	leftThumbstickY:  f32,
	rightThumbstickX: f32,
	rightThumbstickY: f32,
}

GameInputRacingWheelState :: struct {
	buttons:            GameInputRacingWheelButtons,
	patternShifterGear: i32,
	wheel:              f32,
	throttle:           f32,
	brake:              f32,
	clutch:             f32,
	handbrake:          f32,
}

GameInputUiNavigationState :: struct {
	buttons: GameInputUiNavigationButtons,
}

GameInputBatteryState :: struct {
	chargeRate:         f32,
	maxChargeRate:      f32,
	remainingCapacity:  f32,
	fullChargeCapacity: f32,
	status:             GameInputBatteryStatus,
}

GameInputString :: struct {
	sizeInBytes:    u32,
	codePointCount: u32,
	data:           cstring,
}

GameInputUsage :: struct {
	page: u16,
	id:   u16,
}

GameInputVersion :: struct {
	major:    u16,
	minor:    u16,
	build:    u16,
	revision: u16,
}

GameInputRawDeviceItemCollectionInfo :: struct {
	kind:            GameInputRawDeviceItemCollectionKind,
	childCount:      u32,
	siblingCount:    u32,
	usageCount:      u32,
	usages:          [^]GameInputUsage,
	parent:          ^GameInputRawDeviceItemCollectionInfo,
	firstSibling:    ^GameInputRawDeviceItemCollectionInfo,
	previousSibling: ^GameInputRawDeviceItemCollectionInfo,
	nextSibling:     ^GameInputRawDeviceItemCollectionInfo,
	lastSibling:     ^GameInputRawDeviceItemCollectionInfo,
	firstChild:      ^GameInputRawDeviceItemCollectionInfo,
	lastChild:       ^GameInputRawDeviceItemCollectionInfo,
}

GameInputRawDeviceReportItemInfo :: struct {
	bitOffset:                u32,
	bitSize:                  u32,
	logicalMin:               i64,
	logicalMax:               i64,
	physicalMin:              f64,
	physicalMax:              f64,
	physicalUnits:            GameInputRawDevicePhysicalUnitKind,
	rawPhysicalUnits:         u32,
	rawPhysicalUnitsExponent: i32,
	flags:                    GameInputRawDeviceReportItemFlags,
	usageCount:               u32,
	usages:                   [^]GameInputUsage,
	collection:               ^GameInputRawDeviceItemCollectionInfo,
	itemString:               ^GameInputString,
}

GameInputRawDeviceReportInfo :: struct {
	kind:      GameInputRawDeviceReportKind,
	id:        u32,
	size:      u32,
	itemCount: u32,
	items:     [^]GameInputRawDeviceReportItemInfo,
}

GameInputControllerAxisInfo :: struct {
	mappedInputKinds:  GameInputKind,
	label:             GameInputLabel,
	isContinuous:      bool,
	isNonlinear:       bool,
	isQuantized:       bool,
	hasRestValue:      bool,
	restValue:         f32,
	resolution:        u64,
	legacyDInputIndex: u16,
	legacyHidIndex:    u16,
	rawReportIndex:    u32,
	inputReport:       ^GameInputRawDeviceReportInfo,
	inputReportItem:   ^GameInputRawDeviceReportItemInfo,
}

GameInputControllerButtonInfo :: struct {
	mappedInputKinds:  GameInputKind,
	label:             GameInputLabel,
	legacyDInputIndex: u16,
	legacyHidIndex:    u16,
	rawReportIndex:    u32,
	inputReport:       ^GameInputRawDeviceReportInfo,
	inputReportItem:   ^GameInputRawDeviceReportItemInfo,
}

GameInputControllerSwitchInfo :: struct {
	mappedInputKinds:  GameInputKind,
	label:             GameInputLabel,
	positionLabels:    [9]GameInputLabel,
	kind:              GameInputSwitchKind,
	legacyDInputIndex: u16,
	legacyHidIndex:    u16,
	rawReportIndex:    u32,
	inputReport:       ^GameInputRawDeviceReportInfo,
	inputReportItem:   ^GameInputRawDeviceReportItemInfo,
}

GameInputKeyboardInfo :: struct {
	kind:                GameInputKeyboardKind,
	layout:              u32,
	keyCount:            u32,
	functionKeyCount:    u32,
	maxSimultaneousKeys: u32,
	platformType:        u32,
	platformSubtype:     u32,
	nativeLanguage:      ^GameInputString,
}

GameInputMouseInfo :: struct {
	supportedButtons: GameInputMouseButtons,
	sampleRate:       u32,
	sensorDpi:        u32,
	hasWheelX:        bool,
	hasWheelY:        bool,
}

GameInputTouchSensorInfo :: struct {
	mappedInputKinds: GameInputKind,
	label:            GameInputLabel,
	location:         GameInputLocation,
	locationId:       u32,
	resolutionX:      u64,
	resolutionY:      u64,
	shape:            GameInputTouchShape,
	aspectRatio:      f32,
	orientation:      f32,
	physicalWidth:    f32,
	physicalHeight:   f32,
	maxPressure:      f32,
	maxProximity:     f32,
	maxTouchPoints:   u32,
}

GameInputMotionInfo :: struct {
	maxAcceleration:          f32,
	maxAngularVelocity:       f32,
	maxMagneticFieldStrength: f32,
}

GameInputArcadeStickInfo :: struct {
	menuButtonLabel:     GameInputLabel,
	viewButtonLabel:     GameInputLabel,
	stickUpLabel:        GameInputLabel,
	stickDownLabel:      GameInputLabel,
	stickLeftLabel:      GameInputLabel,
	stickRightLabel:     GameInputLabel,
	actionButton1Label:  GameInputLabel,
	actionButton2Label:  GameInputLabel,
	actionButton3Label:  GameInputLabel,
	actionButton4Label:  GameInputLabel,
	actionButton5Label:  GameInputLabel,
	actionButton6Label:  GameInputLabel,
	specialButton1Label: GameInputLabel,
	specialButton2Label: GameInputLabel,
}

GameInputFlightStickInfo :: struct {
	menuButtonLabel:          GameInputLabel,
	viewButtonLabel:          GameInputLabel,
	firePrimaryButtonLabel:   GameInputLabel,
	fireSecondaryButtonLabel: GameInputLabel,
	hatSwitchKind:            GameInputSwitchKind,
}

GameInputGamepadInfo :: struct {
	menuButtonLabel:            GameInputLabel,
	viewButtonLabel:            GameInputLabel,
	aButtonLabel:               GameInputLabel,
	bButtonLabel:               GameInputLabel,
	xButtonLabel:               GameInputLabel,
	yButtonLabel:               GameInputLabel,
	dpadUpLabel:                GameInputLabel,
	dpadDownLabel:              GameInputLabel,
	dpadLeftLabel:              GameInputLabel,
	dpadRightLabel:             GameInputLabel,
	leftShoulderButtonLabel:    GameInputLabel,
	rightShoulderButtonLabel:   GameInputLabel,
	leftThumbstickButtonLabel:  GameInputLabel,
	rightThumbstickButtonLabel: GameInputLabel,
}

GameInputRacingWheelInfo :: struct {
	menuButtonLabel:         GameInputLabel,
	viewButtonLabel:         GameInputLabel,
	previousGearButtonLabel: GameInputLabel,
	nextGearButtonLabel:     GameInputLabel,
	dpadUpLabel:             GameInputLabel,
	dpadDownLabel:           GameInputLabel,
	dpadLeftLabel:           GameInputLabel,
	dpadRightLabel:          GameInputLabel,
	hasClutch:               bool,
	hasHandbrake:            bool,
	hasPatternShifter:       bool,
	minPatternShifterGear:   i32,
	maxPatternShifterGear:   i32,
	maxWheelAngle:           f32,
}

GameInputUiNavigationInfo :: struct {
	menuButtonLabel:        GameInputLabel,
	viewButtonLabel:        GameInputLabel,
	acceptButtonLabel:      GameInputLabel,
	cancelButtonLabel:      GameInputLabel,
	upButtonLabel:          GameInputLabel,
	downButtonLabel:        GameInputLabel,
	leftButtonLabel:        GameInputLabel,
	rightButtonLabel:       GameInputLabel,
	contextButton1Label:    GameInputLabel,
	contextButton2Label:    GameInputLabel,
	contextButton3Label:    GameInputLabel,
	contextButton4Label:    GameInputLabel,
	pageUpButtonLabel:      GameInputLabel,
	pageDownButtonLabel:    GameInputLabel,
	pageLeftButtonLabel:    GameInputLabel,
	pageRightButtonLabel:   GameInputLabel,
	scrollUpButtonLabel:    GameInputLabel,
	scrollDownButtonLabel:  GameInputLabel,
	scrollLeftButtonLabel:  GameInputLabel,
	scrollRightButtonLabel: GameInputLabel,
	guideButtonLabel:       GameInputLabel,
}

GameInputForceFeedbackMotorInfo :: struct {
	supportedAxes:                     GameInputFeedbackAxes,
	location:                          GameInputLocation,
	locationId:                        u32,
	maxSimultaneousEffects:            u32,
	isConstantEffectSupported:         bool,
	isRampEffectSupported:             bool,
	isSineWaveEffectSupported:         bool,
	isSquareWaveEffectSupported:       bool,
	isTriangleWaveEffectSupported:     bool,
	isSawtoothUpWaveEffectSupported:   bool,
	isSawtoothDownWaveEffectSupported: bool,
	isSpringEffectSupported:           bool,
	isFrictionEffectSupported:         bool,
	isDamperEffectSupported:           bool,
	isInertiaEffectSupported:          bool,
}

GameInputHapticWaveformInfo :: struct {
	usage:                  GameInputUsage,
	isDurationSupported:    bool,
	isIntensitySupported:   bool,
	isRepeatSupported:      bool,
	isRepeatDelaySupported: bool,
	defaultDuration:        u64,
}

GameInputHapticFeedbackMotorInfo :: struct {
	mappedRumbleMotors: GameInputRumbleMotors,
	location:           GameInputLocation,
	locationId:         u32,
	waveformCount:      u32,
	waveformInfo:       [^]GameInputHapticWaveformInfo,
}

GameInputDeviceInfo :: struct {
	infoSize:                 u32,
	vendorId:                 u16,
	productId:                u16,
	revisionNumber:           u16,
	interfaceNumber:          u8,
	collectionNumber:         u8,
	usage:                    GameInputUsage,
	hardwareVersion:          GameInputVersion,
	firmwareVersion:          GameInputVersion,
	deviceId:                 APP_LOCAL_DEVICE_ID,
	deviceRootId:             APP_LOCAL_DEVICE_ID,
	deviceFamily:             GameInputDeviceFamily,
	capabilities:             GameInputDeviceCapabilities,
	supportedInput:           GameInputKind,
	supportedRumbleMotors:    GameInputRumbleMotors,
	inputReportCount:         u32,
	outputReportCount:        u32,
	featureReportCount:       u32,
	controllerAxisCount:      u32,
	controllerButtonCount:    u32,
	controllerSwitchCount:    u32,
	touchPointCount:          u32,
	touchSensorCount:         u32,
	forceFeedbackMotorCount:  u32,
	hapticFeedbackMotorCount: u32,
	deviceStringCount:        u32,
	deviceDescriptorSize:     u32,
	inputReportInfo:          [^]GameInputRawDeviceReportInfo,
	outputReportInfo:         [^]GameInputRawDeviceReportInfo,
	featureReportInfo:        [^]GameInputRawDeviceReportInfo,
	controllerAxisInfo:       [^]GameInputControllerAxisInfo,
	controllerButtonInfo:     [^]GameInputControllerButtonInfo,
	controllerSwitchInfo:     [^]GameInputControllerSwitchInfo,
	keyboardInfo:             ^GameInputKeyboardInfo,
	mouseInfo:                ^GameInputMouseInfo,
	touchSensorInfo:          [^]GameInputTouchSensorInfo,
	motionInfo:               ^GameInputMotionInfo,
	arcadeStickInfo:          ^GameInputArcadeStickInfo,
	flightStickInfo:          ^GameInputFlightStickInfo,
	gamepadInfo:              ^GameInputGamepadInfo,
	racingWheelInfo:          ^GameInputRacingWheelInfo,
	uiNavigationInfo:         ^GameInputUiNavigationInfo,
	forceFeedbackMotorInfo:   [^]GameInputForceFeedbackMotorInfo,
	hapticFeedbackMotorInfo:  [^]GameInputHapticFeedbackMotorInfo,
	displayName:              ^GameInputString,
	deviceStrings:            [^]GameInputString,
	deviceDescriptorData:     rawptr,
}

GameInputForceFeedbackEnvelope :: struct {
	attackDuration:  u64,
	sustainDuration: u64,
	releaseDuration: u64,
	attackGain:      f32,
	sustainGain:     f32,
	releaseGain:     f32,
	playCount:       u32,
	repeatDelay:     u64,
}

GameInputForceFeedbackMagnitude :: struct {
	linearX:  f32,
	linearY:  f32,
	linearZ:  f32,
	angularX: f32,
	angularY: f32,
	angularZ: f32,
	normal:   f32,
}

GameInputForceFeedbackConditionParams :: struct {
	magnitude:            GameInputForceFeedbackMagnitude,
	positiveCoefficient:  f32,
	negativeCoefficient:  f32,
	maxPositiveMagnitude: f32,
	maxNegativeMagnitude: f32,
	deadZone:             f32,
	bias:                 f32,
}

GameInputForceFeedbackConstantParams :: struct {
	envelope:  GameInputForceFeedbackEnvelope,
	magnitude: GameInputForceFeedbackMagnitude,
}

GameInputForceFeedbackPeriodicParams :: struct {
	envelope:  GameInputForceFeedbackEnvelope,
	magnitude: GameInputForceFeedbackMagnitude,
	frequency: f32,
	phase:     f32,
	bias:      f32,
}

GameInputForceFeedbackRampParams :: struct {
	envelope:       GameInputForceFeedbackEnvelope,
	startMagnitude: GameInputForceFeedbackMagnitude,
	endMagnitude:   GameInputForceFeedbackMagnitude,
}

GameInputForceFeedbackParams :: struct {
	kind: GameInputForceFeedbackEffectKind,
	data: struct #raw_union {
		constant:         GameInputForceFeedbackConstantParams,
		ramp:             GameInputForceFeedbackRampParams,
		sineWave:         GameInputForceFeedbackPeriodicParams,
		squareWave:       GameInputForceFeedbackPeriodicParams,
		triangleWave:     GameInputForceFeedbackPeriodicParams,
		sawtoothUpWave:   GameInputForceFeedbackPeriodicParams,
		sawtoothDownWave: GameInputForceFeedbackPeriodicParams,
		spring:           GameInputForceFeedbackConditionParams,
		friction:         GameInputForceFeedbackConditionParams,
		damper:           GameInputForceFeedbackConditionParams,
		inertia:          GameInputForceFeedbackConditionParams,
	},
}

GameInputHapticFeedbackParams :: struct {
	waveformIndex: u32,
	duration:      u64,
	intensity:     f32,
	playCount:     u32,
	repeatDelay:   u64,
}

GameInputRumbleParams :: struct {
	lowFrequency:  f32,
	highFrequency: f32,
	leftTrigger:   f32,
	rightTrigger:  f32,
}

// NOTE
// VTABLES CODE GOES HERE
// NOTE

@(default_calling_convention = "system")
foreign lib {
	GameInputCreate :: proc(gameInput: ^^IGameInput) -> win.HRESULT ---
}

FACILITY_GAMEINPUT :: 906

//
// MessageId: GAMEINPUT_E_DEVICE_DISCONNECTED
//
// MessageText:
//
// The device is not currently connected to the system.
//
// #define GAMEINPUT_E_DEVICE_DISCONNECTED _HRESULT_TYPEDEF_(0x838A0001L)
GAMEINPUT_E_DEVICE_DISCONNECTED: u32 : 0x838A0001

//
// MessageId: GAMEINPUT_E_DEVICE_NOT_FOUND
//
// MessageText:
//
// The requested device could not be found.
//
// #define GAMEINPUT_E_DEVICE_NOT_FOUND _HRESULT_TYPEDEF_(0x838A0002L)
GAMEINPUT_E_DEVICE_NOT_FOUND: u32 : 0x838A0002

//
// MessageId: GAMEINPUT_E_READING_NOT_FOUND
//
// MessageText:
//
// The requested reading could not be found.
//
// #define GAMEINPUT_E_READING_NOT_FOUND _HRESULT_TYPEDEF_(0x838A0003L)
GAMEINPUT_E_READING_NOT_FOUND: u32 : 0x838A0003

//
// MessageId: GAMEINPUT_E_REFERENCE_READING_TOO_OLD
//
// MessageText:
//
// The reference reading no longer exists in the reading history.
//
// #define GAMEINPUT_E_REFERENCE_READING_TOO_OLD _HRESULT_TYPEDEF_(0x838A0004L)
GAMEINPUT_E_REFERENCE_READING_TOO_OLD: u32 : 0x838A0004

//
// MessageId: GAMEINPUT_E_TIMESTAMP_OUT_OF_RANGE
//
// MessageText:
//
// The target timestamp for the temporal reading is too far in the past or future.
//
// #define GAMEINPUT_E_TIMESTAMP_OUT_OF_RANGE _HRESULT_TYPEDEF_(0x838A0005L)
GAMEINPUT_E_TIMESTAMP_OUT_OF_RANGE: u32 : 0x838A0005

//
// MessageId: GAMEINPUT_E_INSUFFICIENT_FORCE_FEEDBACK_RESOURCES
//
// MessageText:
//
// The device does not have enough resources remaining to create the requested force feedback effect.
//
// #define GAMEINPUT_E_INSUFFICIENT_FORCE_FEEDBACK_RESOURCES _HRESULT_TYPEDEF_(0x838A0006L)
GAMEINPUT_E_INSUFFICIENT_FORCE_FEEDBACK_RESOURCES: u32 : 0x838A0006
