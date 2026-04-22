;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PF_CS_FollowPlayerPackageTro_0516091C Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
akActor.SetPlayerTeammate(false, false)
akActor.SetAV("Confidence", 4 as Float)
akActor.SetAV("Aggression", 1 as Float)
akActor.SetAV("Morality", 0 as Float)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akActor.SetPlayerTeammate(true, true)
akActor.SetAV("Confidence", 4 as Float)
akActor.SetAV("Aggression", 1 as Float)
akActor.SetAV("Morality", 0 as Float)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  
