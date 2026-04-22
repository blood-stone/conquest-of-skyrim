Scriptname CS_TroopRaceUpdaterScript extends Quest  

LeveledActor Property TroopLCHARSoldier Auto
LeveledActor Property TroopLCHARWarrior Auto
LeveledActor Property TroopLCHARArcher Auto
LeveledActor Property TroopLCHARCrossbow Auto
LeveledActor Property TroopLCHARGuard Auto
LeveledActor Property TroopLCHARDestructionFire Auto
LeveledActor Property TroopLCHARDestructionFrost Auto
LeveledActor Property TroopLCHARDestructionShock Auto
LeveledActor Property TroopLCHARAlteration Auto
LeveledActor Property TroopLCHARRestoration Auto

FormList Property AllowedRacesGlobals Auto
FormList Property AllRaces Auto
FormList Property AllowedRacesList Auto

GlobalVariable Property AllowMale Auto
GlobalVariable Property AllowFemale Auto

FormList Property AllGuardFormLists Auto
FormList Property AllLocations Auto

FormList Property AllowedRacesPresetsSoldierMales Auto
FormList Property AllowedRacesPresetsSoldierFemales Auto

FormList Property AllowedRacesPresetsWarriorMales Auto
FormList Property AllowedRacesPresetsWarriorFemales Auto

FormList Property AllowedRacesPresetsArcherMales Auto
FormList Property AllowedRacesPresetsArcherFemales Auto

FormList Property AllowedRacesPresetsCrossbowMales Auto
FormList Property AllowedRacesPresetsCrossbowFemales Auto

FormList Property AllowedRacesPresetsGuardMales Auto
FormList Property AllowedRacesPresetsGuardFemales Auto

FormList Property AllowedRacesPresetsDestructionFireMales Auto
FormList Property AllowedRacesPresetsDestructionFireFemales Auto

FormList Property AllowedRacesPresetsDestructionFrostMales Auto
FormList Property AllowedRacesPresetsDestructionFrostFemales Auto

FormList Property AllowedRacesPresetsDestructionShockMales Auto
FormList Property AllowedRacesPresetsDestructionShockFemales Auto

FormList Property AllowedRacesPresetsAlterationMales Auto
FormList Property AllowedRacesPresetsAlterationFemales Auto

FormList Property AllowedRacesPresetsRestorationMales Auto
FormList Property AllowedRacesPresetsRestorationFemales Auto

CS_TroopManageMenuScript Property TroopManage Auto
CS_PatrolHoldScript Property CommanderScript Auto

Function UpdateRaces()
	debug.trace("Updating races...")
	TroopLCHARSoldier.Revert()
	TroopLCHARWarrior.Revert()
	TroopLCHARArcher.Revert()
	TroopLCHARCrossbow.Revert()
	TroopLCHARGuard.Revert()
	TroopLCHARDestructionFire.Revert()
	TroopLCHARDestructionFrost.Revert()
	TroopLCHARDestructionShock.Revert()
	TroopLCHARRestoration.Revert()
	TroopLCHARAlteration.Revert()


		if AllowMale.GetValueInt() == 1

			int i = 0
			while i < AllowedRacesGlobals.GetSize()
				if (AllowedRacesGlobals.GetAt(i) as GlobalVariable).GetValue() == 1
					AllowedRacesList.AddForm(AllRaces.GetAt(i) as Race)
					int presetnum = 0
					while presetnum < (AllowedRacesPresetsSoldierMales.GetAt(i) as FormList).GetSize()
						TroopLCHARSoldier.AddForm((AllowedRacesPresetsSoldierMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARWarrior.AddForm((AllowedRacesPresetsWarriorMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARArcher.AddForm((AllowedRacesPresetsArcherMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARCrossbow.AddForm((AllowedRacesPresetsCrossbowMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARGuard.AddForm((AllowedRacesPresetsGuardMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARDestructionFire.AddForm((AllowedRacesPresetsDestructionFireMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARDestructionFrost.AddForm((AllowedRacesPresetsDestructionFrostMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARDestructionShock.AddForm((AllowedRacesPresetsDestructionShockMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARAlteration.AddForm((AllowedRacesPresetsAlterationMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARRestoration.AddForm((AllowedRacesPresetsRestorationMales.GetAt(i) as FormList).GetAt(presetnum), 1)
						presetnum += 1
					endwhile
				else
					AllowedRacesList.RemoveAddedForm(AllRaces.GetAt(i) as Race)
				endif
				i += 1
			endwhile

		endif

		if AllowFemale.GetValueInt() == 1

			int i = 0
			while i < AllowedRacesGlobals.GetSize()
				if (AllowedRacesGlobals.GetAt(i) as GlobalVariable).GetValue() == 1
					AllowedRacesList.AddForm(AllRaces.GetAt(i) as Race)
					int presetnum = 0
					while presetnum < (AllowedRacesPresetsSoldierFemales.GetAt(i) as FormList).GetSize()
						TroopLCHARSoldier.AddForm((AllowedRacesPresetsSoldierFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARWarrior.AddForm((AllowedRacesPresetsWarriorFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARArcher.AddForm((AllowedRacesPresetsArcherFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARCrossbow.AddForm((AllowedRacesPresetsCrossbowFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARGuard.AddForm((AllowedRacesPresetsGuardFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARDestructionFire.AddForm((AllowedRacesPresetsDestructionFireFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARDestructionFrost.AddForm((AllowedRacesPresetsDestructionFrostFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARDestructionShock.AddForm((AllowedRacesPresetsDestructionShockFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARAlteration.AddForm((AllowedRacesPresetsAlterationFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						TroopLCHARRestoration.AddForm((AllowedRacesPresetsRestorationFemales.GetAt(i) as FormList).GetAt(presetnum), 1)
						presetnum += 1
					endwhile
				else
					AllowedRacesList.RemoveAddedForm(AllRaces.GetAt(i) as Race)
				endif
				i += 1
			endwhile

		endif
	debug.trace("Races updated!")
EndFunction

Function ResetTroops()
	int i = 0
	while i < 30
		if CommanderScript.Commanders[i].GetActorRef()
			if CommanderScript.Commanders[i].GetActorRef().Is3DLoaded()
				TroopManage.ResetTroops(i)
			endif
		endif
		i += 1
	endwhile
	i = 0
	while i < AllGuardFormLists.GetSize()
		if Game.GetPlayer().IsInLocation(AllLocations.GetAt(i) as Location)
			int guardnum = 0
			while guardnum < (AllGuardFormLists.GetAt(i) as FormList).GetSize()
				Actor Guard = (AllGuardFormLists.GetAt(i) as FormList).GetAt(guardnum) as Actor
				if Guard.IsEnabled() == 1
					Guard.disable()
					Guard.reset()
					Guard.AllowPCDialogue(true)
					Guard.enable()
				else
					Guard.reset()
				endif
				guardnum += 1
			endwhile
		endif
		i += 1
	endwhile
EndFunction

Event OnInIt()
	UpdateRaces()
EndEvent