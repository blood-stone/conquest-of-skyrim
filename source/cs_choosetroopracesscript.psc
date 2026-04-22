Scriptname CS_ChooseTroopRacesScript extends Quest  conditional

Message Property MenuStart Auto
Message Property RaceAdd1 Auto
Message Property RaceAdd2 Auto
Message Property RaceRemove1 Auto
Message Property RaceRemove2 Auto
Message Property GenderAdd Auto
Message Property GenderRemove Auto

ReferenceAlias[] Property AllowedRaces Auto
ReferenceAlias[] Property AllowedGenders Auto

FormList Property AllowedRacesGlobals Auto
FormList Property AllowedGendersGlobals Auto
FormList Property AllRaces Auto
FormList Property AllowedRacesList Auto

ObjectReference[] Property AllowedRacesObjects Auto
ObjectReference[] Property AllowedGendersObjects Auto
ObjectReference Property NoneObject Auto

CS_TroopRaceUpdaterScript Property RaceUpdater Auto

int Property NumRaces Auto Conditional
int Property NumGenders Auto Conditional

bool Property ChangeDetected Auto

Function AdjustAliases()
	NumRaces = 0
	NumGenders = 0
	int i = 0
	while i < AllowedRaces.Length
		AllowedRaces[i].ForceRefTo(NoneObject)
		i += 1
	endwhile
	i = 0
	while i < AllowedGenders.Length
		AllowedGenders[i].ForceRefTo(NoneObject)
		i += 1
	endwhile
	i = 0
	while i < AllowedRacesGlobals.GetSize()
		if (AllowedRacesGlobals.GetAt(i) as GlobalVariable).GetValue() == 1
			AllowedRaces[NumRaces].ForceRefTo(AllowedRacesObjects[i])
			NumRaces += 1
		endif
		i += 1
	endwhile
	i = 0
	while i < AllowedGendersGlobals.GetSize()
		if (AllowedGendersGlobals.GetAt(i) as GlobalVariable).GetValue() == 1
			AllowedGenders[NumGenders].ForceRefTo(AllowedGendersObjects[i])
			NumGenders += 1
		endif
		i += 1
	endwhile
EndFunction

Function StartMenu(int Response = 0)
	AdjustAliases()
	Response = MenuStart.show()
	if Response == 0
		RaceAdd1Menu()
	elseif Response == 1
		RaceRemove1Menu()
	elseif Response == 2
		GenderAddMenu()
	elseif Response == 3
		GenderRemoveMenu()
	elseif Response == 4
		If ChangeDetected == true
			debug.notification("Updating Troop Races, this may take awhile...")
			RaceUpdater.UpdateRaces()
			RaceUpdater.ResetTroops()
			ChangeDetected = false
		EndIf
	endif
endFunction

Function RaceAdd1Menu(int Response = 0)
	Response = RaceAdd1.show()
	if Response < 5
		ChangeDetected = true
		(AllowedRacesGlobals.GetAt(Response) as GlobalVariable).SetValue(1)
		AllowedRacesList.AddForm(AllRaces.GetAt(Response) as Race)
		AdjustAliases()
		RaceAdd1Menu()
	elseif Response == 5
		RaceAdd2Menu()
	elseif Response == 6
		StartMenu()
	endif
endFunction

Function RaceAdd2Menu(int Response = 0)
	Response = RaceAdd2.show()
	if Response == 0
		RaceAdd1Menu()
	elseif Response > 0 && Response < 6
		ChangeDetected = true
		(AllowedRacesGlobals.GetAt(Response + 4) as GlobalVariable).SetValue(1)
		AllowedRacesList.AddForm(AllRaces.GetAt(Response + 4) as Race)
		AdjustAliases()
		RaceAdd2Menu()
	elseif Response == 6
		StartMenu()
	endif
endFunction

Function RaceRemove1Menu(int Response = 0)
	Response = RaceRemove1.show()
	if Response < 5
		ChangeDetected = true
		(AllowedRacesGlobals.GetAt(Response) as GlobalVariable).SetValue(0)
		AllowedRacesList.RemoveAddedForm(AllRaces.GetAt(Response) as Race)
		AdjustAliases()
		RaceRemove1Menu()
	elseif Response == 5
		RaceRemove2Menu()
	elseif Response == 6
		StartMenu()
	endif
endFunction

Function RaceRemove2Menu(int Response = 0)
	Response = RaceRemove2.show()
	if Response == 0
		RaceRemove1Menu()
	elseif Response > 0 && Response < 6
		ChangeDetected = true
		(AllowedRacesGlobals.GetAt(Response + 4) as GlobalVariable).SetValue(0)
		AllowedRacesList.RemoveAddedForm(AllRaces.GetAt(Response) as Race)
		AdjustAliases()
		RaceRemove2Menu()
	elseif Response == 6
		StartMenu()
	endif
endFunction

Function GenderAddMenu(int Response = 0)
	Response = GenderAdd.show()
	if Response < 2
		ChangeDetected = true
		(AllowedGendersGlobals.GetAt(Response) as GlobalVariable).SetValue(1)
		AdjustAliases()
		GenderAddMenu()
	elseif Response == 2
		StartMenu()
	endif
endFunction

Function GenderRemoveMenu(int Response = 0)
	Response = GenderRemove.show()
	if Response < 2
		ChangeDetected = true
		(AllowedGendersGlobals.GetAt(Response) as GlobalVariable).SetValue(0)
		AdjustAliases()
		GenderRemoveMenu()
	elseif Response == 2
		StartMenu()
	endif
endFunction