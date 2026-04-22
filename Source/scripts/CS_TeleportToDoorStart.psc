Scriptname CS_TeleportToDoorStart extends activemagiceffect  
{ability that will be activated when player is not in the same cell as invisibleObject}
 
Actor property playerRef auto
Quest property TeleportQuest auto
ObjectReference property invisibleObject auto
 
Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.notification("Effect Started")
        Utility.Wait(0.1) ; Required.
        invisibleObject.MoveTo(playerRef)
        TeleportQuest.SetStage(0)
 EndEvent
