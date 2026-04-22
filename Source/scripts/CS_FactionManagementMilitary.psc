Scriptname CS_FactionManagementMilitary extends ObjectReference conditional

import CS_CommonFunctions

ObjectReference[] Property Regiments Auto
int[] Property RegimentCommanderRecruitable Auto conditional hidden

FormList Property TroopTypes Auto
FormList Property InitialTroopTypes Auto
ActorBase Property GuardTroopType Auto
ActorBase Property CommanderTroopType Auto

;Custom Equipment
FormList Property CustomOutfitsMale Auto
FormList Property CustomOutfitsFemale Auto
FormList Property CustomOutfitsCommanderMale Auto
FormList Property CustomOutfitsCommanderFemale Auto
Outfit Property CustomOutfitsGuardMale Auto
Outfit Property CustomOutfitsGuardFemale Auto
FormList Property LeveledItemsMale Auto
FormList Property LeveledItemsFemale Auto
FormList Property LeveledItemsCommanderMale Auto
FormList Property LeveledItemsCommanderFemale Auto
LeveledItem Property LeveledItemsGuardMale Auto
LeveledItem Property LeveledItemsGuardFemale Auto

FormList Property InitialUniqueArmor Auto
FormList Property InitialUniqueCommanderRegimentArmor Auto
FormList Property InitialUniqueCommanderDivisionArmor Auto
FormList Property InitialUniqueCommanderArmyArmor Auto

FormList Property InitialUniqueItemsSoldier Auto
FormList Property InitialUniqueItemsArcher Auto
FormList Property InitialUniqueItemsWarrior Auto
FormList Property InitialUniqueItemsCrossbow Auto
FormList Property InitialUniqueItemsMisc Auto
FormList Property InitialUniqueItemsCommander Auto
FormList Property InitialUniqueItemsGuard Auto

; Equipment Properties
int[] Property HasCustomOutfits Auto hidden
int[] Property HasGenderedOutfits Auto hidden
int[] Property HasCustomCommanderOutfits Auto hidden
int[] Property HasGenderedCommanderOutfits Auto hidden
int Property HasCustomGuardOutfit Auto
int Property HasGenderedGuardOutfit Auto
FormList Property InitialCustomOutfitsMale Auto
FormList Property InitialCustomOutfitsFemale Auto
FormList Property InitialCustomOutfitsCommanderMale Auto
FormList Property InitialCustomOutfitsCommanderFemale Auto
Outfit Property InitialCustomOutfitGuardMale Auto
Outfit Property InitialCustomOutfitGuardFemale Auto
FormList Property LeveledOutfitsMale Auto
FormList Property LeveledOutfitsFemale Auto
FormList Property LeveledOutfitsCommanderMale Auto
FormList Property LeveledOutfitsCommanderFemale Auto
LeveledItem Property LeveledOutfitGuardMale Auto
LeveledItem Property LeveledOutfitGuardFemale Auto

FormList Property InitialItemsMale Auto
FormList Property InitialItemsFemale Auto
FormList Property InitialItemsCommanderMale Auto
FormList Property InitialItemsCommanderFemale Auto
LeveledItem Property InitialItemsGuardMale Auto
LeveledItem Property InitialItemsGuardFemale Auto
FormList Property CS_TroopEquipmentOutfitsBaseHeavy Auto
FormList Property CS_TroopEquipmentOutfitsBaseLight Auto
FormList Property CS_TroopEquipmentItemsSoldier Auto
FormList Property CS_TroopEquipmentItemsWarrior Auto
FormList Property CS_TroopEquipmentItemsArcher Auto
FormList Property CS_TroopEquipmentItemsCrossbow Auto
FormList Property CS_TroopEquipmentPerks Auto

Armor[] Property CustomOutfitSoldier Auto hidden
Armor[] Property CustomOutfitWarrior Auto hidden
Armor[] Property CustomOutfitArcher Auto hidden
Armor[] Property CustomOutfitCrossbow Auto hidden
Armor[] Property CustomOutfitMageDestructionFire Auto hidden
Armor[] Property CustomOutfitMageDestructionFrost Auto hidden
Armor[] Property CustomOutfitMageDestructionShock Auto hidden
Armor[] Property CustomOutfitMageRestoration Auto hidden
Armor[] Property CustomOutfitMageConjuration Auto hidden
Armor[] Property CustomOutfitMageAlteration Auto hidden
Armor[] Property CustomOutfitCommanderRegiment Auto hidden
Armor[] Property CustomOutfitCommanderDivision Auto hidden
Armor[] Property CustomOutfitCommanderArmy Auto hidden
Armor[] Property CustomOutfitGuard Auto hidden
Armor[] Property CustomOutfitSoldierMale Auto hidden
Armor[] Property CustomOutfitSoldierFemale Auto hidden
Armor[] Property CustomOutfitWarriorMale Auto hidden
Armor[] Property CustomOutfitWarriorFemale Auto hidden
Armor[] Property CustomOutfitArcherMale Auto hidden
Armor[] Property CustomOutfitArcherFemale Auto hidden
Armor[] Property CustomOutfitCrossbowMale Auto hidden
Armor[] Property CustomOutfitCrossbowFemale Auto hidden
Armor[] Property CustomOutfitMageDestructionFireMale Auto hidden
Armor[] Property CustomOutfitMageDestructionFireFemale Auto hidden
Armor[] Property CustomOutfitMageDestructionFrostMale Auto hidden
Armor[] Property CustomOutfitMageDestructionFrostFemale Auto hidden
Armor[] Property CustomOutfitMageDestructionShockMale Auto hidden
Armor[] Property CustomOutfitMageDestructionShockFemale Auto hidden
Armor[] Property CustomOutfitMageRestorationMale Auto hidden
Armor[] Property CustomOutfitMageRestorationFemale Auto hidden
Armor[] Property CustomOutfitMageConjurationMale Auto hidden
Armor[] Property CustomOutfitMageConjurationFemale Auto hidden
Armor[] Property CustomOutfitMageAlterationMale Auto hidden
Armor[] Property CustomOutfitMageAlterationFemale Auto hidden
Armor[] Property CustomOutfitCommanderRegimentMale Auto hidden
Armor[] Property CustomOutfitCommanderRegimentFemale Auto hidden
Armor[] Property CustomOutfitCommanderDivisionMale Auto hidden
Armor[] Property CustomOutfitCommanderDivisionFemale Auto hidden
Armor[] Property CustomOutfitCommanderArmyMale Auto hidden
Armor[] Property CustomOutfitCommanderArmyFemale Auto hidden
Armor[] Property CustomOutfitGuardMale Auto hidden
Armor[] Property CustomOutfitGuardFemale Auto hidden

Form[] Property CustomItemsSoldier Auto hidden
Form[] Property CustomItemsWarrior Auto hidden
Form[] Property CustomItemsArcher Auto hidden
Form[] Property CustomItemsCrossbow Auto hidden
Form[] Property CustomItemsMageDestructionFire Auto hidden
Form[] Property CustomItemsMageDestructionFrost Auto hidden
Form[] Property CustomItemsMageDestructionShock Auto hidden
Form[] Property CustomItemsMageRestoration Auto hidden
Form[] Property CustomItemsMageConjuration Auto hidden
Form[] Property CustomItemsMageAlteration Auto hidden
Form[] Property CustomItemsCommanderRegiment Auto hidden
Form[] Property CustomItemsCommanderDivision Auto hidden
Form[] Property CustomItemsCommanderArmy Auto hidden
Form[] Property CustomItemsGuard Auto hidden
Form[] Property CustomItemsSoldierMale Auto hidden
Form[] Property CustomItemsSoldierFemale Auto hidden
Form[] Property CustomItemsWarriorMale Auto hidden
Form[] Property CustomItemsWarriorFemale Auto hidden
Form[] Property CustomItemsArcherMale Auto hidden
Form[] Property CustomItemsArcherFemale Auto hidden
Form[] Property CustomItemsCrossbowMale Auto hidden
Form[] Property CustomItemsCrossbowFemale Auto hidden
Form[] Property CustomItemsMageDestructionFireMale Auto hidden
Form[] Property CustomItemsMageDestructionFireFemale Auto hidden
Form[] Property CustomItemsMageDestructionFrostMale Auto hidden
Form[] Property CustomItemsMageDestructionFrostFemale Auto hidden
Form[] Property CustomItemsMageDestructionShockMale Auto hidden
Form[] Property CustomItemsMageDestructionShockFemale Auto hidden
Form[] Property CustomItemsMageRestorationMale Auto hidden
Form[] Property CustomItemsMageRestorationFemale Auto hidden
Form[] Property CustomItemsMageConjurationMale Auto hidden
Form[] Property CustomItemsMageConjurationFemale Auto hidden
Form[] Property CustomItemsMageAlterationMale Auto hidden
Form[] Property CustomItemsMageAlterationFemale Auto hidden
Form[] Property CustomItemsCommanderRegimentMale Auto hidden
Form[] Property CustomItemsCommanderRegimentFemale Auto hidden
Form[] Property CustomItemsCommanderDivisionMale Auto hidden
Form[] Property CustomItemsCommanderDivisionFemale Auto hidden
Form[] Property CustomItemsCommanderArmyMale Auto hidden
Form[] Property CustomItemsCommanderArmyFemale Auto hidden
Form[] Property CustomItemsGuardMale Auto hidden
Form[] Property CustomItemsGuardFemale Auto hidden

Location Property ArmyName Auto
Location Property CommanderRegimentRank Auto
Location Property CommanderDivisionRank Auto
Location Property CommanderArmyRank Auto
Location Property CommanderGrandArmyRank Auto

Location Property InitialArmyName Auto
Location Property InitialCommanderRegimentRank Auto
Location Property InitialCommanderDivisionRank Auto
Location Property InitialCommanderArmyRank Auto
Location Property InitialCommanderGrandArmyRank Auto

Faction Property CommanderRegimentFaction Auto
Faction Property CommanderDivisionFaction Auto
Faction Property CommanderArmyFaction Auto
Faction Property CommanderGrandArmyFaction Auto

Faction Property ArmyNPCFaction Auto
Faction Property ArmyFaction Auto
Faction Property OwnerArmyFaction Auto
Faction Property OwnerOwnerArmyFaction Auto
Faction Property CWPlayerAlly Auto

int Property PlayerFaction Auto

Outfit Property FarmClothesRandom Auto
Outfit Property CS_TroopEquipmentOutfitHeavyTier01 Auto
Outfit Property CS_TroopEquipmentOutfitLightTier01 Auto
FormList Property CS_TroopEquipmentInitialWeapons Auto

ReferenceAlias Property ArmyNameChanger Auto
ReferenceAlias Property GuardNameChanger Auto

Container Property CS_ArmyRegimentChest Auto
Container Property CS_FactionWarAIArmy Auto

FormList Property RecruitableCommanderList Auto
FormList Property GuardMarkerLists Auto
FormList Property WarCampLocations Auto

Activator Property CS_FactionEquipmentUpdater Auto
ObjectReference Property FactionEquipmentUpdater Auto

FormList Property CS_AllBattleSpacesSkyrim Auto

ObjectReference[] Property DefensiveRegiments Auto
ObjectReference Property InitialBattleSpace Auto
ObjectReference[] Property ControlledBattleSpaces Auto
ObjectReference[] Property CapturedEnemyRegiments Auto
ObjectReference[] Property HomeArmies Auto
ObjectReference[] Property Armies Auto
int[] Property ControlledBattleSpacesEnemyBorders Auto
int Property TotalDefensiveRegiments Auto

int Property InitialTrainingLevel Auto
int Property InitialEquipmentLevel Auto

int Property RegimentPowerLevel Auto
int Property FortificationPowerLevel Auto
int Property CumulativeEnemyRegimentPowerLevel Auto
int Property CumulativeEnemyFortificationPowerLevel Auto

int Property Aggression Auto ;0 = completely defensive (all armies defending), 5 = completely aggressive (all armies offensive)
int Property ArmyMaxRegiments Auto ;0 = 1 regiment per army, 5 = 6 regiments per army
int Property Risk Auto ;0 = not willing to act without 100% intel, 5 = willing to act with 0% intel
int Property DefensiveSpread Auto ;0 = converge defensive regiments to capital, 1 = spread defensive units along borders, 2 = evenly spread across all battlespaces.
int Property DefensiveGarrisons auto; 0 = no units should garrison inside cities/forts, 1 = 25% garrisons, 2 = 50% garrisons, 3 = 75% garrisons, 4 = all possible units should garrison inside cities/forts
int Property Brutality Auto ;0 = not willing to commit any brutal acts (village raiding, torturing, caravan raiding) against enemy, 5 = willing to commit all brutal acts (brutal acts can lower enemy war support)
int[] Property WarSupport Auto ;0 = faction citizens do not support the war at all, 5 = faction citizens completely support war

CS_FactionArmyRegimentsScript Property ArmyRegimentsScript Auto

Function SetUp()
    RegimentCommanderRecruitable = new int[100]
    HasCustomOutfits = new int[10]
    HasGenderedOutfits = new int[10]
    HasCustomCommanderOutfits = new int[4]
    HasGenderedCommanderOutfits = new int[4]
    SetInitialTroopItems()
    SetInitialCommanderItems()
    SetOwner()
    GoToState("Updated")
EndFunction

Function SetPowerLevels()
    int NewRegimentPowerLevel = 0
    int NewFortificationPowerLevel = 0
    
    int i = 0
    while i < CS_AllBattleSpacesSkyrim.GetSize()
        CS_BattleSpaceRegionAll BattleSpace = CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll
        NewRegimentPowerLevel += BattleSpace.GetFactionRegimentPowerLevel(self as ObjectReference)
        NewFortificationPowerLevel += BattleSpace.GetFactionFortificationPowerLevel(self as ObjectReference)
        i += 1
    endwhile
    
    RegimentPowerLevel = NewRegimentPowerLevel
    FortificationPowerLevel = NewFortificationPowerLevel
    debug.trace(GetFactionName(self as ObjectReference) + " PowerLevels - Regiment: " + RegimentPowerLevel + ", Fortification: " + FortificationPowerLevel)
EndFunction

Function SetArmyMaxRegiments()
    float TotalRegiments = GetTotalRegiments()
    int DesiredArmies = math.ceiling(ControlledBattleSpaces.Length as float/2) as int
    int DesiredMaxRegiments = math.ceiling(TotalRegiments/DesiredArmies) as int
    if DesiredMaxRegiments > 6
        DesiredMaxRegiments = 6
    elseif DesiredMaxRegiments < 2
        DesiredMaxRegiments = 2
    endif
    ArmyMaxRegiments = DesiredMaxRegiments - 1
EndFunction

Function SetAggression()
    int BaseAggression = 2
    int AggressionAddition
    
    if RegimentPowerLevel > CumulativeEnemyRegimentPowerLevel
        AggressionAddition += utility.randomint(0, 1)
    elseif RegimentPowerLevel == CumulativeEnemyRegimentPowerLevel
        AggressionAddition += utility.randomint(-1, 1)
    elseif RegimentPowerLevel < CumulativeEnemyRegimentPowerLevel
        AggressionAddition += utility.randomint(-1, 0)
    endif
    
    if RegimentPowerLevel > CumulativeEnemyFortificationPowerLevel
        AggressionAddition += utility.randomint(0, 1)
    elseif RegimentPowerLevel == CumulativeEnemyFortificationPowerLevel
        AggressionAddition += utility.randomint(-1, 1)
    elseif RegimentPowerLevel < CumulativeEnemyFortificationPowerLevel
        AggressionAddition += utility.randomint(-1, 0)
    endif
    
    int NewAggression = BaseAggression + AggressionAddition
    if NewAggression > 5
        NewAggression = 5
    endif
    
    Aggression = NewAggression
EndFunction

Function SetStrategyAttributes();/
    SetArmyMaxRegiments()
    SetAggression()
    
    int BaseDefensiveSpread = 2
    
    int BaseDefensiveGarrisons = 1
    int DefensiveGarrisonsAddition
    
    if FortificationPowerLevel > RegimentPowerLevel
        int upperlimit = math.ceiling(FortificationPowerLevel as float/RegimentPowerLevel as float) as int
        DefensiveGarrisonsAddition = utility.randomint(2, 2 + upperlimit)
    elseif FortificationPowerLevel <= RegimentPowerLevel
        DefensiveGarrisonsAddition = utility.randomint(0, 2)
        BaseDefensiveSpread = 1
    endif
    
    DefensiveSpread = BaseDefensiveSpread
    DefensiveGarrisons = BaseDefensiveGarrisons + DefensiveGarrisonsAddition
    if DefensiveGarrisons > 4
        DefensiveGarrisons = 4
    endif/;
    ArmyMaxRegiments = 5
    Aggression = 2
    DefensiveGarrisons = 3
    debug.trace(GetFactionName(self as ObjectReference) + " Attributes - Aggression: " + Aggression + ", DefensiveSpread: " + DefensiveSpread + ", DefensiveGarrisons: " + DefensiveGarrisons)
EndFunction

Function SetInitialTroopItems()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Setting initial troop items...")
    TroopTypes = InitialTroopTypes
    CustomOutfitsMale = InitialCustomOutfitsMale
    CustomOutfitsFemale = InitialCustomOutfitsFemale
    CustomOutfitsGuardMale = InitialCustomOutfitGuardMale
    CustomOutfitsGuardFemale = InitialCustomOutfitGuardFemale
    LeveledItemsMale = InitialItemsMale
    LeveledItemsFemale = InitialItemsFemale
    LeveledItemsGuardMale = InitialItemsGuardMale
    LeveledItemsGuardFemale = InitialItemsGuardFemale
    if InitialUniqueArmor
        SetAllInitialArmors()
        SetAllInitialItems()
        UpdateAllEquipment()
    endif
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Finished Setting initial troop items!")
EndFunction

Function SetInitialCommanderItems()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Setting initial commander items...")
    ;TroopTypes = InitialTroopTypes Revisit for commanders
    CustomOutfitsCommanderMale = InitialCustomOutfitsCommanderMale
    CustomOutfitsCommanderFemale = InitialCustomOutfitsCommanderFemale
    LeveledItemsCommanderMale = InitialItemsCommanderMale
    LeveledItemsCommanderFemale = InitialItemsCommanderFemale
    if InitialUniqueCommanderRegimentArmor
        SetAllInitialCommanderArmors()
        SetAllInitialCommanderItems()
        UpdateAllCommanderEquipment()
    endif
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Finished Setting initial commaner items!")
EndFunction

Function SetAllInitialArmors()
    Armor[] InitialUniqueArmorArray = ConvertFormListToArmorArray(InitialUniqueArmor)
    
    int i = 0
    while i < HasCustomOutfits.Length
        HasCustomOutfits[i] = 1
        i += 1
    endwhile
    
    HasCustomGuardOutfit = 1
    
    CustomOutfitSoldier = InitialUniqueArmorArray
    CustomOutfitWarrior = InitialUniqueArmorArray
    CustomOutfitArcher = InitialUniqueArmorArray
    CustomOutfitCrossbow = InitialUniqueArmorArray
    CustomOutfitMageDestructionFire = InitialUniqueArmorArray
    CustomOutfitMageDestructionFrost = InitialUniqueArmorArray
    CustomOutfitMageDestructionShock = InitialUniqueArmorArray
    CustomOutfitMageRestoration = InitialUniqueArmorArray
    CustomOutfitMageConjuration = InitialUniqueArmorArray
    CustomOutfitMageAlteration = InitialUniqueArmorArray
    CustomOutfitGuard = InitialUniqueArmorArray
    CustomOutfitSoldierMale = InitialUniqueArmorArray
    CustomOutfitSoldierFemale = InitialUniqueArmorArray
    CustomOutfitWarriorMale = InitialUniqueArmorArray
    CustomOutfitWarriorFemale = InitialUniqueArmorArray
    CustomOutfitArcherMale = InitialUniqueArmorArray
    CustomOutfitArcherFemale = InitialUniqueArmorArray
    CustomOutfitCrossbowMale = InitialUniqueArmorArray
    CustomOutfitCrossbowFemale = InitialUniqueArmorArray
    CustomOutfitMageDestructionFireMale = InitialUniqueArmorArray
    CustomOutfitMageDestructionFireFemale = InitialUniqueArmorArray
    CustomOutfitMageDestructionFrostMale = InitialUniqueArmorArray
    CustomOutfitMageDestructionFrostFemale = InitialUniqueArmorArray
    CustomOutfitMageDestructionShockMale = InitialUniqueArmorArray
    CustomOutfitMageDestructionShockFemale = InitialUniqueArmorArray
    CustomOutfitMageRestorationMale = InitialUniqueArmorArray
    CustomOutfitMageRestorationFemale = InitialUniqueArmorArray
    CustomOutfitMageConjurationMale = InitialUniqueArmorArray
    CustomOutfitMageConjurationFemale = InitialUniqueArmorArray
    CustomOutfitMageAlterationMale = InitialUniqueArmorArray
    CustomOutfitMageAlterationFemale = InitialUniqueArmorArray
    CustomOutfitGuardMale = InitialUniqueArmorArray
    CustomOutfitGuardFemale = InitialUniqueArmorArray
EndFunction

Function SetAllInitialItems()
    Form[] InitialUniqueItemsArraySoldier = ConvertFormListToFormArray(InitialUniqueItemsSoldier)
    Form[] InitialUniqueItemsArrayWarrior = ConvertFormListToFormArray(InitialUniqueItemsWarrior)
    Form[] InitialUniqueItemsArrayArcher = ConvertFormListToFormArray(InitialUniqueItemsArcher)
    Form[] InitialUniqueItemsArrayCrossbow = ConvertFormListToFormArray(InitialUniqueItemsCrossbow)
    Form[] InitialUniqueItemsArrayMisc = ConvertFormListToFormArray(InitialUniqueItemsMisc)
    Form[] InitialUniqueItemsArrayGuard = ConvertFormListToFormArray(InitialUniqueItemsGuard)
    
    CustomItemsSoldier = InitialUniqueItemsArraySoldier
    CustomItemsWarrior = InitialUniqueItemsArrayWarrior
    CustomItemsArcher = InitialUniqueItemsArrayArcher
    CustomItemsCrossbow = InitialUniqueItemsArrayCrossbow
    CustomItemsMageDestructionFire = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionFrost = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionShock = InitialUniqueItemsArrayMisc
    CustomItemsMageRestoration = InitialUniqueItemsArrayMisc
    CustomItemsMageConjuration = InitialUniqueItemsArrayMisc
    CustomItemsMageAlteration = InitialUniqueItemsArrayMisc
    CustomItemsGuard = InitialUniqueItemsArrayGuard
    CustomItemsSoldierMale = InitialUniqueItemsArraySoldier
    CustomItemsSoldierFemale = InitialUniqueItemsArraySoldier
    CustomItemsWarriorMale = InitialUniqueItemsArrayWarrior
    CustomItemsWarriorFemale = InitialUniqueItemsArrayWarrior
    CustomItemsArcherMale = InitialUniqueItemsArrayArcher
    CustomItemsArcherFemale = InitialUniqueItemsArrayArcher
    CustomItemsCrossbowMale = InitialUniqueItemsArrayCrossbow
    CustomItemsCrossbowFemale = InitialUniqueItemsArrayCrossbow
    CustomItemsMageDestructionFireMale = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionFireFemale = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionFrostMale = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionFrostFemale = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionShockMale = InitialUniqueItemsArrayMisc
    CustomItemsMageDestructionShockFemale = InitialUniqueItemsArrayMisc
    CustomItemsMageRestorationMale = InitialUniqueItemsArrayMisc
    CustomItemsMageRestorationFemale = InitialUniqueItemsArrayMisc
    CustomItemsMageConjurationMale = InitialUniqueItemsArrayMisc
    CustomItemsMageConjurationFemale = InitialUniqueItemsArrayMisc
    CustomItemsMageAlterationMale = InitialUniqueItemsArrayMisc
    CustomItemsMageAlterationFemale = InitialUniqueItemsArrayMisc
    CustomItemsGuardMale = InitialUniqueItemsArrayGuard
    CustomItemsGuardFemale = InitialUniqueItemsArrayGuard
EndFunction

Function SetAllInitialCommanderArmors()
    Armor[] InitialUniqueRegimentArmorArray = ConvertFormListToArmorArray(InitialUniqueCommanderRegimentArmor)
    Armor[] InitialUniqueDivisionArmorArray = ConvertFormListToArmorArray(InitialUniqueCommanderDivisionArmor)
    Armor[] InitialUniqueArmyArmorArray = ConvertFormListToArmorArray(InitialUniqueCommanderArmyArmor)
    
    int i = 0
    while i < HasCustomCommanderOutfits.Length
        HasCustomCommanderOutfits[i] = 1
        i += 1
    endwhile
    
    CustomOutfitCommanderRegiment = InitialUniqueRegimentArmorArray
    CustomOutfitCommanderDivision = InitialUniqueDivisionArmorArray
    CustomOutfitCommanderArmy = InitialUniqueArmyArmorArray
    CustomOutfitCommanderRegimentMale = InitialUniqueRegimentArmorArray
    CustomOutfitCommanderRegimentFemale = InitialUniqueRegimentArmorArray
    CustomOutfitCommanderDivisionMale = InitialUniqueDivisionArmorArray
    CustomOutfitCommanderDivisionFemale = InitialUniqueDivisionArmorArray
    CustomOutfitCommanderArmyMale = InitialUniqueArmyArmorArray
    CustomOutfitCommanderArmyFemale = InitialUniqueArmyArmorArray
EndFunction

Function SetAllInitialCommanderItems()
    Form[] InitialUniqueItemsArray = ConvertFormListToFormArray(InitialUniqueItemsCommander)
    
    CustomItemsCommanderRegiment = InitialUniqueItemsArray
    CustomItemsCommanderDivision = InitialUniqueItemsArray
    CustomItemsCommanderArmy = InitialUniqueItemsArray
    CustomItemsCommanderRegimentMale = InitialUniqueItemsArray
    CustomItemsCommanderRegimentFemale = InitialUniqueItemsArray
    CustomItemsCommanderDivisionMale = InitialUniqueItemsArray
    CustomItemsCommanderDivisionFemale = InitialUniqueItemsArray
    CustomItemsCommanderArmyMale = InitialUniqueItemsArray
    CustomItemsCommanderArmyFemale = InitialUniqueItemsArray
EndFunction

Function SetOwner()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Setting owner...")
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_FactionManagementOwnership).FactionOwnerActivator
    
    if ((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionType == 0 && FactionOwnerActivator
        CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
        if !InitialTroopTypes
            TroopTypes = MilitaryScript.TroopTypes
            GuardTroopType = MilitaryScript.GuardTroopType
        endif
        OwnerArmyFaction = MilitaryScript.ArmyFaction
        if MilitaryScript.OwnerArmyFaction
            OwnerOwnerArmyFaction = MilitaryScript.OwnerArmyFaction
        endif
        SetOwnerEquipment(FactionOwnerActivator)
        ArmyName = (FactionOwnerActivator as CS_FactionManagementDiplomacy).FactionName
        CommanderRegimentRank = MilitaryScript.CommanderRegimentRank
        CommanderDivisionRank = MilitaryScript.CommanderDivisionRank
        CommanderArmyRank = MilitaryScript.CommanderArmyRank
        ResetArmyName()
    else
        if FactionOwnerActivator
            CS_FactionManagementMilitary MilitaryScript = FactionOwnerActivator as CS_FactionManagementMilitary
            if !InitialTroopTypes
                TroopTypes = MilitaryScript.TroopTypes
                GuardTroopType = MilitaryScript.GuardTroopType
            endif
            OwnerArmyFaction = MilitaryScript.ArmyFaction
            if MilitaryScript.OwnerArmyFaction
                OwnerOwnerArmyFaction = MilitaryScript.OwnerArmyFaction
            endif
        else
            OwnerArmyFaction = None
            OwnerOwnerArmyFaction = None
        endif
        CustomOutfitsMale = InitialCustomOutfitsMale
        CustomOutfitsFemale = InitialCustomOutfitsFemale
        CustomOutfitsCommanderMale = InitialCustomOutfitsCommanderMale
        CustomOutfitsCommanderFemale = InitialCustomOutfitsCommanderFemale
        CustomOutfitsGuardMale = InitialCustomOutfitGuardMale
        CustomOutfitsGuardFemale = InitialCustomOutfitGuardFemale
        LeveledItemsMale = InitialItemsMale
        LeveledItemsFemale = InitialItemsFemale
        LeveledItemsCommanderMale = InitialItemsCommanderMale
        LeveledItemsCommanderFemale = InitialItemsCommanderFemale
        LeveledItemsGuardMale = InitialItemsGuardMale
        LeveledItemsGuardFemale = InitialItemsGuardFemale
        ArmyName = InitialArmyName
        CommanderRegimentRank = InitialCommanderRegimentRank
        CommanderDivisionRank = InitialCommanderDivisionRank
        CommanderArmyRank = InitialCommanderArmyRank
        ;ResetArmyName()
        ;SetAllEquipment(InitialItemsSoldier, InitialItemsWarrior, InitialItemsArcher, InitialItemsCrossbow)
    endif
    
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Finished Setting owner!")
EndFunction

Function ResetArmyName();/
    int i = 0
    while i < Regiments.Length
        (Regiments[i] as CS_RegimentScript).ArmyName.ForceLocationTo(ArmyName)
        (Regiments[i] as CS_RegimentScript).CommanderTitle.ForceLocationTo(CommanderRegimentRank)
        i += 1
    endwhile/;
    
    ;Add Divisions
    ;Add Armies
EndFunction

Function SetOwnerEquipment(ObjectReference FactionOwnerActivator)
    HasCustomOutfits = (FactionOwnerActivator as CS_FactionManagementMilitary).HasCustomOutfits
    HasGenderedOutfits = (FactionOwnerActivator as CS_FactionManagementMilitary).HasGenderedOutfits
    CustomOutfitsMale = (FactionOwnerActivator as CS_FactionManagementMilitary).CustomOutfitsMale
    CustomOutfitsFemale = (FactionOwnerActivator as CS_FactionManagementMilitary).CustomOutfitsFemale
    LeveledItemsMale = (FactionOwnerActivator as CS_FactionManagementMilitary).LeveledItemsMale
    LeveledItemsFemale = (FactionOwnerActivator as CS_FactionManagementMilitary).LeveledItemsFemale
    
    HasCustomCommanderOutfits = (FactionOwnerActivator as CS_FactionManagementMilitary).HasCustomCommanderOutfits
    HasGenderedCommanderOutfits = (FactionOwnerActivator as CS_FactionManagementMilitary).HasGenderedCommanderOutfits
    CustomOutfitsCommanderMale = (FactionOwnerActivator as CS_FactionManagementMilitary).CustomOutfitsCommanderMale
    CustomOutfitsCommanderFemale = (FactionOwnerActivator as CS_FactionManagementMilitary).CustomOutfitsCommanderFemale
    LeveledItemsCommanderMale = (FactionOwnerActivator as CS_FactionManagementMilitary).LeveledItemsCommanderMale
    LeveledItemsCommanderFemale = (FactionOwnerActivator as CS_FactionManagementMilitary).LeveledItemsCommanderFemale
EndFunction

Function UpdateAllEquipment()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Updating troop equipment...")
    int i = 0
    while i < LeveledOutfitsMale.GetSize()
        UpdateEquipment(i)
        i += 1
    endwhile
    
    UpdateGuardEquipment()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Finished Updating troop equipment!")
    
EndFunction

Function UpdateAllCommanderEquipment()
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Updating troop equipment...")
    int i = 0
    while i < LeveledOutfitsCommanderMale.GetSize()
        UpdateCommanderEquipment(i)
        i += 1
    endwhile
    debug.trace(((self as ObjectReference) as CS_FactionManagementDiplomacy).FactionNameString + " Finished Updating troop equipment!")
    
EndFunction

Function UpdateEquipment(int trooptype, int gender=-1)
    if !FactionEquipmentUpdater
        FactionEquipmentUpdater = (self as ObjectReference).PlaceAtMe(CS_FactionEquipmentUpdater, abForcePersist=true)
        (FactionEquipmentUpdater as CS_EquipmentUpdaterThreadManager).SetUpThreads()
    endif
    
    CS_EquipmentUpdaterThreadManager EquipmentUpdater = FactionEquipmentUpdater as CS_EquipmentUpdaterThreadManager
    if trooptype == 0
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitSoldierMale, CustomItemsSoldierMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitSoldierFemale, CustomItemsSoldierFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitSoldier, CustomItemsSoldier)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitSoldier, CustomItemsSoldier)
        endif
    elseif trooptype == 1
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitWarriorMale, CustomItemsWarriorMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitWarriorFemale, CustomItemsWarriorFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitWarrior, CustomItemsWarrior)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitWarrior, CustomItemsWarrior)
        endif
    elseif trooptype == 2
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitArcherMale, CustomItemsArcherMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitArcherFemale, CustomItemsArcherFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitArcher, CustomItemsArcher)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitArcher, CustomItemsArcher)
        endif
    elseif trooptype == 3
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitCrossbowMale, CustomItemsCrossbowMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitCrossbowFemale, CustomItemsCrossbowFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitCrossbow, CustomItemsCrossbow)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitCrossbow, CustomItemsCrossbow)
        endif
    elseif trooptype == 4
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFireMale, CustomItemsMageDestructionFireMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFireFemale, CustomItemsMageDestructionFireFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFire, CustomItemsMageDestructionFire)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFire, CustomItemsMageDestructionFire)
        endif
    elseif trooptype == 5
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFrostMale, CustomItemsMageDestructionFrostMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFrostFemale, CustomItemsMageDestructionFrostFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFrost, CustomItemsMageDestructionFrost)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionFrost, CustomItemsMageDestructionFrost)
        endif
    elseif trooptype == 6
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionShockMale, CustomItemsMageDestructionShockMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionShockFemale, CustomItemsMageDestructionShockFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionShock, CustomItemsMageDestructionShock)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageDestructionShock, CustomItemsMageDestructionShock)
        endif
    elseif trooptype == 7
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageRestorationMale, CustomItemsMageRestorationMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageRestorationFemale, CustomItemsMageRestorationFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageRestoration, CustomItemsMageRestoration)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageRestoration, CustomItemsMageRestoration)
        endif
    elseif trooptype == 8
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageConjurationMale, CustomItemsMageConjurationMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageConjurationFemale, CustomItemsMageConjurationFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageConjuration, CustomItemsMageConjuration)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageConjuration, CustomItemsMageConjuration)
        endif
    elseif trooptype == 9
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageAlterationMale, CustomItemsMageAlterationMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageAlterationFemale, CustomItemsMageAlterationFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsMale.GetAt(trooptype) as LeveledItem, LeveledItemsMale.GetAt(trooptype) as LeveledItem, CustomOutfitMageAlteration, CustomItemsMageAlteration)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsFemale.GetAt(trooptype) as LeveledItem, LeveledItemsFemale.GetAt(trooptype) as LeveledItem, CustomOutfitMageAlteration, CustomItemsMageAlteration)
        endif
    endif
EndFunction

Function UpdateCommanderEquipment(int unittype, int gender=-1)
    if !FactionEquipmentUpdater
        FactionEquipmentUpdater = (self as ObjectReference).PlaceAtMe(CS_FactionEquipmentUpdater, abForcePersist=true)
        (FactionEquipmentUpdater as CS_EquipmentUpdaterThreadManager).SetUpThreads()
    endif
    
    CS_EquipmentUpdaterThreadManager EquipmentUpdater = FactionEquipmentUpdater as CS_EquipmentUpdaterThreadManager
    if unittype == 0
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderMale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderMale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderRegimentMale, CustomItemsCommanderRegimentMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderFemale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderFemale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderRegimentFemale, CustomItemsCommanderRegimentFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderMale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderMale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderRegiment, CustomItemsCommanderRegiment)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderFemale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderFemale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderRegiment, CustomItemsCommanderRegiment)
        endif
    elseif unittype == 1
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderMale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderMale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderDivisionMale, CustomItemsCommanderDivisionMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderFemale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderFemale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderDivisionFemale, CustomItemsCommanderDivisionFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderMale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderMale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderDivision, CustomItemsCommanderDivision)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderFemale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderFemale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderDivision, CustomItemsCommanderDivision)
        endif
    elseif unittype == 2
        if gender == 0
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderMale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderMale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderArmyMale, CustomItemsCommanderArmyMale)
        elseif gender == 1
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderFemale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderFemale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderArmyFemale, CustomItemsCommanderArmyFemale)
        else
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderMale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderMale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderArmy, CustomItemsCommanderArmy)
            EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitsCommanderFemale.GetAt(unittype) as LeveledItem, LeveledItemsCommanderFemale.GetAt(unittype) as LeveledItem, CustomOutfitCommanderArmy, CustomItemsCommanderArmy)
        endif
    endif
EndFunction

Function UpdateGuardEquipment(int gender=-1)
    if !FactionEquipmentUpdater
        FactionEquipmentUpdater = (self as ObjectReference).PlaceAtMe(CS_FactionEquipmentUpdater, abForcePersist=true)
        (FactionEquipmentUpdater as CS_EquipmentUpdaterThreadManager).SetUpThreads()
    endif
    
    CS_EquipmentUpdaterThreadManager EquipmentUpdater = FactionEquipmentUpdater as CS_EquipmentUpdaterThreadManager
    if gender == 0
        EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitGuardMale, LeveledItemsGuardMale, CustomOutfitGuardMale, CustomItemsGuardMale)
    elseif gender == 1
        EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitGuardFemale, LeveledItemsGuardFemale, CustomOutfitGuardFemale, CustomItemsGuardFemale)
    else
        EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitGuardMale, LeveledItemsGuardMale, CustomOutfitGuard, CustomItemsGuard)
        EquipmentUpdater.UpdateTroopEquipment(LeveledOutfitGuardFemale, LeveledItemsGuardFemale, CustomOutfitGuard, CustomItemsGuard)
    endif
EndFunction

ObjectReference Function CreateNewRegiment(ObjectReference InitialHomeBase)
    int NextCommanderNum = ArmyRegimentsScript.GetNextCommander()
    if NextCommanderNum >= 0
        ReferenceAlias NextCommander = ArmyRegimentsScript.Commanders[NextCommanderNum]
        ReferenceAlias NextCommanderTarget = ArmyRegimentsScript.CommanderTargets[NextCommanderNum]
        LocationAlias BaseLocation = ArmyRegimentsScript.BaseLocations[NextCommanderNum]
        ObjectReference NewRegiment = (self as ObjectReference).PlaceAtMe(CS_ArmyRegimentChest)
        BaseLocation.ForceLocationTo((InitialHomeBase as CS_CityManagementOwnership).VanillaCity)
        ArmyRegimentsScript.Regiments[NextCommanderNum].ForceRefTo(NewRegiment)
        Regiments = AddToArray(NewRegiment, Regiments)
        if RecruitableCommanderList
            (NewRegiment as CS_ArmyRegimentOrders).RecruitableCommanderList = RecruitableCommanderList
        endif
        (NewRegiment as CS_ArmyRegimentOrders).SetUp(self as ObjectReference, NextCommander, NextCommanderTarget, InitialHomeBase)
        return NewRegiment
    else
        debug.trace("Army Regiment Formation FAILED!")
        debug.notification("Army Regiment Formation FAILED!")
        return None
    endif
EndFunction

Function AddToControlledBattleSpaces(ObjectReference BattleSpace)
    ControlledBattleSpaces = AddToArray(BattleSpace, ControlledBattleSpaces)
    SetBattleSpaceEnemyBorders()
EndFunction

Function RemoveFromControlledBattleSpaces(ObjectReference BattleSpace)
    ControlledBattleSpaces = RemoveFromArray(BattleSpace, ControlledBattleSpaces)
    SetBattleSpaceEnemyBorders()
EndFunction

int Function GetTotalRegiments()
    int TotalRegiments

    int i = 0
    while i < CS_AllBattleSpacesSkyrim.GetSize()
        TotalRegiments += (CS_AllBattleSpacesSkyrim.GetAt(i) as CS_BattleSpaceRegionAll).GetFactionCampRegiments(self as ObjectReference)
        i += 1
    endwhile
    
    return TotalRegiments
EndFunction

Function SetTotalDefensiveRegiments()
    int TotalRegiments = GetTotalRegiments()
    
    TotalDefensiveRegiments = TotalRegiments - math.floor(Aggression as float/5) as int
EndFunction

Function SetBattleSpaceDefensiveRegiments()
    
    if DefensiveSpread == 2
        
        int i = 0
        while i < ControlledBattleSpaces.Length
            (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).SetDefensiveRegimentWeight(1)
            i += 1
        endwhile
        
    elseif DefensiveSpread == 1
        
        int i = 0
        while i < ControlledBattleSpaces.Length
            int DefensiveWeight = ControlledBattleSpacesEnemyBorders[i] - Aggression
            if DefensiveWeight < 1
                DefensiveWeight = 1
            endif
            (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).SetDefensiveRegimentWeight(DefensiveWeight)
            i += 1
        endwhile
        
    endif
EndFunction

Function SetBattleSpaceEnemyBorders()
    int[] BattleSpacesEnemyBorders = new int[9]
    
    int i = 0
    while i < ControlledBattleSpaces.Length
        BattleSpacesEnemyBorders[i] = (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).GetEnemyBorders()
        i += 1
    endwhile
    
    ControlledBattleSpacesEnemyBorders = BattleSpacesEnemyBorders
EndFunction

Function DistributeAllDefensiveRegiments();/
    ObjectReference[] DeployableRegiments
    int totalregimentweights
    int i = 0
    while i < ControlledBattleSpaces.Length
        ObjectReference[] DeployableBattleSpaceRegiments = (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).GetDeployableRegiments()
        if DeployableBattleSpaceRegiments
            DeployableRegiments = AddArrayToArray(DeployableBattleSpaceRegiments, DeployableRegiments)
        endif
        totalregimentweights += (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).GetDefensiveRegimentWeight()
        i += 1
    endwhile
    
    int regimentindex = DeployableRegiments.Length - 1
    int regimentstodeploy = DeployableRegiments.Length/;
    int i = 0
    while i < ControlledBattleSpaces.Length; && regimentindex >= 0
        ;/int battlespaceregimentweight = (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).GetDefensiveRegimentWeight()
        int amounttodeploy = math.ceiling((battlespaceregimentweight as float/totalregimentweights as float)*regimentstodeploy)
        int index = 0
        while index < amounttodeploy && regimentindex >= 0
            (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).AddRegimentToCamp(DeployableRegiments[regimentindex])
            index += 1
            regimentindex -= 1
        endwhile/;
        (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).AssignRegimentsToGarrisons()
        (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).PrintBattleSpace()
        i += 1
    endwhile
EndFunction

Function FactionCaptureRegiment(ObjectReference Regiment)
    CapturedEnemyRegiments = AddToArray(Regiment, CapturedEnemyRegiments)
EndFunction

ObjectReference Function FormHomeArmy(ObjectReference HQBattleSpace, ObjectReference HQCamp)
    ObjectReference NewArmy = PlaceAtMe(CS_FactionWarAIArmy)
    int FactionNum = GetFactionNum(self as ObjectReference)
    int HoldNum = CS_AllBattleSpacesSkyrim.Find(HQBattleSpace)
    
    (NewArmy as CS_FactionWarAIArmyScript).FactionOwnerActivator = self as ObjectReference
    (NewArmy as CS_FactionWarAIArmyScript).HQBattleSpace = HQBattleSpace
    (NewArmy as CS_FactionWarAIArmyScript).HQCamp = HQCamp
    
    ObjectReference[] FactionArmies = (HQBattleSpace as CS_BattleSpaceRegionAll).FactionArmies
    FactionArmies[FactionNum] = NewArmy
    HomeArmies[HoldNum] = NewArmy
    
    return NewArmy
EndFunction

ObjectReference Function FormArmy()
    ObjectReference NewArmy = PlaceAtMe(CS_FactionWarAIArmy)
    
    (NewArmy as CS_FactionWarAIArmyScript).FactionOwnerActivator = self as ObjectReference
    ;(NewArmy as CS_FactionWarAIArmyScript).ArmyName = ((OpsTarget as CS_FactionWarLocationScript).LocationName + " Expeditionary Army")
    int i = 0
    while i < HomeArmies.Length && (NewArmy as CS_FactionWarAIArmyScript).Regiments.Length < ArmyMaxRegiments
        if HomeArmies[i]
            int remainingregiments = ArmyMaxRegiments - (NewArmy as CS_FactionWarAIArmyScript).Regiments.Length
            (HomeArmies[i] as CS_FactionWarAIArmyScript).DeployRegimentsIntoArmy(NewArmy, remainingregiments)
        endif
        i += 1
    endwhile
    
    Armies = AddToArray(NewArmy, Armies)
    
    return NewArmy
EndFunction

Function DeleteArmy(ObjectReference Army)
    Armies = RemoveFromArray(Army, Armies)
    
    Army.delete()
EndFunction

Function FormInitialArmies()
    int i = 0
    while i < ControlledBattleSpaces.Length
        ObjectReference[] DefendingRegiments = (ControlledBattleSpaces[i] as CS_BattleSpaceRegionAll).GetDefendingCampRegiments()
        AddNewRegimentsToArmy(DefendingRegiments)
        i += 1
    endwhile
EndFunction

Function AddNewRegimentToArmy(ObjectReference Regiment)
    int i = 0
    while i < Armies.Length
        if (Armies[i] as CS_FactionWarAIArmyScript).Regiments.Length <= ArmyMaxRegiments
            (Armies[i] as CS_FactionWarAIArmyScript).AddRegimentToArmy(Regiment)
            return
        endif
        i += 1
    endwhile
    ;/
    ObjectReference[] NewArmyRegiments = new ObjectReference[1]
    NewArmyRegiments[0] = Regiment
    FormArmy(NewArmyRegiments)/;
EndFunction

Function AddNewRegimentsToArmy(ObjectReference[] Regiments)
    int i = 0
    while i < Regiments.Length
        AddNewRegimentToArmy(Regiments[i])
        i += 1
    endwhile
EndFunction
;/
Function SetDefensiveArmies()
    float OffensiveArmyPercentage = (Aggression as float/5)
    int TotalOffensiveArmies = math.floor(OffensiveArmyPercentage*Armies.Length)
    
    int TotalDefensiveArmies = Armies.Length - TotalOffensiveArmies
    int i = 0
    while i < TotalDefensiveArmies
        ;Create Ops Plan
EndFunction
    
Function CreateDefensiveOpsPlan()
    ObjectReference BattleSpaceTarget
    /;
Function SetDefensivePosture()
    debug.trace("Setting battle space enemy borders...")
    SetBattleSpaceEnemyBorders()
    debug.trace("Setting total defensive regiments..")
    SetTotalDefensiveRegiments()
    debug.trace("Setting battle space defensive regiments...")
    SetBattleSpaceDefensiveRegiments()
    debug.trace("Distrbuting defensive regiments...")
    DistributeAllDefensiveRegiments()
    debug.trace("Defensive Posture Set!")
EndFunction

State NotSetUp
    
    Event OnUpdate()
        
        SetUp()
        
    EndEvent

EndState