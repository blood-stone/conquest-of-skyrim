Scriptname CS_CWMapHoldPatrolsScript extends ObjectReference  

CS_BattleSpaceRegionAll Property BattleSpace Auto

ObjectReference[] PatrolFlags

Function TryToRemoveFlag(ObjectReference FlagRef)

    if FlagRef
        int PatrolFlagIndex = PatrolFlags.Find(FlagRef)
        PatrolFlags[PatrolFlagIndex] = None
        FlagRef.disable()
        FlagRef.delete()
    endif
    
EndFunction

Function TryToRemoveFlags()
    int i = 0
    while i < PatrolFlags.Length
        TryToRemoveFlag(PatrolFlags[i])
        i += 1
    endwhile
EndFunction

Function TryToPlaceFlags()
    BattleSpace = ((self as ObjectReference) as CS_CWMapActivatorHoldScript).BattleSpace
    PatrolFlags = new ObjectReference[4]
    
    int i = 0
    while i < PatrolFlags.Length
        TryToPlaceFlag(i)
        i += 1
    endwhile
    
    i = 0
    while i < PatrolFlags.Length
        if PatrolFlags[i]
            PatrolFlags[i].EnableNoWait()
        endif
        i += 1
    endwhile
EndFunction

Function TryToPlaceFlag(int patrolnum)

    Static FlagToPlace = (BattleSpace.BattleSpaceOwner as CS_FactionManagementDiplomacy).MapFlag
    string node = "Patrol"
    
    if BattleSpace.PatrolRegiments[patrolnum]
        node += ((patrolnum + 1) as string)
        debug.trace("Placing patrolflag at node " + node)
        PatrolFlags[patrolnum] = self.PlaceAtMe(FlagToPlace, abInitiallyDisabled = true)
        PatrolFlags[patrolnum].SetScale(0.5)

        PatrolFlags[patrolnum].MoveToNode(self, node)
        PatrolFlags[patrolnum].SetAngle(PatrolFlags[patrolnum].GetAngleX(), PatrolFlags[patrolnum].GetAngleY(), afZAngle = PatrolFlags[patrolnum].GetAngleZ() + 180)
    endif
    
EndFunction

State ResetFlags

    Event OnUpdate()
        
        TryToRemoveFlags()
        TryToPlaceFlags()
        
    EndEvent
    
EndState

State RemoveFlags

    Event OnUpdate()
        
        TryToRemoveFlags()
        
    EndEvent
    
EndState