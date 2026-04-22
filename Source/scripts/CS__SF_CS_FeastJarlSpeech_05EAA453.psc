;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname CS__SF_CS_FeastJarlSpeech_05EAA453 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
(GetOwningQuest() as CS_InfluenceChangesScript).AdjustInfluence((GetOwningQuest() as CS_FeastScript).citynum, "Jarl", 5)
(GetOwningQuest() as CS_FeastScript).AllCheer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
getowningquest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(GetOwningQuest() as CS_FeastScript).BardSongs.StopAllSongs()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
