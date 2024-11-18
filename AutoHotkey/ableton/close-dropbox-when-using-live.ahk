#Requires AutoHotkey v2.0.18+
#SingleInstance Force
#NoTrayIcon

dropboxAppName := "Dropbox.exe"
liveAppName := "Ableton Live 12 Suite.exe"

if (ProcessExist(liveAppName)) {
    if (ProcessExist(dropboxAppName)) {
        CloseApp(dropboxAppName)
    }
	ExitApp	
} else {
    if (ProcessExist(dropboxAppName)) {
        CloseApp(dropboxAppName)
    }
    RunWait "C:\ProgramData\Ableton\Live 12 Suite\Program\" liveAppName
	ProcessWait(liveAppName)
	ExitApp
}
ExitApp

CloseApp(appName) {
    ProcessClose(appName)
	ProcessWaitClose(appName)
}