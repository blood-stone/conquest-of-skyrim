;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname CS_DefendVillage extends Quest  

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
debug.notification("Rorikstead is under attack! " + TotalEnemyNum.GetValue() + " Total Spawned ")
RegisterForUpdateGameTime(0.5)
EndFunction

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(AttackedLocation) == 0
		If AttackingGuard.GetDeadCount() != TotalEnemyNum.GetValue()
			debug.notification("Rorikstead has been captured")
			CaptureMarker.disable()
			HoldingValue.SetValue(EnemyFactionValue.GetValue())
		EndIf
		UnRegisterForUpdateGameTime()
		DefendQuest.Stop()
	Else
		If AttackingGuard.GetDeadCount() == TotalEnemyNum.GetValue()
			UnRegisterForUpdateGameTime()
			DefendQuest.Stop()
		EndIf		
	EndIf
EndEvent

Function BugFix()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property AttackedLocation  Auto  

ObjectReference Property CaptureMarker  Auto  

GlobalVariable Property HoldingValue  Auto  

GlobalVariable Property EnemyFactionValue  Auto  

ActorBase Property AttackingGuard  Auto  

GlobalVariable Property TotalEnemyNum  Auto  

Quest Property DefendQuest  Auto  
