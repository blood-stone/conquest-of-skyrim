;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname PF_CS_FollowPlayerPackageTro_0202C084 Extends Package Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(Actor akActor)
;BEGIN CODE
akActor.RemoveFromFaction(InteriorFollowerFaction)
TroopInteriorNum.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(Actor akActor)
;BEGIN CODE
akActor.SetPlayerTeammate(true, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

Faction Property InteriorFollowerFaction  Auto  

GlobalVariable Property TroopInteriorNum  Auto  
