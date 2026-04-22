Scriptname CS_POWScript extends Quest  

Scene Property SurrenderScene Auto

ReferenceAlias Property Surrenderer Auto

FormList Property POWFollowingPlayerList Auto

GlobalVariable Property POWFollowingPlayer Auto

Faction Property CommanderFactionImp Auto
Faction Property CommanderFactionSons Auto

CS_EconomyVariableFunctions Property EconomyScript Auto

Function StartSurrender(Actor Troop)
	Surrenderer.ForceRefTo(Troop)
	SurrenderScene.ForceStart()
EndFunction

Function RansomPrisoners()
	int GoldToAdd
	int i = 0
	while i < POWFollowingPlayerList.GetSize()
		Actor POW = POWFollowingPlayerList.GetAt(i) as Actor
		if POW.IsInFaction(CommanderFactionImp) || POW.IsInFaction(CommanderFactionSons)
			GoldToAdd += 5000
		else
			GoldToAdd += 200
		endif
		POW.disable()
		POW.delete()
		i += 1
	endwhile
	POWFollowingPlayerList.Revert()
	POWFollowingPlayer.SetValue(0)
	EconomyScript.AddToTreasury(GoldToAdd)
EndFunction