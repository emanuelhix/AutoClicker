#cs ----------------------------------------------------------------------------

 AutoIt Version: 3.3.16.1
 Author:         Parker Hix
 Date: 2 April 2024
 Script Function:
	An autoclicker that clicks at a rate of 1ms.
	Enable and disable the autoclicker using Q (default).
	Change dHotkey configuration to edit the hotkey toggle button.
	You can do this by setting it to something like "{Esc}" or "{a}" It's best to use lowercase version of the letter key.
#ce ----------------------------------------------------------------------------

#include <MsgBoxConstants.au3>

; Configurations 
Global $dHotKey = "{q}"

; Global Variables 
Global $bEnabled = false
Global $sMsgTitle = "AutoClicker by EmanuelHix"

; Functions

HotKeySet($dHotKey, "Toggle")
Func Toggle()
	$bEnabled = Not $bEnabled
	MsgBox($MB_SYSTEMMODAL, $sMsgTitle, "AutoClicker toggled: " & String($bEnabled))
    HotKeySet($dHotKey)
    Send($dHotKey)
    HotKeySet($dHotKey, "Toggle")
EndFunc

HotKeySet("{Esc}", "Kill")
Func Kill()
	MsgBox($MB_SYSTEMMODAL, $sMsgTitle, "Program closing.")
	Exit
EndFunc

Func AutoClick()
	While True
		if $bEnabled Then
			MouseClick("left")
		EndIf
	WEnd
EndFunc

Func Main()
	MsgBox ($MB_SYSTEMMODAL, $sMsgTitle, "AutoClicker is now Running" & @CRLF & "Press ESC to kill the program." & @CRLF & "Press" & $dHotKey & " to enable start AutoClicking.")
	AutoClick()
EndFunc

; Initialize

Main()