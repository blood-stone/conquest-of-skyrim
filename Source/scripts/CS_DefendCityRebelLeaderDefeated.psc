Scriptname CS_DefendCityRebelLeaderDefeated extends ReferenceAlias  

Faction Property DefeatedFaction Auto
Faction Property RebelFaction Auto

Event OnEnterBleedout()
	self.GetActorRef().RemoveFromFaction(RebelFaction)
	self.GetActorRef().AddToFaction(DefeatedFaction)
	self.GetActorRef().StopCombat()
	self.GetActorRef().EvaluatePackage()
EndEvent