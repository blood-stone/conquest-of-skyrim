Scriptname CS_GovUpdateOutfit extends ReferenceAlias  

FormList Property CustomOutfit Auto

Event OnLoad()
    debug.trace("Updating gov outfit...")
    UpdateGovOutfit()
    debug.trace("Gov Outfit updated")
EndEvent

Function UpdateGovOutfit()

    CS_GovScriptFunctions GovScriptFunctions = GetOwningQuest() as CS_GovScriptFunctions
    CS_RecruitJarl RecruitJarl = GetOwningQuest() as CS_RecruitJarl
    Actor Person = GetActorRef()

    if Person.IsInFaction(GovScriptFunctions.JarlFaction) || Person.IsInFaction(GovScriptFunctions.VillageLeaderFaction)

        int index = RecruitJarl.JarlAliases.Find(self)
                
        if Person.IsInFaction(GovScriptFunctions.CustomOutfitFaction)

            Person.UnequipAll()

            debug.trace("Person in faction")
            int i = 0
            while i < CustomOutfit.GetSize()
                debug.trace("Equipping items...")
                Person.AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                Person.EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                i += 1
            endwhile

        elseif Person.IsInFaction(GovScriptFunctions.DefaultOutfitFaction)

            Person.UnequipAll()
                    
            int i = 0
            FormList JarlDefaultOutfit = GovScriptFunctions.JarlDefaultOutfits[index]
            while i < JarlDefaultOutfit.GetSize()
                Person.AddItem(JarlDefaultOutfit.GetAt(i) as Armor, 1)
                Person.EquipItem(JarlDefaultOutfit.GetAt(i) as Armor, true)
            i += 1
            endwhile        
            
        endif

    elseif Person.IsInFaction(GovScriptFunctions.StewardFaction) && Person != GovScriptFunctions.Steward.GetActorRef()

        int index = RecruitJarl.JarlAliases.Find(self)
                
        if Person.IsInFaction(GovScriptFunctions.CustomOutfitFaction)

            Person.UnequipAll()

            debug.trace("Person in faction")
            int i = 0
            while i < CustomOutfit.GetSize()
                debug.trace("Equipping items...")
                Person.AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                Person.EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                i += 1
            endwhile

        elseif Person.IsInFaction(GovScriptFunctions.DefaultOutfitFaction)

            Person.UnequipAll()
                    
            int i = 0
            FormList StewardDefaultOutfit = GovScriptFunctions.StewardDefaultOutfit
            while i < StewardDefaultOutfit.GetSize()
                Person.AddItem(StewardDefaultOutfit.GetAt(i) as Armor, 1)
                Person.EquipItem(StewardDefaultOutfit.GetAt(i) as Armor, true)
            i += 1
            endwhile        
            
        endif

    elseif Person.IsInFaction(GovScriptFunctions.HousecarlFaction) && Person != GovScriptFunctions.ASIC.GetActorRef()

        int index = RecruitJarl.JarlAliases.Find(self)
                
        if Person.IsInFaction(GovScriptFunctions.CustomOutfitFaction)

            Person.UnequipAll()

            debug.trace("Person in faction")
            int i = 0
            while i < CustomOutfit.GetSize()
                debug.trace("Equipping items...")
                Person.AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                Person.EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                i += 1
            endwhile

        elseif Person.IsInFaction(GovScriptFunctions.DefaultOutfitFaction)

            Person.UnequipAll()
                    
            int i = 0
            FormList HousecarlDefaultOutfit = GovScriptFunctions.HousecarlDefaultOutfit
            while i < HousecarlDefaultOutfit .GetSize()
                Person.AddItem(HousecarlDefaultOutfit .GetAt(i) as Armor, 1)
                Person.EquipItem(HousecarlDefaultOutfit .GetAt(i) as Armor, true)
            i += 1
            endwhile        
            
        endif

    else

        int index = GovScriptFunctions.GovPositions.Find(self)

        if Person.IsInFaction(GovScriptFunctions.CustomOutfitFaction)

            Person.UnequipAll()

            debug.trace("Person in faction")
            int i = 0
            while i < CustomOutfit.GetSize()
                debug.trace("Equipping items...")
                if Person.IsEquipped(CustomOutfit.GetAt(i) as Armor) != true
                    if Person.GetItemCount(CustomOutfit.GetAt(i) as Armor) < 1
                        Person.AddItem(CustomOutfit.GetAt(i) as Armor, 1)
                    endif
                    Person.EquipItem(CustomOutfit.GetAt(i) as Armor, true)
                endif
                i += 1
            endwhile

        elseif Person.IsInFaction(GovScriptFunctions.DefaultOutfitFaction)

            Person.UnequipAll()

            int i = 0
            FormList GovDefaultOutfit = GovScriptFunctions.GovDefaultOutfits[index]
            while i < GovDefaultOutfit.GetSize()
                if Person.IsEquipped(GovDefaultOutfit.GetAt(i) as Armor) != true
                    if Person.GetItemCount(GovDefaultOutfit.GetAt(i) as Armor) < 1
                        Person.AddItem(GovDefaultOutfit.GetAt(i) as Armor, 1)
                    endif
                    Person.EquipItem(GovDefaultOutfit.GetAt(i) as Armor, true)
                endif
                i += 1
            endwhile        
            
        endif
            
    endif


EndFunction