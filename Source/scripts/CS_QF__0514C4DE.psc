;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname CS_QF__0514C4DE Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CS_UpgradeCity.PayForUpgrade()
RegisterForSingleUpdateGameTime(UpgradeTime.GetValue() as int)
AllowUpgrade.SetValue(0)
endFunction

Event OnUpdateGameTime()
	UpgradeQuest.SetStage(100)
EndEvent

Function BugFixMaybe()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold001  Auto  

Quest Property UpgradeQuest  Auto  

GlobalVariable Property UpgradeCost  Auto  

GlobalVariable Property UpgradeTime  Auto  

GlobalVariable Property AllowUpgrade  Auto  

LocationAlias Property UpgradeCity  Auto  

Location Property CityLocation  Auto  

GlobalVariable Property Treasury  Auto  

CS_UpgradeCityScript Property CS_UpgradeCity Auto
