;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname CS__SF_CS_BardBandSong01_0541547B Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
BardLead.GetActorRef().PlayIdle(IdleLuteStart)
Bard1.GetActorRef().PlayIdle(IdleFluteStart)
Bard2.GetActorRef().PlayIdle(IdleDrumStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
BardLead.GetActorRef().PlayIdle(IdleStop)
Bard1.GetActorRef().PlayIdle(IdleStop)
Bard2.GetActorRef().PlayIdle(IdleStop)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
int Continuous = (GetOwningQuest() as CS_BardBandScript).Continuous
if Continuous
	(GetOwningQuest() as CS_BardBandScript).ChooseNewSong(self as Scene)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property IdleDrumStart  Auto  

Idle Property IdleFluteStart  Auto  

Idle Property IdleLuteStart  Auto  

Idle Property IdleStop  Auto  

ReferenceAlias Property BardLead  Auto  

ReferenceAlias Property Bard1  Auto  

ReferenceAlias Property Bard2  Auto  
