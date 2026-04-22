Scriptname CS_CityEventManagerScript extends Quest  

FormList Property AllLocations Auto
FormList Property AllVanillaLocations Auto
FormList Property AllHoldings Auto
FormList Property SpawnPoints Auto
FormList Property PossibleQuests Auto
FormList Property AllBeggarFormLists Auto
FormList Property AllThiefFormLists Auto
FormList Property AllCorpseFormLists Auto
FormList Property AllPrisonMarkers Auto

ActorBase Property BeggarBase Auto
ActorBase Property ThiefBase Auto
ActorBase Property CriminalBase Auto

Faction Property CrimeTheft Auto
Faction Property CrimeAssault Auto
Faction Property CrimeMurder Auto

float[] Property UnemploymentPercentage Auto
float[] Property SceneRefreshTime Auto

bool[] Property AllowThiefScenes Auto
bool[] Property AllowExecutionScenes Auto
bool[] Property AllowReligionScenes Auto

Keyword Property Population Auto
Keyword Property Unemployment Auto
Keyword Property Crimes Auto
Keyword Property PrisonerNum Auto
Keyword Property LawPunishmentTheft Auto
Keyword Property LawPunishmentAssault Auto
Keyword Property LawPunishmentMurder Auto

Armor Property PrisonerCuffs Auto

Quest Property ThiefQuest Auto
Quest Property ExecutionQuest Auto
Quest Property ExecutionQuestOriginal Auto
Quest Property ReligionQuest Auto
Scene[] Property AllScenes Auto

ReferenceAlias Property ArrestGuard Auto
ReferenceAlias Property ArrestPrisoner Auto
ReferenceAlias Property PrisonerMarker Auto

LocationAlias Property EventCity Auto

Location Property EntireFaction Auto

GlobalVariable Property GameDaysPassed Auto

Quest Property ChosenQuest Auto

Function StartQuests()
	EventCity.clear()
	int citynum = 0
	int foundlocation = 0
	int i = 0
	while i < 9 && foundlocation == 0
		if Game.GetPlayer().IsInLocation(AllVanillaLocations.GetAt(i) as Location) == 1
			debug.trace("Found Location " + i)
			citynum = i
			EventCity.ForceLocationTo(AllVanillaLocations.GetAt(i) as Location)
			EventCityCS.ForceLocationTo(AllLocations.GetAt(i) as Location)
			foundlocation = 1
		endif
		i += 1
	endwhile
	
	if AllowThiefScenes[citynum] == true
		debug.trace("Thief Quest true")
		ThiefQuest.Stop()
		ThiefQuest.Start()
	endif

	if ExecutionQuestOriginal.IsRunning() == 0 && AllowExecutionScenes[citynum] == true
		debug.trace("Execution Quest true")
		ExecutionQuest.Stop()
		ExecutionQuest.Start()
	endif

	if AllowReligionScenes[citynum] == true
		debug.trace("Religion Quest true")
		ReligionQuest.Stop()
		ReligionQuest.Start()
	endif

	FindPossibleQuests()

	int randomscenenum = utility.randomint(0, PossibleQuests.GetSize() - 1)	
	ChosenQuest = (PossibleQuests.GetAt(randomscenenum) as Quest)
	PossibleQuests.Revert()
	ChosenQuest.SetStage(1)
EndFunction

Function FindPossibleQuests()
	if ThiefQuest.IsRunning() == 1
		PossibleQuests.AddForm(ThiefQuest)
	endif

	if ExecutionQuest.IsRunning() == 1
		PossibleQuests.AddForm(ExecutionQuest)
	endif

	if ReligionQuest.IsRunning() == 1
		PossibleQuests.AddForm(ReligionQuest)
	endif
EndFunction


Function StopQuests()
	ThiefQuest.SetStage(9)
	ExecutionQuest.SetStage(9)
	ReligionQuest.SetStage(9)
EndFunction

Function QuestEnd(Quest EventQuest, Location City)
	int citynum = AllVanillaLocations.Find(City)
	if EventQuest == ThiefQuest
		debug.trace("Thief Quest set to false")
		AllowThiefScenes[citynum] = false
	elseif EventQuest == ExecutionQuest
		debug.trace("Execution Quest set to false")
		AllowExecutionScenes[citynum] = false	
	elseif EventQuest == ReligionQuest
		debug.trace("Religion Quest set to false")
		AllowReligionScenes[citynum] = false	
	endif
EndFunction

Function StartQuestScene()
	ChosenQuest.SetStage(2)
	ChosenQuest = None
EndFunction

bool Function FindExecutionCriminals(Location City)
	bool foundcriminals = false
	int citynum = AllLocations.Find(City)
	bool theftexec = false
	bool assaultexec = false
	bool murderexec = false
	AllowExecutionScenes[citynum] = false
	int executioneenums = 0
	if City.GetKeywordData(LawPunishmentTheft) == 4 || (City.GetKeywordData(LawPunishmentTheft) == -1 && EntireFaction.GetKeywordData(LawPunishmentTheft) == 4)
		executioneenums += math.floor(0.6*City.GetKeywordData(Crimes))
		theftexec = true
	endif

	if City.GetKeywordData(LawPunishmentAssault) == 4 || (City.GetKeywordData(LawPunishmentAssault) == -1 && EntireFaction.GetKeywordData(LawPunishmentAssault) == 4)
		executioneenums += math.floor(0.3*City.GetKeywordData(Crimes))
		assaultexec = true
	endif	

	if City.GetKeywordData(LawPunishmentMurder) == 4 || (City.GetKeywordData(LawPunishmentMurder) == -1 && EntireFaction.GetKeywordData(LawPunishmentMurder) == 4)
		executioneenums += math.floor(0.1*City.GetKeywordData(Crimes))
		murderexec = true
	endif

	if executioneenums > 6
		executioneenums = 6
	endif

	int i = 0
	while i < executioneenums
		foundcriminals = true
		Actor Criminal = (ExecutionQuest as CS_CityEventExecutionQuestScript).Alias_ChoppingBlock.GetReference().PlaceAtMe(CriminalBase, abForcePersist = true) as Actor

		int crimenum = utility.randomint(0, 100)
		if crimenum <= 60
			if theftexec == true
				Criminal.AddToFaction(CrimeTheft)
			elseif assaultexec == true
				Criminal.AddToFaction(CrimeAssault)
			elseif murderexec == true
				Criminal.AddToFaction(CrimeMurder)
			endif
		elseif crimenum > 60 && crimenum <= 90
			if assaultexec == true
				Criminal.AddToFaction(CrimeAssault)
			elseif theftexec == true
				Criminal.AddToFaction(CrimeTheft)
			elseif murderexec == true
				Criminal.AddToFaction(CrimeMurder)
			endif
		elseif crimenum > 90 && crimenum <= 100
			if murderexec == true
				Criminal.AddToFaction(CrimeMurder)
			elseif assaultexec == true
				Criminal.AddToFaction(CrimeAssault)
			elseif theftexec == true
				Criminal.AddToFaction(CrimeTheft)
			endif
		endif

		(ExecutionQuest as CS_ExecutionScript).Executionees[i].ForceRefTo(Criminal)
		i += 1
	endwhile
	return foundcriminals
EndFunction

Function GuardArrestPrisoner(Actor Guard, Actor Prisoner, Location City)
	int citynum = AllVanillaLocations.Find(City)
	(AllLocations.GetAt(citynum) as Location).SetKeywordData(Crimes, (AllLocations.GetAt(citynum) as Location).GetKeywordData(Crimes) + 1)
	PrisonerMarker.ForceRefTo(AllPrisonMarkers.GetAt(citynum) as ObjectReference)
	ArrestGuard.ForceRefTo(Guard)
	ArrestPrisoner.ForceRefTo(Prisoner)
	ArrestPrisoner.GetActorRef().EquipItem(PrisonerCuffs)
	ArrestGuard.GetActorRef().EvaluatePackage()
	ArrestPrisoner.GetActorRef().EvaluatePackage()
EndFunction

Function RemoveBeggars()
	debug.trace("Removing beggars")
	int i = 0
	while i < AllBeggarFormLists.GetSize()
		if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
			int index = 0
			while index < (AllBeggarFormLists.GetAt(i) as FormList).GetSize()
				Actor Beggar = (AllBeggarFormLists.GetAt(i) as FormList).GetAt(index) as Actor
				Beggar.delete()
				index += 1
			endwhile
			(AllBeggarFormLists.GetAt(index) as FormList).Revert()
		endif
		i += 1
	endwhile
EndFunction

Function SpawnBeggars()
	debug.trace("Spawning beggars")
	int i = 0
	while i < AllLocations.GetSize()
		if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
			int beggarnum = 0
			while beggarnum < math.floor((AllLocations.GetAt(i) as Location).GetKeywordData(Unemployment)/2)
				FormList SpawnPointList = SpawnPoints.GetAt(i) as FormList
				int randomspawn = utility.randomint(0, SpawnPointList.GetSize() - 1)
				Actor Beggar = (SpawnPointList.GetAt(randomspawn) as ObjectReference).PlaceAtMe(BeggarBase, abForcePersist=true) as Actor
				(AllBeggarFormLists.GetAt(i) as FormList).AddForm(Beggar)
				beggarnum += 1
			endwhile
		endif
		i += 1
	endwhile
EndFunction

Function RemoveThieves()
	debug.trace("Removing thieves")
	int i = 0
	while i < AllThiefFormLists.GetSize()
		AllowThiefScenes[i] = false
		if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
			int index = 0
			while index < (AllThiefFormLists.GetAt(i) as FormList).GetSize()
				Actor Thief = (AllThiefFormLists.GetAt(i) as FormList).GetAt(index) as Actor
				Thief.delete()
				index += 1
			endwhile
			(AllThiefFormLists.GetAt(index) as FormList).Revert()
		endif
		i += 1
	endwhile
EndFunction

Function SpawnThieves()
	debug.trace("Spawning thieves")
	int i = 0
	while i < AllLocations.GetSize()
		if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
			Location City = AllLocations.GetAt(i) as Location
			int legalthiefnum = 0
			if City.GetKeywordData(LawPunishmentTheft) == 0 || (City.GetKeywordData(LawPunishmentTheft) == -1 && EntireFaction.GetKeywordData(LawPunishmentTheft) == 0)
				legalthiefnum = math.floor((City.GetKeywordData(Population))/3)
			endif
			int thiefnum = 0
			while thiefnum < math.floor((AllLocations.GetAt(i) as Location).GetKeywordData(Crimes)/3) + legalthiefnum
				FormList SpawnPointList = SpawnPoints.GetAt(i) as FormList
				int randomspawn = utility.randomint(0, SpawnPointList.GetSize() - 1)
				Actor Thief = (SpawnPointList.GetAt(randomspawn) as ObjectReference).PlaceAtMe(ThiefBase, abForcePersist=true) as Actor
				(AllThiefFormLists.GetAt(i) as FormList).AddForm(Thief)
				thiefnum += 1
			endwhile
		endif
		i += 1
	endwhile
EndFunction

Function RemoveCorpses()
	debug.trace("Removing corpses")
	int i = 0
	while i < AllCorpseFormLists.GetSize()
		if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
			int index = 0
			while index < (AllCorpseFormLists.GetAt(i) as FormList).GetSize()
				Actor Corpse = (AllCorpseFormLists.GetAt(i) as FormList).GetAt(index) as Actor
				Corpse.delete()
				index += 1
			endwhile
			(AllCorpseFormLists.GetAt(index) as FormList).Revert()
		endif
		i += 1
	endwhile
EndFunction

Function SpawnCorpses()
	debug.trace("Spawning corpses")
	int i = 0
	while i < AllLocations.GetSize()
		if (AllHoldings.GetAt(i) as GlobalVariable).GetValue() == 1
			Location City = AllLocations.GetAt(i) as Location
			int corpsenum = 0
			if City.GetKeywordData(LawPunishmentMurder) == 0 || (City.GetKeywordData(LawPunishmentMurder) == -1 && EntireFaction.GetKeywordData(LawPunishmentMurder) == 0)

				while corpsenum < math.floor(City.GetKeywordData(Population)/20)
					FormList SpawnPointList = SpawnPoints.GetAt(i) as FormList
					int randomspawn = utility.randomint(0, SpawnPointList.GetSize() - 1)
					Actor Corpse = (SpawnPointList.GetAt(randomspawn) as ObjectReference).PlaceAtMe(ThiefBase, abForcePersist=true) as Actor
					Corpse.kill()
					(AllCorpseFormLists.GetAt(i) as FormList).AddForm(Corpse)
					corpsenum += 1
				endwhile
			
			endif
		endif
		i += 1
	endwhile
EndFunction

Function ReAllowScenes()
	int i = 0
	while i < AllLocations.GetSize()
		AllowThiefScenes[i] = true
		AllowExecutionScenes[i] = true
		AllowReligionScenes[i] = true
		i += 1
	endwhile
EndFunction

Event OnUpdate()
;	RemoveBeggars()
;	SpawnBeggars()
;	RemoveThieves()
;	SpawnThieves()
;	RemoveCorpses()
;	SpawnCorpses()
;	ReAllowScenes()
	debug.trace("Beggar Update Complete")
EndEvent

LocationAlias Property EventCityCS  Auto  
