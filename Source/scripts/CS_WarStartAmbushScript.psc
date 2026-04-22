Scriptname CS_WarStartAmbushScript extends ObjectReference  

Quest Property AmbushQuest Auto
Quest Property AttackCityQuest Auto
Quest Property AttackFortQuest Auto
Quest Property AttackCampQuest Auto

ReferenceAlias Property AmbushStagingTrigger Auto

Location Property HoldLocation Auto

FormList Property AllHolds Auto
FormList Property AllHoldsCS Auto
FormList Property CS_AllBattleSpacesSkyrim Auto
FormList Property CS_PatrolKeywords Auto

Keyword Property LandSuperiority Auto
Keyword Property PatrolKeyword Auto
Keyword Property ArmiesPatrolling Auto

Keyword Property StoryAmbush Auto

ObjectReference Property CS_FactionPlayer Auto

Event OnCellLoad()

    StartAmbush()

EndEvent

Function StartAmbush()

    int patrolnum = CS_PatrolKeywords.Find(PatrolKeyword)
    int holdnum = AllHoldsCS.Find(HoldLocation)
    CS_BattleSpaceRegionAll BattleSpace = CS_AllBattleSpacesSkyrim.GetAt(holdnum) as CS_BattleSpaceRegionAll 

    if (AttackCityQuest.IsRunning() && (AttackCityQuest as CS_AttackCityScript).citynum == holdnum) || (AttackFortQuest.IsRunning() && (AttackFortQuest as CS_AttackFortCampScript).holdnum == holdnum) || (AttackCampQuest.IsRunning() && (AttackCampQuest as CS_AttackFortCampScript).holdnum == holdnum)

        debug.trace("Did not start ambush due to attack quest in same hold")

    else

    debug.trace("Starting ambush!")

    if AmbushQuest.IsRunning() && (!Game.GetPlayer().IsInCombat() || BattleSpace.BattleSpaceOwner == CS_FactionPlayer)
        debug.trace("Ambush quest running and player not in combat or controls roads. Detaching Army...")
        (AmbushQuest as CS_WarPatrolAmbushScript).DetachArmy()
    elseif AmbushQuest.IsRunning() && Game.GetPlayer().IsInCombat()
        debug.trace("Ambush quest running and player in combat")
    endif

    if BattleSpace.PatrolRegiments[patrolnum]
        StoryAmbush.SendStoryEvent(akRef1 = self, akRef2 = BattleSpace.PatrolRegiments[patrolnum])
    endif

    endif
EndFunction