Scriptname CS_ClaimAreaFunctions extends Quest  

Activator Property Banner Auto

ActorBase Property GuardMisc Auto
ActorBase Property Miner  Auto  

GlobalVariable Property GuardNum Auto
GlobalVariable Property MetalOutput Auto
GlobalVariable Property FoodOutput Auto
GlobalVariable Property WoodOutput Auto
GlobalVariable Property FoodCost Auto
GlobalVariable Property FoodMiscCost  Auto  
GlobalVariable Property MetalMiscProduced  Auto  
GlobalVariable Property Treasury  Auto  
GlobalVariable Property TreasuryPerDay  Auto  
GlobalVariable Property FoodReserve  Auto
GlobalVariable Property FoodPerDay  Auto    

LocationAlias[] Property Holdings  Auto  

LocationAlias Property ClaimedArea Auto
LocationAlias Property NewPlayerTerritory Auto
LocationAlias Property HoldingSelected Auto

Message Property ClaimMessage Auto
Message Property ManageHoldingHideout Auto
Message Property ManageHoldingMine Auto

ReferenceAlias[] Property Bandits Auto
ReferenceAlias Property NameChanger Auto

Keyword Property PlayerOwner Auto
Keyword Property PlayerDefended Auto
Keyword Property MineLocType Auto

FormList Property HoldingLocationsVanilla  Auto  
FormList Property HoldingLocations  Auto  

Quest Property UpgradeTroopsQuest Auto

bool Property BannerActivated Auto

CS_ClaimAreaFunctions Property AllHoldings Auto

Function TryToClaimArea()
	Location HoldingLoc = ClaimedArea.GetLocation()
	int i = 0
	while i < HoldingLocationsVanilla.GetSize()
		if HoldingLoc == HoldingLocationsVanilla.GetAt(i) as Location
			if (HoldingLocations.GetAt(i) as Location).GetKeywordData(PlayerOwner) != 1 

				int banditnum = 0
				int alivecount = 0
				while banditnum < Bandits.Length
					if Bandits[banditnum].GetActorRef().IsDead() == 0 && Bandits[banditnum].GetActorRef().IsEnabled() == 1
						alivecount += 1
					endif
					i += 1
				endwhile

				if alivecount == 0
					ClaimMessage.show()
					ObjectReference NewBanner = Game.GetPlayer().PlaceAtMe(Banner)
					NewBanner.SetAngle(0, 0, 0)
					int index = 0
					while index < Holdings.Length
						if Holdings[i].GetLocation() == None
							Holdings[i].ForceLocationTo(HoldingLocations.GetAt(index) as Location)		
							NewPlayerTerritory.ForceLocationTo(HoldingLocations.GetAt(i) as Location)
							index = Holdings.Length
						endif
						index += 1
					endwhile
				else
					debug.notification("You must defeat all enemies before claiming this area! There are " + alivecount + " enemies left")
				endif

			endif
		endif
		i += 1
	endwhile
endFunction

Location Function ConvertLocToCS(Location Holding)
	Location NewHolding = Holding
	NewHolding = HoldingLocations.GetAt(HoldingLocationsVanilla.Find(Holding)) as Location
	return NewHolding
EndFunction

Location Function ConvertCSToLoc(Location Holding)
	Location NewHolding = Holding
	NewHolding = HoldingLocationsVanilla.GetAt(HoldingLocations.Find(Holding)) as Location
	return NewHolding
EndFunction

Function ClaimArea()
	(NewPlayerTerritory.GetLocation()).SetKeywordData(PlayerOwner, 1) 
EndFunction

Function ManageHoldingMenu(int Response = 0, Location Holding, ObjectReference SelectedBanner)
		HoldingSelected.ForceLocationTo(Holding)
		FindInteriorMarkerRecruit(Holding)
		GuardNum.SetValue(Holding.GetKeywordData(PlayerDefended) as int)
		UpdateCurrentInstanceGlobal(GuardNum)
		UpdateCurrentInstanceGlobal(Treasury)
		UpdateCurrentInstanceGlobal(TreasuryPerDay)
		UpdateCurrentInstanceGlobal(FoodReserve)
		UpdateCurrentInstanceGlobal(FoodPerDay)
		if Holding.HasKeyword(MineLocType) == 1
			FoodCost.SetValue(GuardNum.GetValue() + Holding.GetKeywordData(MineLocType) as int)
			MetalOutput.SetValue(2*Holding.GetKeywordData(MineLocType))
			UpdateCurrentInstanceGlobal(FoodCost)
			UpdateCurrentInstanceGlobal(MetalOutput)
			Response = ManageHoldingMine.show()
			if Response == 0
				HireGuard(Holding)
				ManageHoldingMenu(Holding = Holding, SelectedBanner = SelectedBanner)
			elseif Response == 1
				HireMiner(Holding)
				ManageHoldingMenu(Holding = Holding, SelectedBanner = SelectedBanner)
			elseif Response == 2
				CapitalBase.ForceLocationTo(ConvertCSToLoc(Holding))
				;FindInteriorMarker(Holding)
				BaseMarker.ForceRefTo(SelectedBanner)
				RefreshGovPackages()
				ManageHoldingMenu(Holding = Holding, SelectedBanner = SelectedBanner)
			endif
		else
			UpdateCurrentInstanceGlobal(FoodCost)
			Response = ManageHoldingHideout.show()
			if Response == 0
				HireGuard(Holding)
				ManageHoldingMenu(Holding = Holding, SelectedBanner = SelectedBanner)
			elseif Response == 1
				CapitalBase.ForceLocationTo(ConvertCSToLoc(Holding))
				;FindInteriorMarker(Holding)
				BaseMarker.ForceRefTo(SelectedBanner)
				RefreshGovPackages()
				ManageHoldingMenu(Holding = Holding, SelectedBanner = SelectedBanner)
			endif
		endif
EndFunction

Function HireGuard(Location Holding)
	If Treasury.GetValue() >= 250
		if Holding.GetKeywordData(PlayerDefended) < 5
			Treasury.SetValue(Treasury.GetValue() - 250)
			CoinSound.Play(Game.GetPlayer())
			Actor Troop = Game.GetPlayer().PlaceActorAtMe(GuardMisc)
			NameChanger.ForceRefTo(Troop)
			NameChanger.Clear()
			Holding.SetKeywordData(PlayerDefended, Holding.GetKeywordData(PlayerDefended) + 1)
			FoodMiscCost.SetValue(FoodMiscCost.GetValue() + 1)
			FoodPerDay.SetValue(FoodPerDay.GetValue() - 1)
		endif
	Else
		debug.notification("Not enough coin in the treasury!")
	EndIf
EndFunction

Function HireMiner(Location Holding)
	if Holding.GetKeywordData(MineLocType) < 5 && Treasury.GetValue() >= 250
		Treasury.SetValue(Treasury.GetValue() - 200)
		CoinSound.Play(Game.GetPlayer())
		Actor MiningPerson = InteriorMarker.GetReference().PlaceActorAtMe(Miner)
		Holding.SetKeywordData(MineLocType, Holding.GetKeywordData(MineLocType) + 1)
		MetalMiscProduced.SetValue(MetalMiscProduced.GetValue() + 2)
		FoodMiscCost.SetValue(FoodMiscCost.GetValue() + 1)
		FoodPerDay.SetValue(FoodPerDay.GetValue() - 1)
	else
		debug.notification("Not enough coin in the treasury!")
	endif
EndFunction

Function ResetCommanderHoldings()
	int i = 0
	while i < CommanderQuest.Commanders.Length
		if CommanderHoldings[i].GetLocation() == None && CommanderQuest.Commanders[i].GetActorRef() != None
			CommanderFindNewMarkers(i)
		endif
		i += 1
	endwhile
EndFunction

Function CommanderFindNewMarkers(int ArmyNum)
	int i = 0
	while i < Holdings.Length && CommanderHoldings[ArmyNum].GetLocation() == None
		Location HoldingLocCS = Holdings[i].GetLocation()
		if HoldingLocCS
			Location HoldingLocVanilla = ConvertCSToLoc(HoldingLocCS)
			int index = 0
			bool HoldingTaken = false
			while index < CommanderMarkers.Length && !HoldingTaken
				if index != ArmyNum && CommanderHoldings[index].GetLocation() == HoldingLocVanilla
					HoldingTaken = true
				endif
				index += 1
			endwhile
			if !HoldingTaken
				CommanderHoldings[ArmyNum].ForceLocationTo(HoldingLocVanilla)
				FindBannerHolding.ForceLocationTo(HoldingLocVanilla)
				FindBannerQuest.Start()
				FindBannerQuest.SetStage(11)
				CommanderMarkers[ArmyNum].ForceRefTo((FindBannerQuest as CS_FindHoldingBannerScript).GetHoldingBanner())
				FindBannerQuest.Stop()
			endif
		endif
		i += 1
	endwhile
	RefreshCommanderPackages(ArmyNum)
	ShowArmyMessage(ArmyNum)
EndFunction

Function ShowArmyMessage(int ArmyNum)
	If CommanderQuest.Commanders[ArmyNum].GetActorRef() != None
		CommanderAlias.ForceRefTo(CommanderQuest.Commanders[ArmyNum].GetActorRef())
		HoldingName.ForceLocationTo(CommanderHoldings[ArmyNum].GetLocation())
		ArmyMessage.show()
	EndIf
	CommanderAlias.Clear()
	HoldingName.Clear()
EndFunction

Function IncreaseArmyLimit()
	int i = 0
	while i < RecruitCommanders.GetSize()
		if (RecruitCommanders.GetAt(i) as GlobalVariable).GetValue() == -1
			(RecruitCommanders.GetAt(i) as GlobalVariable).SetValue(1)
			i = RecruitCommanders.GetSize()
		endif
		i += 1
	endwhile
EndFunction

Function RefreshCommanderPackages(int ArmyNum)
	if CommanderQuest.Commanders[ArmyNum].GetActorRef() != None
		CommanderQuest.Commanders[ArmyNum].GetActorRef().AddToFaction(RefreshFaction)
		CommanderQuest.Commanders[ArmyNum].GetActorRef().EvaluatePackage()
		CommanderQuest.Commanders[ArmyNum].GetActorRef().RemoveFromFaction(RefreshFaction)
		CommanderQuest.Commanders[ArmyNum].GetActorRef().EvaluatePackage()
	endif
EndFunction

Function RefreshGovPackages()
	int i = 0
	while i < GovPositions.Length
		GovPositions[i].GetActorRef().AddToFaction(RefreshFaction)
		GovPositions[i].GetActorRef().EvaluatePackage()
		GovPositions[i].GetActorRef().RemoveFromFaction(RefreshFaction)
		GovPositions[i].GetActorRef().EvaluatePackage()
		i += 1
	endwhile
EndFunction

Function FindInteriorMarker(Location Holding)
	BaseMarker.Clear()
	FindBannerHolding.ForceLocationTo(ConvertCSToLoc(Holding))
	FindBannerQuest.Start()
	FindBannerQuest.SetStage(11)
	RefreshGovPackages()
EndFunction

Function FindInteriorMarkerRecruit(Location Holding)
	InteriorMarker.Clear()
	FindBannerHolding.ForceLocationTo(ConvertCSToLoc(Holding))
	FindBannerQuest.Start()
	FindBannerQuest.SetStage(12)
EndFunction

Sound Property CoinSound  Auto  

ReferenceAlias[] Property CommanderMarkers  Auto  

LocationAlias[] Property CommanderHoldings  Auto  

CS_PatrolHoldScript Property CommanderQuest Auto

Faction Property RefreshFaction Auto

ReferenceAlias Property CommanderAlias Auto

Message Property ArmyMessage Auto

GlobalVariable Property HoldingNum Auto
LocationAlias Property FindBannerHolding  Auto  

Quest Property FindBannerQuest  Auto  

LocationAlias Property HoldingName  Auto  

FormList Property RecruitCommanders  Auto  

LocationAlias Property CapitalBase Auto

ReferenceAlias Property BaseMarker Auto

ReferenceAlias[] Property GovPositions  Auto  

ReferenceAlias Property interiorMarker  Auto  
