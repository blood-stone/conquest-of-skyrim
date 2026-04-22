Scriptname CS_PlayerSurrenderArresterChangeLoc extends ReferenceAlias  

Event OnDetachedFromCell()
	Game.GetPlayer().MoveTo(GetActorRef())
EndEvent