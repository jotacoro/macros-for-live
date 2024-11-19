#Requires AutoHotkey v2.0.18+

abletonVersionInWindowTitle := "Ableton Live 12 Suite"
abletonMainWindow := GetMainAbletonLiveWindow()

; Change here the path of the menu option you want to select
MenuSelect WinGetTitle(abletonMainWindow),,"Archivo","Exportar MIDI Clip..."

GetMainAbletonLiveWindow() {
    windows := WinGetList(abletonVersionInWindowTitle)
    mainWindow := WinGetList(abletonVersionInWindowTitle)[1]
    Return mainWindow
}
