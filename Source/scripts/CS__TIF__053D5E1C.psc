;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__TIF__053D5E1C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.SetRace(OrcRace)
int i = 0
while i < WhiterunGuards.GetSize()
	(WhiterunGuards.GetAt(i) as Actor).SetRace(OrcRace)
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Race Property OrcRace  Auto  

FormList Property WhiterunGuards  Auto  
