Scriptname CS_HoldBordersScript extends Quest  

; BorderMarkers
ObjectReference Property MarkarthEast  Auto  
ObjectReference Property MarkarthSouthEast  Auto  

ObjectReference Property RiftenWest  Auto  
ObjectReference Property RiftenNorthWest  Auto
ObjectReference Property RiftenNorthEast  Auto  

ObjectReference Property SolitudeSouth Auto  

ObjectReference Property WhiterunSouth Auto  
ObjectReference Property WhiterunSouthWest Auto
ObjectReference Property WhiterunNorthWest Auto    
ObjectReference Property WhiterunNorth Auto
ObjectReference Property WhiterunNorthEast Auto
ObjectReference Property WhiterunEast Auto 

ObjectReference Property WindhelmNorthWest Auto  
ObjectReference Property WindhelmWest Auto  
ObjectReference Property WindhelmSouthWest Auto  
ObjectReference Property WindhelmSouthEast Auto  

ObjectReference Property DawnstarSouth Auto 
ObjectReference Property DawnstarWest Auto   
ObjectReference Property DawnstarEast Auto  

ObjectReference Property FalkreathNorthWest Auto  
ObjectReference Property FalkreathNorth Auto 
ObjectReference Property FalkreathEast Auto 
ObjectReference Property FalkreathNorthEast  Auto    

ObjectReference Property MorthalWest Auto  
ObjectReference Property MorthalSouthWest Auto
ObjectReference Property MorthalSouthEast Auto    
ObjectReference Property MorthalNorthEast Auto  

ObjectReference Property WinterholdSouth Auto  


;Border Names
ObjectReference Property MarkarthEastName  Auto  
ObjectReference Property MarkarthSouthEastName  Auto  

ObjectReference Property RiftenWestName  Auto  
ObjectReference Property RiftenNorthWestName  Auto
ObjectReference Property RiftenNorthEastName  Auto  

ObjectReference Property SolitudeSouthName Auto  

ObjectReference Property WhiterunSouthName Auto  
ObjectReference Property WhiterunSouthWestName Auto
ObjectReference Property WhiterunNorthWestName Auto    
ObjectReference Property WhiterunNorthName Auto
ObjectReference Property WhiterunNorthEastName Auto
ObjectReference Property WhiterunEastName Auto 

ObjectReference Property WindhelmNorthWestName Auto  
ObjectReference Property WindhelmWestName Auto  
ObjectReference Property WindhelmSouthWestName Auto  
ObjectReference Property WindhelmSouthEastName Auto  

ObjectReference Property DawnstarSouthName Auto 
ObjectReference Property DawnstarWestName Auto   
ObjectReference Property DawnstarEastName Auto  

ObjectReference Property FalkreathNorthWestName Auto  
ObjectReference Property FalkreathNorthName Auto 
ObjectReference Property FalkreathEastName Auto 
ObjectReference Property FalkreathNorthEastName  Auto    

ObjectReference Property MorthalWestName Auto  
ObjectReference Property MorthalSouthWestName Auto
ObjectReference Property MorthalSouthEastName Auto    
ObjectReference Property MorthalNorthEastName Auto  

ObjectReference Property WinterholdSouthName Auto  

GlobalVariable Property HoldingsMarkarth Auto
GlobalVariable Property HoldingsRiften Auto
GlobalVariable Property HoldingsSolitude Auto
GlobalVariable Property HoldingsWhiterun Auto
GlobalVariable Property HoldingsWindhelm Auto
GlobalVariable Property HoldingsDawnstar Auto
GlobalVariable Property HoldingsFalkreath Auto
GlobalVariable Property HoldingsMorthal Auto
GlobalVariable Property HoldingsWinterhold Auto

FormList Property AllHoldings Auto
FormList Property BorderTroopCounts Auto
FormList Property ArmyTroopCounts Auto
FormList Property CommanderBorderObjects Auto

GlobalVariable Property BorderNum Auto

ReferenceAlias[] Property Borders Auto
ReferenceAlias[] Property BorderNames  Auto  
ReferenceAlias[] Property CommanderBorders  Auto
ReferenceAlias[] Property Commanders Auto  

Faction Property RefreshFaction Auto

FormList Property BorderMessages Auto

FormList Function FindPossibleBorderOpenings(int factionnum)
	FormList BorderOpenings

	if HoldingsMarkarth.GetValue() != factionnum
		if HoldingsWhiterun.GetValue() == factionnum
			BorderOpenings.AddForm(MarkarthEast)
			BorderOpenings.AddForm(MarkarthSouthEast)
		endif
		if HoldingsMorthal.GetValue() == factionnum
			BorderOpenings.AddForm(MarkarthEast)
		endif
	endif

	if HoldingsRiften.GetValue() != factionnum
		if HoldingsWindhelm.GetValue() == factionnum
			BorderOpenings.AddForm(RiftenNorthWest)
			BorderOpenings.AddForm(RiftenNorthEast)
		endif
		if HoldingsFalkreath.GetValue() == factionnum
			BorderOpenings.AddForm(RiftenWest)
		endif
	endif

	if HoldingsSolitude.GetValue() != factionnum
		if HoldingsMorthal.GetValue() == factionnum
			BorderOpenings.AddForm(SolitudeSouth)
		endif
	endif

	if HoldingsWhiterun.GetValue() != factionnum
		if HoldingsMarkarth.GetValue() == factionnum
			BorderOpenings.AddForm(WhiterunNorthWest)
			BorderOpenings.AddForm(WhiterunSouthWest)
		endif
		if HoldingsWindhelm.GetValue() == factionnum
			BorderOpenings.AddForm(WhiterunEast)
		endif
		if HoldingsDawnstar.GetValue() == factionnum
			BorderOpenings.AddForm(WhiterunNorthEast)
		endif
		if HoldingsFalkreath.GetValue() == factionnum
			BorderOpenings.AddForm(WhiterunSouthWest)
			BorderOpenings.AddForm(WhiterunSouth)
		endif
		if HoldingsMorthal.GetValue() == factionnum
			BorderOpenings.AddForm(WhiterunNorthWest)
			BorderOpenings.AddForm(WhiterunNorth)
		endif
	endif

	if HoldingsWindhelm.GetValue() != factionnum
		if HoldingsRiften.GetValue() == factionnum
			BorderOpenings.AddForm(WindhelmSouthWest)
			BorderOpenings.AddForm(WindhelmSouthEast)
		endif
		if HoldingsWhiterun.GetValue() == factionnum
			BorderOpenings.AddForm(WindhelmWest)
		endif
		if HoldingsDawnstar.GetValue() == factionnum
			BorderOpenings.AddForm(WindhelmNorthWest)
		endif
	endif

	if HoldingsDawnstar.GetValue() != factionnum
		if HoldingsWhiterun.GetValue() == factionnum
			BorderOpenings.AddForm(DawnstarSouth)
		endif
		if HoldingsWindhelm.GetValue() == factionnum
			BorderOpenings.AddForm(DawnstarEast)
		endif
		if HoldingsWinterhold.GetValue() == factionnum
			BorderOpenings.AddForm(DawnstarEast)
		endif
		if HoldingsMorthal.GetValue() == factionnum
			BorderOpenings.AddForm(DawnstarWest)
		endif
	endif

	if HoldingsFalkreath.GetValue() != factionnum
		if HoldingsMarkarth.GetValue() == factionnum
			BorderOpenings.AddForm(FalkreathNorthWest)
		endif
		if HoldingsRiften.GetValue() == factionnum
			BorderOpenings.AddForm(FalkreathEast)
		endif
		if HoldingsWhiterun.GetValue() == factionnum
			BorderOpenings.AddForm(FalkreathNorthWest)
			BorderOpenings.AddForm(FalkreathNorthEast)
			BorderOpenings.AddForm(FalkreathNorth)
		endif
	endif

	if HoldingsMorthal.GetValue() != factionnum
		if HoldingsSolitude.GetValue() == factionnum
			BorderOpenings.AddForm(MorthalWest)
		endif
		if HoldingsWhiterun.GetValue() == factionnum
			BorderOpenings.AddForm(MorthalSouthEast)
			BorderOpenings.AddForm(MorthalSouthWest)
		endif
		if HoldingsDawnstar.GetValue() == factionnum
			BorderOpenings.AddForm(MorthalNorthEast)
		endif
	endif

	if HoldingsWinterhold.GetValue() != factionnum
		if HoldingsDawnstar.GetValue() == factionnum
			BorderOpenings.AddForm(WinterholdSouth)
		endif
	endif

	return BorderOpenings
EndFunction

Function RedefineBordersMarkarth()
	If HoldingsWhiterun.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(MarkarthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(MarkarthEastName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWhiterun.GetValue() != 1 || HoldingsFalkreath.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(MarkarthSouthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(MarkarthSouthEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersRiften()
	If HoldingsFalkreath.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(RiftenWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(RiftenWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWindhelm.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(RiftenNorthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(RiftenNorthWestName)
		BorderNum.Mod(1)
		Borders[BorderNum.GetValue() as int].ForceRefTo(RiftenNorthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(RiftenNorthEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersSolitude()
	If HoldingsMorthal.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(SolitudeSouth)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(SolitudeSouthName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersWhiterun()
	If HoldingsFalkreath.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WhiterunSouth)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WhiterunSouthName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsFalkreath.GetValue() != 1 || HoldingsMarkarth.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WhiterunSouthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WhiterunSouthWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsMorthal.GetValue() != 1 || HoldingsMarkarth.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WhiterunNorthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WhiterunNorthWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsMorthal.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WhiterunNorth)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WhiterunNorthName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsDawnstar.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WhiterunNorthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WhiterunNorthEastName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWindhelm.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WhiterunEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WhiterunEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersWindhelm()
	If HoldingsDawnstar.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WindhelmNorthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WindhelmNorthWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWhiterun.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WindhelmWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WindhelmWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsRiften.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WindhelmSouthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WindhelmSouthWestName)
		BorderNum.Mod(1)
		Borders[BorderNum.GetValue() as int].ForceRefTo(WindhelmSouthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WindhelmSouthEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersDawnstar()
	If HoldingsWhiterun.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(DawnstarSouth)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(DawnstarSouthName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsMorthal.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(DawnstarWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(DawnstarWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWindhelm.GetValue() != 1 || HoldingsWinterhold.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(DawnstarEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(DawnstarEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersFalkreath()
	If HoldingsWhiterun.GetValue() != 1 || HoldingsMarkarth.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(FalkreathNorthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(FalkreathNorthWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWhiterun.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(FalkreathNorth)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(FalkreathNorthName)
		BorderNum.Mod(1)
		Borders[BorderNum.GetValue() as int].ForceRefTo(FalkreathNorthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(FalkreathNorthEastName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsRiften.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(FalkreathEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(FalkreathEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersMorthal()
	If HoldingsSolitude.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(MorthalWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(MorthalWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsWhiterun.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(MorthalSouthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(MorthalSouthEastName)
		BorderNum.Mod(1)
		Borders[BorderNum.GetValue() as int].ForceRefTo(MorthalSouthWest)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(MorthalSouthWestName)
		BorderNum.Mod(1)
	EndIf
	If HoldingsDawnstar.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(MorthalNorthEast)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(MorthalNorthEastName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function RedefineBordersWinterhold()
	If HoldingsDawnstar.GetValue() != 1
		Borders[BorderNum.GetValue() as int].ForceRefTo(WinterholdSouth)
		BorderNames[BorderNum.GetValue() as int].ForceRefTo(WinterholdSouthName)
		BorderNum.Mod(1)
	EndIf
EndFunction

Function ClearBorders()
	int i = 0
	while i < Borders.Length
		Borders[i].Clear()
		BorderNames[i].Clear()
		i += 1
	endwhile
	i = 0
	while i < CommanderBorders.Length
		CommanderBorders[i].Clear()
		(BorderTroopCounts.GetAt(i) as GlobalVariable).SetValue(0)
		i += 1
	endwhile
	BorderNum.SetValue(0)
EndFunction

Function RedefineAllBorders()
	ClearBorders()
	If HoldingsMarkarth.GetValue() == 1
		RedefineBordersMarkarth()
	EndIf
	If HoldingsRiften.GetValue() == 1
		RedefineBordersRiften()
	EndIf
	If HoldingsSolitude.GetValue() == 1
		RedefineBordersSolitude()
	EndIf
	If HoldingsWhiterun.GetValue() == 1
		RedefineBordersWhiterun()
	EndIf
	If HoldingsWindhelm.GetValue() == 1
		RedefineBordersWindhelm()
	EndIf
	If HoldingsDawnstar.GetValue() == 1
		RedefineBordersDawnstar()
	EndIf
	If HoldingsFalkreath.GetValue() == 1
		RedefineBordersFalkreath()
	EndIf
	If HoldingsMorthal.GetValue() == 1
		RedefineBordersMorthal()
	EndIf
	If HoldingsWinterhold.GetValue() == 1
		RedefineBordersWinterhold()
	EndIf
	If BorderNum.GetValue() > 0
		ResetCommanderBorders()
	EndIf
	int i = 0
	while i < ArmyQuests.GetSize()
		(ArmyQuests.GetAt(i) as Quest).SetObjectiveDisplayed(0)
		i += 1
	endwhile
	ShowBorders()
EndFunction

Function ResetCommanderBorders()
	int i = 0
	while i < Commanders.Length
		CommanderFindNewBorders(i)
		i += 1
	endwhile
EndFunction

Function CommanderFindNewBorders(int ArmyNum)
	int i = 0
	while i < Borders.Length && CommanderBorders[ArmyNum].GetReference() == None
		int BorderTaken = 0
		int index = 0
		while index < CommanderBorders.Length && BorderTaken == 0
			If Borders[i].GetReference() == CommanderBorders[index].GetReference()
				BorderTaken = 1
			EndIf
			index += 1
		endwhile
		If BorderTaken == 0
			CommanderBorders[ArmyNum].ForceRefTo(Borders[i].GetReference())
			(BorderTroopCounts.GetAt(i) as GlobalVariable).SetValue((ArmyTroopCounts.GetAt(ArmyNum) as GlobalVariable).GetValue())
		EndIf
		i += 1
	endwhile
	if CommanderBorders[ArmyNum].GetReference() == None
		i = 0
		while i < 200 && CommanderBorders[ArmyNum].GetReference() == None
			CommanderCheckBorder(ArmyNum, i)
			i += 20
		endwhile
	endif
	if Commanders[ArmyNum].GetActorRef() != None
		Commanders[ArmyNum].GetActorRef().AddToFaction(RefreshFaction)
		Commanders[ArmyNum].GetActorRef().EvaluatePackage()
		Commanders[ArmyNum].GetActorRef().RemoveFromFaction(RefreshFaction)
		Commanders[ArmyNum].GetActorRef().EvaluatePackage()
	endif
	ShowArmyMessage(ArmyNum)
EndFunction

Function CommanderCheckBorder(int ArmyNum, int MaxTroopNum)
	int index = 0
	while index < Borders.Length && CommanderBorders[ArmyNum].GetReference() == None
		if (BorderTroopCounts.GetAt(index) as GlobalVariable).GetValue() <= MaxTroopNum
			CommanderBorders[ArmyNum].ForceRefTo(Borders[index].GetReference())
			(BorderTroopCounts.GetAt(index) as GlobalVariable).Mod((ArmyTroopCounts.GetAt(ArmyNum) as GlobalVariable).GetValue())
		endif
		index += 1
	endwhile
EndFunction

Function ShowArmyMessage(int ArmyNum)
	If Commanders[ArmyNum].GetActorRef() != None
		int i = 0
		while i < BorderNum.GetValue()
			if Borders[i].GetReference() == CommanderBorders[ArmyNum].GetReference()
				CommanderAlias.ForceRefTo(Commanders[ArmyNum].GetActorRef())
				BorderName.ForceRefTo(BorderNames[i].GetReference())
			endif
			i += 1
		endwhile
		ArmyMessage.show()
	EndIf
	CommanderAlias.Clear()
	BorderName.Clear()
EndFunction

Function AttackBorder(int AttackedHolding, int AttackingFaction)
	AssignAttackedBorders(AttackedHolding, AttackingFaction)
	ObjectReference AttackedBorder
	int LeastDefendedBorderTroopCount = 200
	int i = 0
	while i < BorderNum.GetValue()
		If ExposedBorders.HasForm(Borders[i].GetReference()) == 1
			If (BorderTroopCounts.GetAt(i) as GlobalVariable).GetValue() <= LeastDefendedBorderTroopCount
				LeastDefendedBorderTroopCount = (BorderTroopCounts.GetAt(i) as GlobalVariable).GetValue() as int
				AttackedBorder = Borders[i].GetReference()
				debug.notification("Border " + i + " Selected as Target")
			EndIf
		EndIf
		i += 1
	endwhile

	If AttackingFaction == 11
		DefendBorderQuestImp.Start()
		AttackedBorderImp.ForceRefTo(AttackedBorder)
		DefendBorderQuestImp.SetStage(1)
	ElseIf AttackingFaction == 12
		DefendBorderQuestSons.Start()
		AttackedBorderImp.ForceRefTo(AttackedBorder)
		DefendBorderQuestSons.SetStage(1)
	EndIf
				
EndFunction

Function AssignAttackedBorders(int AttackedHolding, int AttackingFaction)
	debug.notification("Assigning Attack Borders")
	ExposedBorders.Revert()
	int BorderingHolding1 = -1
	int BorderingHolding2 = -1
	int BorderingHolding3 = -1
	int BorderingHolding4 = -1
	int BorderingHolding5 = -1
	int BorderingHolding6 = -1
	If AttackedHolding == 0
		BorderingHolding1 = 3
		BorderingHolding2 = 6
		BorderingHolding3 = 7
	ElseIf AttackedHolding == 1
		BorderingHolding2 = 4
		BorderingHolding3 = 6
	ElseIf AttackedHolding == 2
		BorderingHolding1 = 7
	ElseIf AttackedHolding == 3
		BorderingHolding1 = 0
		BorderingHolding2 = 1
		BorderingHolding3 = 4
		BorderingHolding4 = 5
		BorderingHolding5 = 6
		BorderingHolding6 = 7
	ElseIf AttackedHolding == 4
		BorderingHolding1 = 1
		BorderingHolding2 = 3
		BorderingHolding3 = 5
	ElseIf AttackedHolding == 5
		BorderingHolding1 = 3
		BorderingHolding2 = 4
		BorderingHolding3 = 7
	ElseIf AttackedHolding == 6
		BorderingHolding1 = 0
		BorderingHolding2 = 1
		BorderingHolding3 = 3
	ElseIf AttackedHolding == 7
		BorderingHolding1 = 2
		BorderingHolding2 = 3
		BorderingHolding3 = 5
	ElseIf AttackedHolding == 8
		BorderingHolding1 = 5
	EndIf

	If (AllHoldings.GetAt(BorderingHolding1) as GlobalVariable).GetValue() == AttackingFaction
		AssignAllowedBorders(AttackedHolding, BorderingHolding1)
	Endif
	If (AllHoldings.GetAt(BorderingHolding2) as GlobalVariable).GetValue() == AttackingFaction
		AssignAllowedBorders(AttackedHolding, BorderingHolding2)
	Endif
	If (AllHoldings.GetAt(BorderingHolding3) as GlobalVariable).GetValue() == AttackingFaction
		AssignAllowedBorders(AttackedHolding, BorderingHolding3)
	Endif		
	If (AllHoldings.GetAt(BorderingHolding4) as GlobalVariable).GetValue() == AttackingFaction
		AssignAllowedBorders(AttackedHolding, BorderingHolding4)
	Endif
	If (AllHoldings.GetAt(BorderingHolding5) as GlobalVariable).GetValue() == AttackingFaction
		AssignAllowedBorders(AttackedHolding, BorderingHolding5)
	Endif
	If (AllHoldings.GetAt(BorderingHolding6) as GlobalVariable).GetValue() == AttackingFaction
		AssignAllowedBorders(AttackedHolding, BorderingHolding6)
	Endif		
EndFunction

Function AssignAllowedBorders(int DefendingHolding, int AttackingHolding)
	debug.notification("Assigning Allowed Borders for Defense= " + DefendingHolding + " Attack=" + AttackingHolding)
	If DefendingHolding == 0
		If AttackingHolding == 3
			ExposedBorders.AddForm(MarkarthEast)
			ExposedBorders.AddForm(MarkarthSouthEast)
		ElseIf AttackingHolding == 6
			ExposedBorders.AddForm(MarkarthSouthEast)
		EndIf
	ElseIf DefendingHolding == 1
		If AttackingHolding == 4
			ExposedBorders.AddForm(RiftenNorthEast)
			ExposedBorders.AddForm(RiftenNorthWest)
		ElseIf AttackingHolding == 6
			ExposedBorders.AddForm(RiftenWest)
		EndIf
	ElseIf DefendingHolding == 2
		If AttackingHolding == 7
			ExposedBorders.AddForm(SolitudeSouth)
		EndIf
	ElseIf DefendingHolding == 3
		If AttackingHolding == 0
			ExposedBorders.AddForm(WhiterunSouthWest)
			ExposedBorders.AddForm(WhiterunNorthWest)
		ElseIf AttackingHolding == 4
			ExposedBorders.AddForm(WhiterunEast)
		ElseIf AttackingHolding == 5
			ExposedBorders.AddForm(WhiterunNorthEast)
		ElseIf AttackingHolding == 6
			ExposedBorders.AddForm(WhiterunSouthWest)
			ExposedBorders.AddForm(WhiterunSouth)
		ElseIf AttackingHolding == 7
			ExposedBorders.AddForm(WhiterunNorthWest)
			ExposedBorders.AddForm(WhiterunNorth)
		EndIf
	ElseIf DefendingHolding == 4
		If AttackingHolding == 1
			ExposedBorders.AddForm(WindhelmSouthEast)
			ExposedBorders.AddForm(WindhelmSouthWest)
		ElseIf AttackingHolding == 3
			ExposedBorders.AddForm(WindhelmWest)
		ElseIf AttackingHolding == 5
			ExposedBorders.AddForm(WindhelmNorthWest)
		EndIf
	ElseIf DefendingHolding == 5
		If AttackingHolding == 3
			ExposedBorders.AddForm(DawnstarSouth)
		ElseIf AttackingHolding == 4
			ExposedBorders.AddForm(DawnstarEast)
		ElseIf AttackingHolding == 7
			ExposedBorders.AddForm(DawnstarWest)
		ElseIf AttackingHolding == 8
			ExposedBorders.AddForm(DawnstarEast)
		EndIf
	ElseIf DefendingHolding == 6
		If AttackingHolding == 0
			ExposedBorders.AddForm(FalkreathNorthWest)
		ElseIf AttackingHolding == 1
			ExposedBorders.AddForm(FalkreathEast)
		ElseIf AttackingHolding == 3
			ExposedBorders.AddForm(FalkreathNorthEast)
			ExposedBorders.AddForm(FalkreathNorthWest)
			ExposedBorders.AddForm(FalkreathNorth)
		EndIf
	ElseIf DefendingHolding == 7
		If AttackingHolding == 2
			ExposedBorders.AddForm(MorthalWest)
		ElseIf AttackingHolding == 3
			ExposedBorders.AddForm(MorthalSouthEast)
			ExposedBorders.AddForm(MorthalSouthWest)
		ElseIf AttackingHolding == 5
			ExposedBorders.AddForm(MorthalNorthEast)
		EndIf
	ElseIf DefendingHolding == 8
		If AttackingHolding == 5
			ExposedBorders.AddForm(WinterholdSouth)
		EndIf
	EndIf
EndFunction

Function ShowBorders()
	(BorderMessages.GetAt(BorderNum.GetValue() as int) as Message).show()
EndFunction

FormList Property ArmyQuests  Auto  

ReferenceAlias Property BorderName  Auto  

ReferenceAlias Property CommanderAlias  Auto  

Message Property ArmyMessage  Auto  

Keyword Property DefenderCount Auto

Quest Property HoldingsQuest  Auto  

FormList Property ExposedBorders  Auto  

Quest Property DefendBorderQuestImp Auto
Quest Property DefendBorderQuestSons Auto

ReferenceAlias Property AttackedBorderImp Auto
ReferenceAlias Property AttackedBorderSons Auto