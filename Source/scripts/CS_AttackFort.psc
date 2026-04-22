Scriptname CS_AttackFort extends ObjectReference  

Event OnTriggerEnter(ObjectReference akTriggerRef)
    If akTriggerRef == Game.GetPlayer()
        if BattleQuest.IsRunning() && (BattleQuest as CS_AttackFortCampScript).FortLoc.GetLocation() != FortLoc
            (BattleQuest as CS_AttackFortCampScript).FailQuest()
        endif
        ;FortAlias.ForceLocationTo(FortLoc)
        ;(FortAlias.GetOwningQuest() as CS_AttackFortStagingScript).TriggerBoxTriggered = true
        ;BattleQuest.Start()
        CS_StoryAttackFort.SendStoryEvent(akLoc = FortLoc, akRef1 = self)
        self.disable()
    EndIf
EndEvent

Keyword Property CS_StoryAttackFort Auto

ReferenceAlias[] Property DefendersRefs  Auto  

Quest Property BattleQuest  Auto  

GlobalVariable Property DefenderCount  Auto  

FormList Property Defenders  Auto  

LocationAlias Property FortAlias  Auto  

Location Property FortLoc  Auto  

ReferenceAlias Property TriggerBoxRef  Auto  

Faction Property CS_DefendingVillageFaction  Auto  