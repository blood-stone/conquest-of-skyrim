;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_RefreshTroopsVillage extends TopicInfo  

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
If marker3.IsDisabled() == 1
	If GameHour.GetValue() >= 6
		Marker1.enable()
		Marker2.enable()
		marker3.enable()
	EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property GameHour  Auto  

ObjectReference Property Marker1  Auto  

ObjectReference Property Marker2  Auto  

ObjectReference Property marker3  Auto  
