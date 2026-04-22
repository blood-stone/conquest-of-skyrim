;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS__TIF__0512BA0B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_FactionEconomyReport.Menu(CS_FactionPlayer)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

CS_FactionEconomyReportScript Property CS_FactionEconomyReport Auto
ObjectReference Property CS_FactionPlayer Auto  
