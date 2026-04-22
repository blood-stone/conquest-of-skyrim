;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF_CS_TeleportToPlayer_02010282 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
debug.notification("This is running")
While akActor.GetCurrentLocation() != PlayerREF.GetCurrentLocation()
	debug.notification("Teleport Package Started")
	debug.notification("Distance = " + akActor.GetDistance(PlayerREF))
	akActor.DisableNoWait()
	akActor.MoveTo(PlayerREF,10, 10)
	akActor.EnableNoWait()
	akActor.EvaluatePackage()
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

GlobalVariable Property GameDaysPassed  Auto  

ReferenceAlias Property TroopRef  Auto  
