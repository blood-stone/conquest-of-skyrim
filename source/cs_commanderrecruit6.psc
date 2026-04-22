;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_CommanderRecruit6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_PatrolHoldScript).RecruitCommander(akSpeaker, 6)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property CommanderAlias  Auto  

Faction Property CommanderFaction  Auto  

ReferenceAlias[] Property Troops  Auto  

GlobalVariable Property RecruitCommander  Auto  

FormList Property OutfitSteel  Auto  

ReferenceAlias Property Commander2Alias  Auto  
