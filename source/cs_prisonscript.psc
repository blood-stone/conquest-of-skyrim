Scriptname CS_PrisonScript extends Quest  

ReferenceAlias[] Property PrisonersMarkarth Auto
ReferenceAlias[] Property PrisonersRiften Auto
ReferenceAlias[] Property PrisonersSolitude Auto
ReferenceAlias[] Property PrisonersWhiterun Auto
ReferenceAlias[] Property PrisonersWindhelm Auto
ReferenceAlias[] Property PrisonersDawnstar Auto
ReferenceAlias[] Property PrisonersFalkreath Auto
ReferenceAlias[] Property PrisonersMorthal Auto
ReferenceAlias[] Property PrisonersWinterhold Auto
ReferenceAlias[] Property JarlPrisonersImp Auto
ReferenceAlias[] Property JarlPrisonersSons Auto

ReferenceAlias Property PrisonerGuard Auto
ReferenceAlias Property PrisonerCourt Auto
ReferenceAlias Property ArrestGuard Auto
ReferenceAlias Property NewPrisoner Auto
ReferenceAlias Property Prisoner Auto

ActorBase Property DBGuard Auto

Scene Property ArrestScene Auto
Scene Property CourtScene Auto

GlobalVariable Property CanArrest Auto

FormList[] Property Guards Auto
FormList Property PrisonNums Auto

CS_PrisonerQuestScript Property PrisonerQuestScript Auto

Function MoveToPrisonMarkers(int citynum)
	ReferenceAlias[] PrisonerAliases
	if citynum == 0
		PrisonerAliases = PrisonersMarkarth
	elseif citynum == 1
		PrisonerAliases = PrisonersRiften
	elseif citynum == 2
		PrisonerAliases = PrisonersSolitude
	elseif citynum == 3
		PrisonerAliases = PrisonersWhiterun
	elseif citynum == 4
		PrisonerAliases = PrisonersWindhelm
	elseif citynum == 5
		PrisonerAliases = PrisonersDawnstar
	elseif citynum == 6
		PrisonerAliases = PrisonersFalkreath
	elseif citynum == 7
		PrisonerAliases = PrisonersMorthal
	elseif citynum == 8
		PrisonerAliases = PrisonersWinterhold
	endif

	int i = 0
	while i < PrisonerAliases.Length
		if PrisonerAliases[i].GetActorRef()
			PrisonerAliases[i].GetActorRef().MoveToPackageLocation()
		endif
		i += 1
	endwhile

EndFunction

Function SendToPrison(Actor PrisonerActor, int citynum, bool spawnguard = false)
	ReferenceAlias[] PrisonerAliases
	if citynum == 0
		PrisonerAliases = PrisonersMarkarth
	elseif citynum == 1
		PrisonerAliases = PrisonersRiften
	elseif citynum == 2
		PrisonerAliases = PrisonersSolitude
	elseif citynum == 3
		PrisonerAliases = PrisonersWhiterun
	elseif citynum == 4
		PrisonerAliases = PrisonersWindhelm
	elseif citynum == 5
		PrisonerAliases = PrisonersDawnstar
	elseif citynum == 6
		PrisonerAliases = PrisonersFalkreath
	elseif citynum == 7
		PrisonerAliases = PrisonersMorthal
	elseif citynum == 8
		PrisonerAliases = PrisonersWinterhold
	endif

	if spawnguard
		Actor Guard = Game.GetPlayer().PlaceAtMe(DBGuard) as Actor
		(Guard as CS_GuardDeath).TempGuard = true
		ArrestGuard.ForceRefTo(Guard)
		ArrestGuard.GetActorRef().MoveTo(Game.GetPlayer(), -120.0 * Math.Sin(Game.GetPlayer().GetAngleZ()), -120.0 * Math.Cos(Game.GetPlayer().GetAngleZ()))
	endif

	int i = 0
	while i < PrisonerAliases.Length
		If PrisonerAliases[i].GetReference() == None
			if ArrestGuard.GetActorRef()
				NewPrisoner.ForceRefTo(PrisonerActor)
				;CanArrest.SetValue(0)
				ArrestScene.ForceStart()
				PrisonerQuestScript.PlayerTakePrisoner(PrisonerActor, city = true)
			else
				PrisonerAliases[i].ForceRefTo(PrisonerActor)
				(PrisonNums.GetAt(citynum) as GlobalVariable).Mod(1)
			endif
			i += 10
		EndIf
		i += 1
	endwhile
	If i == PrisonerAliases.Length + 1
		debug.notification("The prison in this hold is full!")
	endIf
EndFunction

Function SendInPrisoner(int citynum, int prisonernum)
	int i = 0
	while i < Guards[citynum].GetSize()
		Actor Guard = Guards[citynum].GetAt(i) as Actor
		if Guard.IsDead() == 0 && Guard.IsEnabled()
			PrisonerGuard.ForceRefTo(Guard)
		endif
		i += 1
	endwhile
	
	prisonernum -= 1

	if citynum == 0
		PrisonerCourt.ForceRefTo(PrisonersMarkarth[prisonernum].GetActorRef())
	elseif citynum == 1
		PrisonerCourt.ForceRefTo(PrisonersRiften[prisonernum].GetActorRef())
	elseif citynum == 2
		PrisonerCourt.ForceRefTo(PrisonersSolitude[prisonernum].GetActorRef())
	elseif citynum == 3
		PrisonerCourt.ForceRefTo(PrisonersWhiterun[prisonernum].GetActorRef())
	elseif citynum == 4
		PrisonerCourt.ForceRefTo(PrisonersWindhelm[prisonernum].GetActorRef())
	elseif citynum == 5
		PrisonerCourt.ForceRefTo(PrisonersDawnstar[prisonernum].GetActorRef())
	elseif citynum == 6
		PrisonerCourt.ForceRefTo(PrisonersFalkreath[prisonernum].GetActorRef())
	elseif citynum == 7
		PrisonerCourt.ForceRefTo(PrisonersMorthal[prisonernum].GetActorRef())
	elseif citynum == 8
		PrisonerCourt.ForceRefTo(PrisonersWinterhold[prisonernum].GetActorRef())
	endif

	CourtScene.ForceStart()
EndFunction

Function SendInJarlPrisoner(int citynum, int factionnum)
	if factionnum == 11
		PrisonerCourt.ForceRefTo(JarlPrisonersImp[citynum].GetActorRef())
	elseif factionnum == 12
		PrisonerCourt.ForceRefTo(JarlPrisonersSons[citynum].GetActorRef())
	endif

	CourtScene.ForceStart()
EndFunction