#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

exeName := "Native Access.exe"
if (PID := ProcessExist(exeName)) {
    ProcessClose PID
    ProcessWaitClose(PID)
}
ExitApp
