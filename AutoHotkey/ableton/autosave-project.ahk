;To not mix user activity with the script activity
SendMode "Input"
; To not run more than an instance of this script
#SingleInstance Force

; Define variables
abletonLiveAppName := "Ableton Live 12 Suite.exe"
projectsPath := "C:\Users\" A_UserName "wherever\your-projects\are-saved"

; The script will not exit automatically, even though it has nothing to do.
Persistent

; Runs the SaveProject function each 10 seconds
SetTimer SaveProject, 10000
Return

; Function to get the project name from the Ableton Live window title
GetProjectNameFromWindow() {
    ; If Ableton Live window is activated
    if WinActive("ahk_exe " abletonLiveAppName) {
		; Get the Ableton window title
		abletonWindowTitle := WinGetTitle("A")
		
		; Get the project name from Window title
		RegExMatch(abletonWindowTitle, "(.+[^\*])(\*?)( - Ableton Live 12 Suite)", &RegExResults)
		return RegExResults[1] ".als"
	}
}

; Function to check if the project already exists in your projects path
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
    Return ; project is saved. "*" is not present in window title
}

/* Function to check if Ableton is running.
Then checks if the project exists, and saves it in that case
*/
SaveProject() {
	if(ProcessExist(abletonLiveAppName)) {
		projectFileName := GetProjectNameFromWindow()
		if (projectFileExists(projectsPath, projectFileName)) {
			if WinActive("ahk_exe " abletonLiveAppName) {
				if (InStr(WinGetTitle("A"), "*")) {
					Send "^s"
					WaitForSavedProject()
				}
			}
		}
	}
	else {
		ExitApp
	}
}
