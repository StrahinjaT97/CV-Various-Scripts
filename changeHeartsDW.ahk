#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey relea
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.

;Converts <3 to heartbeat in Discord and WhatsApp

#Persistent


;Create folder in Roaming
directory := A_AppData "\Ket-Bra\AHK\config.conf"
If (FileExist(directory) == "") {
    FileCreateDir, %A_AppData%\Ket-Bra
    FileCreateDir, %A_AppData%\Ket-Bra\AHK
    FileCreateDir, %A_AppData%\Ket-Bra\AHK\changeHeartsDw
    FileAppend, ,%A_AppData%\Ket-Bra\AHK\Androjana\config.conf
}


;Install itself in startup
If (A_ScriptDir != A_Startup) {
    FileRead, ask, %A_AppData%\Ket-Bra\AHK\changeHeartsDw\config.conf
    If (ask != "don't ask") {
        Gui, New
        Gui, Add, Checkbox, vstartWithWindows, Start with windows
        Gui, Add, Checkbox, vdontAsk, Don't ask again,
        Gui, Add, Button, Default w80 gOk, OK
        Gui, Add, Button, w80 gCancel, Cancel
        Gui, Show, w500 h400 Center, Androjana
    }
}


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


Cancel:
    Gui, Destroy

Ok:
    Gui, Submit
    If (startWithWindows == 1) {
        FileCopy, %A_ScriptFullPath%, %A_Startup%
    }
    If (dontAsk == 1) {
        FileAppend, don't ask, %A_AppData%\Ket-Bra\AHK\changeHeartsDw\config.conf
    }
