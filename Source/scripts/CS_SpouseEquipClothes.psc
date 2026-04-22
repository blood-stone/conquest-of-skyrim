Scriptname CS_SpouseEquipClothes extends ReferenceAlias  

Faction Property CustomOutfitFaction Auto
Faction Property DefaultOutfitFaction Auto

FormList Property CustomOutfit Auto
FormList Property DefaultOutfit Auto

Event OnCellAttach()
    EquipOutfit()
EndEvent

Function EquipOutfit()
    Actor Person = GetActorRef()
    
    if Person.IsInFaction(CustomOutfitFaction)

        Person.UnequipAll()

        debug.trace("Person in faction")
        int i = 0
        while i < CustomOutfit.GetSize()
            debug.trace("Equipping items...")
            Person.AddItem(CustomOutfit.GetAt(i) as Armor, 1)
            Person.EquipItem(CustomOutfit.GetAt(i) as Armor, true)
            i += 1
        endwhile

    elseif Person.IsInFaction(DefaultOutfitFaction)

        Person.UnequipAll()
                
        int i = 0
        while i < DefaultOutfit.GetSize()
            Person.AddItem(DefaultOutfit.GetAt(i) as Armor, 1)
            Person.EquipItem(DefaultOutfit.GetAt(i) as Armor, true)
        i += 1
        endwhile        
        
    endif
EndFunction