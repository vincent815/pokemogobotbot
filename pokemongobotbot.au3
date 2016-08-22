#include <ButtonConstants.au3>
#include <ComboConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <SliderConstants.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#Region ### START Koda GUI section ### Form=e:\autoit scripts\pokemongobotbot.kxf
$Form1_1 = GUICreate("PokemonGoBotBot by 2EZ4MONSKIE", 514, 270, 313, 329)
$Information = GUICtrlCreateGroup("Required Information", 232, 0, 265, 169)
$username = GUICtrlCreateInput("", 312, 32, 169, 21)
$password = GUICtrlCreateInput("", 312, 64, 169, 21, BitOR($ES_PASSWORD,$ES_AUTOHSCROLL))
$lat = GUICtrlCreateInput("", 312, 96, 169, 21)
$long = GUICtrlCreateInput("", 312, 128, 169, 21)
$Label1 = GUICtrlCreateLabel("Username", 248, 32, 52, 17)
$Label2 = GUICtrlCreateLabel("Password", 248, 64, 50, 17)
$Label3 = GUICtrlCreateLabel("Latitude", 248, 96, 42, 17)
$Label4 = GUICtrlCreateLabel("Longitude", 248, 128, 51, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$botDurationLabel = GUICtrlCreateLabel("Bot Duration", 8, 8, 63, 17)
$botRestLabel = GUICtrlCreateLabel("Bot Rest", 8, 64, 45, 17)
$startBot = GUICtrlCreateButton("Start", 208, 224, 75, 25, $WS_GROUP)
GUICtrlSetBkColor(-1, 0x3399FF)
$sliderDuration = GUICtrlCreateSlider(80, 8, 134, 45)
GUICtrlSetLimit(-1, 24, 1)
GUICtrlSetData(-1, 1)
$sliderRest = GUICtrlCreateSlider(80, 56, 134, 45)
GUICtrlSetLimit(-1, 24, 1)
GUICtrlSetData(-1, 1)
$locationLabel = GUICtrlCreateLabel("Location", 8, 104, 45, 17)
$location = GUICtrlCreateCombo("", 88, 104, 121, 25)
GUICtrlSetData(-1, "Ayala Mall Cebu|SM Cebu|SM Seaside|IT Park Cebu|Fuente Osmena Cebu", "Ayala Mall Cebu")
$uselatlong = GUICtrlCreateCheckbox("Use lat long", 88, 144, 97, 17)
$Label5 = GUICtrlCreateLabel("Bot will stop in", 16, 176, 71, 17)
$Label6 = GUICtrlCreateLabel("Rest for", 16, 200, 41, 17)
$Label7 = GUICtrlCreateLabel("hrs", 128, 200, 18, 17)
$Label8 = GUICtrlCreateLabel("hrs", 128, 176, 18, 17)
#comments-start
$Label9 = GUICtrlCreateLabel("Level:", 240, 176, 33, 17)
$level = GUICtrlCreateLabel("40", 304, 176, 16, 17)
$Label10 = GUICtrlCreateLabel("Exp:", 392, 176, 25, 17)
$exp = GUICtrlCreateLabel("999999", 456, 176, 40, 17)
$Label12 = GUICtrlCreateLabel("Stardust:", 240, 200, 46, 17)
$stardust = GUICtrlCreateLabel("999999", 304, 200, 40, 17)
$Label14 = GUICtrlCreateLabel("Transfered:", 392, 200, 58, 17)
$transfered = GUICtrlCreateLabel("999999", 456, 200, 40, 17)
#comments-end
$duration = GUICtrlCreateLabel("1", 96, 176, 26, 17)
$rest = GUICtrlCreateLabel("1", 96, 200, 26, 17)
$durationSeconds = GUICtrlCreateLabel("(6000secs)", 152, 176, 88, 17)
$restSeconds = GUICtrlCreateLabel("(6000secs)", 152, 200, 88, 17)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

$counterStart = 0;
GUICtrlSetState($lat, $GUI_DISABLE)
GUICtrlSetState($long, $GUI_DISABLE)

While 1000
$nMsg = GUIGetMsg()
Switch $nMsg
	Case $startBot
		startBot()
	Case $GUI_EVENT_CLOSE
		Exit
	Case $uselatlong
		useLatLong()
	Case Else
		mainBodyLogic()

EndSwitch
WEnd

Func mainBodyLogic()
	GUICtrlSetData($duration,GUICtrlRead($sliderDuration));
	GUICtrlSetData($durationSeconds,"(" & GUICtrlRead($sliderDuration)*3600 &"secs)");

	GUICtrlSetData($rest,GUICtrlRead($sliderRest));
	GUICtrlSetData($restSeconds,"(" & GUICtrlRead($sliderRest)*3600 &"secs)");
EndFunc

Func startBot()
	if $counterStart = 0 Then
		$counterStart = 1
		GUICtrlSetData($startBot,"Stop");
		GUICtrlSetBkColor($startBot, 0xFF0000)

		GUICtrlSetState($lat, $GUI_DISABLE)
		GUICtrlSetState($long, $GUI_DISABLE)
		GUICtrlSetState($location, $GUI_DISABLE)
		GUICtrlSetState($uselatlong, $GUI_DISABLE)
		GUICtrlSetState($username, $GUI_DISABLE)
		GUICtrlSetState($password, $GUI_DISABLE)
	Else
		$counterStart = 0
		GUICtrlSetData($startBot,"Start");
		GUICtrlSetBkColor($startBot, 0x3399FF)

		useLatLong()
		GUICtrlSetState($uselatlong, $GUI_ENABLE)
		GUICtrlSetState($username, $GUI_ENABLE)
		GUICtrlSetState($password, $GUI_ENABLE)
	EndIf
EndFunc

Func useLatLong()
	If IsChecked($uselatlong) Then
		GUICtrlSetState($lat, $GUI_ENABLE)
		GUICtrlSetState($long, $GUI_ENABLE)
		GUICtrlSetState($location, $GUI_DISABLE)
	Else
		GUICtrlSetState($lat, $GUI_DISABLE)
		GUICtrlSetState($long, $GUI_DISABLE)
		GUICtrlSetState($location, $GUI_ENABLE)
	EndIf
EndFunc
Func IsChecked($control)
    Return BitAnd(GUICtrlRead($control),$GUI_CHECKED) = $GUI_CHECKED
EndFunc
