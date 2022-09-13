#Requires AutoHotkey v2.0-beta
#SingleInstance

; 1. 检测腾讯会议窗口
; 2. 若窗口不存在, 则检测腾讯会议进程
; 3. 若进程存在, kill wemeet进程

Loop {
    if (WinWait("腾讯会议")) {
        DetectHiddenWindows True
        if (WinWaitClose("腾讯会议")) {
            Sleep(1900)
            PID := ProcessExist("wemeetapp.exe")
            while (PID != 0) {
                ProcessClose(PID)
                PID := ProcessExist("wemeetapp.exe")
            }
        }
        DetectHiddenWindows False
    }
}