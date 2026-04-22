Scriptname CS_CoupJarlScript extends ReferenceAlias  

Event OnEnterBleedout()
    if GetOwningQuest().GetStage() == 20
        GetOwningQuest().SetStage(100)
    elseif GetOwningQuest().GetStage() == 40
        GetOwningQuest().SetStage(46)
    endif
EndEvent