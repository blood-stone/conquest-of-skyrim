;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_RefreshRespawnTime Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
int i = 0
while i < MiscCounts.GetSize()
	MiscCount.SetValue(MiscCount.GetValue() + (MiscCounts.GetAt(i) as GlobalVariable).GetValue())
	i += 1
endwhile
DailyTroopLimit.SetValue(1*MiscCount.GetValue() + 3*FortCount.GetValue()+ 3*VillageCount.GetValue() + 5*MinorCityCount.GetValue() + 7*MajorCityCount.GetValue())
DailyTroopLimitMinus5.SetValue(DailyTroopLimit.GetValue() - 5)
If DailyTroopSpawned.GetValue() >= DailyTroopLimit.GetValue()
	If GameDaysPassed.GetValue() >= RespawnTime.GetValue()
		DailyTroopSpawned.SetValue(0)
	EndIf
ElseIf DailyTroopSpawned.GetValue() < DailyTroopLimit.GetValue()
	If GameDaysPassed.GetValue() >= RespawnTime.GetValue()
		DailyTroopSpawned.SetValue(0)
	EndIf
EndIf
MiscCount.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property RespawnTime  Auto  

GlobalVariable Property DailyTroopSpawned  Auto  

GlobalVariable Property DailyTroopLimit  Auto  

GlobalVariable Property GameDaysPassed  Auto  
