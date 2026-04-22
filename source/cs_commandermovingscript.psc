Scriptname CS_CommanderMovingScript extends Quest  

ReferenceAlias[] Property Commanders Auto
ReferenceAlias[] Property Targets Auto

Actor[] Property CommandersIncomingFort Auto
FormList[] Property CommandersIncomingCity Auto
FormList[] Property CommandersIncomingCamp Auto

FormList Property AllHoldings Auto
FormList Property AllLocationsCS Auto

Keyword Property Invading Auto

GlobalVariable Property GameDaysPassed Auto

CS_PatrolHoldScript Property CommanderScript Auto
CS_FortCommandersScript Property FortCommanders Auto
CS_TMScript Property TM Auto
CS_TMScript Property TMImp Auto
CS_TMScript Property TMSons Auto

Function StartCommanderMoving(Actor Commander)
	int armynum = CommanderScript.GetCommanderArmyNum(Commander)
	int i = 0
	bool foundalias = false
	while i < Commanders.Length && foundalias == false
		if Commanders[i].GetActorRef() == None
			Targets[i].ForceRefTo(CommanderScript.ArmyScripts[armynum].MovingArrivalRef)
			Commanders[i].ForceRefTo(Commander)
			foundalias = true
		endif
		i += 1
	endwhile
	Commander.EvaluatePackage()
EndFunction

Function CommanderArrival(Actor Commander)
	int armynum = CommanderScript.GetCommanderArmyNum(Commander)
	CS_ArmyTroopDeath ArmyScript = CommanderScript.ArmyScripts[armynum]
	if ArmyScript.MovingType == "Follow"
		debug.notification("Commander " + armynum + " arriving to Player")
		if Commander.Is3DLoaded() == false
			Actor PlayerRef = Game.GetPlayer()
			Commander.MoveTo(PlayerRef, -120.0 * Math.Sin(PlayerRef.GetAngleZ()), -120.0 * Math.Cos(PlayerRef.GetAngleZ()))
			CommanderScript.FollowPlayer(Commander, true)
		else
			CommanderScript.FollowPlayer(Commander)
		endif
	elseif ArmyScript.MovingType == "Fort"
		debug.notification("Commander " + armynum + " arriving to Fort" + ArmyScript.MovingArrivalHoldNum)
		FortCommanders.AssignCommander(Commander, ArmyScript.MovingArrivalHoldNum)
		if Commander.Is3DLoaded() == false
			Commander.MoveTo(FortCommanders.Positions[ArmyScript.MovingArrivalHoldNum])
		endif
	elseif ArmyScript.MovingType == "City"
		debug.notification("Commander " + armynum + " arriving to City" + ArmyScript.MovingArrivalHoldNum)
		CommanderScript.StartPatrol(Commander, ArmyScript.MovingArrivalHoldNum, forcestart=true)
	elseif ArmyScript.MovingType == "Camp"
		if (CommanderScript.CampMarkers.GetAt(ArmyScript.MovingArrivalHoldNum) as ObjectReference).IsDisabled() == 1
			TM.SetUpCamp(ArmyScript.MovingArrivalHoldNum)
			if (AllHoldings.GetAt(ArmyScript.MovingArrivalHoldNum) as GlobalVariable).GetValue() == 11
				(TMImp.InvasionObjectiveQuests.GetAt(ArmyScript.MovingArrivalHoldNum) as Quest).SetObjectiveDisplayed(0, true, true)
			elseif (AllHoldings.GetAt(ArmyScript.MovingArrivalHoldNum) as GlobalVariable).GetValue() == 12
				(TMSons.InvasionObjectiveQuests.GetAt(ArmyScript.MovingArrivalHoldNum) as Quest).SetObjectiveDisplayed(0, true, true)
			endif
		endif
		if !Game.GetPlayer().HasLOS(Commander)
			Commander.MoveTo(CommanderScript.CampMarkers.GetAt(ArmyScript.MovingArrivalHoldNum) as ObjectReference)
		endif
		CommanderScript.StartPatrolHold(Commander, ArmyScript.MovingArrivalHoldNum)
	endif
	StopCommanderMoving(Commander)
EndFunction

Function StopCommanderMoving(Actor Commander)
	int commandernum = FindCommanderNum(Commander)
	if commandernum != -1
		int armynum = CommanderScript.GetCommanderArmyNum(Commander)
		CS_ArmyTroopDeath ArmyScript = CommanderScript.ArmyScripts[armynum]
		ArmyScript.MovingType = ""
		ArmyScript.MovingArrivalHoldNum = -1
		ArmyScript.MovingArrivalTime = 0
		ArmyScript.MovingArrivalTimeRemaining = 0
		ArmyScript.MovingArrivalRef = None
		ArmyScript.MovingArrivalLoc = None
		ArmyScript.MovingArrivalText = None
		Commanders[commandernum].Clear()
		Targets[commandernum].Clear()
		if CommandersIncomingFort.Find(Commander) >= 0
			int fortnum = CommandersIncomingFort.Find(Commander)
			CommandersIncomingFort[fortnum] = None
		endif
		int i = 0
		bool foundcity = false
		while i < CommandersIncomingCity.Length && foundcity == false
			if CommandersIncomingCity[i].Find(Commander) >= 0
				int citynum = i
				CommandersIncomingCity[citynum].RemoveAddedForm(Commander)
				foundcity = true
			endif
			i += 1
		endwhile
		i = 0
		bool foundcamp = false
		while i < CommandersIncomingCamp.Length && foundcamp == false
			if CommandersIncomingCamp[i].Find(Commander) >= 0
				int campnum = i
				CommandersIncomingCamp[campnum].RemoveAddedForm(Commander)
				if CommandersIncomingCamp[i].GetSize() <= 0
					(AllLocationsCS.GetAt(i) as Location).SetKeywordData(Invading, 0)
				endif
				foundcamp = true
			endif
			i += 1
		endwhile
	endif
endFunction

int Function FindCommanderNum(Actor Commander)
	int i = 0
	int commandernum = -1
	bool foundcommander = false
	while i < Commanders.Length && foundcommander == false
		if Commanders[i].GetActorRef() == Commander
			foundcommander = true
			commandernum = i
		endif
		i += 1
	endwhile

	return commandernum
endFunction

Function CheckCommanderTimes()
	debug.trace("Checking commander times")
	int i = 0
	while i < Commanders.Length
		if Commanders[i].GetActorRef() != None
			int armynum = CommanderScript.GetCommanderArmyNum(Commanders[i].GetActorRef())
			CS_ArmyTroopDeath ArmyScript = CommanderScript.ArmyScripts[armynum]
			debug.trace("Army " + armynum + " Arrival Time = " + ArmyScript.MovingArrivalTime + ", Current Time = " + GameDaysPassed.GetValue()) 
			if ArmyScript.MovingArrivalTime <= GameDaysPassed.GetValue() && ArmyScript.MovingArrivalTime > 0
				CommanderArrival(Commanders[i].GetActorRef())
			elseif ArmyScript.MovingArrivalTime > GameDaysPassed.GetValue() && ArmyScript.MovingArrivalTime > 0
				ArmyScript.MovingArrivalTimeRemaining = math.ceiling(24*(ArmyScript.MovingArrivalTime - GameDaysPassed.GetValue()))
				debug.trace("Time remaining: " + ArmyScript.MovingArrivalTimeRemaining + " hours")
			endif
		endif
		i += 1
	endwhile
EndFunction

Event OnUpdateGameTime()
	debug.trace("Moving Game Time Updated")
	CheckCommanderTimes()
EndEvent