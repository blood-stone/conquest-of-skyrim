Scriptname CS_CityEventPlanScript extends ObjectReference  

float Property DateTime Auto
float Property EndDateTime Auto

string Property Time Auto

int Property DaysRemaining Auto

int Property EventType Auto

Actor[] Property Organizers Auto

Keyword Property EventKeyword Auto

Location Property EventLocation Auto

Quest Property EventQuest Auto

Message Property EventDetailsMessage Auto

int Property EventValue1 Auto
int Property EventValue2 Auto
int Property EventValue3 Auto
int Property EventValue4 Auto

Function BeginEvent(ObjectReference CityManagementActivator)
    GoToState("EventBegun")
    if EventQuest.IsRunning()
        debug.notification("Event already running...")
        int loopnum = 0
        while EventQuest.IsRunning() && loopnum < 100 ; If the event already running, wait for a max of 10 seconds before force stopping it
            utility.wait(0.1)
            loopnum += 1
        endwhile
        if loopnum >= 100
            debug.notification("Forcibly stopping event...")
            EventQuest.Stop()
        endif
    endif
    debug.notification("Starting event...")
    EventKeyword.SendStoryEvent(EventLocation, self, CityManagementActivator)
EndFunction

Function SimulateEventRewards(ObjectReference CityManagementActivator)
    string InfluencingGroup
    string InfluencedGroup
    
    if Organizers[0] == Game.GetPlayer()
        InfluencingGroup == "Player"
    else
        InfluencingGroup == "Jarl"
    endif
    
    if eventtype == 0
        InfluencedGroup = "Commoner"
    elseif eventtype == 1
        InfluencedGroup = "Nobility"
    endif
    
    int Value1Influence = 3*EventValue1
    int Value2Influence = 3*EventValue2
    int Value3Influence = 3*EventValue3
    
    int TotalInfluenceChange = Value1Influence + Value2Influence + Value3Influence
    (CityManagementActivator as CS_CityManagementPopulation).AdjustInfluence(InfluencingGroup, InfluencedGroup, TotalInfluenceChange)
EndFunction