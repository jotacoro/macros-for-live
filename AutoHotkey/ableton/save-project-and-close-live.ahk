﻿#Requires AutoHotkey v2.0
#SingleInstance Force
SendMode "Input"
SetTitleMatchMode 2

; Define variables
abletonLiveAppName := "Ableton Live 12 Suite.exe"
; Window title when Live Set default template is open
newLiveSetName := "Sin título"
projectsPath := "C:\Users\" A_UserName "wherever\your-projects\are-saved"

; Avoid if Ableton Live is not running
If (ProcessExist(abletonLiveAppName)) {
	projectFileName := GetProjectNameFromWindow()
	SaveProjectAndClose()
	OpenDropbox()
	ExitApp
}
Else {
	ExitApp ; Ableton is not running
}

; Function to get the project name from the Ableton Live window title
GetProjectNameFromWindow() {
    ; Activate Ableton Live window
    WinActivate("ahk_exe " abletonLiveAppName)

    ; Get the Ableton window title
    abletonWindow := WinGetTitle("A")

    ; Get the project name from Window title
    RegExMatch(abletonWindow, "(.+[^\*])(\*?)( - Ableton Live 12 Suite)", &RegExResults)
    return RegExResults[1] ".als"
}

; Function to check if the project already exists
projectFileExists(projectsPath := "", projectFileName := "") {
    Loop Files, projectsPath . "\*.*", "R"  ; R means recurse through subfolders
    {
        If (A_LoopFileName == projectFileName)  ; Compare the file name with the target file name
        {
            return true ; Stop after finding the first match
        }
		Else
		{
		Continue ; Return false if file is not found
		}
    }
	return false
}

; Function to wait until the "*" character is gone from the window title
WaitForSavedProject() {
    while (InStr(WinGetTitle("A"), "*") != 0) {  ; Check if the active window's title contains "*"
        Sleep(500)  ; Pause for 500 milliseconds before checking again
    }
    return true ; project is saved. "*" is not present in window title
}

; Function to check if the project exists, save it, close ableton and start Dropbox client
SaveProjectAndClose() {
    If (projectFileExists(projectsPath, projectFileName)) {
		MsgBox projectFileExists(projectsPath, projectFileName)
        WinActivate("ahk_exe " abletonLiveAppName)
        Send "^s"
    	WaitForSavedProject()
    	WinClose("ahk_exe " abletonLiveAppName)
    	WinWaitClose("ahk_exe " abletonLiveAppName)
    }
    Else {
    	WinActivate("ahk_exe " abletonLiveAppName)
        If (InStr(WinGetTitle("A"), "*")) {
			MsgBox "Guarda el proyecto por primera vez"
			ExitApp
    	}
    	Else {
    	    WinClose("ahk_exe " abletonLiveAppName)
			WinWaitClose("ahk_exe " abletonLiveAppName)
    	}
    }
}

OpenDropbox() {
    If (ProcessExist("Dropbox.exe")) {
        ExitApp
    }
    Else {
    	RunWait "C:\Program Files (x86)\Dropbox\Client\Dropbox.exe"
    	ProcessWait("Dropbox.exe")
    	ExitApp
    }
}