; to use this file:
; place this .ahk script in your windows startup folder
;
; the windows startup folder can be opened by running 
; shell:startup

; this is subroutine #1
SetInputLang(Lang)
{
    WinExist("A")
    ControlGetFocus, CtrlInFocus
    PostMessage, 0x50, 0, % Lang, %CtrlInFocus%
}

; this is subroutine #2
GetKeyboardLanguage(_hWnd=0)
{
	if !_hWnd
		ThreadId=0
	else
		if !ThreadId := DllCall("user32.dll\GetWindowThreadProcessId", "Ptr", _hWnd, "UInt", 0, "UInt")
			return false
	if !KBLayout := DllCall("user32.dll\GetKeyboardLayout", "UInt", ThreadId, "UInt")
		return false
	return KBLayout & 0xFFFF
}

; 0x0411 = japanese
; 0x0409 = english
#if !WinActive("ahk_exe HD-Player.exe")
vk14::
{
	If (GetKeyboardLanguage(WinActive("A")) = 0x0411)
		; vk09::Send, {down}  
		{
			SetInputLang(0x0409)    ; change language to english
			sleep, 200 ; OMG THIS BUG TOOK ME 4 HOURS TO FIND. SLEEP 50 was too fast!!
			send, {LAlt down}{`}{LAlt up}
		}
	Else
	; If (GetKeyboardLanguage(WinActive("A")) = 0x0409)
		SetInputLang(0x0411)    ; change language to english
	return
}
return

;delete this line later