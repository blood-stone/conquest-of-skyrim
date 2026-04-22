Scriptname CS_GuardQuestPatrolScript extends ReferenceAlias  

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer()
        if GetOwningQuest().GetStage() == 10
            GetOwningQuest().SetStage(20)
        elseif GetOwningQuest().GetStage() == 20
            GetOwningQuest().SetStage(30)
        elseif GetOwningQuest().GetStage() == 30
            GetOwningQuest().SetStage(100)
        endif
        GetRef().disable()
    endif
EndEvent