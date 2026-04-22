;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_MinorJarlPrison Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Elisif.GetOwningQuest().SetStage(20)
int i = 0
while i < AllLocations.GetSize()
	Location CityLoc = AllLocations.GetAt(i) as Location
	if Game.GetPlayer().IsInLocation(CityLoc) == 1
		NewPrisonerAlias.ForceRefTo(akSpeaker)
		ArrestingGuardAlias.ForceRefTo((ArrestingGuardsLists[i].GetAt(utility.randomint(0, ArrestingGuardsLists[i].GetSize() - 1)) as Actor))
		ArrestScene.Start()
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList[] Property ArrestingGuardsLists  Auto  

ReferenceAlias Property ArrestingGuardAlias  Auto  

ReferenceAlias Property NewPrisonerAlias  Auto  

Scene[] Property ArrestingScenes  Auto  

FormList Property AllLocations  Auto  

Scene Property ArrestScene  Auto  

ReferenceAlias Property Elisif  Auto  
