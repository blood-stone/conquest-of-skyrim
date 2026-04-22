Scriptname CS_SurrenderScript extends Quest  

CS_PrisonScript Property PrisonScript Auto

ReferenceAlias Property Guard Auto
ReferenceAlias Property Surrenderer Auto

Faction Property PrisonerFaction Auto

ObjectReference Property BoundMarker Auto

Function SendToPrison(Actor Prisoner)
	BoundMarker.MoveTo(Prisoner)
	Prisoner.AddToFaction(PrisonerFaction)
	Prisoner.EvaluatePackage()
	PrisonScript.ArrestGuard.ForceRefTo(Guard.GetActorRef())
	PrisonScript.NewPrisoner.ForceRefTo(Prisoner)
	PrisonScript.ArrestScene.ForceStart()
EndFunction