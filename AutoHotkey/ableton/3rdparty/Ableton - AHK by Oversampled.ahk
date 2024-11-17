;Ableton AHK Shortcuts by Oversampled
;This is a script for AutoHotKey that allows you to use all sorts of neat shortcuts to dramaticaly improve your workflow in Ableton

;Useful links:
;https://autohotkey.com/download/
;https://www.autohotkey.com/docs/Hotkeys.htm
;https://www.autohotkey.com/docs/KeyList.htm

;How to use:
;1. Install AutoHotKey
;2. Personalise the script to your own needs
;3. Run the script (using AHK app)
;4. Each time you make a change in the script make sure to reload it hitting F12
;(effect shortcuts are in line 53)


;>---------SKIP---------<
F13::ExitApp
;>---------SKIP---------<



;>---------RELOAD THE SCRIPT---------< (press F12 to reload the script after changing it)
F12::Reload
;>---------RELOAD THE SCRIPT---------<



;>--------------------------------EFFECT PICKER--------------------------------< (just a script, shortcuts are below)
effect(item)
{

;LOCK MOUSE MOVEMENT
BlockInput, SendAndMouse
BlockInput, On

Send ^{f}

;TYPE THE NAME OF THE EFFECT ("item)
Send %item%

;CHOOSE EFFECT
Sleep 200
Send {enter}
Send {enter}


;UNLOCK MOUSE MOVEMENT
BlockInput, Off

}

;>---------EFFECT SHORTCUTS---------<
;Replace effect names with your own, it will basically paste it into the search bar in ableton
;To make sure the script will find an Ableton effect/instrument etc. make sure to add an extension like ".adv" or ".adg"
;For loading VSTs use "vst PLUGIN NAME"
;I've put some examples below
;Exclaimation mark equals "ALT" so an example shortcut would be ALT+Z

!z::effect("EQ Eight.adv")
!x::effect("OTT.adv")
!c::effect("Utility.adv")
	
!v::effect("vst Serum")
!b::effect("vst Vital")
!n::effect("PasteEffectName")
!m::effect("PasteEffectName")
!,::effect("PasteEffectName")
!.::effect("PasteEffectName")
!/::effect("PasteEffectName")
			
!q::effect("PasteEffectName")
!w::effect("PasteEffectName")
!e::effect("PasteEffectName")
!r::effect("PasteEffectName")

;(hit ALT+F to open search bar and type "vst " for you - this allows you to type the plugin name for it to pop up easier)
!f::
Send ^{f}
Send vst
Send {space}
Return


;>--------------------------------EFFECT PICKER--------------------------------<





;>---------TRIPLE DUPLICATE---------< (duplicates a selected region 3 times using ALT+A combination)
!a::
Send ^{d}
Send ^{d}
Send ^{d}
return
;>---------TRIPLE DUPLICATE---------<






;>---------INSERT MIDI CLIP---------< (inserts empty midi clip on the selected region using CTRL+SHIFT+MiddleMouseButton combination)
^+MButton::
Send ^+m
return
;>---------INSERT MIDI CLIP---------<





;>---------MORE CONVENIENT REDO---------< (replaces very hard to reach CTRL+Y redo combination with more convinient one: CTRL+SHIFT+Z)
^+z::
Send ^{y}
return
;>---------MORE CONVENIENT REDO---------<





;>--------------------------------CHORD BUILDERS--------------------------------< (builds a 9th minor or major chord with a single press of ALT+2 or ALT+3)
;>---------MINOR 9th CHORD BUILDER---------<
!2::
;3rd
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}

;5th
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}
Send {up}

;7th
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}

;9th
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}
Send {up}
return





;>---------MAJOR 9th CHORD BUILDER---------<
!3::
;3rd
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}
Send {up}

;5th
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}

;7th
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}
Send {up}

;9th
Send ^{c}
Send ^{v}
Send {up}
Send {up}
Send {up}
return
;>--------------------------------CHORD BUILDERS--------------------------------<





;>--------------------------------MIDI NOTE MANIPULATION--------------------------------< (for moving your midi notes with the scroll wheel!)
;>---------NOTE TRANSPOSE OCTAVE---------< (SHIFT+MouseWheelUp/Down for transposing a note by an octave)
+WheelUp::
Send +{up}
Return

+WheelDown::
Send +{down}
Return

;>---------NOTE TRANSPOSE SEMITONE---------< (SHIFT+MouseWheelUp/Down for transposing a note by a semitone)
^+WheelUp::
Send {up}
Return

^+WheelDown::
Send {down}
Return

;>---------NOTE LENGTH---------< (SHIFT+ALT+MouseWheelUp/Down for lengthening or shortening the note)
+!WheelUp::
Send +{right}
Return

+!WheelDown::
Send +{left}
Return


;>---------NOTE MOVE LEFT & RIGHT---------< (CTRL+SHIFT+ALT+MouseWheelUp/Down for moving the note left/right)
^+!WheelUp::
Send {right}
Return

^+!WheelDown::
Send {left}
Return

;>---------DISABLE---------< (instead of hitting 0 on your keyboard to disable a clip/track etc. you can now hit MiddleMouseButton)
MButton::
Send {Numpad0}
Return
;>--------------------------------MIDI NOTE MANIPULATION--------------------------------<


;https://oversampled.us