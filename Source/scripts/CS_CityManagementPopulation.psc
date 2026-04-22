Scriptname CS_CityManagementPopulation extends ObjectReference  

import CS_CommonFunctions

Location Property Palace Auto

ObjectReference[] Property BuildingsHouses Auto hidden

;Events
MiscObject Property CS_CityEventPlan Auto

ObjectReference[] Property AllUpcomingEvents Auto hidden
ObjectReference[] Property EventsToday Auto hidden
ObjectReference[] Property EventsTomorrow Auto hidden
ObjectReference[] Property Events2Days Auto hidden
ObjectReference[] Property Events3Days Auto hidden
ObjectReference[] Property Events4Days Auto hidden
ObjectReference[] Property Events5Days Auto hidden
ObjectReference[] Property Events6Days Auto hidden
ObjectReference[] Property Events7Days Auto hidden

ObjectReference Property WorkerPriorityBuilding Auto

FormList Property CS_CityEventQuests Auto
FormList Property CS_CityEventKeywords Auto
FormList Property CS_CityEventDetailsMessages Auto

GlobalVariable Property GameDaysPassed Auto

ActorBase[] Property Nobles Auto

Actor[] Property Settlers Auto
Actor[] Property UnemployedSettlers Auto
Actor[] Property GuardActors Auto

ObjectReference[] Property GuardPatrolPoints Auto

ObjectReference[] Property TroopRegiments Auto

Faction Property CS_SettlementGuardFaction Auto

FormList Property CS_CraftingResourcesOutputsEquipmentTroop Auto

MiscObject Property CS_ResourceFoodRaw Auto

int Property PopulationCommoners Auto hidden
int Property CommonerIncreaseRate Auto hidden
int Property TotalPopulation Auto hidden
int Property MaxPopulation Auto hidden
int Property TotalWorkers Auto hidden
int Property MaxWorkers Auto hidden
int Property Guards Auto hidden
int Property MaxGuards Auto hidden
int Property Unemployed Auto hidden
int Property Unassigned Auto hidden
int Property FoodDeficit Auto hidden
int Property Happiness Auto hidden

int Property InfluenceCommoner Auto hidden
int Property InfluenceNobility Auto hidden
int Property InfluenceGuard Auto hidden
int Property InfluenceJarl Auto hidden

int Property JarlInfluenceCommoner Auto hidden
int Property JarlInfluenceNobility Auto hidden
int Property JarlInfluenceGuard Auto hidden

int[] Property IssueStancesCommoner Auto ;0: Economy, 1: Magic Regulation, 2: Imperial Influence, 3: Non-Human Rights, 4: Environment, 5: Education, 6: Religion, 7: Military, 8: Crime, 9: Diplomacy
int[] Property IssueStancesNobility Auto ;0: Economy, 1: Magic Regulation, 2: Imperial Influence, 3: Non-Human Rights, 4: Environment, 5: Education, 6: Religion, 7: Military, 8: Crime, 9: Diplomacy

Keyword Property CS_StoryBeds Auto

Quest Property CS_CityManagementFindBeds Auto
Quest Property CS_TutorialQuests00FirstSteps Auto

Faction Property CS_MarriedToPlayerFaction Auto

ObjectReference Property CS_FactionPlayer Auto

bool Property ShowingPatrolPoints Auto hidden
bool Property UnitActivated Auto hidden

ActorBase Property CS_Settler Auto
ActorBase Property CS_StorageEquipmentGuards Auto

ObjectReference Property GuardEquipment Auto hidden

Function SetUp()
    TotalPopulation = PopulationCommoners + Nobles.Length
    ;/
    if MaxPopulation == 0
        SetInitialPopulation()
    endif/;
    
    GuardEquipment = PlaceAtMe(CS_StorageEquipmentGuards)
    (GuardEquipment as CS_StorageEquipmentGuardsScript).City = self as ObjectReference
    
    ;SetUpInfluence()
EndFunction

; Influence -----------------------------------------------------

Function SetUpInfluence()
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    Actor Leader = (FactionOwnerActivator as CS_FactionManagementOwnership).Leader
    Quest ThaneQuest = (FactionOwnerActivator as CS_FactionManagementEconomy).ThaneQuest
    Actor PlayerRef = Game.GetPlayer()
    
    if Leader == PlayerRef
        
        InfluenceCommoner = 50
        InfluenceNobility = 50
        InfluenceGuard = 50
        
        JarlInfluenceCommoner = InfluenceCommoner
        JarlInfluenceNobility = InfluenceNobility
        JarlInfluenceGuard = InfluenceGuard
        
    else
        
        JarlInfluenceCommoner = 50
        JarlInfluenceNobility = 50
        JarlInfluenceGuard = 50
    
        if Leader.IsInFaction(CS_MarriedToPlayerFaction)
            InfluenceCommoner = 10
            InfluenceGuard = 20
            InfluenceNobility = 40
        endif
        
        if ThaneQuest && ThaneQuest.GetStageDone(200)
            InfluenceNobility += 20
            InfluenceGuard += 30
            InfluenceCommoner += 10
        endif
        
    endif
    
    (FactionOwnerActivator as CS_FactionManagementEconomy).UpdateInfluences()
EndFunction

Function AdjustInfluence(string InfluencingGroup, string InfluencedGroup, int amount)
    if InfluencingGroup == "Player"
        if InfluencedGroup == "Commoner"
            InfluenceCommoner += amount
            if InfluenceCommoner > 100
                InfluenceCommoner = 100
            elseif InfluenceCommoner < -100
                InfluenceCommoner = -100
            endif
        elseif InfluencedGroup == "Nobility"
            InfluenceNobility += amount
            if InfluenceNobility > 100
                InfluenceNobility = 100
            elseif InfluenceNobility < -100
                InfluenceNobility = -100
            endif
        elseif InfluencedGroup == "Guard"
            InfluenceGuard += amount
            if InfluenceGuard > 100
                InfluenceGuard = 100
            elseif InfluenceGuard < -100
                InfluenceGuard = -100
            endif
        elseif InfluencedGroup == "Jarl"
            InfluenceJarl += amount
            if InfluenceJarl > 100
                InfluenceJarl = 100
            elseif InfluenceJarl < -100
                InfluenceJarl = -100
            endif
        endif
    elseif InfluencingGroup == "Jarl"
        if InfluencedGroup == "Commoner"
            JarlInfluenceCommoner += amount
            if JarlInfluenceCommoner > 100
                JarlInfluenceCommoner = 100
            elseif JarlInfluenceCommoner < -100
                JarlInfluenceCommoner = -100
            endif
        elseif InfluencedGroup == "Nobility"
            InfluenceNobility += amount
            if JarlInfluenceNobility > 100
                JarlInfluenceNobility = 100
            elseif JarlInfluenceNobility < -100
                JarlInfluenceNobility = -100
            endif
        elseif InfluencedGroup == "Guard"
            JarlInfluenceGuard += amount
            if JarlInfluenceGuard > 100
                JarlInfluenceGuard = 100
            elseif JarlInfluenceGuard < -100
                JarlInfluenceGuard = -100
            endif
        endif
    endif
    
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    (FactionOwnerActivator as CS_FactionManagementEconomy).UpdateInfluences()
EndFunction
        
Function SetInitialPopulation()
    CS_CityManagementFindBeds.Stop()
    CS_StoryBeds.SendStoryEventAndWait(akLoc = ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity, akRef1 = self as ObjectReference)
EndFunction

Function AddBuilding(ObjectReference Building, string BuildingType)
    debug.trace("Adding " + Building.GetBaseObject().GetName() + " to array")
    
    if BuildingType == "House"
        BuildingsHouses = AddToArray(Building, BuildingsHouses)
    endif
    
    (Building as CS_BuildingHouseScript).SetUp()
    debug.trace(Building.GetBaseObject().GetName() + " added to array")
EndFunction

Function RemoveBuilding(ObjectReference Building, string BuildingType)
    debug.trace("Removing " + Building.GetBaseObject().GetName() + " from array")
    if BuildingType == "House"
        BuildingsHouses = RemoveFromArray(Building, BuildingsHouses)
    endif
    debug.trace(Building.GetBaseObject().GetName() + " removed from array")
EndFunction

; Settler Scores ------------------------------------

float Function CalculateDefenseScore()
CS_StorageEquipmentGuardsScript StorageEquipmentScript = GuardEquipment as CS_StorageEquipmentGuardsScript
    
    int IdealGuardAmount = math.floor(TotalPopulation as float/2) as int
    float GuardAmountScore
    if IdealGuardAmount > 0
        GuardAmountScore = (Guards as float/IdealGuardAmount)
    endif
    float GuardEquipmentScore = (StorageEquipmentScript.TroopEquipmentModifier/2)
    
    float DefenseScore = (GuardAmountScore + GuardEquipmentScore/2)
    
    if DefenseScore > 1
        DefenseScore = 1
    endif
    
    return DefenseScore
EndFunction

float Function CalculateEconomyScore()
    CS_CityManagementEconomy EconomyScript = (self as ObjectReference) as CS_CityManagementEconomy
    float Unemployment = 1 - (Unemployed as float/TotalPopulation)
    float WagePerCapitaScore
    if TotalWorkers > 0
        WagePerCapitaScore = (EconomyScript.TotalWages as float/TotalWorkers as float)/200
    endif
    float WagesPaid = (EconomyScript.StorageWage as CS_StorageWageScript).WagesPaid
    
    float EconomyScore = (Unemployment + WagesPaid + WagePerCapitaScore)/3
    
    return EconomyScore
EndFunction

float Function CalculateFoodScore()
    CS_CityManagementEconomy EconomyScript = (self as ObjectReference) as CS_CityManagementEconomy
    CS_StorageFoodReserves StorageFoodScript = EconomyScript.StorageFoodReserves as CS_StorageFoodReserves
    int FedPopulation = TotalPopulation - StorageFoodScript.FoodDeficiency
    float FoodPercentage
    if TotalPopulation > 0
        FoodPercentage = (FedPopulation as float/TotalPopulation)
    endif
    ;Add cooked food vs raw food later
    
    if FoodPercentage > 1
        FoodPercentage = 1
    endif
    
    return FoodPercentage
EndFunction

float Function CalculateTaxScore()
    CS_CityManagementEconomy EconomyScript = (self as ObjectReference) as CS_CityManagementEconomy
    float IncomeTaxScore = 1 - (EconomyScript.IncomeTaxRate/0.5)
    float HousingTaxScore = 1 - (0.01*EconomyScript.HousingTax/0.5)

    float TaxScore = (IncomeTaxScore + HousingTaxScore)/2
    
    return TaxScore
EndFunction
    
Function UpdateHappiness()
    if TotalPopulation > 0
        float DefenseScore = CalculateDefenseScore()
        float EconomyScore = CalculateEconomyScore()
        float FoodScore = CalculateFoodScore()
        float TaxScore = CalculateTaxScore()
        
        Happiness = math.floor(100*(DefenseScore + EconomyScore + 3*FoodScore + TaxScore)/6) as int
    else
        Happiness = 0
    endif
EndFunction

Function UpdateAbandonmentScores()
    int MaxAbandonmentScore
    int HappinessRating = Happiness
    if HappinessRating < 10
        HappinessRating = 10
    endif
    MaxAbandonmentScore = 2*math.ceiling(0.1*(50.0 - HappinessRating)) as int
    
    int i = 0
    while i < Settlers.Length
        if Settlers[i]
            ((Settlers[i] as ObjectReference) as CS_SettlementSettlerScript).SetAbandonmentScore(MaxAbandonmentScore)
        endif
        i += 1
    endwhile
EndFunction

; Settler Actors --------------------------------------------------

Function SpawnSettler()
    ObjectReference SpawnPoint = ((self as ObjectReference) as CS_CityManagementOwnership).HQExteriorMarker
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    
    Actor NewSettler = SpawnPoint.PlaceAtMe(CS_Settler) as Actor
    int NewSettlerIndex = Settlers.Find(None)
    Settlers[NewSettlerIndex] = NewSettler
    UnemployedSettlers = AddToActorArray(NewSettler, UnemployedSettlers)
    ((NewSettler as ObjectReference) as CS_SettlementSettlerScript).SetSettlement(self as ObjectReference)
EndFunction

Function RemoveSettler(Actor OldSettler)
    PopulationCommoners -= 1
    TotalPopulation = PopulationCommoners + Nobles.Length
    
    int SettlerIndex = Settlers.Find(OldSettler)
    if SettlerIndex >= 0
        Settlers[SettlerIndex] = None
    endif
    
    if UnemployedSettlers.Find(OldSettler) >= 0
        UnemployedSettlers = RemoveFromActorArray(OldSettler, UnemployedSettlers)
        Unemployed -= 1
    endif
EndFunction

Actor Function GetUnemployedSettlerForJob()
    if UnemployedSettlers.Length >= 1
        Actor NewWorker = UnemployedSettlers[0]
        UnemployedSettlers = RemoveFromActorArray(NewWorker, UnemployedSettlers)
        return NewWorker
    else
        Return None
    endif
EndFunction

Function UnemploySettler(Actor Settler)
    UnemployedSettlers = AddToActorArray(Settler, UnemployedSettlers)
    Unemployed += 1
EndFunction

; Guards ------------------------------------------------------------------

Function HireGuard()
    Actor NewGuard = GetUnemployedSettlerForJob()
    if NewGuard
        ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    
        NewGuard.AddToFaction(CS_SettlementGuardFaction)
        ((NewGuard as ObjectReference) as CS_SettlementSettlerScript).GoToState("Guard")
        GuardActors = AddToActorArray(NewGuard, GuardActors)
        NewGuard.EvaluatePackage()
        EquipGuard(NewGuard)
    endif
    Guards += 1
    Unemployed -= 1
EndFunction

Function FireGuard(Actor OldGuard=None, bool killed=false)
    if !OldGuard
        OldGuard = GuardActors[0]
    endif
    
    if OldGuard
        ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    
        GuardActors = RemoveFromActorArray(OldGuard, GuardActors)
        if !killed
            int NewSettlerIndex = Settlers.Find(None)
            Settlers[NewSettlerIndex] = OldGuard
            OldGuard.RemoveFromFaction(CS_SettlementGuardFaction)
            UnemploySettler(OldGuard)
            OldGuard.EvaluatePackage()
            ((OldGuard as ObjectReference) as CS_SettlementSettlerScript).RemoveGuardName()
            OldGuard.RemoveAllItems()
            ((OldGuard as ObjectReference) as CS_SettlementSettlerScript).ResetOutfit()
            ((OldGuard as ObjectReference) as CS_SettlementSettlerScript).GoToState("Settler")
        endif
    endif
    Guards -= 1
EndFunction

Function EquipGuard(Actor Guard)
    ;/
    int i = CS_CraftingResourcesOutputsEquipmentTroop.GetSize() - 1
    while i >= 0
        Form Equipment = CS_CraftingResourcesOutputsEquipmentTroop.GetAt(i)
        if StorageEquipment.GetItemCount(Equipment) >= 1
            StorageEquipment.RemoveItem(Equipment, 1, true, Guard)
            return
        endif
        i -= 1
    endwhile/;
    
    (Guard as CS_ResourceEquipmentReceiver).GuardPopulation = self
    (Guard as CS_ResourceEquipmentReceiver).GuardEquipmentScript = (GuardEquipment as CS_StorageEquipmentGuardsScript)
    ;(Guard as CS_ResourceEquipmentReceiver).EquipmentTier = 0
    (Guard as CS_ResourceEquipmentReceiver).GoToState("EquipTroop")
    (Guard as CS_ResourceEquipmentReceiver).RegisterForSingleUpdate(0.1)
EndFunction

Function UnequipGuard(Actor Guard)
    ;/ObjectReference StorageEquipment = ((self as ObjectReference) as CS_CityManagementEconomy).StorageEquipment
    
    CS_CraftingResourcesOutputsEquipmentTroop.GetSize()
    Guard.RemoveItem(CS_CraftingResourcesOutputsEquipmentTroop, 1, true, StorageEquipment)
    Guard.RemoveAllItems()/;
EndFunction

Function EvaluateAllGuardPackages()
    int i = 0
    while i < GuardActors.Length
        GuardActors[i].EvaluatePackage()
        i += 1
    endwhile
EndFunction

Function AddGuardPatrolPoint(ObjectReference NewPatrolPoint)
    GuardPatrolPoints = AddToArray(NewPatrolPoint, GuardPatrolPoints)
    if ShowingPatrolPoints
        NewPatrolPoint.EnableNoWait()
    else
        NewPatrolPoint.DisableNoWait()
    endif
EndFunction

Function RemoveGuardPatrolPoint(ObjectReference OldPatrolPoint)
    GuardPatrolPoints = RemoveFromArray(OldPatrolPoint, GuardPatrolPoints)
    OldPatrolPoint.delete()
EndFunction

Function ShowAllPatrolPoints()
    int i = 0
    while i < GuardPatrolPoints.Length
        GuardPatrolPoints[i].EnableNoWait()
        i += 1
    endwhile
    ShowingPatrolPoints = true
EndFunction

Function HideAllPatrolPoints()
    int i = 0
    while i < GuardPatrolPoints.Length
        GuardPatrolPoints[i].DisableNoWait()
        i += 1
    endwhile
    ShowingPatrolPoints = false
EndFunction

; Military Unit -----------------------------------------------

Function AddUnit(ObjectReference NewUnit)
    TroopRegiments = AddToArray(NewUnit, TroopRegiments)
EndFunction

Function ActivateUnit()
    (TroopRegiments[0] as CS_ArmyRegimentTroops).ActivateUnit()
    UnitActivated = true
    ;/
    int i = 0
    while i < Settlers.Length
        if Settlers[i]
            ((Settlers[i] as ObjectReference) as CS_SettlementSettlerScript).GoToState("Troop")
            (Settlers[i] as CS_ResourceEquipmentReceiver).GuardPopulation = self
            (Settlers[i] as CS_ResourceEquipmentReceiver).GuardEquipmentScript = (GuardEquipment as CS_StorageEquipmentGuardsScript)
            ((Settlers[i] as ObjectReference) as CS_SettlementSettlerScript).RegisterForSingleUpdate(0.1)
        endif
        i += 1
    endwhile/;
EndFunction

; Population --------------------------------------------------

Function UpdateCommonerPopulation()
    ObjectReference FactionOwner = GetCityOwnership(self as ObjectReference).FactionOwnerActivator
    CommonerIncreaseRate = GetFactionEconomy(FactionOwner).CommonerIncreaseRate
    
    if TotalPopulation < MaxPopulation
        int NewCommoners = 10;CommonerIncreaseRate DELETE 10 WHEN DONE!!!!!!!!!!!!!!!!!!!!!
        if GetCityEconomy(self as ObjectReference).IsSettlement
            if NewCommoners + TotalPopulation > MaxPopulation
                NewCommoners = MaxPopulation - TotalPopulation
            endif
            Unemployed += NewCommoners
            
            int i = 0
            while i < NewCommoners
                SpawnSettler()
                i += 1
            endwhile
        endif
        
        PopulationCommoners += NewCommoners
        TotalPopulation = PopulationCommoners + Nobles.Length
        
        ; START WORKING ON THIS TOMORROW!!!!!
        
        ;PushCommonersIntoPositions(NewCommoners)
        
    endif
    UpdateCommonerIncreaseRate()
EndFunction

Function UpdateCommonerIncreaseRate()
    ObjectReference FactionOwnerActivator = ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator
    CommonerIncreaseRate = (FactionOwnerActivator as CS_FactionManagementEconomy).CommonerIncreaseRate
    
    if CommonerIncreaseRate < 1
        CommonerIncreaseRate = 1
    endif
    
    if CommonerIncreaseRate > (MaxPopulation - TotalPopulation)
        CommonerIncreaseRate = (MaxPopulation - TotalPopulation)
    endif
EndFunction

; City Events ------------------------------------------------------

float Function SetEventDateTime(ObjectReference NewEvent, string Date, string Time)
    CS_CityEventPlanScript PlanScript = NewEvent as CS_CityEventPlanScript
    
    float DateTime
    if Date == "Tomorrow"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 1
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            EventsTomorrow[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            EventsTomorrow[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            EventsTomorrow[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 1
        return DateTime
    elseif Date == "2Days"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 2
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            Events2Days[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            Events2Days[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            Events2Days[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 2
        return DateTime
    elseif Date == "3Days"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 3
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            Events3Days[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            Events3Days[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            Events3Days[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 3
        return DateTime
    elseif Date == "4Days"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 4
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            Events4Days[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            Events4Days[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            Events4Days[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 4
        return DateTime
    elseif Date == "5Days"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 5
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            Events5Days[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            Events5Days[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            Events5Days[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 5
        return DateTime
    elseif Date == "6Days"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 6
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            Events6Days[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            Events6Days[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            Events6Days[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 6
        return DateTime
    elseif Date == "7Days"
        DateTime = math.floor(GameDaysPassed.GetValue()) + 7
        if Time == "Morning"
            PlanScript.EndDateTime = DateTime + 0.5
            DateTime += 0.25
            Events7Days[0] = NewEvent
        elseif Time == "Afternoon"
            PlanScript.EndDateTime = DateTime + 0.709
            DateTime += 0.5
            Events7Days[1] = NewEvent
        elseif Time == "Evening"
            PlanScript.EndDateTime = DateTime + 1
            DateTime += 0.709
            Events7Days[2] = NewEvent
        endif
        PlanScript.DaysRemaining = 7
        return DateTime
    endif
EndFunction

Function AddCityEvent(Actor[] Organizers, int eventtype, string Date, string Time, Location EventLocation, int EventValue1 = 0, int EventValue2 = 0, int EventValue3 = 0, int EventValue4 = 0)
    ObjectReference NewEvent = (self as ObjectReference).PlaceAtMe(CS_CityEventPlan, abForcePersist = true)
    CS_CityEventPlanScript PlanScript = NewEvent as CS_CityEventPlanScript
    PlanScript.Organizers = Organizers
    PlanScript.EventType = eventtype
    PlanScript.EventLocation = EventLocation
    PlanScript.EventKeyword = CS_CityEventKeywords.GetAt(eventtype) as Keyword
    PlanScript.EventQuest = CS_CityEventQuests.GetAt(eventtype) as Quest
    PlanScript.EventDetailsMessage = CS_CityEventDetailsMessages.GetAt(eventtype) as Message
    PlanScript.EventValue1 = EventValue1
    PlanScript.EventValue2 = EventValue2
    PlanScript.EventValue3 = EventValue3
    PlanScript.EventValue4 = EventValue4
    PlanScript.Time = Time
    
    PlanScript.DateTime = SetEventDateTime(NewEvent, Date, Time)
    AllUpcomingEvents = AddToArray(NewEvent, AllUpcomingEvents)
EndFunction

Function RemoveCityEvent(ObjectReference EventToDelete)
    RemoveFromDayEvents(EventToDelete)
    AllUpcomingEvents = RemoveFromArray(EventToDelete, AllUpcomingEvents)
    EventToDelete.delete()
EndFunction

Function RemoveFromDayEvents(ObjectReference EventToRemove)
    CS_CityEventPlanScript PlanScript = EventToRemove as CS_CityEventPlanScript
    int DaysRemaining = PlanScript.DaysRemaining
    
    if DaysRemaining == 0
        int dayeventsnum = EventsToday.Find(EventToRemove)
        EventsToday[dayeventsnum] = None
    elseif DaysRemaining == 1
        int dayeventsnum = EventsTomorrow.Find(EventToRemove)
        EventsTomorrow[dayeventsnum] = None
    elseif DaysRemaining == 2
        int dayeventsnum = Events2Days.Find(EventToRemove)
        Events2Days[dayeventsnum] = None
    elseif DaysRemaining == 3
        int dayeventsnum = Events3Days.Find(EventToRemove)
        Events3Days[dayeventsnum] = None
    elseif DaysRemaining == 4
        int dayeventsnum = Events4Days.Find(EventToRemove)
        Events4Days[dayeventsnum] = None
    elseif DaysRemaining == 5
        int dayeventsnum = Events5Days.Find(EventToRemove)
        Events5Days[dayeventsnum] = None
    elseif DaysRemaining == 6
        int dayeventsnum = Events6Days.Find(EventToRemove)
        Events6Days[dayeventsnum] = None
    elseif DaysRemaining == 7
        int dayeventsnum = Events7Days.Find(EventToRemove)
        Events7Days[dayeventsnum] = None
    endif
EndFunction

ObjectReference[] Function SetDayEvents(ObjectReference CityEvent, CS_CityEventPlanScript PlanScript, int DaysRemaining, ObjectReference[] DayEvents)
    if PlanScript.Time == "Morning"
        DayEvents[0] = CityEvent
    elseif PlanScript.Time == "Afternoon"
        DayEvents[1] = CityEvent
    elseif PlanScript.Time == "Evening"
        DayEvents[2] = CityEvent
    endif
    
    PlanScript.DaysRemaining = DaysRemaining
    return DayEvents
EndFunction

Function CheckCityEvents()
    Location City = ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity
    debug.trace(((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName() + " Checking city events...")
    ObjectReference[] InitialAllUpcomingEvents = AllUpcomingEvents
    int i = 0
    while i < InitialAllUpcomingEvents.Length
        CS_CityEventPlanScript PlanScript = InitialAllUpcomingEvents[i] as CS_CityEventPlanScript
        int PlannedDay = math.floor(PlanScript.DateTime)
        int CurrentDay = math.floor(GameDaysPassed.GetValue())
        if GameDaysPassed.GetValue() >= PlanScript.EndDateTime
            RemoveCityEvent(InitialAllUpcomingEvents[i])
        elseif CurrentDay == PlannedDay
            if EventsToday.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                EventsToday = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 0, EventsToday)
            endif
            
            if GameDaysPassed.GetValue() >= PlanScript.EndDateTime
                PlanScript.SimulateEventRewards(self as ObjectReference)
            elseif GameDaysPassed.GetValue() >= PlanScript.DateTime && City.IsLoaded() && PlanScript.GetState() != "EventBegun"
                PlanScript.BeginEvent(self as ObjectReference)
            endif
        elseif CurrentDay + 1 >= PlannedDay
            if EventsTomorrow.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                EventsTomorrow = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 1, EventsTomorrow)
            endif
        elseif CurrentDay + 2 >= PlannedDay
            if Events2Days.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                Events2Days = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 2, Events2Days)
            endif
        elseif CurrentDay + 3 >= PlannedDay
            if Events3Days.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                Events3Days = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 3, Events3Days)
            endif
        elseif CurrentDay + 4 >= PlannedDay
            if Events4Days.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                Events4Days = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 4, Events4Days)
            endif
        elseif CurrentDay + 5 >= PlannedDay
            if Events5Days.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                Events5Days = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 5, Events5Days)
            endif
        elseif CurrentDay + 6 >= PlannedDay
            if Events6Days.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                Events6Days = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 6, Events6Days)
            endif
        elseif CurrentDay + 7 >= PlannedDay
            if Events7Days.Find(InitialAllUpcomingEvents[i]) < 0
                RemoveFromDayEvents(InitialAllUpcomingEvents[i])
                Events7Days = SetDayEvents(InitialAllUpcomingEvents[i], PlanScript, 7, Events7Days)
            endif
        endif
        i += 1
    endwhile
    debug.trace(((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName() + " City events checked!")
EndFunction

; States -------------------------------------------------

State Daily

    Event OnUpdate()
        GoToState("Updating")
        
        CheckCityEvents()
        if ((self as ObjectReference) as CS_CityManagementOwnership).FactionOwnerActivator == CS_FactionPlayer
            UpdateCommonerPopulation()
            UpdateHappiness()
            UpdateAbandonmentScores()
        endif
        
        GoToState("Updated")
    EndEvent
    
EndState

Auto State NotSetUp

    Event OnUpdate()
        debug.trace("Starting city " + ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName() + " population set up...")
        SetUp()
        debug.trace("City " + ((self as ObjectReference) as CS_CityManagementOwnership).VanillaCity.GetName() + " population SET UP!")
        GoToState("SetUp")
    EndEvent
    
EndState