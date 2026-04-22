Scriptname CS_AttackTroopsRespawnCellDetach extends ReferenceAlias

FormList Property AttackTroops Auto

Event OnCellDetach()
	;If self.GetActorRef().IsInFaction((GetOwningQuest() as CS_AttackTroopsRespawnScript).AttackFaction) == 0
	;	(GetOwningQuest() as CS_AttackTroopsRespawnScript).CommanderQuest.RespawnTroops(self.GetActorRef())
	;	self.clear()
	;EndIf
EndEvent