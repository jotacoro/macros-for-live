#Requires AutoHotkey v2.0
#SingleInstance Force
#NoTrayIcon

; Define the list of programs to check and close
programs := ["Native Access.exe", "Auto-Tune Central.exe", "UA Connect.exe", "PA-InstallationManager.exe", "Aquarius.exe", "Arturia Software Center.exe", "MPluginManager.exe", "IK Product Manager.exe"]

; Loop through each program in the list
for (program in programs) {
    if (PID := ProcessExist(program)) {
        ProcessClose PID
        ProcessWaitClose(PID)
    }
}
ExitApp