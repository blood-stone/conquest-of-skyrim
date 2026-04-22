Scriptname CS_GovVampireScript extends Quest  

Idle Property VampireBiteIdle Auto

TextureSet Property RedEyes Auto

Faction Property PlayerVampireFaction Auto

Function TurnActor(Actor Victim)
	Game.GetPlayer().PlayIdleWithTarget(VampireBiteIdle, Victim)
	Utility.Wait(3)
	MakeEyesRed(Victim)
	Victim.AddToFaction(PlayerVampireFaction)
EndFunction

Function MakeEyesRed(Actor Vampire)
	Vampire.SetEyeTexture(RedEyes)
EndFunction