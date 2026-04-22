Scriptname CS_StopArmyInterior extends ObjectReference  

Faction Property CS_PlayerArmyFaction Auto
Quest Property pDialogueFollower Auto

Event OnInit()
 BlockActivation()
EndEvent

Event OnActivate(ObjectReference akActionRef)

if IsActivationBlocked() == False
 Debug.Trace("Door is currently unblocked")
 return
endIf

if IsActivationBlocked() == True
 if akActionRef == Game.GetPlayer()
  Activate(akActionRef, True)
 else
  Actor actorRef = akActionRef as Actor
  if !actorRef.IsInFaction(CS_PlayerArmyFaction)
   Activate(actorRef, True)
  endIf
 endIf
endif

EndEvent
