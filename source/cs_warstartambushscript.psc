Scriptname CS_WarStartAmbushScript extends ObjectReference  

Quest Property AmbushQuest Auto
Quest Property AttackCityQuest Auto
Quest Property AttackFortQuest Auto
Quest Property AttackCampQuest Auto

ReferenceAlias Property AmbushStagingTrigger Auto

Location Property HoldLocation Auto

FormList Property AllHolds Auto
FormList Property AllHoldsCS Auto

Keyword Property LandSuperiority Auto
Keyword Property PatrolKeyword Auto
Keyword Property ArmiesPatrolling Auto

Keyword Property StoryAmbush Auto

Event OnCellLoad()

    StartAmbush()

EndEvent

Function StartAmbush()

    int holdnum = AllHoldsCS.Find(HoldLocation)

    if (AttackCityQuest.IsRunning() && (AttackCityQuest as CS_AttackCityScript).citynum == holdnum) || (AttackFortQuest.IsRunning() && (AttackFortQuest as CS_AttackFortCampScript).holdnum == holdnum) || (AttackCampQuest.IsRunning() && (AttackCampQuest as CS_AttackFortCampScript).holdnum == holdnum)

        debug.trace("Did not start ambush due to attack quest in same hold")

    else

    debug.trace("Starting ambush!")

    if AmbushQuest.IsRunning() && (!Game.GetPlayer().IsInCombat() || HoldLocation.GetKeywordData(LandSuperiority) == 1)
        debug.trace("Ambush quest running and player not in combat or controls roads. Detaching Army...")
        (AmbushQuest as CS_WarPatrolAmbushScript).DetachArmy()
    elseif AmbushQuest.IsRunning() && Game.GetPlayer().IsInCombat()
        debug.trace("Ambush quest running and player in combat")
    endif

    if (HoldLocation.GetKeywordData(PatrolKeyword) > 0 || (HoldLocation.GetKeywordData(LandSuperiority) == 1 && HoldLocation.GetKeywordData(PatrolKeyword) != -1)) && AmbushQuest.IsRunning() == 0 && HoldLocation.GetKeywordData(ArmiesPatrolling) > 0
        StoryAmbush.SendStoryEvent(akRef1 = self)
    endif

    endif
EndFunction