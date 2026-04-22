Scriptname CS_StorageCityEquipmentScript extends ObjectReference  

FormList Property TroopEquipment Auto

int[] Property GuardEquipmentTiers Auto

float Property TroopEquipmentModifier=1.0 Auto hidden


Function SetModifier(FormList List)
    ObjectReference City = ((self as ObjectReference) as CS_StorageCityScript).City
    float modifier = 1 ;base amount without equipment
    int TotalGuards = (City as CS_CityManagementPopulation).Guards
    
    int i = List.GetSize() - 1
    int usedtools = 0
    while i >= 0 && usedtools < TotalGuards
        int toolitemcount = GetItemCount(List.GetAt(i))
        if toolitemcount > 0
            if toolitemcount > TotalGuards
                toolitemcount = TotalGuards
            endif
            
            float ModifierAddition = 0.2*(i + 1)*(toolitemcount as float/TotalGuards)
            modifier += ModifierAddition
            usedtools += toolitemcount
        endif
        i -= 1
    endwhile
    
    TroopEquipmentModifier = modifier
EndFunction

Function SetGuardEquipmentTiers()
    ObjectReference City = ((self as ObjectReference) as CS_StorageCityScript).City
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    
    ;int GuardsToEquip = Population.GuardActors.Length
    GuardEquipmentTiers = new int[20]
    int GuardNum = 0
    int TotalEquipment = GetItemCount(TroopEquipment)
    int i = TroopEquipment.GetSize() - 1
    while i >= 1 && TotalEquipment > 0 && GuardNum < 20; && GuardsToEquip > 0
        Form EquipmentForm = TroopEquipment.GetAt(i)
        int EquipmentAmount = GetItemCount(EquipmentForm)
        while EquipmentAmount > 0 && TotalEquipment > 0 && GuardNum < 20; && GuardsToEquip > 0
            ;GuardsToEquip -= 1
            GuardEquipmentTiers[GuardNum] = i
            GuardNum += 1
            EquipmentAmount -= 1
            TotalEquipment -= 1
        endwhile
        i -= 1
    endwhile
EndFunction

Function ReEquipGuards()
    GoToState("ReEquippingGuards")
    ObjectReference City = ((self as ObjectReference) as CS_StorageCityScript).City
    CS_CityManagementPopulation Population = City as CS_CityManagementPopulation
    
    int i = 0
    while i < Population.GuardActors.Length
        (Population.GuardActors[i] as CS_ResourceEquipmentReceiver).GoToState("EquipTroop")
        (Population.GuardActors[i] as CS_ResourceEquipmentReceiver).RegisterforSingleUpdate(0.1)
        i += 1
    endwhile
    GoToState("Normal")
EndFunction

Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
    if akSourceContainer != Game.GetPlayer()
        debug.trace("Equipment added itemcount = " + aiItemCount)
        if TroopEquipment.HasForm(akBaseItem) ;Need to edit the function to reflect troop numbers
            SetModifier(TroopEquipment)
            SetGuardEquipmentTiers()
            ReEquipGuards()
        endif
    endif
EndEvent

Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
    if akDestContainer != Game.GetPlayer()
        if TroopEquipment.HasForm(akBaseItem) ;Need to edit the function to reflect troop numbers
            SetModifier(TroopEquipment)
            SetGuardEquipmentTiers()
            ReEquipGuards()
        endif
    endif
EndEvent

State ReEquippingGuards
    
    Function ReEquipGuards()
        ;Block
    EndFunction
    
EndState

State UpdateEquipment
    
    Event OnUpdate()
        SetModifier(TroopEquipment)
        SetGuardEquipmentTiers()
        ReEquipGuards()
    EndEvent
    
EndState