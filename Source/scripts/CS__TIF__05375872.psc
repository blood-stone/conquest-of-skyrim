;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname CS__TIF__05375872 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
TroopManageQuest.Stop()
TroopManageQuest.SetStage(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RespawnTime  Auto  

GlobalVariable Property DailyTroopSpawned  Auto  

GlobalVariable Property DailyTroopLimit  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property MiscCount  Auto  

GlobalVariable Property VillageCount  Auto  

GlobalVariable Property MinorCityCount  Auto  

GlobalVariable Property MajorCityCount  Auto  

GlobalVariable Property DailyTroopLimitMinus5  Auto  

FormList Property MiscCounts  Auto  

GlobalVariable Property FortCount  Auto  

Quest Property TroopManageQuest  Auto  
