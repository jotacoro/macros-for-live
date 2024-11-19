#Requires AutoHotkey v2.0.18+

;To not mix user activity with the script activity
SendMode "Input"
; To not run more than an instance of this script
#SingleInstance Force

; Define variables
abletonLiveAppName := "Ableton Live 12 Suite.exe"
abletonVersionInWindowTitle := "Ableton Live 12 Suite"
projectsPath := "C:\Users\" A_UserName "wherever\your-projects\are-saved"

; The script will not exit automatically, even though it has nothing to do.
Persistent

; Runs the SaveProject function each 10 minutes
SetTimer SaveProject, 600000
Return

GetMainAbletonLiveWindow() {
    windows := WinGetList(abletonVersionInWindowTitle)
    mainWindow := WinGetList(abletonVersionInWindowTitle)[1]
    Return mainWindow
}

; Function to get the project name from the Ableton Live window title
GetProjectNameFromWindow() {
	abletonMainWindow := GetMainAbletonLiveWindow()
    ; If Ableton Live window is activated
    if WinActive(abletonMainWindow) {
		; Get the Ableton window title
		abletonWindowTitle := WinGetTitle("A")
		
		; Get the project name from Window title
		RegExMatch(abletonWindowTitle, "(.+[^\*])(\*?)( - Ableton Live 12 Suite)", &RegExResults)
		return RegExResults[1] ".als"
	}
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
	abletonMainWindow := GetMainAbletonLiveWindow()
	; Check if the active window's title contains "*"
    while (InStr(WinGetTitle(abletonMainWindow), "*") != 0) {
        Sleep(500)  ; Pause for 500 milliseconds before checking again
    }
    Return ; project is saved. "*" is not present in window title
}

/* Function to check if Ableton is running.
Then checks if the project exists, and saves it in that case
*/
SaveProject() {
	if(ProcessExist(abletonLiveAppName)) {
		abletonMainWindow := GetMainAbletonLiveWindow()
		projectFileName := GetProjectNameFromWindow()
		if (projectFileExists(projectsPath, projectFileName)) {
			if WinActive(abletonMainWindow) {
				if (InStr(WinGetTitle("A"), "*")) {
					Send "^s"
					WaitForSavedProject()
				}
			}
		}
	}
	else {
		ExitApp ;If Ableton is not running end this script
	}
}
