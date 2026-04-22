;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_TIF__02032CA4 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ExecutionerAlias.ForceRefTo(akSpeaker)
HasExecutioner.SetValue(1)
int i = 0
while i < OutfitExecutioner.GetSize()
	Armor Piece = OutfitExecutioner.GetAt(i) as Armor
	akSpeaker.EquipItem(Piece, true)
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ExecutionerAlias  Auto  

GlobalVariable Property HasExecutioner  Auto  

FormList Property OutfitExecutioner  Auto  
