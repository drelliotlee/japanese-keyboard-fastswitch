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

#if !WinActive("ahk_exe HD-Player.exe")
vk14::    ; if you press caps lock while in english
{
	SetInputLang(0x0411)    ; change language to japanese
	sleep, 50
	send {vkf2}         ; then switch from romaji to hiragana
}
return

#if !WinActive("ahk_exe HD-Player.exe")
vkf0::      ; if you press caps lock while in japanese
{
	SetInputLang(0x0409)    ; change language to english
}
return

; when in japanese mode, to go down the list of
; suggestions in the pop-up menu, 
; you have to use the down arrow
; this is inefficient bc you have to reposition your right hand
; this code block turns Lshift into the down arrow
#If (GetKeyboardLanguage(WinActive("A")) = 0x0411)
	vk09::Send, {down}    
	return 