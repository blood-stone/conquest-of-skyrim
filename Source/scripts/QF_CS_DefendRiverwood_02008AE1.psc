;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname QF_CS_DefendRiverwood_02008AE1 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
debug.notification("Riverwood is under attack! " + TotalEnemyNum.GetValue() + " Total Spawned ")
RegisterForUpdateGameTime(0.5)
EndFunction

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(AttackedLocation) == 0
		If AttackingGuard.GetDeadCount() != TotalEnemyNum.GetValue()
			debug.notification("Riverwood has been captured")
			AreaCount.SetValue(AreaCount.GetValue() - 1)
			int i = 0
			while i < PlayerGuards.GetSize()
				ObjectReference Guard = PlayerGuards.GetAt(i) as ObjectReference
				Guard.disable()
				i += 1
			endwhile
			GarrisonCount.SetValue(0)
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

ObjectReference Property TroopClearer  Auto  

GlobalVariable Property AreaCount  Auto  

GlobalVariable Property GarrisonCount  Auto  

FormList Property PlayerGuards  Auto  
