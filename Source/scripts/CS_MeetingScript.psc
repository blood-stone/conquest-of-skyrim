Scriptname CS_MeetingScript extends Quest  Conditional

ReferenceAlias Property Throne Auto
ReferenceAlias Property Steward Auto
ReferenceAlias[] Property Jarls Auto
ReferenceAlias[] Property JarlChairs Auto
ReferenceAlias[] Property JarlStandMarkers Auto
ReferenceAlias Property JarlBeginMeeting Auto
ReferenceAlias Property JarlNominator Auto
ReferenceAlias Property JarlSpeaking Auto

Quest Property GovQuest Auto
Quest Property CoronationQuest Auto
Quest Property CourtQuest Auto

int Property holdingnum Auto Conditional
int Property JarlsAttending Auto Conditional
int Property JarlVoting Auto Conditional
int Property VotingJarls Auto Conditional
int Property MootVoteFor Auto Conditional
int Property MootVoteAgainst Auto Conditional
int Property MootVoteHoldingLoyalty Auto Conditional

float Property MeetingDay Auto
GlobalVariable Property GameDaysPassed Auto

Scene Property JarlsStandScene Auto
Scene Property JarlStartMeetingScene Auto
Scene Property MootSelfNominationScene Auto
Scene Property MootNominatedScene Auto
Scene Property MootVoteStartScene Auto
Scene Property MootVoteScene Auto
Scene Property MootVictoryScene Auto
Scene Property MootFailureScene Auto

Keyword Property Loyalty Auto

FormList Property AllLocations Auto

CS_LoyaltyCheckScript Property LoyaltyCheck Auto

bool Property JarlsStanding Auto
bool Property Moot Auto

Function GetJarls()
    JarlsAttending = 0
    int i = 0
    while i < 9
        if (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef() != None && i != (GovQuest as CS_GovScriptFunctions).CapitalGlobal.GetValueint() && (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef().IsInFaction((GovQuest as CS_RecruitJarl).GovFaction) == 1
            Jarls[JarlsAttending].ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef())
            JarlsAttending += 1
        endif
        i += 1
    endwhile
EndFunction

Function GetMinorThrone()
    holdingnum = (GovQuest as CS_GovScriptFunctions).CapitalGlobal.GetValueint()
    if holdingnum >= 5
        Throne.ForceRefTo((CourtQuest as CS_CourtScript).Thrones[holdingnum].GetReference())
    endif
EndFunction

Function MoveToMarkers()
    if (GovQuest as CS_GovScriptFunctions).CapitalGlobal.GetValue() < 5
        int i = 0
        while i < Jarls.Length
            Jarls[i].GetActorRef().MoveTo(JarlChairs[i].GetReference())
            i += 1
        endwhile
    elseif (GovQuest as CS_GovScriptFunctions).CapitalGlobal.GetValue() >= 5
        int i = 0
        while i < Jarls.Length
            Jarls[i].GetActorRef().MoveTo(JarlStandMarkers[i].GetReference())
            i += 1
        endwhile
    endif
EndFunction

Function StartMeeting()
    JarlStartMeetingScene.ForceStart()
EndFunction

Function StartMoot()
    Moot = true
    RegisterForSingleUpdate(2)
EndFunction

Function StartMootVote()
    MootVoteFor = 0
    MootVoteAgainst = 0
    MootVoteStartScene.Stop()
    JarlNextVote()
    MootVoteScene.ForceStart()
EndFunction

Function JarlNextVote()
    debug.notification(MootVoteFor + " Votes For, " + MootVoteAgainst + " Votes Against")
    if VotingJarls > 0
        VotingJarls -= 1
        JarlSpeaking.ForceRefTo(Jarls[VotingJarls].GetActorRef())
        Location MootVoteHolding = AllLocations.GetAt((GovQuest as CS_RecruitJarl).FindJarl(JarlSpeaking.GetActorRef())) as Location
        MootVoteHoldingLoyalty = MootVoteHolding.GetKeywordData(Loyalty) as int
    else
        MootVoteFor += 1
        debug.notification("Final Vote: " + MootVoteFor + " Votes For, " + MootVoteAgainst + " Votes Against")
        SetStage(35)
    endif
EndFunction

Function FindJarlNominator()
    VotingJarls = JarlsAttending
    int i = 0
    int nominatorholdingnum = -1
    while i < AllLocations.GetSize() && nominatorholdingnum == -1
        if (AllLocations.GetAt(i) as Location).GetKeywordData(Loyalty) >= 60 && (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef() != None && (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef() != Game.GetPlayer()
            nominatorholdingnum = i
        endif
        i += 1
    endwhile

    if nominatorholdingnum == -1
        int randomjarlnum = utility.randomint(0, JarlsAttending)
        JarlNominator.ForceRefTo(Jarls[randomjarlnum].GetActorRef())
        MootSelfNominationScene.ForceStart()
    else
        JarlNominator.ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[nominatorholdingnum].GetActorRef())
        MootNominatedScene.ForceStart()
    endif
EndFunction

Function EndMoot()
    MootVoteScene.Stop()
    if MootVoteFor >= MootVoteAgainst
        ReduceHoldsLoyalty()
        MootVictoryScene.ForceStart()
    else
        MootFailureScene.ForceStart()
    endif
EndFunction

Function ReduceHoldsLoyalty()
    int i = 0
    while i < 9
        if i != (GovQuest as CS_GovScriptFunctions).CapitalGlobal.GetValueint() && ((GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef() == None || (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef().IsInFaction((GovQuest as CS_RecruitJarl).GovFaction) != 1)
            LoyaltyCheck.AdjustLoyalty((AllLocations.GetAt(i) as Location), -80)
        endif
        i += 1
    endwhile
EndFunction

Function RegisterForJarlsToStand()
    RegisterForSingleLOSGain(Steward.GetActorRef(), Game.GetPlayer())
EndFunction

Function RegisterForJarlsToLeave()
    RegisterForSingleLOSLost(Steward.GetActorRef(), Game.GetPlayer())
EndFunction

Function JarlsStand()
    JarlsStandScene.ForceStart()
    Utility.Wait(2)
    int i = 0
    while i < Jarls.Length
        debug.SendAnimationEvent(Jarls[i].GetActorRef(), "IdleSalute")
        i += 1
    endwhile
EndFunction

Function JarlsSit()
    int randomjarlnum = utility.randomint(0, JarlsAttending)
    JarlBeginMeeting.ForceRefTo(Jarls[randomjarlnum].GetActorRef())
    JarlsStandScene.Stop()
    int i = 0
    while i < Jarls.Length
        Jarls[i].GetActorRef().EvaluatePackage()
        i += 1
    endwhile
    i = 0
EndFunction

Event OnGainLOS(Actor Viewer, ObjectReference akTarget)
    if JarlsStanding == false
        JarlsStanding = true
        JarlsStand()
    endif
EndEvent

Event OnLostLOS(Actor Viewer, ObjectReference akTarget)
    Stop()
EndEvent

Event OnUpdateGameTime()
    if GameDaysPassed.GetValue() >= MeetingDay
        If GetStage() < 10
            UnRegisterForUpdateGameTime()
            SetStage(10)
        EndIf
    endif
EndEvent

Event OnUpdate()
    if GetStage() == 25 && Moot
        JarlStartMeetingScene.Stop()
        FindJarlNominator()
    endif
EndEvent