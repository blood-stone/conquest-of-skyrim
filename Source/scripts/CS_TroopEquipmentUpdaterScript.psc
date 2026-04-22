Scriptname CS_TroopEquipmentUpdaterScript extends Quest  

FormList Property ItemListsMale Auto
FormList Property ItemListsFemale Auto
FormList Property OutfitListsMale Auto
FormList Property OutfitListsFemale Auto
FormList Property CS_GuardOutfitLists Auto
FormList Property CS_GuardItemLists Auto
FormList Property DestructionItemListsMale Auto
FormList Property DestructionItemListsFemale Auto
FormList Property DestructionOutfitListsMale Auto
FormList Property DestructionOutfitListsFemale Auto
FormList Property TroopLevels Auto

FormList[] Property TroopOutfits Auto
FormList[] Property TroopOutfitsCustom Auto
FormList[] Property TroopOutfitsCustomMale Auto
FormList[] Property TroopOutfitsCustomFemale Auto
FormList[] Property GuardOutfitsImp Auto
FormList[] Property GuardOutfitsSons Auto
FormList Property CS_GuardItems_Imperial Auto
FormList Property CS_GuardItems_Stormcloak Auto
FormList[] Property DestructionOutfitsCustom Auto
FormList[] Property DestructionOutfitsCustomMale Auto
FormList[] Property DestructionOutfitsCustomFemale Auto
FormList[] Property TroopWeapons Auto

FormList Property TroopsGenderedList Auto
FormList Property TroopsOutfitNums Auto
FormList Property DestructionGenderedList Auto
FormList Property DestructionOutfitNums Auto

FormList Property CS_AllLocations Auto

Keyword Property CWOwner Auto

GlobalVariable Property DestructionMageLevel Auto
GlobalVariable Property RestorationMageLevel Auto
GlobalVariable Property AlterationMageLevel Auto
GlobalVariable Property ConjurationMageLevel Auto

LeveledSpell Property DestructionLSpellsFire Auto
LeveledSpell Property DestructionLSpellsFrost Auto
LeveledSpell Property DestructionLSpellsShock Auto

CS_UpgradeTroopsMenu Property CS_UpgradeTroopsReport Auto

Function UpdateAllLists()
    debug.trace("Updating equipment lists")
    int i = 0
    while i < 9
        
        UpdateGuardList(i)

        if i != 5

            UpdateList(i)

        else

            int destructionmage = 1
            while destructionmage < 4
                
                UpdateList(i, destructionmage)
                destructionmage += 1
        
            endwhile

        endif

        i += 1

    endwhile
    debug.trace("Equipment lists updated")
EndFunction

Function UpdateGuardList(int citynum)
    (CS_GuardOutfitLists.GetAt(citynum) as LeveledItem).Revert()
    (CS_GuardItemLists.GetAt(citynum) as LeveledItem).Revert()
    
    FormList TroopOutfit
    FormList TroopItems
    if (CS_AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) == 1
        TroopOutfit = GuardOutfitsImp[citynum]
        TroopItems = CS_GuardItems_Imperial
    elseif (CS_AllLocations.GetAt(citynum) as Location).GetKeywordData(CWOwner) == 2
        TroopOutfit = GuardOutfitsSons[citynum]
        TroopItems = CS_GuardItems_Stormcloak
    endif
    int index = 0
    while index < TroopOutfit.GetSize()
        (CS_GuardOutfitLists.GetAt(citynum) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
        index += 1
    endwhile

    (CS_GuardItemLists.GetAt(citynum) as LeveledItem).AddForm(TroopItems.GetAt(0) as LeveledItem, 1, 1)
EndFunction

Function UpdateList(int i, int destructionmage = 0)
        if i != 5
            (OutfitListsMale.GetAt(i) as LeveledItem).Revert()
            (OutfitListsFemale.GetAt(i) as LeveledItem).Revert()
            (ItemListsMale.GetAt(i) as LeveledItem).Revert()
            (ItemListsFemale.GetAt(i) as LeveledItem).Revert()
        else
            (DestructionOutfitListsMale.GetAt(destructionmage) as LeveledItem).Revert()
            (DestructionOutfitListsFemale.GetAt(destructionmage) as LeveledItem).Revert()
        endif

        if i != 5

            if (TroopsOutfitNums.GetAt(i) as GlobalVariable).GetValue() != -1
    
                FormList TroopOutfit
                if i < 5
                    TroopOutfit = TroopOutfits[i].GetAt((TroopsOutfitNums.GetAt(i) as GlobalVariable).GetValueInt()) as FormList
                elseif i == 6
                    TroopOutfit = TroopOutfits[i].GetAt((RestorationMageLevel as GlobalVariable).GetValueInt() - 1) as FormList
                    debug.trace("Found troop outfit for restoration mage level " + (RestorationMageLevel as GlobalVariable).GetValueInt())
                elseif i == 7
                    TroopOutfit = TroopOutfits[i].GetAt((ConjurationMageLevel as GlobalVariable).GetValueInt() - 1) as FormList
                elseif i == 8
                    TroopOutfit = TroopOutfits[i].GetAt((AlterationMageLevel as GlobalVariable).GetValueInt() - 1) as FormList
                endif
                int index = 0
                while index < TroopOutfit.GetSize()
                    if i == 6
                        debug.trace("Adding Outfit to restoration mage, index = " + index)
                    endif
                    (OutfitListsMale.GetAt(i) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                    (OutfitListsFemale.GetAt(i) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                    index += 1
                endwhile

                if i < 5

                    FormList TroopWeapon = TroopWeapons[i]
                    (ItemListsMale.GetAt(i) as LeveledItem).AddForm(TroopWeapon.GetAt((TroopsOutfitNums.GetAt(i) as GlobalVariable).GetValueInt()) as LeveledItem, 1, 1)
                    (ItemListsFemale.GetAt(i) as LeveledItem).AddForm(TroopWeapon.GetAt((TroopsOutfitNums.GetAt(i) as GlobalVariable).GetValueInt()) as LeveledItem, 1, 1)
    
                endif

            else
    
                if (TroopsGenderedList.GetAt(i) as GlobalVariable).GetValue() != 1

                    FormList TroopOutfit = TroopOutfitsCustom[i]
                    int index = 0
                    while index < TroopOutfit.GetSize()
                        if TroopOutfit.GetAt(index) as Armor
                            (OutfitListsMale.GetAt(i) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                            (OutfitListsFemale.GetAt(i) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                        else
                            (ItemListsMale.GetAt(i) as LeveledItem).AddForm(TroopOutfit.GetAt(index), 1, 1)
                            (ItemListsFemale.GetAt(i) as LeveledItem).AddForm(TroopOutfit.GetAt(index), 1, 1)
                        endif
                        index += 1
                    endwhile
                    
                    if i < 5 ;Checks if the custom outfit has a weapon and if not, gives the best possible weapons unlocked
                    
                        if !GetHasWeapon(TroopOutfit)
                            int HighestWeaponNum = GetBestOutfitNum(i)
                            FormList TroopWeapon = TroopWeapons[i]
                            (ItemListsMale.GetAt(i) as LeveledItem).AddForm(TroopWeapon.GetAt(HighestWeaponNum) as LeveledItem, 1, 1)
                            (ItemListsFemale.GetAt(i) as LeveledItem).AddForm(TroopWeapon.GetAt(HighestWeaponNum) as LeveledItem, 1, 1)
                        endif
                        
                    endif

                else
    
                    FormList TroopOutfitMale = TroopOutfitsCustomMale[i]
                    int index = 0
                    while index < TroopOutfitMale.GetSize()
                        if TroopOutfitMale.GetAt(index) as Armor
                            (OutfitListsMale.GetAt(i) as LeveledItem).AddForm(TroopOutfitMale.GetAt(index) as Armor, 1, 1)
                        else
                            (ItemListsMale.GetAt(i) as LeveledItem).AddForm(TroopOutfitMale.GetAt(index), 1, 1)
                        endif
                        index += 1
                    endwhile
                
                    if i < 5 ;Checks if the custom outfit has a weapon and if not, gives the best possible weapons unlocked
                    
                        if !GetHasWeapon(TroopOutfitMale)
                            int HighestWeaponNum = GetBestOutfitNum(i)
                            FormList TroopWeapon = TroopWeapons[i]
                            (ItemListsMale.GetAt(i) as LeveledItem).AddForm(TroopWeapon.GetAt(HighestWeaponNum) as LeveledItem, 1, 1)
                        endif
                        
                    endif    

                    FormList TroopOutfitFemale = TroopOutfitsCustomFemale[i]
                    index = 0
                    while index < TroopOutfitFemale.GetSize()
                        if TroopOutfitFemale.GetAt(index) as Armor
                            (OutfitListsFemale.GetAt(i) as LeveledItem).AddForm(TroopOutfitFemale.GetAt(index) as Armor, 1, 1)
                        else
                            (ItemListsFemale.GetAt(i) as LeveledItem).AddForm(TroopOutfitFemale.GetAt(index), 1, 1)
                        endif
                        index += 1
                    endwhile
                    
                    if i < 5 ;Checks if the custom outfit has a weapon and if not, gives the best possible weapons unlocked
                    
                        if !GetHasWeapon(TroopOutfitFemale)
                            int HighestWeaponNum = GetBestOutfitNum(i)
                            FormList TroopWeapon = TroopWeapons[i]
                            (ItemListsFemale.GetAt(i) as LeveledItem).AddForm(TroopWeapon.GetAt(HighestWeaponNum) as LeveledItem, 1, 1)
                        endif
                        
                    endif

                endif

            endif

        else

                AddDestructionSpells(destructionmage)

                if (DestructionOutfitNums.GetAt(destructionmage) as GlobalVariable).GetValue() != -1
    
                    FormList TroopOutfit = TroopOutfits[i].GetAt(DestructionMageLevel.GetValueInt() - 1) as FormList
                    int index = 0
                    while index < TroopOutfit.GetSize()
                        (DestructionOutfitListsMale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                        (DestructionOutfitListsFemale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                        index += 1
                    endwhile

                else
    
                    if (DestructionGenderedList.GetAt(destructionmage) as GlobalVariable).GetValue() != 1
    
                        FormList TroopOutfit = DestructionOutfitsCustom[destructionmage]
                        int index = 0
                        while index < TroopOutfit.GetSize()
                            if TroopOutfit.GetAt(index) as Armor
                                (DestructionOutfitListsMale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                                (DestructionOutfitListsFemale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfit.GetAt(index) as Armor, 1, 1)
                            else
                                (DestructionItemListsMale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfit.GetAt(index), 1, 1)
                                (DestructionItemListsFemale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfit.GetAt(index), 1, 1)
                            endif
                            index += 1
                        endwhile

                    else

                        FormList TroopOutfitMale = DestructionOutfitsCustomMale[destructionmage]
                        int index = 0
                        while index < TroopOutfitMale.GetSize()
                            if TroopOutfitMale.GetAt(index) as Armor
                                (DestructionOutfitListsMale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfitMale.GetAt(index) as Armor, 1, 1)
                            else
                                (DestructionItemListsMale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfitMale.GetAt(index), 1, 1)
                            endif
                            index += 1
                        endwhile        
    
                        FormList TroopOutfitFemale = DestructionOutfitsCustomFemale[destructionmage]
                        index = 0
                        while index < TroopOutfitFemale.GetSize()
                            if TroopOutfitFemale.GetAt(index) as Armor
                                (DestructionOutfitListsFemale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfitFemale.GetAt(index) as Armor, 1, 1)
                            else
                                (DestructionItemListsFemale.GetAt(destructionmage) as LeveledItem).AddForm(TroopOutfitFemale.GetAt(index), 1, 1)
                            endif
                            index += 1
                        endwhile
    
                    endif   

                endif

            endif
EndFunction

Function AddDestructionSpells(int destructionmage)

        int i = 0
        if DestructionMageLevel.GetValueInt() == 5
            i = 1
        endif

            If destructionmage == 1
                DestructionLSpellsFire.Revert()
                while i < DestructionMageLevel.GetValueInt()
                    DestructionLSpellsFire.AddForm(CS_UpgradeTroopsReport.DestructionSpellsFire.GetAt(i) as Spell, 1)
                    i += 1
                endwhile
            ElseIf destructionmage == 2
                DestructionLSpellsFrost.Revert()
                while i < DestructionMageLevel.GetValueInt()
                    DestructionLSpellsFrost.AddForm(CS_UpgradeTroopsReport.DestructionSpellsFrost.GetAt(i) as Spell, 1)
                    i += 1
                endwhile
            ElseIf destructionmage == 3
                DestructionLSpellsShock.Revert()
                while i < DestructionMageLevel.GetValueInt()
                    DestructionLSpellsShock.AddForm(CS_UpgradeTroopsReport.DestructionSpellsShock.GetAt(i) as Spell, 1)
                    i += 1
                endwhile
            EndIf

EndFunction
        
int Function GetBestOutfitNum(int TroopNum)
    int TroopLevel = (TroopLevels.GetAt(TroopNum) as GlobalVariable).GetValueInt()
    
    if TroopNum == 0 || TroopNum == 1 || TroopNum == 4
        if TroopLevel < 3
            return 0
        elseif TroopLevel < 5 && TroopLevel >= 3
            return 1
        elseif TroopLevel == 5
            return 2
        elseif TroopLevel == 6
            return 3
        elseif TroopLevel < 9 && TroopLevel >= 7
            return 4
        elseif TroopLevel == 9
            return 5
        else
            return 6
        endif
    elseif TroopNum == 2 || TroopNum == 3
        if TroopLevel < 2
            return 0
        elseif TroopLevel == 2
            return 1
        elseif TroopLevel < 5 && TroopLevel >= 3
            return 2
        elseif TroopLevel < 7 && TroopLevel >= 5
            return 3
        elseif TroopLevel == 7
            return 4
        elseif TroopLevel < 10 && TroopLevel >= 8
            return 5
        else
            return 6
        endif
    endif
EndFunction
        
bool Function GetHasWeapon(FormList OutfitList)
    int i = 0
    bool HasWeapon = false
    while i < OutfitList.GetSize() && HasWeapon == false
        if (OutfitList.GetAt(i) as Weapon)
            HasWeapon = true
        endif
        i += 1
    endwhile
    
    return HasWeapon
EndFunction

Event OnInIt()
    UpdateAllLists()
EndEvent