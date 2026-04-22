Scriptname CS_GatherWoodScript extends activemagiceffect  

Quest Property CS_CutTreesQuest Auto

Weapon Property Axe01 Auto

Actor Property PlayerRef Auto

FormList Property CS_ResourceOutputListEquipment Auto

Message Property CS_GatherWoodMessage Auto

Auto State EffectReady

    Event OnEffectStart(Actor akTarget, Actor akCaster)
        GoToState("EffectStarted")
        if PlayerRef.IsInInterior()
            debug.notification("You can only gather wood outside!")
        elseif PlayerRef.IsInCombat()
            debug.notification("You can not gather wood while in combat!")
        elseif PlayerRef.GetItemCount(Axe01) > 0 || PlayerRef.GetItemCount(CS_ResourceOutputListEquipment) > 0
            if CS_GatherWoodMessage.show() == 0
                CS_CutTreesQuest.Stop()
                CS_CutTreesQuest.Start()
            endif
        else
            debug.notification("You need a Woodcutter's Axe or Tools to gather wood!")
        endif
        GoToState("EffectReady")
    EndEvent
    
EndState