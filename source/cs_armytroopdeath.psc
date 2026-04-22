Scriptname CS_ArmyTroopDeath extends Quest  conditional

FormList Property CS_TroopCountsS  Auto  
FormList Property CS_TroopCountsW  Auto  
FormList Property CS_TroopCountsA  Auto  
FormList Property CS_TroopCountsCB  Auto  
FormList Property CS_ArmyQuests  Auto  
FormList Property CS_ArmyBaseTroops  Auto 

FormList Property CS_AllPlayerGarrisonTroops Auto

Armor Property CS_WarDrum Auto
Faction Property CS_ArmyDrummerFaction Auto
Sound Property CS_DrumsSounds1 Auto

CS_TroopManageMenuScript Property ManageArmy Auto
Quest Property CS_TroopRecruiter Auto

float Property MovingArrivalTime Auto
int Property MovingArrivalTimeRemaining Auto
int Property MovingArrivalTimePotential Auto
int Property MovingArrivalHoldNum Auto
ObjectReference Property MovingArrivalRef Auto
ObjectReference Property MovingArrivalText Auto
Location Property MovingArrivalLoc Auto
string Property MovingType Auto

bool Property IsVampire Auto
bool Property Blockaded Auto
bool Property NeedReset Auto
bool Property NeedSpawn=false Auto
int Property TemplateNum=-1 Auto

ObjectReference Property CurrentTask Auto

int Property TroopCount Auto conditional
int Property TroopCountFood Auto conditional

int Property CountSoldier Auto conditional
int Property CountWarrior Auto conditional
int Property CountArcher Auto conditional
int Property CountCrossbow Auto conditional
int Property CountMageDestructionFire Auto conditional
int Property CountMageDestructionFrost Auto conditional
int Property CountMageDestructionShock Auto conditional
int Property CountMageRestoration Auto conditional
int Property CountMageConjuration Auto conditional
int Property CountMageAlteration Auto conditional
int Property CountDwarvenSpider Auto conditional
int Property CountDwarvenSphere Auto conditional
int Property CountDwarvenBallista Auto conditional
int Property CountDwarvenCenturion Auto conditional
int Property CountCreatureSkeever Auto conditional
int Property CountCreatureWolf Auto conditional
int Property CountCreatureSabreCat Auto conditional
int Property CountCreatureFrostbiteSpider Auto conditional
int Property CountCreatureBear Auto conditional
int Property CountCreatureTroll Auto conditional
int Property CountCreatureGiant Auto conditional
int Property CountCreatureMammoth Auto conditional

int Property CountUnspawnedSoldier Auto conditional
int Property CountUnspawnedWarrior Auto conditional
int Property CountUnspawnedArcher Auto conditional
int Property CountUnspawnedCrossbow Auto conditional
int Property CountUnspawnedMageDestructionFire Auto conditional
int Property CountUnspawnedMageDestructionFrost Auto conditional
int Property CountUnspawnedMageDestructionShock Auto conditional
int Property CountUnspawnedMageRestoration Auto conditional
int Property CountUnspawnedMageConjuration Auto conditional
int Property CountUnspawnedMageAlteration Auto conditional
int Property CountUnspawnedDwarvenSpider Auto conditional
int Property CountUnspawnedDwarvenSphere Auto conditional
int Property CountUnspawnedDwarvenBallista Auto conditional
int Property CountUnspawnedDwarvenCenturion Auto conditional
int Property CountUnspawnedCreatureSkeever Auto conditional
int Property CountUnspawnedCreatureWolf Auto conditional
int Property CountUnspawnedCreatureSabreCat Auto conditional
int Property CountUnspawnedCreatureFrostbiteSpider Auto conditional
int Property CountUnspawnedCreatureBear Auto conditional
int Property CountUnspawnedCreatureTroll Auto conditional
int Property CountUnspawnedCreatureGiant Auto conditional
int Property CountUnspawnedCreatureMammoth Auto conditional
int Property CountUnspawnedTotal Auto

bool Property AutoRespawn = true Auto
int Property CountSoldierAuto Auto conditional
int Property CountWarriorAuto Auto conditional
int Property CountArcherAuto Auto conditional
int Property CountCrossbowAuto Auto conditional
int Property CountMageDestructionFireAuto Auto conditional
int Property CountMageDestructionFrostAuto Auto conditional
int Property CountMageDestructionShockAuto Auto conditional
int Property CountMageRestorationAuto Auto conditional
int Property CountMageConjurationAuto Auto conditional
int Property CountMageAlterationAuto Auto conditional
int Property CountDwarvenSpiderAuto Auto conditional
int Property CountDwarvenSphereAuto Auto conditional
int Property CountDwarvenBallistaAuto Auto conditional
int Property CountDwarvenCenturionAuto Auto conditional
int Property CountCreatureSkeeverAuto Auto conditional
int Property CountCreatureWolfAuto Auto conditional
int Property CountCreatureSabreCatAuto Auto conditional
int Property CountCreatureFrostbiteSpiderAuto Auto conditional
int Property CountCreatureBearAuto Auto conditional
int Property CountCreatureTrollAuto Auto conditional
int Property CountCreatureGiantAuto Auto conditional
int Property CountCreatureMammothAuto Auto conditional

ReferenceAlias Property Troop001 Auto
ReferenceAlias Property Troop002 Auto
ReferenceAlias Property Troop003 Auto
ReferenceAlias Property Troop004 Auto
ReferenceAlias Property Troop005 Auto
ReferenceAlias Property Troop006 Auto
ReferenceAlias Property Troop007 Auto
ReferenceAlias Property Troop008 Auto
ReferenceAlias Property Troop009 Auto
ReferenceAlias Property Troop010 Auto
ReferenceAlias Property Troop011 Auto
ReferenceAlias Property Troop012 Auto
ReferenceAlias Property Troop013 Auto
ReferenceAlias Property Troop014 Auto
ReferenceAlias Property Troop015 Auto
ReferenceAlias Property Troop016 Auto
ReferenceAlias Property Troop017 Auto
ReferenceAlias Property Troop018 Auto
ReferenceAlias Property Troop019 Auto
ReferenceAlias Property Troop020 Auto

ReferenceAlias Property Troop1 Auto
ReferenceAlias Property Troop2 Auto
ReferenceAlias Property Troop3 Auto
ReferenceAlias Property Troop4 Auto
ReferenceAlias Property Troop5 Auto
ReferenceAlias Property Troop6 Auto
ReferenceAlias Property Troop7 Auto
ReferenceAlias Property Troop8 Auto
ReferenceAlias Property Troop9 Auto
ReferenceAlias Property Troop10 Auto
ReferenceAlias Property Troop11 Auto
ReferenceAlias Property Troop12 Auto
ReferenceAlias Property Troop13 Auto
ReferenceAlias Property Troop14 Auto
ReferenceAlias Property Troop15 Auto
ReferenceAlias Property Troop16 Auto
ReferenceAlias Property Troop17 Auto
ReferenceAlias Property Troop18 Auto
ReferenceAlias Property Troop19 Auto
ReferenceAlias Property Troop20 Auto

Actor Property SpawnCommander Auto

Function AdjustTroopCount(ReferenceAlias TroopAlias)
    Actor Troop = TroopAlias.GetActorRef()
    TroopCount -= 1
    if Troop.GetActorBase() == ManageArmy.Troops[0]
        CountSoldier -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[1]
        CountWarrior -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[2]
        CountArcher -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[3]
        CountCrossbow -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.DestructionMages[1]
        CountMageDestructionFire -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.DestructionMages[2]
        CountMageDestructionFrost -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.DestructionMages[3]
        CountMageDestructionShock -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[6]
        CountMageRestoration -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[7]
        CountMageConjuration -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[8]
        CountMageAlteration -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[9]
        CountDwarvenSpider -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[10]
        CountDwarvenSphere -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[11]
        CountDwarvenBallista -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[12]
        CountDwarvenCenturion -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[13]
        CountCreatureSkeever -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[14]
        CountCreatureWolf -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[15]
        CountCreatureSabreCat -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[16]
        CountCreatureFrostbiteSpider -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[17]
        CountCreatureBear -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[18]
        CountCreatureTroll -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[19]
        CountCreatureGiant -= 1
        TroopCountFood -= 1
    elseif Troop.GetActorBase() == ManageArmy.Troops[20]
        CountCreatureMammoth -= 1
        TroopCountFood -= 1
    endif
    RemoveFromGarrison(Troop)
    if Troop.IsDisabled()
        Troop.delete()
    endif
    TroopAlias.Clear()
endFunction

Function AddTroopCount(int trooptype, int destructionmagetype = -1)
    TroopCount += 1
    if trooptype == 0
        CountSoldier += 1
        TroopCountFood += 1
    elseif trooptype  == 1
        CountWarrior += 1
        TroopCountFood += 1
    elseif trooptype == 2
        CountArcher += 1
        TroopCountFood += 1
    elseif trooptype == 3
        CountCrossbow += 1
        TroopCountFood += 1
    elseif trooptype == 5
        if destructionmagetype == 1
            CountMageDestructionFire += 1
        elseif destructionmagetype == 2
            CountMageDestructionFrost += 1
        elseif destructionmagetype == 3
            CountMageDestructionShock += 1
        endif
        TroopCountFood += 1
    elseif trooptype  == 6
        CountMageRestoration += 1
        TroopCountFood += 1
    elseif trooptype == 7
        CountMageConjuration += 1
        TroopCountFood += 1
    elseif trooptype == 8
        CountMageAlteration += 1
        TroopCountFood += 1
    elseif trooptype == 9
        CountDwarvenSpider += 1
    elseif trooptype  == 10
        CountDwarvenSphere += 1
    elseif trooptype == 11
        CountDwarvenBallista += 1
    elseif trooptype == 12
        CountDwarvenCenturion += 1
    elseif trooptype == 13
        CountCreatureSkeever += 1
        TroopCountFood += 1
    elseif trooptype  == 14
        CountCreatureWolf += 1
        TroopCountFood += 1
    elseif trooptype == 15
        CountCreatureSabreCat += 1
        TroopCountFood += 1
    elseif trooptype == 16
        CountCreatureFrostbiteSpider += 1
        TroopCountFood += 1
    elseif trooptype == 17
        CountCreatureBear += 1
        TroopCountFood += 1
    elseif trooptype  == 18
        CountCreatureTroll += 1
        TroopCountFood += 1
    elseif trooptype == 19
        CountCreatureGiant += 1
        TroopCountFood += 1
    elseif trooptype == 20
        CountCreatureMammoth += 1
        TroopCountFood += 1
    endif
endFunction

Function AddTroopCountUnspawned(int trooptype, int destructionmagetype = -1)
    ;CountUnspawnedTotal += 1
    if trooptype == 0
        CountUnspawnedSoldier += 1
    elseif trooptype  == 1
        CountUnspawnedWarrior += 1
    elseif trooptype == 2
        CountUnspawnedArcher += 1
    elseif trooptype == 3
        CountUnspawnedCrossbow += 1
    elseif trooptype == 5
        if destructionmagetype == 1
            CountUnspawnedMageDestructionFire += 1
        elseif destructionmagetype == 2
            CountUnspawnedMageDestructionFrost += 1
        elseif destructionmagetype == 3
            CountUnspawnedMageDestructionShock += 1
        endif
    elseif trooptype  == 6
        CountUnspawnedMageRestoration += 1
    elseif trooptype == 7
        CountUnspawnedMageConjuration += 1
    elseif trooptype == 8
        CountUnspawnedMageAlteration += 1
    elseif trooptype == 9
        CountUnspawnedDwarvenSpider += 1
    elseif trooptype  == 10
        CountUnspawnedDwarvenSphere += 1
    elseif trooptype == 11
        CountUnspawnedDwarvenBallista += 1
    elseif trooptype == 12
        CountUnspawnedDwarvenCenturion += 1
    elseif trooptype == 13
        CountUnspawnedCreatureSkeever += 1
    elseif trooptype  == 14
        CountUnspawnedCreatureWolf += 1
    elseif trooptype == 15
        CountUnspawnedCreatureSabreCat += 1
    elseif trooptype == 16
        CountUnspawnedCreatureFrostbiteSpider += 1
    elseif trooptype == 17
        CountUnspawnedCreatureBear += 1
    elseif trooptype  == 18
        CountUnspawnedCreatureTroll += 1
    elseif trooptype == 19
        CountUnspawnedCreatureGiant += 1
    elseif trooptype == 20
        CountUnspawnedCreatureMammoth += 1
    endif
endFunction

Function RemoveFromGarrison(Actor Troop)
    int i = 0
    int FoundTroop = 0
    while i < CS_AllPlayerGarrisonTroops.GetSize() && FoundTroop == 0
        FormList TroopGarrison = CS_AllPlayerGarrisonTroops.GetAt(i) as FormList
        if TroopGarrison.HasForm(Troop) == 1
            TroopGarrison.RemoveAddedForm(Troop)
            FoundTroop = 1
        endif
        i += 1
    endwhile
EndFunction

Function SpawnUnSpawnedTroops(Actor Commander)

EndFunction

ReferenceAlias Function GetNextFreeSpot()

    int armynum = CS_ArmyQuests.Find(self as Form)
    if armynum < 12
        if !Troop1.GetActorRef()
            return Troop1
        elseif !Troop2.GetActorRef()
            return Troop2
        elseif !Troop3.GetActorRef()
            return Troop3
        elseif !Troop4.GetActorRef()
            return Troop4
        elseif !Troop5.GetActorRef()
            return Troop5
        elseif !Troop6.GetActorRef()
            return Troop6
        elseif !Troop7.GetActorRef()
            return Troop7
        elseif !Troop8.GetActorRef()
            return Troop8
        elseif !Troop9.GetActorRef()
            return Troop9
        elseif !Troop10.GetActorRef()
            return Troop10
        elseif !Troop11.GetActorRef()
            return Troop11
        elseif !Troop12.GetActorRef()
            return Troop12
        elseif !Troop13.GetActorRef()
            return Troop13
        elseif !Troop14.GetActorRef()
            return Troop14
        elseif !Troop15.GetActorRef()
            return Troop15
        elseif !Troop16.GetActorRef()
            return Troop16
        elseif !Troop17.GetActorRef()
            return Troop17
        elseif !Troop18.GetActorRef()
            return Troop18
        elseif !Troop19.GetActorRef()
            return Troop19
        elseif !Troop20.GetActorRef()
            return Troop20
        endif
    else
        if !Troop001.GetActorRef()
            return Troop001
        elseif !Troop002.GetActorRef()
            return Troop002
        elseif !Troop003.GetActorRef()
            return Troop003
        elseif !Troop004.GetActorRef()
            return Troop004
        elseif !Troop005.GetActorRef()
            return Troop005
        elseif !Troop006.GetActorRef()
            return Troop006
        elseif !Troop007.GetActorRef()
            return Troop007
        elseif !Troop008.GetActorRef()
            return Troop008
        elseif !Troop009.GetActorRef()
            return Troop009
        elseif !Troop010.GetActorRef()
            return Troop010
        elseif !Troop011.GetActorRef()
            return Troop011
        elseif !Troop012.GetActorRef()
            return Troop012
        elseif !Troop013.GetActorRef()
            return Troop013
        elseif !Troop014.GetActorRef()
            return Troop014
        elseif !Troop015.GetActorRef()
            return Troop015
        elseif !Troop016.GetActorRef()
            return Troop016
        elseif !Troop017.GetActorRef()
            return Troop017
        elseif !Troop018.GetActorRef()
            return Troop018
        elseif !Troop019.GetActorRef()
            return Troop019
        elseif !Troop020.GetActorRef()
            return Troop020
        endif
    endif
EndFunction

Function ResetAllTroops()
    Actor[] AllTroops = GetAllTroops()

    int i = 0
    while i < AllTroops.Length
        if AllTroops[i]
            if AllTroops[i].Is3DLoaded() && !AllTroops[i].IsDisabled()
                AllTroops[i].Reset()
            endif
        endif
        i += 1
    endwhile
EndFunction

ReferenceAlias[] Function GetAllAliases()
    ReferenceAlias[] AllAliases = new ReferenceAlias[20]

    int armynum = CS_ArmyQuests.Find(self as Form)
    if armynum < 12
        AllAliases[0] = Troop1
        AllAliases[1] = Troop2
        AllAliases[2] = Troop3
        AllAliases[3] = Troop4
        AllAliases[4] = Troop5
        AllAliases[5] = Troop6
        AllAliases[6] = Troop7
        AllAliases[7] = Troop8
        AllAliases[8] = Troop9
        AllAliases[9] = Troop10
        AllAliases[10] = Troop11
        AllAliases[11] = Troop12
        AllAliases[12] = Troop13
        AllAliases[13] = Troop14
        AllAliases[14] = Troop15
        AllAliases[15] = Troop16
        AllAliases[16] = Troop17
        AllAliases[17] = Troop18
        AllAliases[18] = Troop19
        AllAliases[19] = Troop20
    else
        AllAliases[0] = Troop001
        AllAliases[1] = Troop002
        AllAliases[2] = Troop003
        AllAliases[3] = Troop004
        AllAliases[4] = Troop005
        AllAliases[5] = Troop006
        AllAliases[6] = Troop007
        AllAliases[7] = Troop008
        AllAliases[8] = Troop009
        AllAliases[9] = Troop010
        AllAliases[10] = Troop011
        AllAliases[11] = Troop012
        AllAliases[12] = Troop013
        AllAliases[13] = Troop014
        AllAliases[14] = Troop015
        AllAliases[15] = Troop016
        AllAliases[16] = Troop017
        AllAliases[17] = Troop018
        AllAliases[18] = Troop019
        AllAliases[19] = Troop020
    endif

    return AllAliases
EndFunction

Actor[] Function GetAllTroops()
    Actor[] AllTroops = new Actor[20]

    int armynum = CS_ArmyQuests.Find(self as Form)
    if armynum < 12
        AllTroops[0] = Troop1.GetActorRef()
        AllTroops[1] = Troop2.GetActorRef()
        AllTroops[2] = Troop3.GetActorRef()
        AllTroops[3] = Troop4.GetActorRef()
        AllTroops[4] = Troop5.GetActorRef()
        AllTroops[5] = Troop6.GetActorRef()
        AllTroops[6] = Troop7.GetActorRef()
        AllTroops[7] = Troop8.GetActorRef()
        AllTroops[8] = Troop9.GetActorRef()
        AllTroops[9] = Troop10.GetActorRef()
        AllTroops[10] = Troop11.GetActorRef()
        AllTroops[11] = Troop12.GetActorRef()
        AllTroops[12] = Troop13.GetActorRef()
        AllTroops[13] = Troop14.GetActorRef()
        AllTroops[14] = Troop15.GetActorRef()
        AllTroops[15] = Troop16.GetActorRef()
        AllTroops[16] = Troop17.GetActorRef()
        AllTroops[17] = Troop18.GetActorRef()
        AllTroops[18] = Troop19.GetActorRef()
        AllTroops[19] = Troop20.GetActorRef()
    else
        AllTroops[0] = Troop001.GetActorRef()
        AllTroops[1] = Troop002.GetActorRef()
        AllTroops[2] = Troop003.GetActorRef()
        AllTroops[3] = Troop004.GetActorRef()
        AllTroops[4] = Troop005.GetActorRef()
        AllTroops[5] = Troop006.GetActorRef()
        AllTroops[6] = Troop007.GetActorRef()
        AllTroops[7] = Troop008.GetActorRef()
        AllTroops[8] = Troop009.GetActorRef()
        AllTroops[9] = Troop010.GetActorRef()
        AllTroops[10] = Troop011.GetActorRef()
        AllTroops[11] = Troop012.GetActorRef()
        AllTroops[12] = Troop013.GetActorRef()
        AllTroops[13] = Troop014.GetActorRef()
        AllTroops[14] = Troop015.GetActorRef()
        AllTroops[15] = Troop016.GetActorRef()
        AllTroops[16] = Troop017.GetActorRef()
        AllTroops[17] = Troop018.GetActorRef()
        AllTroops[18] = Troop019.GetActorRef()
        AllTroops[19] = Troop020.GetActorRef()
    endif

    return AllTroops
EndFunction

Function SpawnNewUnSpawnedTroops(Actor Commander)

    debug.trace("Army " + CS_ArmyQuests.Find(self as Form) + " Spawn Unspawned started")

    CountUnspawnedTotal = CountUnspawnedSoldier + CountUnspawnedWarrior + CountUnspawnedArcher + CountUnspawnedCrossbow + CountUnspawnedMageDestructionFire + CountUnspawnedMageDestructionFrost + CountUnspawnedMageDestructionShock + CountUnspawnedMageRestoration + CountUnspawnedMageConjuration + CountUnspawnedMageAlteration + CountUnspawnedDwarvenSpider + CountUnspawnedDwarvenSphere + CountUnspawnedDwarvenBallista + CountUnspawnedDwarvenCenturion + CountUnspawnedCreatureSkeever + CountUnspawnedCreatureWolf + CountUnspawnedCreatureSabreCat + CountUnspawnedCreatureFrostbiteSpider + CountUnspawnedCreatureBear + CountUnspawnedCreatureTroll + CountUnspawnedCreatureGiant + CountUnspawnedCreatureMammoth   

    if CountUnspawnedTotal > 0

        bool spawnedtroop
        int armynum = CS_ArmyQuests.Find(self as Form)
        while CountUnspawnedSoldier > 0
            debug.trace(CountUnspawnedSoldier + " Unspawned Soldiers")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 0)
                spawnedtroop = true
                CountUnspawnedSoldier -= 1
            endif
        endwhile

        while CountUnspawnedWarrior > 0
            debug.trace(CountUnspawnedWarrior + " Unspawned Warriors")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 1)
                spawnedtroop = true
                CountUnspawnedWarrior -= 1
            endif
        endwhile

        while CountUnspawnedArcher > 0
            debug.trace(CountUnspawnedArcher + " Unspawned Archers")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 2)
                spawnedtroop = true
                CountUnspawnedArcher -= 1
            endif
        endwhile

        while CountUnspawnedCrossbow > 0
            debug.trace(CountUnspawnedCrossbow + " Unspawned Crossbows")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 3)
                spawnedtroop = true
                CountUnspawnedCrossbow -= 1
            endif
        endwhile

        while CountUnspawnedMageDestructionFire > 0
            debug.trace(CountUnspawnedMageDestructionFire + " Unspawned MageDestructionFire")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 5, destructionmage=1)
                spawnedtroop = true
                CountUnspawnedMageDestructionFire -= 1
            endif
        endwhile

        while CountUnspawnedMageDestructionFrost > 0
            debug.trace(CountUnspawnedMageDestructionFrost + " Unspawned MageDestructionFrost")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 5, destructionmage=2)
                spawnedtroop = true
                CountUnspawnedMageDestructionFrost -= 1
            endif
        endwhile

        while CountUnspawnedMageDestructionShock > 0
            debug.trace(CountUnspawnedMageDestructionShock + " Unspawned MageDestructionShock")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 5, destructionmage=3)
                spawnedtroop = true
                CountUnspawnedMageDestructionShock -= 1
            endif
        endwhile

        while CountUnspawnedMageRestoration > 0
            debug.trace(CountUnspawnedMageRestoration + " Unspawned MageRestorations")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 6)
                spawnedtroop = true
                CountUnspawnedMageRestoration -= 1
            endif
        endwhile

        while CountUnspawnedMageConjuration > 0
            debug.trace(CountUnspawnedMageConjuration + " Unspawned MageConjurations")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 7)
                spawnedtroop = true
                CountUnspawnedMageConjuration -= 1
            endif
        endwhile

        while CountUnspawnedMageAlteration > 0
            debug.trace(CountUnspawnedMageAlteration + " Unspawned MageAlterations")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 8)
                spawnedtroop = true
                CountUnspawnedMageAlteration -= 1
            endif
        endwhile

        while CountUnspawnedDwarvenSpider > 0
            debug.trace(CountUnspawnedDwarvenSpider + " Unspawned DwarvenSpider")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 9)
                spawnedtroop = true
                CountUnspawnedDwarvenSpider -= 1
            endif
        endwhile

        while CountUnspawnedDwarvenSphere > 0
            debug.trace(CountUnspawnedDwarvenSphere + " Unspawned DwarvenSphere")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 10)
                spawnedtroop = true
                CountUnspawnedDwarvenSphere -= 1
            endif
        endwhile

        while CountUnspawnedDwarvenBallista > 0
            debug.trace(CountUnspawnedDwarvenBallista + " Unspawned DwarvenBallista")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 11)
                spawnedtroop = true
                CountUnspawnedDwarvenBallista -= 1
            endif
        endwhile

        while CountUnspawnedDwarvenCenturion > 0
            debug.trace(CountUnspawnedDwarvenCenturion + " Unspawned DwarvenCenturion")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 12)
                spawnedtroop = true
                CountUnspawnedDwarvenCenturion -= 1
            endif
        endwhile

        while CountUnspawnedCreatureSkeever > 0
            debug.trace(CountUnspawnedCreatureSkeever + " Unspawned CreatureSkeevers")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 13)
                spawnedtroop = true
                CountUnspawnedCreatureSkeever -= 1
            endif
        endwhile

        while CountUnspawnedCreatureWolf > 0
            debug.trace(CountUnspawnedCreatureWolf + " Unspawned CreatureWolfs")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 14)
                spawnedtroop = true
                CountUnspawnedCreatureWolf -= 1
            endif
        endwhile

        while CountUnspawnedCreatureSabreCat > 0
            debug.trace(CountUnspawnedCreatureSabreCat + " Unspawned CreatureSabreCats")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 15)
                spawnedtroop = true
                CountUnspawnedCreatureSabreCat -= 1
            endif
        endwhile

        while CountUnspawnedCreatureFrostbiteSpider > 0
            debug.trace(CountUnspawnedCreatureFrostbiteSpider + " Unspawned CreatureFrostbiteSpiders")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 16)
                spawnedtroop = true
                CountUnspawnedCreatureFrostbiteSpider -= 1
            endif
        endwhile

        while CountUnspawnedCreatureBear > 0
            debug.trace(CountUnspawnedCreatureBear + " Unspawned CreatureBear")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 17)
                spawnedtroop = true
                CountUnspawnedCreatureBear -= 1
            endif
        endwhile

        while CountUnspawnedCreatureTroll > 0
            debug.trace(CountUnspawnedCreatureTroll + " Unspawned CreatureTroll")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 18)
                spawnedtroop = true
                CountUnspawnedCreatureTroll -= 1
            endif
        endwhile

        while CountUnspawnedCreatureGiant > 0
            debug.trace(CountUnspawnedCreatureGiant + " Unspawned CreatureGiant")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 19)
                spawnedtroop = true
                CountUnspawnedCreatureGiant -= 1
            endif
        endwhile

        while CountUnspawnedCreatureMammoth > 0
            debug.trace(CountUnspawnedCreatureMammoth + " Unspawned CreatureMammoth")
            if !(CS_TroopRecruiter as CS_TroopRecruiterScript).BeingUsed
                (CS_TroopRecruiter as CS_TroopRecruiterScript).SpawnTroop(armynum, 20)
                spawnedtroop = true
                CountUnspawnedCreatureMammoth -= 1
            endif
        endwhile

        CountUnspawnedTotal = 0

    endif

    debug.trace("Army " + CS_ArmyQuests.Find(self as Form) + " Spawn Unspawned finished")

    ;if !Commander.IsInFaction(ManageArmy.ArmyAttackFaction)
    ;   SetStage(30)
    ;   SetStage(40)
    ;endif
EndFunction

Function StartAutoRecruit()
    AutoRespawn = true

    if TemplateNum == -1
        CountSoldierAuto = CountSoldier
        CountWarriorAuto = CountWarrior
        CountArcherAuto = CountArcher
        CountCrossbowAuto = CountCrossbow
        CountMageDestructionFireAuto = CountMageDestructionFire
        CountMageDestructionFrostAuto = CountMageDestructionFrost
        CountMageDestructionShockAuto = CountMageDestructionShock
        CountMageRestorationAuto = CountMageRestoration
        CountMageConjurationAuto = CountMageConjuration
        CountMageAlterationAuto = CountMageAlteration
        CountDwarvenSpiderAuto = CountDwarvenSpider
        CountDwarvenSphereAuto = CountDwarvenSphere
        CountDwarvenBallistaAuto = CountDwarvenBallista
        CountDwarvenCenturionAuto = CountDwarvenCenturion
        CountCreatureSkeeverAuto = CountCreatureSkeever
        CountCreatureWolfAuto = CountCreatureWolf
        CountCreatureSabreCatAuto = CountCreatureSabreCat
        CountCreatureFrostbiteSpiderAuto = CountCreatureFrostbiteSpider
        CountCreatureBearAuto = CountCreatureBear
        CountCreatureTrollAuto = CountCreatureTroll
        CountCreatureGiantAuto = CountCreatureGiant
        CountCreatureMammothAuto = CountCreatureMammoth
    endif
EndFunction

Function KillFlaggedTroops()
    ReferenceAlias[] AllTroopAliases = GetAllAliases()

    int i = 0
    while i < AllTroopAliases.Length
        Actor Troop = AllTroopAliases[i].GetActorRef()
        if Troop && (Troop as CS_UpgradeTroopOnAttach).FlaggedForDeath
           debug.trace("Killing flagged troop " + Troop)
           AdjustTroopCount(AllTroopAliases[i])
       endif
       i += 1
    endwhile 
EndFunction

Function StopAutoRecruit()
    AutoRespawn = false
EndFunction

Function RemoveFromSpecificGarrison(Actor Troop, FormList Garrison)
    Garrison.RemoveAddedForm(Troop)
EndFunction

Event OnUpdate()
    SpawnNewUnspawnedTroops(SpawnCommander)
EndEvent

FormList Property CS_TroopCountPlayerArmy  Auto  

Quest Property CS_HealersFindTarget  Auto  
Quest Property CS_BuffersFindTarget Auto

SPELL Property HealingHands  Auto  

SPELL Property HealOther  Auto  

Spell Property Oakflesh Auto
Spell Property Stoneflesh Auto
Spell Property Ironflesh Auto
Spell Property Ebonyflesh Auto

MiscObject Property Gold001  Auto  
