Scriptname CS_JarlSurrenderTimer extends Quest  

ReferenceAlias Property Jarl  Auto  

Faction Property JarlSurrenderFaction  Auto  

Event OnUpdateGameTime()
	Jarl.GetActorRef().RemoveFromFaction(JarlSurrenderFaction)
endEvent
