;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__05132F94 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int i = 0
while i < Prisoner.Length
	If Prisoner[i].GetReference() == None
		Prisoner[i].ForceRefTo(PrisonerNew.GetActorRef())
		PrisonerGuard[i].ForceRefTo(akSpeaker)
		(Prisoner[i].GetReference() as Actor).AddItem(PrisonerCuffs)
		(Prisoner[i].GetReference() as Actor).EquipItem(PrisonerCuffs, true)
		(Prisoner[i].GetReference() as Actor).RemoveItem((Prisoner[i].GetReference() as Actor).GetEquippedWeapon())
		(Prisoner[i].GetReference() as Actor).RemoveItem((Prisoner[i].GetReference() as Actor).GetEquippedWeapon())
		(Prisoner[i].GetReference() as Actor).RemoveItem((Prisoner[i].GetReference() as Actor).GetEquippedWeapon())
		debug.SendAnimationEvent((Prisoner[i].GetReference() as Actor), "IdleStop")
		(Prisoner[i].GetReference() as Actor).PlayIdle(OffsetBoundStandingStart)
		i = Prisoner.Length		
		PrisonerNum.SetValue(PrisonerNum.GetValue() + 1)
		PrisonerNumNonPerm.SetValue(PrisonerNumNonPerm.GetValue() + 1)
	EndIf
	i += 1
endwhile
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
