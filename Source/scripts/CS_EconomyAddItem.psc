Scriptname CS_EconomyAddItem extends ObjectReference  

String Property Resource Auto
String Property CityOrFaction Auto

CS_EconomyFactionUpdaterNewScript Property EconomyFaction Auto
CS_EconomyHoldUpdaterNewScript Property EconomyHold Auto

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if akSourceContainer == Game.GetPlayer()
        if CityOrFaction == "Faction"
            if Resource == "Food"
                EconomyFaction.FoodReserve += aiItemCount
            elseif Resource == "Wood"
                EconomyFaction.WoodReserve += aiItemCount
            elseif Resource == "Metal"
                EconomyFaction.MetalReserve += aiItemCount
            endif
        elseif CityOrFaction == "City"
            if Resource == "Food"
                EconomyHold.FoodReserve += aiItemCount
            elseif Resource == "Wood"
                EconomyHold.WoodReserve += aiItemCount
            elseif Resource == "Metal"
                EconomyHold.MetalReserve += aiItemCount
            endif
        endif
    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if akDestContainer == Game.GetPlayer()
        if CityOrFaction == "Faction"
            if Resource == "Food"
                EconomyFaction.FoodReserve -= aiItemCount
            elseif Resource == "Wood"
                EconomyFaction.WoodReserve -= aiItemCount
            elseif Resource == "Metal"
                EconomyFaction.MetalReserve -= aiItemCount
            endif
        elseif CityOrFaction == "City"
            if Resource == "Food"
                EconomyHold.FoodReserve -= aiItemCount
            elseif Resource == "Wood"
                EconomyHold.WoodReserve -= aiItemCount
            elseif Resource == "Metal"
                EconomyHold.MetalReserve -= aiItemCount
            endif
        endif
    endif
EndEvent