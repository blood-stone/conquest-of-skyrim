Scriptname CS_AttackCityJarlBleedout extends Quest  

Event OnUpdate()
	EnemyJarl.GetActorRef().StartCombat(Game.GetPlayer())
	If EnemyJarl.GetActorRef().IsBleedingOut() == 1
		UnRegisterForUpdate()
		SetStage(15)
	EndIf
EndEvent

ReferenceAlias Property EnemyJarl Auto