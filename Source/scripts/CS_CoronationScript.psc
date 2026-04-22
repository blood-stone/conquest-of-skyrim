Scriptname CS_CoronationScript extends Quest  Conditional

float Property CoronationDay Auto
GlobalVariable Property GameDaysPassed Auto
GlobalVariable Property IsHighKing Auto

FormList Property AllLocations Auto

int Property JarlsAttending Auto Conditional

Quest Property GovQuest Auto

CS_LoyaltyCheckScript Property LoyaltyCheck Auto

ReferenceAlias Property Throne Auto
ReferenceAlias Property Steward Auto
ReferenceAlias Property StewardMarker Auto
ReferenceAlias[] Property Jarls Auto
ReferenceAlias[] Property JarlMarkers Auto
ReferenceAlias[] Property Citizens Auto
ReferenceAlias[] Property CitizenMarkers Auto
ReferenceAlias[] Property Guards Auto
ReferenceAlias Property ASIC Auto
ReferenceAlias Property Blacksmith Auto
ReferenceAlias Property CourtMage Auto
ReferenceAlias Property JarlTribute Auto

Armor Property HighKingCrown Auto
Armor Property HighQueenCrown Auto

Scene Property JarlPledgeScene Auto
Scene Property StewardStartPledgeScene Auto
Scene Property EndScene Auto

ObjectReference Property CoronationStandMarker Auto

bool Property PledgeSceneStarted Auto


Function SetupThrone()
    Throne.ForceRefTo((GovQuest as CS_GovScriptFunctions).Thrones.GetAt((GovQuest as CS_GovScriptFunctions).CapitalGlobal.GetValue() as int) as ObjectReference)
EndFunction

Function GetKeyPersonnel()
    int i = 0
    while i < 9
        if (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef() != None && (GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef() != Game.GetPlayer()
            Jarls[JarlsAttending].ForceRefTo((GovQuest as CS_RecruitJarl).JarlAliases[i].GetActorRef())
            JarlsAttending += 1
        endif
        i += 1
    endwhile
    Steward.ForceRefTo((GovQuest as CS_GovScriptFunctions).Steward.GetActorRef())
    ASIC.ForceRefTo((GovQuest as CS_GovScriptFunctions).ASIC.GetActorRef())
    Blacksmith.ForceRefTo((GovQuest as CS_GovScriptFunctions).Blacksmith.GetActorRef())
    CourtMage.ForceRefTo((GovQuest as CS_GovScriptFunctions).CourtMage.GetActorRef())
EndFunction

Function MoveToMarkers()
    int i = 0
    while i < Citizens.Length
        Citizens[i].GetActorRef().MoveTo(CitizenMarkers[i].GetReference())
        i += 1
    endwhile
    i = 0
    while i < JarlsAttending
        Jarls[i].GetActorRef().MoveTo(JarlMarkers[i].GetReference())
        i += 1
    endwhile
    Steward.GetActorRef().MoveTo(StewardMarker.GetReference())
EndFunction

Function StartJarlPledges()
    If JarlsAttending > 0
        JarlsAttending -= 1
        JarlTribute.ForceRefTo(Jarls[JarlsAttending].GetActorRef())
        JarlPledgeScene.ForceStart()
    Else
        SetStage(21)
    EndIf
EndFunction

Function NextJarlPledge()
    If JarlsAttending > 0
        JarlsAttending -= 1
        JarlTribute.ForceRefTo(Jarls[JarlsAttending].GetActorRef())
    Else
        SetStage(21)
    EndIf
EndFunction

Function CitizensKneel()
    int i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            debug.sendAnimationEvent(Citizens[i].GetActorRef(), "IdleKneelingEnter")
        endif
        i += 1
    endwhile
EndFunction

Function JarlsKneel()
    debug.sendAnimationEvent(ASIC.GetActorRef(), "IdleKneelingEnter")
    debug.sendAnimationEvent(Blacksmith.GetActorRef(), "IdleKneelingEnter")
    debug.sendAnimationEvent(CourtMage.GetActorRef(), "IdleKneelingEnter")
    int i = 0
    while i < 8
        debug.sendAnimationEvent(Jarls[i].GetActorRef(), "IdleKneelingEnter")
        i += 1
    endwhile
    i = 0
    while i < Guards.Length
        if Guards[i].GetActorRef() != None
            debug.sendAnimationEvent(Guards[i].GetActorRef(), "IdleKneelingEnter")
        endif
        i += 1
    endwhile
EndFunction

Function StewardKneel()
    debug.sendAnimationEvent(Steward.GetActorRef(), "IdleKneelingEnter")
EndFunction

Function KneelStop()
    debug.sendAnimationEvent(Steward.GetActorRef(), "IdleForceDefaultState")
    debug.sendAnimationEvent(ASIC.GetActorRef(), "IdleForceDefaultState")
    debug.sendAnimationEvent(Blacksmith.GetActorRef(), "IdleForceDefaultState")
    debug.sendAnimationEvent(CourtMage.GetActorRef(), "IdleForceDefaultState")
    int i = 0
    while i < 8
        debug.sendAnimationEvent(Jarls[i].GetActorRef(), "IdleForceDefaultState")
        i += 1
    endwhile
    i = 0
    while i < Guards.Length
        if Guards[i].GetActorRef() != None
            debug.sendAnimationEvent(Guards[i].GetActorRef(), "IdleForceDefaultState")
        endif
        i += 1
    endwhile
    i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            debug.sendAnimationEvent(Citizens[i].GetActorRef(), "IdleForceDefaultState")
        endif
        i += 1
    endwhile
EndFunction

Function AllCheer()
    int i = 0
    while i < JarlsAttending
        int randomapplaudnum = utility.randomint(0, 3)
        if randomapplaudnum == 0
            debug.sendAnimationEvent(Jarls[i].GetActorRef(), "IdleApplaud2")
        elseif randomapplaudnum == 1
            debug.sendAnimationEvent(Jarls[i].GetActorRef(), "IdleApplaud3")
        elseif randomapplaudnum == 2
            debug.sendAnimationEvent(Jarls[i].GetActorRef(), "IdleApplaud4")
        elseif randomapplaudnum == 3
            debug.sendAnimationEvent(Jarls[i].GetActorRef(), "IdleApplaud5")
        endif
        i += 1
    endwhile
    i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            int randomapplaudnum = utility.randomint(0, 3)
            if randomapplaudnum == 0
                debug.sendAnimationEvent(Citizens[i].GetActorRef(), "IdleApplaud2")
            elseif randomapplaudnum == 1
                debug.sendAnimationEvent(Citizens[i].GetActorRef(), "IdleApplaud3")
            elseif randomapplaudnum == 2
                debug.sendAnimationEvent(Citizens[i].GetActorRef(), "IdleApplaud4")
            elseif randomapplaudnum == 3
                debug.sendAnimationEvent(Citizens[i].GetActorRef(), "IdleApplaud5")
            endif
        endif
        i += 1
    endwhile
EndFunction

Function AllLookAtPlayer()
    int i = 0
    while i < JarlsAttending
        Jarls[i].GetActorRef().SetLookAt(Game.GetPlayer())
        i += 1
    endwhile
    i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            Citizens[i].GetActorRef().SetLookAt(Game.GetPlayer())
        endif
        i += 1
    endwhile
EndFunction

Function ClearAllLookAtPlayer()
    int i = 0
    while i < JarlsAttending
        Jarls[i].GetActorRef().ClearLookAt()
        i += 1
    endwhile
    i = 0
    while i < Citizens.Length
        if Citizens[i].GetActorRef() != None
            Citizens[i].GetActorRef().ClearLookAt()
        endif
        i += 1
    endwhile
EndFunction

Function AddLoyalty(int holdingnum)
    LoyaltyCheck.AdjustLoyalty((AllLocations.GetAt(holdingnum) as Location), 30)
EndFunction

Function RegisterForLOSCheer()
    RegisterForSingleLOSGain(Steward.GetActorRef(), Game.GetPlayer())
EndFunction

Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
    AllCheer()
EndEvent

Event OnUpdateGameTime()
    if GameDaysPassed.GetValue() >= CoronationDay
        If GetStage() < 10
            SetStage(10)
        EndIf
    endif
EndEvent
Scene Property CoronationStartScene  Auto  

Idle Property TestIdle  Auto  

Quest Property MeetingQuest  Auto  
