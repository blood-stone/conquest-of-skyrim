;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_JarlFree Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if akSpeaker == Elisif.GetActorRef()
	Elisif.GetOwningQuest().SetStage(30)
else
	Elisif.GetOwningQuest().SetStage(20)
endif

int i = 0
while i < AllLocations.GetSize()
	Location Loc = AllLocations.GetAt(i) as Location
	if CityLoc.GetLocation() == Loc
		if (akSpeaker as Actor) == Tullius
			TulliusCitizen.ForceRefTo(akSpeaker)
		else
			If JarlCitizens[i].GetActorRef() == None
				JarlCitizens[i].ForceRefTo(akSpeaker)
			EndIf
		endif
		Jarls[i].Clear()
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Elisif  Auto  

ReferenceAlias[] Property JarlCitizens  Auto  

FormList Property AllLocations  Auto  

LocationAlias Property CityLoc  Auto  

Actor Property Tullius  Auto  

ReferenceAlias Property TulliusCitizen  Auto  

ReferenceAlias[] Property Jarls  Auto  
