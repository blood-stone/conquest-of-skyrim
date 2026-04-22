Scriptname CS_AttackCampTriggerBoxScript extends ObjectReference  

Quest Property AttackQuest  Auto  
Location Property CampLocation Auto
LocationAlias Property CampLocationAlias Auto

Keyword Property StoryAttackCamp Auto

int Property enemyfactionnum Auto
int Property holdnum Auto

Event OnTriggerEnter(ObjectReference akTriggerRef)
    If akTriggerRef == Game.GetPlayer()
        if AttackQuest.IsRunning() && (AttackQuest as CS_AttackFortCampScript).Camp.GetLocation() != CampLocation
            (AttackQuest as CS_AttackFortCampScript).FailQuest()
        endif
        ;CampLocationAlias.ForceLocationTo(CampLocation)
        ;(CampLocationAlias.GetOwningQuest() as CS_AttackCampStagingScript).enemyfactionnum = enemyfactionnum
        ;(CampLocationAlias.GetOwningQuest() as CS_AttackCampStagingScript).holdnum = holdnum
        ;(CampLocationAlias.GetOwningQuest() as CS_AttackCampStagingScript).TriggerBoxActivated = true
        ;AttackQuest.Start()
        StoryAttackCamp.SendStoryEvent(akLoc = CampLocation, akRef1 = self, aiValue1 = enemyfactionnum, aiValue2 = holdnum)
    EndIf
EndEvent
