Scriptname CS_CWMapHoldCampsScript extends ObjectReference

CS_BattleSpaceRegionAll Property BattleSpace Auto

ObjectReference[] CampFlags

Function TryToRemoveFlag(ObjectReference FlagRef)

    if FlagRef
        int CampFlagIndex = CampFlags.Find(FlagRef)
        CampFlags[CampFlagIndex] = None
        FlagRef.disable()
        FlagRef.delete()
    endif
    
EndFunction

Function TryToRemoveFlags()
    int i = CampFlags.Length - 1
    while i >= 0
        TryToRemoveFlag(CampFlags[i])
        i -= 1
    endwhile
EndFunction

Function TryToPlaceFlags()
    BattleSpace = ((self as ObjectReference) as CS_CWMapActivatorHoldScript).BattleSpace
    CampFlags = new ObjectReference[5]
    
    int i = 0
    while i < CampFlags.Length
        TryToPlaceFlag(i)
        i += 1
    endwhile
EndFunction

Function TryToPlaceFlag(int campfactionnum)

    ObjectReference CampMarker = BattleSpace.Camps[campfactionnum]
    if CampMarker && CampMarker.IsEnabled()
        string node
        if campfactionnum == 0
            node = "CampPlayer"
        elseif campfactionnum == 1
            node = "CampImp"
        elseif campfactionnum == 2
            node = "CampSons"
        endif
        
        CS_CampManagementScript CampScript = BattleSpace.CampManagementActivators[campfactionnum] as CS_CampManagementScript
        ObjectReference CampFaction = CampScript.FactionOwnerActivator

        Static FlagToPlace = (CampFaction as CS_FactionManagementDiplomacy).MapFlag
        float NewScale = 1
        if node == "CampImp" || node == "CampSons"
            NewScale = 0.75
        elseif node == "CampPlayer"
            NewScale = 1.5
        endif
        
        CampFlags[campfactionnum] = self.PlaceAtMe(FlagToPlace, abInitiallyDisabled = true)
        CampFlags[campfactionnum].SetScale(NewScale)

        CampFlags[campfactionnum].MoveToNode(self, node)
        CampFlags[campfactionnum].SetAngle(CampFlags[campfactionnum].GetAngleX(), CampFlags[campfactionnum].GetAngleY(), afZAngle = CampFlags[campfactionnum].GetAngleZ() + 180)
        CampFlags[campfactionnum].EnableNoWait()
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