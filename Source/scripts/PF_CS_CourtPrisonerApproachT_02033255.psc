;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_CS_CourtPrisonerApproachT_02033255 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akActor.MoveTo(PrisonerStartMarker)
PrisonerGuard.GetActorRef().MoveTo(PrisonerStartMarker)
akActor.AddItem(PrisonerCuffs)
akActor.EquipItem(PrisonerCuffs, true)
debug.SendAnimationEvent(akActor, "IdleStop")
akActor.PlayIdle(OffsetBoundStandingStart)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PrisonerStartMarker  Auto  

Armor Property PrisonerCuffs  Auto  

Idle Property OffsetBoundStandingStart  Auto  

ReferenceAlias Property PrisonerGuard  Auto  
