#Requires AutoHotkey v2.0.18+
#SingleInstance Force
#NoTrayIcon

exeName := "MPluginManager.exe"
if (PID := ProcessExist(exeName)) {
    ProcessClose PID
    ProcessWaitClose(PID)
}
ExitApp
