#SingleInstance
; https://superuser.com/questions/1349626/paste-selected-text-on-windows-like-on-linux-middle-mouse-button

mousedrag_threshold := 20	; pixels

~lButton::
    MouseGetPos, mousedrag_x, mousedrag_y
    keywait lbutton, T0.3
    if (ErrorLevel) {
        keywait lbutton
        WinGet, cwn, ProcessName, A
        if (cwn == "powershell.exe"
        or cwn == "WindowsTerminal.exe"
        or cwn == "wsl.exe"
        or cwn == "ubuntu2004.exe") {
            mousegetpos, mousedrag_x2, mousedrag_y2
            if (abs(mousedrag_x2 - mousedrag_x) > mousedrag_threshold
            or abs(mousedrag_y2 - mousedrag_y) > mousedrag_threshold)
            {
                sendInput ^ c
            }
        }
    }
return

~lButton Up:: return