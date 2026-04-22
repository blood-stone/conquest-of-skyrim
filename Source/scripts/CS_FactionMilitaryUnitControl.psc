Scriptname CS_FactionMilitaryUnitControl extends Quest  

import CS_CommonFunctions

ReferenceAlias[] Property Commanders Auto
FormList Property Units Auto
ReferenceAlias[] Property RallyPoints Auto

FormList Property CommanderOutfits Auto

Container Property CS_ArmyRegimentChest Auto

ObjectReference Property CS_FactionPlayer Auto

CS_FactionMilitaryReportScript Property CS_FactionMilitaryReport Auto

Actor Commander
CS_ArmyUnitAliasScript Unit
ObjectReference RallyPoint
int Property TotalUnits Auto hidden
int Property SelectedUnitNum Auto hidden

; Unit Functions ----------------------------------------------

Function SetUnit(ReferenceAlias SelectedCommander)
    SelectedUnitNum = Commanders.Find(SelectedCommander)
    Commander = Commanders[SelectedUnitNum].GetActorRef()
    Unit = Units.GetAt(SelectedUnitNum) as CS_ArmyUnitAliasScript
    RallyPoint = RallyPoints[SelectedUnitNum].GetRef()
EndFunction

Function CreateUnit(ObjectReference NewUnitHQ)
    Start()
    
    (Units.GetAt(TotalUnits) as CS_ArmyUnitAliasScript).SetUp(NewUnitHQ)
    TotalUnits += 1
EndFunction

Function ManageUnit()
    CS_FactionMilitaryReport.Start()
    CS_FactionMilitaryReport.MenuUnit(Unit)
EndFunction

; Commander Functions -------------------------------------------

Function HireCommander(int unitnum, Actor NewCommander)
    unitnum -= 1
    Unit = Units.GetAt(unitnum) as CS_ArmyUnitAliasScript
    Unit.HireCommander(NewCommander)
EndFunction

Function EnableCommanderOutfit()
    (Commanders[SelectedUnitNum] as CS_FactionMilitaryUnitCommanderScript).CustomOutfit = true
EndFunction

Function DisableCommanderOutfit()
    (Commanders[SelectedUnitNum] as CS_FactionMilitaryUnitCommanderScript).CustomOutfit = false
EndFunction

Event OnInit()
    
    RegisterForUpdateGameTime(24)
    
EndEvent

Event OnUpdateGameTime()
    int i = 0
    while i < Units.GetSize()
        (Units.GetAt(i) as CS_ArmyUnitAliasScript).RegisterForSingleUpdate(0.1)
        i += 1
    endwhile
EndEvent