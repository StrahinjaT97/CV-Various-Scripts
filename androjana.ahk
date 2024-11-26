#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey relea
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;Converts <3 to heartbeat in Discord and WhatsApp

#Persistent

#Hotstring EndChars `n `t

:*:<3::
    toHearts() {
        WinGetTitle, title, A
        If (InStr(title, "Discord") > 0) {
            Send :heartbeat:
        }
        Else IF (InStr(title, "WhatsApp") > 0) {
            Send :heartbeat{Enter}
        }
        Else Send <3
    }


