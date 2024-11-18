#Requires AutoHotkey v2.0.18+
#SingleInstance Force
#NoTrayIcon

exeName := "OwlPlug.exe"
if (PID := ProcessExist(exeName)) {
    ProcessClose PID
    ProcessWaitClose(PID)
}
ExitApp
