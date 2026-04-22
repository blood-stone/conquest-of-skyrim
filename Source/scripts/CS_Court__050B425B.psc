;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_Court__050B425B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
WorshipValue.SetValue(0)
int i = 0
while i < Holdings.Length
	If Holdings[i].GetValue() == 1
		Popularity[i].SetValue(Popularity[i].GetValue() - 60)
	EndIf
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FreeSpeechValue  Auto  

GlobalVariable[] Property Popularity  Auto  

GlobalVariable[] Property Holdings  Auto  

GlobalVariable Property WorshipValue  Auto  
