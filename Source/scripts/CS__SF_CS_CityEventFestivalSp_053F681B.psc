;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname CS__SF_CS_CityEventFestivalSp_053F681B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(GetOwningQuest() as CS_FeastScript).BardStopPlaying()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
getowningquest().setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
