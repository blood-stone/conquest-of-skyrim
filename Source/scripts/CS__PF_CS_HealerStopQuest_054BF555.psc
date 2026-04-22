;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__PF_CS_HealerStopQuest_054BF555 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
debug.notification("Stopping Healer Quest")
akActor.SetAV("Magicka", 500)
GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
