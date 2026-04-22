;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname PF_CS_PrisonerWhiterunFollow_0202430B Extends Package Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
akActor.MoveTo(PrisonMarker)
akActor.UnequipItem(Cuffs)
debug.SendAnimationEvent(akActor, "StopIdle")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property Cuffs  Auto  

ObjectReference Property PrisonMarker  Auto  

ReferenceAlias Property Guard  Auto  
