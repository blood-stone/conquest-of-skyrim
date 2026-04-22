;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname PRKF_CS_RestrictInteriorTroo_0501BA56 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
DoorAlias.ForceRefTo(akTargetRef)
int i = 0
while i < FollowCommander.GetSize()
	if (FollowCommander.GetAt(i) as GlobalVariable).GetValue() == 1
		(FollowCommander.GetAt(i) as GlobalVariable).SetValue(2)
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property DoorAlias  Auto  

FormList Property FollowCommander  Auto  
