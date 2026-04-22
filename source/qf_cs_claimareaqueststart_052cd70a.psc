;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_ClaimAreaQuestStart_052CD70A Extends Quest Hidden

;BEGIN ALIAS PROPERTY ClaimedArea
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ClaimedArea Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ClaimAreaQuest.start()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property ClaimAreaQuest  Auto  

LocationAlias Property ClaimedArea  Auto  
