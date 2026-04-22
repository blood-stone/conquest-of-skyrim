Scriptname CS_CityEventPlanningScript extends Quest conditional

ObjectReference Property PlayerFactionManagementActivator Auto
ObjectReference Property CityManagementActivator Auto

MiscObject Property CS_ResourceFoodRaw Auto
MiscObject Property CS_ResourceWoodenPlank Auto
MiscObject Property Gold001 Auto

GlobalVariable Property GameDaysPassed Auto

LocationAlias Property City Auto
LocationAlias Property EventTypeAlias Auto
LocationAlias Property EventGuestTypeAlias Auto

Location Property CS_TextEventGuestTypeCommoners Auto
Location Property CS_TextEventGuestTypeNobility Auto

FormList Property CS_TextEventTypes Auto

int Property EventType Auto

int Property EventStarted Auto conditional

int Property CanAffordMinimal Auto conditional
int Property CanAffordAverage Auto conditional
int Property CanAffordExtravagant Auto conditional
int Property CanAffordBard Auto conditional
int Property CanAffordBand Auto conditional
int Property CanAffordDecorations Auto conditional

int Property SlotOpenTomorrow Auto conditional
int Property SlotOpen2Days Auto conditional
int Property SlotOpen3Days Auto conditional
int Property SlotOpen4Days Auto conditional
int Property SlotOpen5Days Auto conditional
int Property SlotOpen6Days Auto conditional
int Property SlotOpen7Days Auto conditional

int Property SlotOpenMorning Auto conditional
int Property SlotOpenAfternoon Auto conditional
int Property SlotOpenEvening Auto conditional

int FoodCost
int GoldCost
int WoodCost

int PlayerJarl

string Date
string Time

;Festival Properties
Message Property CS_CityEventPlanningFestivalMenuStart Auto
Message Property CS_CityEventPlanningFestivalMenuEntertainment Auto
Message Property CS_CityEventPlanningFestivalMenuDecorations Auto
Message Property CS_CityEventPlanningFestivalMenuSpeech Auto
Message Property CS_CityEventPlanningFestivalMenuDate Auto
Message Property CS_CityEventPlanningFestivalMenuTime Auto

int FoodType
int EntertainmentType
int Property Decorations Auto
int Property Speech Auto

Keyword Property CS_StoryCityEventFestival Auto
Keyword Property CS_StoryFeast Auto

Function MenuStart(int Response = 0)
    return
EndFunction

Function MenuDecorations(int Response = 0)
    return
EndFunction

Function MenuEntertainment(int Response = 0)
    return
EndFunction
    
Function MenuSpeech(int Response = 0)
    return
EndFunction
    
Function MenuDate(int Response = 0)
    return
EndFunction
    
Function MenuTime(ObjectReference[] DateSlots, int Response = 0)
    return
EndFunction

Function SetUpText()
    City.ForceLocationTo((CityManagementActivator as CS_CityManagementOwnership).VanillaCity)
    EventTypeAlias.ForceLocationTo(CS_TextEventTypes.GetAt(EventType) as Location)
    if EventType == 0
        EventGuestTypeAlias.ForceLocationTo(CS_TextEventGuestTypeCommoners)
    elseif EventType == 1
        EventGuestTypeAlias.ForceLocationTo(CS_TextEventGuestTypeNobility)
    endif
    
    ObjectReference FactionOwnerActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
    if (FactionOwnerActivator as CS_FactionManagementOwnership).Leader == Game.GetPlayer()
        PlayerJarl = 1
    else
        PlayerJarl = 0
    endif
EndFunction

int Function GetPlayerResourceAmount(string Resource)
    int ResourceAmount

    if Resource == "Food"
        
        ObjectReference PlayerFoodReserves = (PlayerFactionManagementActivator as CS_ManagementReserves).FoodReserves
        ResourceAmount = PlayerFoodReserves.GetItemCount(CS_ResourceFoodRaw)
        
        if PlayerJarl == 1
            ObjectReference CityFoodReserves = (CityManagementActivator as CS_ManagementReserves).FoodReserves
            ResourceAmount += CityFoodReserves.GetItemCount(CS_ResourceFoodRaw)
        endif
        
        ResourceAmount += Game.GetPlayer().GetItemCount(CS_ResourceFoodRaw)
        
    elseif Resource == "Wood"
        
        ObjectReference PlayerWoodReserves = (PlayerFactionManagementActivator as CS_ManagementReserves).BuildingMaterialReserves
        ResourceAmount = PlayerWoodReserves.GetItemCount(CS_ResourceWoodenPlank)
        
        if PlayerJarl == 1
            ObjectReference CityWoodReserves = (CityManagementActivator as CS_ManagementReserves).BuildingMaterialReserves
            ResourceAmount += CityWoodReserves.GetItemCount(CS_ResourceWoodenPlank)
        endif
        
        ResourceAmount += Game.GetPlayer().GetItemCount(CS_ResourceWoodenPlank)
        
    endif
    
    return ResourceAmount
EndFunction

Function SetDaySlotsOpen()
    
    CS_CityManagementPopulation PopulationScript = CityManagementActivator as CS_CityManagementPopulation
    if PopulationScript.EventsTomorrow.Find(None) >= 0
        SlotOpenTomorrow = 1
    else
        SlotOpenTomorrow = 0
    endif
    
    if PopulationScript.Events2Days.Find(None) >= 0
        SlotOpen2Days = 1
    else
        SlotOpen2Days = 0
    endif
    
    if PopulationScript.Events3Days.Find(None) >= 0
        SlotOpen3Days = 1
    else
        SlotOpen3Days = 0
    endif
    
    if PopulationScript.Events4Days.Find(None) >= 0
        SlotOpen4Days = 1
    else
        SlotOpen4Days = 0
    endif
    
    if PopulationScript.Events5Days.Find(None) >= 0
        SlotOpen5Days = 1
    else
        SlotOpen5Days = 0
    endif
    
    if PopulationScript.Events6Days.Find(None) >= 0
        SlotOpen6Days = 1
    else
        SlotOpen6Days = 0
    endif
    
    if PopulationScript.Events7Days.Find(None) >= 0
        SlotOpen7Days = 1
    else
        SlotOpen7Days = 0
    endif
EndFunction

Function PayFoodFromCity()
    
    ObjectReference CityFoodReserves = (CityManagementActivator as CS_ManagementReserves).FoodReserves
    int CityReservesAmount = CityFoodReserves.GetItemCount(CS_ResourceFoodRaw)

    if CityReservesAmount >= FoodCost
        CityFoodReserves.RemoveItem(CS_ResourceFoodRaw, FoodCost)
        FoodCost = 0
    elseif CityReservesAmount > 0
        CityFoodReserves.RemoveItem(CS_ResourceFoodRaw, CityReservesAmount)
        FoodCost -= CityReservesAmount
    endif
EndFunction

Function PayFoodFromFaction()
    ObjectReference FactionFoodReserves = (PlayerFactionManagementActivator as CS_ManagementReserves).FoodReserves
    int FactionReservesAmount = FactionFoodReserves.GetItemCount(CS_ResourceFoodRaw)
    if FactionReservesAmount >= FoodCost
        FactionFoodReserves.RemoveItem(CS_ResourceFoodRaw, FoodCost)
        FoodCost = 0
    elseif FactionReservesAmount > 0
        FactionFoodReserves.RemoveItem(CS_ResourceFoodRaw, FactionReservesAmount)
        FoodCost -= FactionReservesAmount
    endif
EndFunction

Function PayFoodFromPlayer()
    Actor PlayerRef = Game.GetPlayer()
    int PlayerAmount = PlayerRef.GetItemCount(CS_ResourceFoodRaw)
    if PlayerAmount >= FoodCost
        PlayerRef.RemoveItem(CS_ResourceFoodRaw, FoodCost)
        FoodCost = 0
    elseif PlayerAmount > 0
        PlayerRef.RemoveItem(CS_ResourceFoodRaw, PlayerAmount)
        FoodCost -= PlayerAmount
    endif
EndFunction

Function PayFood()
    
    if PlayerJarl == 1
        PayFoodFromCity()
    endif
    
    if FoodCost > 0
        PayFoodFromFaction()
    endif
    
    if FoodCost > 0
        PayFoodFromPlayer()
    endif
    
EndFunction

Function PayWoodFromCity()
    
    ObjectReference CityWoodReserves = (CityManagementActivator as CS_ManagementReserves).BuildingMaterialReserves
    int CityReservesAmount = CityWoodReserves.GetItemCount(CS_ResourceWoodenPlank)

    if CityReservesAmount >= WoodCost
        CityWoodReserves.RemoveItem(CS_ResourceWoodenPlank, WoodCost)
        WoodCost = 0
    elseif CityReservesAmount > 0
        CityWoodReserves.RemoveItem(CS_ResourceWoodenPlank, CityReservesAmount)
        WoodCost -= CityReservesAmount
    endif
EndFunction

Function PayWoodFromFaction()
    ObjectReference FactionWoodReserves = (PlayerFactionManagementActivator as CS_ManagementReserves).BuildingMaterialReserves
    int FactionReservesAmount = FactionWoodReserves.GetItemCount(CS_ResourceWoodenPlank)
    if FactionReservesAmount >= WoodCost
        FactionWoodReserves.RemoveItem(CS_ResourceWoodenPlank, WoodCost)
        WoodCost = 0
    elseif FactionReservesAmount > 0
        FactionWoodReserves.RemoveItem(CS_ResourceWoodenPlank, FactionReservesAmount)
        WoodCost -= FactionReservesAmount
    endif
EndFunction

Function PayWoodFromPlayer()
    Actor PlayerRef = Game.GetPlayer()
    int PlayerAmount = PlayerRef.GetItemCount(CS_ResourceWoodenPlank)
    if PlayerAmount >= WoodCost
        PlayerRef.RemoveItem(CS_ResourceWoodenPlank, WoodCost)
        WoodCost = 0
    elseif PlayerAmount > 0
        PlayerRef.RemoveItem(CS_ResourceWoodenPlank, PlayerAmount)
        WoodCost -= PlayerAmount
    endif
EndFunction

Function PayWood()
    
    if PlayerJarl == 1
        PayWoodFromCity()
    endif
    
    if WoodCost > 0
        PayWoodFromFaction()
    endif
    
    if WoodCost > 0
        PayWoodFromPlayer()
    endif
    
EndFunction

Function PayGoldFromFaction()
    int FactionTreasury = (PlayerFactionManagementActivator as CS_ManagementReserves).Treasury
    
    if FactionTreasury >= GoldCost
        (PlayerFactionManagementActivator as CS_ManagementReserves).Treasury -= GoldCost
        GoldCost = 0
    elseif FactionTreasury > 0
        GoldCost -= FactionTreasury
        (PlayerFactionManagementActivator as CS_ManagementReserves).Treasury = 0
    endif
EndFunction

Function PayGoldFromPlayer()
    Actor PlayerRef = Game.GetPlayer()
    
    int PlayerAmount = PlayerRef.GetItemCount(Gold001)
    if PlayerAmount >= GoldCost
        PlayerRef.RemoveItem(Gold001, GoldCost)
        GoldCost = 0
    elseif PlayerAmount > 0
        PlayerRef.RemoveItem(Gold001, PlayerAmount)
        GoldCost -= PlayerAmount
    endif
EndFunction

Function PayGold()
    
    if GoldCost > 0
        PayGoldFromFaction()
    endif
    
    if GoldCost > 0
        PayGoldFromPlayer()
    endif
EndFunction

Function PayCosts()
    
    if FoodCost > 0
        PayFood()
    Endif
    
    if WoodCost > 0
        PayWood()
    endif

    if GoldCost > 0
        PayGold()
    endif
    
EndFunction

State Festival
    
    Function MenuStart(int Response = 0)
        
        SetUpText()
        
        int FoodNum = GetPlayerResourceAmount("Food")
        
        int PopulationCommoners = (CityManagementActivator as CS_CityManagementPopulation).PopulationCommoners
        
        int MinimalFood = math.ceiling(PopulationCommoners as float/2)
        int AverageFood = math.ceiling(PopulationCommoners as float)
        int ExtravagantFood = math.ceiling(PopulationCommoners as float*2)
        
        if FoodNum >= MinimalFood
            CanAffordMinimal = 1
        else
            CanAffordMinimal = 0
        endif
        
        if FoodNum >= AverageFood
            CanAffordAverage = 1
        else
            CanAffordAverage = 0
        endif
        
        if FoodNum >= ExtravagantFood
            CanAffordExtravagant = 1
        else
            CanAffordExtravagant = 0
        endif
        
        Response = CS_CityEventPlanningFestivalMenuStart.show(FoodNum, MinimalFood, AverageFood, ExtravagantFood)
        if Response < 4
            FoodType = Response
            if Response == 0
                FoodCost = 0
            elseif Response == 1
                FoodCost = MinimalFood
            elseif Response == 2
                FoodCost = AverageFood
            elseif Response == 3
                FoodCost = ExtravagantFood
            endif
            MenuDecorations()
        else
            EventStarted = 0
        endif
        
        Stop()
        
    EndFunction
    
    Function MenuDecorations(int Response = 0)
        
        int WoodNum = GetPlayerResourceAmount("Wood")
        
        int DecorationsCost = 10
        
        if WoodNum >= DecorationsCost
            CanAffordDecorations = 1
        else
            CanAffordDecorations = 0
        endif
        
        Response = CS_CityEventPlanningFestivalMenuDecorations.show(WoodNum, DecorationsCost)
        if Response < 2
            Decorations = Response
            if Response == 1
                WoodCost = DecorationsCost
            endif
            MenuEntertainment()
        else
            EventStarted = 0
        endif
        
    EndFunction
    
    Function MenuEntertainment(int Response = 0)
        
        int PlayerTreasury = (PlayerFactionManagementActivator as CS_ManagementReserves).Treasury
        PlayerTreasury += Game.GetPlayer().GetItemCount(Gold001)
        int BardCost = 100
        int BandCost = 300
        
        if PlayerTreasury >= BardCost
            CanAffordBard = 1
        else
            CanAffordBard = 0
        endif
        
        if PlayerTreasury >= BandCost
            CanAffordBand = 1
        else
            CanAffordBand = 0
        endif
        
        Response = CS_CityEventPlanningFestivalMenuEntertainment.show(PlayerTreasury, BardCost, BandCost)
        if Response < 3
            EntertainmentType = Response
            if Response == 1
                GoldCost = BardCost
            elseif Response == 2
                GoldCost = BandCost
            endif
            MenuSpeech()
        else
            EventStarted = 0
        endif
        
    EndFunction
    
    Function MenuSpeech(int Response = 0)
        
        Response = CS_CityEventPlanningFestivalMenuSpeech.show()
        if Response < 2
            Speech = Response
            MenuDate()
        else
            EventStarted = 0
        endif
        
    EndFunction
    
    Function MenuDate(int Response = 0)
        
        SetDaySlotsOpen()
        
        Response = CS_CityEventPlanningFestivalMenuDate.show()
        if Response < 7
            
            CS_CityManagementPopulation PopulationScript = CityManagementActivator as CS_CityManagementPopulation
            ObjectReference[] DateSlots
            if Response == 0
                Date = "Tomorrow"
                DateSlots = PopulationScript.EventsTomorrow
            elseif Response == 1 
                Date = "2Days"
                DateSlots = PopulationScript.Events2Days
            elseif Response == 2
                Date = "3Days"
                DateSlots = PopulationScript.Events3Days
            elseif Response == 3 
                Date = "4Days"
                DateSlots = PopulationScript.Events4Days
            elseif Response == 4 
                Date = "5Days"
                DateSlots = PopulationScript.Events5Days
            elseif Response == 5 
                Date = "6Days"
                DateSlots = PopulationScript.Events6Days
            elseif Response == 6 
                Date = "7Days"
                DateSlots = PopulationScript.Events7Days
            endif
            MenuTime(DateSlots)
        else
            EventStarted = 0
        endif
        
    EndFunction
    
    Function MenuTime(ObjectReference[] DateSlots, int Response = 0)
        
        if DateSlots[0] == None
            SlotOpenMorning = 1
        else
            SlotOpenMorning = 0
        endif
        
        if DateSlots[1] == None
            SlotOpenAfternoon = 1
        else
            SlotOpenAfternoon = 0
        endif
        
        if DateSlots[2] == None
            SlotOpenEvening = 1
        else
            SlotOpenEvening = 0
        endif
        
        Response = CS_CityEventPlanningFestivalMenuTime.show()
        if Response < 3
            if Response == 0
                Time = "Morning"
            elseif Response == 1
                Time = "Afternoon"
            elseif Response == 2
                Time = "Evening"
            endif
            
            EventStarted = 1
            PayCosts()
            Actor[] Organizers = new Actor[1]
            Organizers[0] = Game.GetPlayer()
            Location EventLocation
            if EventType == 0
                EventLocation = City.GetLocation()
            elseif EventType == 1
                EventLocation = (CityManagementActivator as CS_CityManagementPopulation).Palace
            endif
            (CityManagementActivator as CS_CityManagementPopulation).AddCityEvent(Organizers, EventType, Date, Time, EventLocation, FoodType, Decorations, EntertainmentType, Speech)
        else
            EventStarted = 0
        endif
        
    EndFunction
    
EndState