#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

sonarworksExe := "Reference 4 Systemwide.exe"

if (PID := ProcessExist(sonarworksExe)) {
    ExitApp
}
else {
    RunWait "C:\Program Files\Sonarworks\Reference 4\Systemwide\" sonarworksExe
	ProcessWait(sonarworksExe)
	ExitApp
}
