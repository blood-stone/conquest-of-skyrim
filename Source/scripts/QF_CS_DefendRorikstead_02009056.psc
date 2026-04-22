;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_DefendRorikstead_02009056 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_DefendVillage
Quest __temp = self as Quest
CS_DefendVillage kmyQuest = __temp as CS_DefendVillage
;END AUTOCAST
;BEGIN CODE
debug.notification("Rorikstead is under attack!")
RegisterForUpdateGameTime(0.5)
EndFunction

Event OnUpdateGameTime()
	If Game.GetPlayer().IsInLocation(AttackedLocation) == 0
		If AttackingGuard.GetDeadCount() != TotalEnemyNum.GetValue()
			debug.notification("Rorikstead has been captured")
			AreaCount.SetValue(AreaCount.GetValue() - 1)
			int i = 0
			while i < PlayerGuards.GetSize()
				ObjectReference Guard = PlayerGuards.GetAt(i) as ObjectReference
				Guard.disable()
				i += 1
			endwhile
			TroopClearer.enable()
			GarrisonCount.SetValue(0)
			HoldingValue.SetValue(EnemyFactionValue.GetValue())
		EndIf
		UnRegisterForUpdateGameTime()
		DefendQuest.Stop()
	Else
		If AttackingGuard.GetDeadCount() == TotalEnemyNum.GetValue()
			debug.notification(AttackingGuard.GetDeadCount() + " = " + TotalEnemyNum.GetValue())
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


GlobalVariable Property AreaCount  Auto  

GlobalVariable Property GarrisonCount  Auto  

ObjectReference Property TroopClearer  Auto  

FormList Property PlayerGuards  Auto  
