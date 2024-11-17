/*
 		    Definitive Live 6 Script, compiled & edited by rozling

  		   Based on Ableton Live 5 browsercontrols by djsynchro v0.04
			   Now includes Stutter's AHK Scripts,
			      drb's Expand Edit Window script,
			    Part of SubQ's Browser Select Script
		    & Ableton Live Mousewheel Modifier by ilia, version 0.2,

					***********

			This script has been tested at 1024x768 resolution,
				running the 'metal' skin in Live.  
		   Please edit to ensure compatibilitywith other configurations.

					***********

                                       W A R N I N G

  Use this script at your own risk! I won't be accepting responsibility if it crashes your computer or
  goes and insults your mother.  Autohotkeys has some huge possibilities for Live users and I'd love to
  see more people getting in on the red hot scripting action.  Please improve this script and share on the forum!


  				     F U N C T I O N S

  Pause			Suspends the script no matter what window is open - N.B. the hotkeys 
			are still mapped and some keys might not be passed to whatever window you have open. 
  Space			Pause (as opposed to play)  
  Tab			Browser open/close 
  l/Ctrl+l		Press l to 'mark' your selected clip slot, navigate to your desired clip in 
			the browser, then press Ctrl+l to load the clip in your selected slot.
  ALT+1...3		Browsers 1,2,3, & select first item  **Needs compatibility update w/L6**
  Alt+4...5		Devices/Plugin
  `			Browser preview
  Windows Key 		Toggle clip/device view
  Right Alt Key		Track/clip view
  Right Ctrl key	Alt (with arrow keys) change focus between Browser-Session-Clips/Devices.
  Pageup/pagedown	Undo/Redo
  /, \, & RShift	Cut/Copy/Paste
  F1 - F10		Remapped to symbols in order to make them assignable using Live's key mapping.
  Insert		Inserts a scene (when Clip View is in focus).
  [			Maximise Clip View (need to make this toggleable to both maximise & minimise)
  Ctrl+f		Find
  '-'&'='		Mapped to '-'&'+' for one-press zooming.

  'right-click'/'menu'  (beside Right Alt) ***USE WITH CAUTION*** 
			Clicks mouse in the middle of Session view (to be replaced with a mouseup/down for less risk) 

  Ctrl+Shift+b		Highlight clip brace start **still in development**
 
  
 				P L A N N E D   F U N C T I O N S

  - Make the script more user configurable using a GUI or .ini file accessible from the Taskbar 
  - Tempo 'push' keys
    menu (see the 'Ghoster'script).
  - GUI 'frame' around the edges of Live (i.e. a flashing/pulsing colour) to display the beat.
  - Map browser buttons to number keys while keeping Qwerty search available.
                              or
  - Have Caps Lock cycle through browser folders, freeing up the number keys completely.
  - Browse Albums/Singles by cover... more a wish than a planned function...
  - Update all 'MouseClick' actions to 'Click'

					C H A N G E L O G

  07-04-01 - Ctrl+r (rename) & Ctrl+f (find) temporarily suspend the script
		 Better display when suspending script
  07-02-08 - Added Browser Clip Loader :) Press l to 'mark' your selected clip slot, navigate to your desired 
	           clip in the browser, then press Ctrl+l to load the clip in your selected slot.
  07-02-07 - Added i for toggle I/O view, took advantage of window groups to clean up script,
	           added Drb & SubQ's script, temporarily commented out.
  07-02-06 - Tidied up comments/instructions, added Ableton Live Mousewheel Modifier by ilia, version 0.2
  06-07-28 - Added a basic version of Clip Brace Selector. Press Ctrl+Shift+b while your clip is selected
	           (clip/track view can be shown or hidden) to select your clip start brace.


*/

{
SplashImage, AutoHotkey_logo_no_text.gif, W250 H205 B1, Compiled & edited by Rozling, The Definitive Live Autohotkey Script, 

Sleep, 2000
SplashImage, Off
}

;					Window Handling
;        ------------------------------------------------------------------------------
; Defines Live's window as the one to execute commands on:
	GroupAdd, Live, ahk_class Afx:00400000:0:00000000:01900015:00000000
	GroupAdd, Live, ahk_class Afx:00400000:0:00000000:01900015:02BB05FD
	GroupAdd, Live, ahk_class Afx:00400000:0:00000000:01900015:02FF0351
	curMode := 1
	return


;					Script Exiting
;        ------------------------------------------------------------------------------
; Maps the Pause button to suspend the script:

Pause::
  Suspend
  If A_IsSuspended
    Text=Hotkeys Paused
  Else
    Text=Hotkeys Activated
  CustomColor = EEAA99
  Gui, +AlwaysOnTop +LastFound +ToolWindow
  Gui, Color, %CustomColor%
  Gui, Font, s40
  Gui, Add, Text, cLime, % Text
  WinSet, TransColor, %CustomColor% 250
  Gui, -Caption
  Gui, Show, x466 y301 NoActivate
  Sleep, 500
  Gui, Destroy
Return

;					Browser Hotkeys
;    ------------------------------------------------------------------------------------

#IfWinActive, ahk_group Live
{
Tab::^!b ; Tab = Open/Close browser

`:: ; Toggle browser preview on/off
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  51, 100, , 0 ; Preview button
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return	
}

!4::
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  21,  118, , 0 ; Live devices browser
	MouseMove, 66,  117, 0 ; move to first item in browser
	Sleep 200
	MouseClick, left,  65,  136,  1 , 0 ; select first item in browser
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return
}

!5::
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  21,  142, , 0 ; plugins browser
	MouseMove, 66,  117, 0 ; move to first item in browser
	Sleep 200
	MouseClick, left,  65,  136, 1 , 0 ; select first item in browser
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return
}

!1::  ;
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  21,  165, , 0 ; browser #1
	MouseMove, 66,  117, 0 ; move to first item in browser
	Sleep 200
	MouseClick, left,  65,  154, 1 , 0 ; select first item in browser
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return
}

!2::
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  21,  189, , 0 ; browser #2
	MouseMove, 66,  117, 0 ; move to first item in browser
	Sleep 200
	MouseClick, left,  65,  154, 1 , 0 ; select first item in browser
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return
}

!3::
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  21,  213 ; browser #3
	MouseMove, 66,  117, 0 ; move to first item in browser
	Sleep 200
	MouseClick, left,  65,  154, 1 , 0 ; select first item in browser
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return
}



Appskey::
{	
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left, 482, 213 ; clip view <<<<change to move mouse wheel!
        MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Return
}

        Lwin::+tab
;{	MouseGetPos, xpos, ypos ; get mouse position
;	MouseClick, left, 48, 760 ; Sample view
;	Sleep 50
;	MouseClick, left, 991, 90 ; Select Session view
;	MouseMove, xpos, ypos, 0 ; return mouse to where it was
;	Return
;}

}

;				Browser Clip Loader
;    ------------------------------------------------------------------------------------

#IfWinActive, ahk_group Live
{
l::
{
	PixelSearch, SelectedSessionClipX, SelectedSessionClipY, 350, 82, 911, 544, 0xFFCA83 [Fast]
{
	Send, !{Up}!{Left}
}
	return
}
	return

^l::
{
	PixelSearch, SelectedBrowserClipX, SelectedBrowserClipY, 38, 144, 130, 568, 0xFFCA83 [Fast]
	MouseClickDrag, left,  (SelectedBrowserClipX + 35), (SelectedBrowserClipY + 10),  (SelectedSessionClipX + 30), (SelectedSessionClipY + 7) 
	Return
}

}
Return	

;				Hard Key Remapping
;    ------------------------------------------------------------------------------------

#IfWinActive, ahk_group Live
{
  Space::+Space
    ; <<<changes space to Shift+Space so that it acts as a PAUSE rather than stop

  ^r:: 
    ; <<<Suspends script while renaming.
  Suspend , on 
  Send ^r 
  { 
    SetTimer, labelb, 500 
    ;; Example: On-screen display (OSD) via transparent window: 
    ; 
    CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below). 
    Gui, +AlwaysOnTop +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item. 
    Gui, Color, %CustomColor% 
    Gui, Font, s40 
    Gui, Add, Text, cLime,  Hotkeys Paused   ; XX & YY serve to auto-size the window. 
    ;Make all pixels of this color transparent and make the text itself translucent (150): 
    WinSet, TransColor, %CustomColor% 250 
    Gui, -Caption  ; Remove the title bar and window borders. 
    ; SetTimer, UpdateOSD, 200 
    ; Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer. 
    
    Gui, Show, x466, y301 NoActivate, Paused;  NoActivate avoids deactivating the currently active window. 
    return 
    
    ; UpdateOSD: 
    ; FormatTime, Time_a , h:m:s  ;MouseGetPos, MouseX, MouseY 
    ; GuiControl,, MyText , %Time_a% 
    ; return 
    }
    labelb: 
    SetTimer,labelb, off 
    Gui, destroy 
  Keywait Return , d
  Suspend , off
    { 
    SetTimer, labelc, 500 
    ;; Example: On-screen display (OSD) via transparent window: 
    ; 
    CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below). 
    Gui, +AlwaysOnTop +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item. 
    Gui, Color, %CustomColor% 
    Gui, Font, s40 
    Gui, Add, Text, cLime,  Hotkeys Activated   ; XX & YY serve to auto-size the window. 
    ;Make all pixels of this color transparent and make the text itself translucent (150): 
    WinSet, TransColor, %CustomColor% 250 
    Gui, -Caption  ; Remove the title bar and window borders. 
    ; SetTimer, UpdateOSD, 200 
    ; Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer. 
    
    Gui, Show, x466, y301 NoActivate, Activated;  NoActivate avoids deactivating the currently active window. 
    return 
    
    ; UpdateOSD: 
    ; FormatTime, Time_a , h:m:s  ;MouseGetPos, MouseX, MouseY 
    ; GuiControl,, MyText , %Time_a% 
    ; return 
    }
    labelc: 
    SetTimer,labelc, off 
    Gui, destroy 
  return

	^f:: 
    ; <<<Suspend script while finding, & remaps Ctrl+f to Ctrl+Shift+f
  Suspend , on 
  Send ^+f 
    { 
    SetTimer, labeld, 500 
    ;; Example: On-screen display (OSD) via transparent window: 
    ; 
    CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below). 
    Gui, +AlwaysOnTop +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item. 
    Gui, Color, %CustomColor% 
    Gui, Font, s40 
    Gui, Add, Text, cLime,  Hotkeys Paused   ; XX & YY serve to auto-size the window. 
    ;Make all pixels of this color transparent and make the text itself translucent (150): 
    WinSet, TransColor, %CustomColor% 250 
    Gui, -Caption  ; Remove the title bar and window borders. 
    ; SetTimer, UpdateOSD, 200 
    ; Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer. 
    
    Gui, Show, x466, y301 NoActivate, Paused;  NoActivate avoids deactivating the currently active window. 
    return 
    
    ; UpdateOSD: 
    ; FormatTime, Time_a , h:m:s  ;MouseGetPos, MouseX, MouseY 
    ; GuiControl,, MyText , %Time_a% 
    ; return 
    }
    labeld: 
    SetTimer,labeld, off 
    Gui, destroy 
  Keywait Return , d
  Suspend , off
      { 
    SetTimer, labele, 500 
    ;; Example: On-screen display (OSD) via transparent window: 
    ; 
    CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below). 
    Gui, +AlwaysOnTop +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item. 
    Gui, Color, %CustomColor% 
    Gui, Font, s40 
    Gui, Add, Text, cLime,  Hotkeys Activated   ; XX & YY serve to auto-size the window. 
    ;Make all pixels of this color transparent and make the text itself translucent (150): 
    WinSet, TransColor, %CustomColor% 250 
    Gui, -Caption  ; Remove the title bar and window borders. 
    ; SetTimer, UpdateOSD, 200 
    ; Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer. 
    
    Gui, Show, x466, y301 NoActivate, Activated;  NoActivate avoids deactivating the currently active window. 
    return 
    
    ; UpdateOSD: 
    ; FormatTime, Time_a , h:m:s  ;MouseGetPos, MouseX, MouseY 
    ; GuiControl,, MyText , %Time_a% 
    ; return 
    }
    labele: 
    SetTimer,labele, off 
    Gui, destroy 
  return
      
  ^+f:: 
    ; <<<Suspends script while finding.
  Suspend , on 
  Send ^+f 
    { 
    SetTimer, labelf, 500 
    ;; Example: On-screen display (OSD) via transparent window: 
    ; 
    CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below). 
    Gui, +AlwaysOnTop +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item. 
    Gui, Color, %CustomColor% 
    Gui, Font, s40 
    Gui, Add, Text, cLime,  Hotkeys Paused   ; XX & YY serve to auto-size the window. 
    ;Make all pixels of this color transparent and make the text itself translucent (150): 
    WinSet, TransColor, %CustomColor% 250 
    Gui, -Caption  ; Remove the title bar and window borders. 
    ; SetTimer, UpdateOSD, 200 
    ; Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer. 
    
    Gui, Show, x466, y301 NoActivate, Paused;  NoActivate avoids deactivating the currently active window. 
    return 
    
    ; UpdateOSD: 
    ; FormatTime, Time_a , h:m:s  ;MouseGetPos, MouseX, MouseY 
    ; GuiControl,, MyText , %Time_a% 
    ; return 
    }
    labelf: 
    SetTimer,labelf, off 
    Gui, destroy 
  Keywait Return , d
  Suspend , off
        { 
    SetTimer, labelg, 500 
    ;; Example: On-screen display (OSD) via transparent window: 
    ; 
    CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below). 
    Gui, +AlwaysOnTop +LastFound +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item. 
    Gui, Color, %CustomColor% 
    Gui, Font, s40 
    Gui, Add, Text, cLime,  Hotkeys Activated   ; XX & YY serve to auto-size the window. 
    ;Make all pixels of this color transparent and make the text itself translucent (150): 
    WinSet, TransColor, %CustomColor% 250 
    Gui, -Caption  ; Remove the title bar and window borders. 
    ; SetTimer, UpdateOSD, 200 
    ; Gosub, UpdateOSD  ; Make the first update immediate rather than waiting for the timer. 
    
    Gui, Show, x466, y301 NoActivate, Activated;  NoActivate avoids deactivating the currently active window. 
    return 
    
    ; UpdateOSD: 
    ; FormatTime, Time_a , h:m:s  ;MouseGetPos, MouseX, MouseY 
    ; GuiControl,, MyText , %Time_a% 
    ; return 
    }
    labelg: 
    SetTimer,labelg, off 
    Gui, destroy 
  return
    

  s::^e
    ; <<<Split
  
	PgUp::^z
		; <<<Undo
	PgDn::^y
		; <<<Redo
	/::^x
		; <<<Cut
	\::^c
		; <<<Copy
	Rshift::^v
		; <<<Paste
  Rctrl::Alt
		; <<<Right Control -> Alt for highlighting various panes w/arrow keys.
  Ralt::+F12
		; <<<Toggle Clip/Track views
	=::+ 
		; <<<changed '=' to '+' for one-press zooming.
	SC152::^i 
		; <<<maps the 'Insert' key to 'insert scene'
	LAlt & Tab::AltTab
		; <<<Fixed Alt+Tab
	LControl & Tab::Send {Tab}
		; <<<Control + Tab works as Tab
	LShift & Tab::Send {Tab}
		; <<<Left Shift + Tab works as Tab
 	  ; ~::^!i 
		; <<<disabled - maps '~' to 'Capture and insert scene.' (copy playing clips to a new scene)
	
  m::^!m 
		; <<< disabled - maps the 'm' key to Ctrl+Alt+m to toggle the mixer display.  To make this key # put in              		; SC02B instead 
	i::
    ; <<<Maps 'i' to open Routing - the standard keyboard shortcut doesn't work on my system, only
    ;    the below keyboard sequence works, so I've left it this way in case it's the same everywhere.
{
Send {RCtrl Down}{RAlt Down}{i}{Ralt Up}
Sleep 50
Send {RAlt Down}{i}{Ralt Up}{RCtrl Up}
return
}

	x::^!f
	  ;  Show Crossfader section
 
	F1::á
	F2::é 
	F3::¬
	F4::ó
	F5::ú
	F6::Á
	F7::É
	F8::Í
	F9::Ó
	F10::Ú
		; <<<Function Keys - remapped to allow for Live keyboard mapping.

; From Adapted from Browser Select Script

	;Remove Stop Button
	o::^e

	;Toggle Pen Mode
	p::^b

	;Toggle Track, Clip View
	t::+Tab

	;To Duplicate
	d::^d

	;Sixteen Note QUantization
	6::^6

	;Eight Note Quantization
	7::^7

	;Quarter Note Quantization
	8::^8

	;1 Bar Quantization
	0::^0

	;From Session To Browser
	b::!Left

	;From Browser to Devices
	n::!Down

	;From Devices To Session
;	m::!Up


; Even more keys:
; 	i::Send LControlDown,RAlt,i,Ralt,i,LControlUp
; 		Display I/O

e::
  ; <<<Maximise/minimise the clip edit window (for using the whole screen to edit waveforms/automation etc)
  ;    Probably needs to be edited to work with different resolutions.
if Edit_window = Maximised
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClickdrag, left, 1001, 80, 1005, 579 ; Edit Window
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Edit_Window = Minimised
	Return
}
else
{
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClickdrag, left,  995, 577, 985, 79 ; Edit Window
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
	Edit_Window = Maximised
	Return
}


/*
;			SETTING FOCUS by stutter
;   -------------------------------------------------------

b::
#IfWinActive, ahk_class Afx:00400000:0:00000000:01900015:00000000
{
Send, !{Down}!{Down}!{Down}!{Down}!{Down}!{Down}
}
return
; Focus on clip details - NEEDS Making compatible with CLIP BRACE


n::
#IfWinActive, ahk_class Afx:00400000:0:00000000:01900015:00000000
{
Send, !{Up}!{Left}
}
return
; Focus on browser


m::
#IfWinActive, ahk_class Afx:00400000:0:00000000:01900015:00000000
{
Send, !{Right}!{Up 3}!{Down}
}
return
; Focus on clip slot


,::
#IfWinActive, ahk_class Afx:00400000:0:00000000:01900015:00000000
{
Send, !{Right}!{Up 3}
}
return
; Focus on track title

.::
#IfWinActive, ahk_class Afx:00400000:0:00000000:01900015:00000000
{
Send, !{Right}!{Up 3}!{Down 2}
}
return
; Focus on Overview, not sure for what use
*/


;--------------------------------------------------------------------------
;EXPAND EDIT WINDOW WITH A KEY TO TOGGLE LARGE/SMALL
;script by db@skylab2000.com - please email fixes & improvements v.1

;window must initially be in default small edit size to use this toggle key
;don't resize manually - only use this toggle key so the script knows where the windows was resized to.

; NB This appears not to work on my system so I have left in my own implementation above - Rozling.

#IfWinActive, ahk_class Afx:00400000:0:00000000:01900015:00000000
;
;define vars
f12:: ; choose key to redefine (this is f9, which was record key)
wheight = 125 ; top row # of window size desired - approx 125 -700 are 'legal'
;
;
if window = closed ; test window state
{
;open window
MouseGetPos, xpos, ypos ; get mouse position
MouseClickDrag, L, 200, 759, 200, wheight ; open window to size defined in wheight above
MouseMove, xpos, ypos, 0 ; return mouse to where it was
MsgBox, 0,, window was just expanded, .5 ; display window state for testing
window = open ; update window status variable
return
}
else
{
;close window
MouseGetPos, xpos, ypos ; get mouse position
MouseClickDrag, L, 200, wheight, 200, 759 ; close window to normal
MouseMove, xpos, ypos, 0 ; return mouse to where it was
msgbox, 0,, window was just contracted, .5 ; display window state for testing
window = closed ; update window status variable
}
return
;--------------------------------------------------------------------------


}


;			Highlight Clip Start Brace (in development)
;    ------------------------------------------------------------------------------------

#IfWinActive, ahk_group Live
{
^+b:: 
; Gosub, ChkLoopView
Gosub, ChkClipTrack


Click_ClipBrace:
If ClipTrackStatus = Shown
{
ImageSearch, ClipBraceStartX, ClipBraceStartY, 87, 594, 1017, 615, *55 Clipbrace start - unselected.jpg

if ErrorLevel = 2
	MsgBox Clipbrace Start:  Could not conduct the search.
else if ErrorLevel = 1
	MsgBox Clipbrace Start:  Couldn't see the icon.
else
  Clip_Brace_Start_Visible := Shown
	MouseGetPos, xpos, ypos ; get mouse position
	MouseClick, left,  %ClipBraceStartX%,  %ClipBraceStartY% ; Click on Clip Brace start with x & y offset.
	MouseMove, xpos, ypos, 0 ; return mouse to where it was
  Return
}
else
{
	Send +{F12} ; open Clip/Track view
  ClipTrackStatus = Shown
	Goto, Click_ClipBrace
pause 
listvars
}
gosub, end

ChkClipTrack:
{
ImageSearch, CLipTrackX, ClipTrackY, 996,785, 1023, 812, *55 ClipTrack Hidden - Selected.jpg

if ErrorLevel = 2
	MsgBox CTHS: Could not conduct the search.
else if ErrorLevel = 1
	GoSub, CTHU
else
  ClipTrackStatus = Hidden
	; MsgBox The icon was found at %CLipTrackX%x%ClipTrackY%.
}
return



CTHU:
{
ImageSearch, CLipTrackX, ClipTrackY, 996,785, 1023, 812, *55 ClipTrack Hidden - Unselected.jpg

if ErrorLevel = 2
	MsgBox CTHU: Could not conduct the search.
else if ErrorLevel = 1
	GoSub, CTSS
else
        ClipTrackStatus = Hidden
	; MsgBox The icon was found at %CLipTrackX%x%ClipTrackY%.

}
return

CTSS:
{
ImageSearch, CLipTrackX, ClipTrackY, 996,785, 1023, 812, *55 ClipTrack Shown - Selected.jpg

if ErrorLevel = 2
	MsgBox CTSS: Could not conduct the search.
else if ErrorLevel = 1
	GoSub, CTSU
else
  ClipTrackStatus = Shown
	; MsgBox The icon was found at %CLipTrackX%x%ClipTrackY%.

}
return

CTSU:
{
ImageSearch, CLipTrackX, ClipTrackY, 996,785, 1023, 812, *55 ClipTrack Shown - Unselected.jpg

if ErrorLevel = 2
	MsgBox CTSU: Could not conduct the search.
else if ErrorLevel = 1
	MsgBox CTSU: Couldn't see the icon.
else
  ClipTrackStatus = Shown
	; MsgBox The icon was found at %CLipTrackX%x%ClipTrackY%.

}
return

/* ChkLoopView:
{
	ImageSearch, LoopViewX, LoopViewY, 18, 752, 38, 771, *55 Loop View Hidden - Unselected.jpg
if ErrorLevel = 2
	MsgBox Loop View: Could not conduct the search.
else if ErrorLevel = 1
	GoSub, ChkLoopView2
else
        LoopView = Hidden
	; MsgBox The icon was found at %LoopViewX%x%LoopViewY%.
}
return



ChkLoopView2:
{
	ImageSearch, LoopViewX, LoopViewY, 996,785, 1023, 812, *55 Loop View Shown - Unselected.jpg
if ErrorLevel = 2
	MsgBox Loop View: Could not conduct the search.
else if ErrorLevel = 1
	GoSub, ChkLoopView3
else
        LoopView = Shown
	; MsgBox The icon was found at %LoopViewX%x%LoopViewY%.

}
return

ChkLoopView3:
{
	ImageSearch, LoopViewX, LoopViewY, 996,785, 1023, 812, *55 Loop View Shown - selected.jpg
if ErrorLevel = 2
	MsgBox Loop View: Could not conduct the search.
else if ErrorLevel = 1
	GoSub, ChkLoopView4
else
        LoopView = Shown
	; MsgBox The icon was found at %LoopViewX%x%LoopViewY%.

}
return

ChkLoopView4:
{
	ImageSearch, LoopViewX, LoopViewY, 996,785, 1023, 812, *55 Loop View Hidden - selected.jpg
if ErrorLevel = 2
	MsgBox Loop View: Could not conduct the search.
else if ErrorLevel = 1
	LoopView = NotVisible
else
        LoopView = Shown
	; MsgBox The icon was found at %LoopViewX%x%LoopViewY%.

}
return

*/

}

;			Ableton Live Mousewheel Modifier by ilia, version 0.2
;    ------------------------------------------------------------------------------------
;     NB I think I left this at the end as it wouldn't work at other places in the script - Rozling.
#IfWinActive, ahk_group Live
{
WheelDown::
{
  if (curMode=0)
  {
  send {WheelDown}
  return
  }
  WinGetPos, x, y, w, h, A
  ; find where focus is
  PixelGetColor, f0, 29, h-23          ; get inactive color
  PixelGetColor, fArr,  w-24, 99       
  PixelGetColor, fBrws, 22, 92         
  PixelGetColor, fPlug, w-198, h-38    
  PixelGetColor, fClip, w-216, h-38    
                                       
  Arr := (fArr != fNone)               
  if (fBrws != f0) & (fBrws != fNone)  
  focus :=2                            ; browser
  else
  {                               
  if (fPlug != f0) & (fPlug != fNone)  
  focus :=3                            ; plug
  else
  {
    if (fClip != f0) & (fClip != fNone)  
  focus :=4                            ; clip
  else                                 
  focus :=1                           ; main window
  } 
  }

;   msgBox, Focus=%focus%


  if (focus = 2)
  send {down}
  else
  if (focus = 3)
  send {left}
  else 
  if (Arr)
  send -
  else
  send {left}

  return
}

WheelUp::
{
  if (curMode=0)
  {
  send {WheelUp}
	return
  }
  WinGetPos, x, y, w, h, A
 
  ; find where focus is

  PixelGetColor, fNone, 8, 62          ; get empty color
  PixelGetColor, f0, 29, h-23          ; get inactive color
  PixelGetColor, fArr,  w-24, 99       
  PixelGetColor, fBrws, 22, 92         
  PixelGetColor, fPlug, w-198, h-38    
  PixelGetColor, fClip, w-216, h-38    
                                       
  Arr := (fArr != fNone)             
                                     
  if (fBrws != f0) & (fBrws != fNone)
  focus :=2                            ; browser
  else                                 
  {                                    
  if (fPlug != f0) & (fPlug != fNone)  
  focus :=3                            ; plug
  else                                 
    {                                  
    if (fClip != f0) & (fClip != fNone)  
    focus :=4                          ; clip
    else                               
    focus :=1                          ; main window
    }
  }

  ;   msgBox, Focus=%focus%
  ;   msgBox, R=%R% G=%G% B=%B% Arr=%Arr%
  
  if (focus = 2)
  send {up}
  else
  if (focus = 3)
  send {right}
  else 
  if (Arr)
  send {NumPadAdd}
  else
  send {right}
  return   
}

MButton::
{
  curMode := 1-curMode                ; switch between modified and original behavior
  return
}

}

end:
