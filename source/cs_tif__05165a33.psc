;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__05165A33 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(PrisonerNew.GetReference() as Actor).AddItem(PrisonerCuffs)
(PrisonerNew.GetReference() as Actor).EquipItem(PrisonerCuffs, true)
(PrisonerNew.GetReference() as Actor).RemoveItem((PrisonerNew.GetReference() as Actor).GetEquippedWeapon())
(PrisonerNew.GetReference() as Actor).RemoveItem((PrisonerNew.GetReference() as Actor).GetEquippedWeapon())
(PrisonerNew.GetReference() as Actor).RemoveItem((PrisonerNew.GetReference() as Actor).GetEquippedWeapon())
debug.SendAnimationEvent((PrisonerNew.GetReference() as Actor), "IdleStop")
(PrisonerNew.GetReference() as Actor).PlayIdle(OffsetBoundStandingStart)
PrisonerNum.SetValue(PrisonerNum.GetValue() + 1)
PrisonerNumNonPerm.SetValue(PrisonerNumNonPerm.GetValue() + 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias[] Property Prisoner  Auto  

Armor Property PrisonerCuffs  Auto  

Idle Property OffsetBoundStandingStart  Auto  

ReferenceAlias[] Property PrisonerGuard  Auto  

ReferenceAlias Property PrisonerNew  Auto  

ReferenceAlias Property GuardFollower  Auto  

GlobalVariable Property PrisonerNum  Auto  

GlobalVariable Property PrisonerNumNonPerm  Auto  
