Scriptname CS_AttackCity extends ObjectReference  

Quest Property AttackQuest  Auto  
Quest Property AttackQuestSiege Auto
Location Property CityLocation Auto
LocationAlias Property CityLocationAlias Auto

Keyword Property CS_StoryAttackCity Auto


Event OnTriggerEnter(ObjectReference akTriggerRef)
    If akTriggerRef == Game.GetPlayer()
        self.disable()
        if (AttackQuestSiege as CS_AttackCitySiegeScript).City.GetLocation() == CityLocation
            (AttackQuestSiege as CS_AttackCitySiegeScript).LaunchAttack()
        else
            CS_StoryAttackCity.SendStoryEvent(akLoc = CityLocation, akRef1 = self, aiValue1 = 1)
        endif
    EndIf
EndEvent
