;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court_0203326E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int i = 0
while i < Prisoners.Length
	If akSpeaker == Prisoners[i].GetActorRef()
		akSpeaker.AddToFaction(PrisonerPermanentFaction)
	EndIf
	i += 1
endwhile
i = 0
while i < AllHoldingValues.GetSize()
	GlobalVariable HoldingValue = AllHoldingValues.GetAt(i) as GlobalVariable
	if HoldingValue.GetValue() == CapitalHoldingValue.GetValue()
		GlobalVariable PrisonerNum = NonPermPrisonerNum.GetAt(i) as GlobalVariable
		PrisonerNum.SetValue(PrisonerNum.GetValue() - 1)
		i += 15
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PrisonerGuard  Auto  

ReferenceAlias Property Executionee  Auto  

ReferenceAlias Property ExecutionGuard  Auto  

ReferenceAlias[] Property Prisoners  Auto  

Scene Property ExecutionScene  Auto  

FormList Property AllLocations  Auto  

FormList Property AllHoldingValues  Auto  

GlobalVariable Property CapitalHoldingValue  Auto  

FormList Property NonPermPrisonerNum  Auto  

Armor Property PrisonerCuffs  Auto  

ReferenceAlias[] Property PrisonerPermanent  Auto  

Faction Property PrisonerPermanentFaction  Auto  
