Scriptname CS_AttackVillage extends ObjectReference  

Event OnTriggerEnter(ObjectReference akTriggerRef)
	If akTriggerRef == Game.GetPlayer() || (akTriggerRef as Actor).IsInFaction(CS_ArmyAttackFaction) == 1 || (akTriggerRef as Actor).IsInFaction(CS_ArmyAttackFaction2) == 1
		TriggerBoxRef.GetReference().enable()
		DefenderCount.SetValue(0)
		BattleQuest.Start()
		VillageAlias.ForceLocationTo(VillageLoc)
		TriggerBoxRef.ForceRefTo(self)
		int i = 0
		int defnum = 0
		while i < Defenders.GetSize()
			Actor Defender = Defenders.GetAt(i) as Actor
				If (Defender.IsDead() == 0)
					If (Defender.IsDisabled() == 0)
						DefendersRefs[defnum].ForceRefTo(Defender)
						Defender.AddToFaction(CS_DefendingVillageFaction)
						DefenderCount.SetValue(DefenderCount.GetValue() + 1)
						defnum += 1
					EndIf
				EndIf
			i += 1
		endwhile
		BattleQuest.SetStage(1)
	EndIf
EndEvent

ReferenceAlias[] Property DefendersRefs  Auto  

Quest Property BattleQuest  Auto  

GlobalVariable Property DefenderCount  Auto  

FormList Property Defenders  Auto  

LocationAlias Property VillageAlias  Auto  

Location Property VillageLoc  Auto  

ReferenceAlias Property TriggerBoxRef  Auto  

Faction Property CS_DefendingVillageFaction  Auto  

Faction Property CS_ArmyAttackFaction  Auto  

Faction Property CS_ArmyAttackFaction2  Auto  
