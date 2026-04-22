Scriptname CS_CustomEquipmentTroopActorScript extends Actor  

import CS_CommonFunctions

CS_FactionManagementMilitary Property MilitaryScript Auto
CS_FactionMilitaryReportScript Property CS_FactionMilitaryReport Auto

int Property TroopType Auto hidden
int Property gender Auto hidden
CS_ArmyUnitAliasScript Property UnitScript Auto hidden

State TroopReady

    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        if akBaseItem as Armor
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomOutfitSoldierMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitSoldierMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitSoldierFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitSoldierFemale)
                else
                    MilitaryScript.CustomOutfitSoldier = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitSoldier)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomOutfitWarriorMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitWarriorMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitWarriorFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitWarriorFemale)
                else
                    MilitaryScript.CustomOutfitWarrior = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitWarrior)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomOutfitArcherMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitArcherMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitArcherFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitArcherFemale)
                else
                    MilitaryScript.CustomOutfitArcher = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitArcher)
                endif
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomOutfitCrossbowMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCrossbowFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowFemale)
                else
                    MilitaryScript.CustomOutfitCrossbow = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbow)
                endif
            elseif trooptype == 4
                if gender == 0
                    MilitaryScript.CustomOutfitMageDestructionFireMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFireMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageDestructionFireFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFireFemale)
                else
                    MilitaryScript.CustomOutfitMageDestructionFire = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFire)
                endif
            elseif trooptype == 5
                if gender == 0
                    MilitaryScript.CustomOutfitMageDestructionFrostMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFrostMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageDestructionFrostFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFrostFemale)
                else
                    MilitaryScript.CustomOutfitMageDestructionFrost = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFrost)
                endif
            elseif trooptype == 6
                if gender == 0
                    MilitaryScript.CustomOutfitMageDestructionShockMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionShockMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageDestructionShockFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionShockFemale)
                else
                    MilitaryScript.CustomOutfitMageDestructionShock = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionShock)
                endif
            elseif trooptype == 7
                if gender == 0
                    MilitaryScript.CustomOutfitMageRestorationMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageRestorationMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageRestorationFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageRestorationFemale)
                else
                    MilitaryScript.CustomOutfitMageRestoration = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageRestoration)
                endif
            elseif trooptype == 8
                if gender == 0
                    MilitaryScript.CustomOutfitMageConjurationMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageConjurationMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageConjurationFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageConjurationFemale)
                else
                    MilitaryScript.CustomOutfitMageConjuration = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageConjuration)
                endif
            elseif trooptype == 9
                if gender == 0
                    MilitaryScript.CustomOutfitMageAlterationMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageAlterationMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageAlterationFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageAlterationFemale)
                else
                    MilitaryScript.CustomOutfitMageAlteration = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageAlteration)
                endif
            endif
        elseif akBaseItem as Form
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomItemsSoldierMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsSoldierMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsSoldierFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsSoldierFemale)
                else
                    MilitaryScript.CustomItemsSoldier = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsSoldier)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomItemsWarriorMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsWarriorMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsWarriorFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsWarriorFemale)
                else
                    MilitaryScript.CustomItemsWarrior = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsWarrior)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomItemsArcherMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsArcherMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsArcherFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsArcherFemale)
                else
                    MilitaryScript.CustomItemsArcher = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsArcher)
                endif
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomItemsCrossbowMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCrossbowFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbowFemale)
                else
                    MilitaryScript.CustomItemsCrossbow = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbow)
                endif
            elseif trooptype == 4
                if gender == 0
                    MilitaryScript.CustomItemsMageDestructionFireMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFireMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageDestructionFireFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFireFemale)
                else
                    MilitaryScript.CustomItemsMageDestructionFire = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFire)
                endif
            elseif trooptype == 5
                if gender == 0
                    MilitaryScript.CustomItemsMageDestructionFrostMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFrostMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageDestructionFrostFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFrostFemale)
                else
                    MilitaryScript.CustomItemsMageDestructionFrost = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFrost)
                endif
            elseif trooptype == 6
                if gender == 0
                    MilitaryScript.CustomItemsMageDestructionShockMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionShockMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageDestructionShockFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionShockFemale)
                else
                    MilitaryScript.CustomItemsMageDestructionShock = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionShock)
                endif
            elseif trooptype == 7
                if gender == 0
                    MilitaryScript.CustomItemsMageRestorationMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageRestorationMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageRestorationFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageRestorationFemale)
                else
                    MilitaryScript.CustomItemsMageRestoration = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageRestoration)
                endif
            elseif trooptype == 8
                if gender == 0
                    MilitaryScript.CustomItemsMageConjurationMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageConjurationMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageConjurationFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageConjurationFemale)
                else
                    MilitaryScript.CustomItemsMageConjuration = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageConjuration)
                endif
            elseif trooptype == 9
                if gender == 0
                    MilitaryScript.CustomItemsMageAlterationMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageAlterationMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageAlterationFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageAlterationFemale)
                else
                    MilitaryScript.CustomItemsMageAlteration = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsMageAlteration)
                endif
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedTroop = true
    EndEvent

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akBaseItem as Armor
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomOutfitSoldierMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitSoldierMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitSoldierFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitSoldierFemale)
                else
                    MilitaryScript.CustomOutfitSoldier = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitSoldier)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomOutfitWarriorMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitWarriorMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitWarriorFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitWarriorFemale)
                else
                    MilitaryScript.CustomOutfitWarrior = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitWarrior)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomOutfitArcherMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitArcherMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitArcherFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitArcherFemale)
                else
                    MilitaryScript.CustomOutfitArcher = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitArcher)
                endif
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomOutfitCrossbowMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCrossbowFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowFemale)
                else
                    MilitaryScript.CustomOutfitCrossbow = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbow)
                endif
            elseif trooptype == 4
                if gender == 0
                    MilitaryScript.CustomOutfitMageDestructionFireMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFireMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageDestructionFireFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFireFemale)
                else
                    MilitaryScript.CustomOutfitMageDestructionFire = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFire)
                endif
            elseif trooptype == 5
                if gender == 0
                    MilitaryScript.CustomOutfitMageDestructionFrostMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFrostMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageDestructionFrostFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFrostFemale)
                else
                    MilitaryScript.CustomOutfitMageDestructionFrost = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionFrost)
                endif
            elseif trooptype == 6
                if gender == 0
                    MilitaryScript.CustomOutfitMageDestructionShockMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionShockMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageDestructionShockFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionShockFemale)
                else
                    MilitaryScript.CustomOutfitMageDestructionShock = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageDestructionShock)
                endif
            elseif trooptype == 7
                if gender == 0
                    MilitaryScript.CustomOutfitMageRestorationMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageRestorationMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageRestorationFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageRestorationFemale)
                else
                    MilitaryScript.CustomOutfitMageRestoration = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageRestoration)
                endif
            elseif trooptype == 8
                if gender == 0
                    MilitaryScript.CustomOutfitMageConjurationMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageConjurationMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageConjurationFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageConjurationFemale)
                else
                    MilitaryScript.CustomOutfitMageConjuration = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageConjuration)
                endif
            elseif trooptype == 9
                if gender == 0
                    MilitaryScript.CustomOutfitMageAlterationMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageAlterationMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitMageAlterationFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageAlterationFemale)
                else
                    MilitaryScript.CustomOutfitMageAlteration = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitMageAlteration)
                endif
            endif
        elseif akBaseItem as Form
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomItemsSoldierMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsSoldierMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsSoldierFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsSoldierFemale)
                else
                    MilitaryScript.CustomItemsSoldier = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsSoldier)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomItemsWarriorMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsWarriorMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsWarriorFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsWarriorFemale)
                else
                    MilitaryScript.CustomItemsWarrior = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsWarrior)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomItemsArcherMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsArcherMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsArcherFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsArcherFemale)
                else
                    MilitaryScript.CustomItemsArcher = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsArcher)
                endif
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomItemsCrossbowMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCrossbowFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbowFemale)
                else
                    MilitaryScript.CustomItemsCrossbow = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbow)
                endif
            elseif trooptype == 4
                if gender == 0
                    MilitaryScript.CustomItemsMageDestructionFireMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFireMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageDestructionFireFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFireFemale)
                else
                    MilitaryScript.CustomItemsMageDestructionFire = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFire)
                endif
            elseif trooptype == 5
                if gender == 0
                    MilitaryScript.CustomItemsMageDestructionFrostMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFrostMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageDestructionFrostFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFrostFemale)
                else
                    MilitaryScript.CustomItemsMageDestructionFrost = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionFrost)
                endif
            elseif trooptype == 6
                if gender == 0
                    MilitaryScript.CustomItemsMageDestructionShockMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionShockMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageDestructionShockFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionShockFemale)
                else
                    MilitaryScript.CustomItemsMageDestructionShock = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageDestructionShock)
                endif
            elseif trooptype == 7
                if gender == 0
                    MilitaryScript.CustomItemsMageRestorationMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageRestorationMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageRestorationFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageRestorationFemale)
                else
                    MilitaryScript.CustomItemsMageRestoration = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageRestoration)
                endif
            elseif trooptype == 8
                if gender == 0
                    MilitaryScript.CustomItemsMageConjurationMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageConjurationMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageConjurationFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageConjurationFemale)
                else
                    MilitaryScript.CustomItemsMageConjuration = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageConjuration)
                endif
            elseif trooptype == 9
                if gender == 0
                    MilitaryScript.CustomItemsMageAlterationMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageAlterationMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsMageAlterationFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageAlterationFemale)
                else
                    MilitaryScript.CustomItemsMageAlteration = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsMageAlteration)
                endif
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedTroop = true
    EndEvent
    
EndState

State CommanderReady

    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        if akBaseItem as Armor
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomOutfitCommanderRegimentMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderRegimentMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCommanderRegimentFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderRegimentFemale)
                else
                    MilitaryScript.CustomOutfitCommanderRegiment = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderRegiment)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomOutfitCommanderDivisionMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderDivisionMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCommanderDivisionFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderDivisionFemale)
                else
                    MilitaryScript.CustomOutfitCommanderDivision = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderDivision)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomOutfitCommanderArmyMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderArmyMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCommanderArmyFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderArmyFemale)
                else
                    MilitaryScript.CustomOutfitCommanderArmy = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderArmy)
                endif;/
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomOutfitCrossbowMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCrossbowFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowFemale)
                else
                    MilitaryScript.CustomOutfitCrossbow = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbow)
                endif/;
            endif
        elseif akBaseItem as Form
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomItemsCommanderRegimentMale = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderRegimentMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCommanderRegimentFemale = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderRegimentFemale)
                else
                    MilitaryScript.CustomItemsCommanderRegiment = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderRegiment)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomItemsCommanderDivisionMale = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderDivisionMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCommanderDivisionFemale = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderDivisionFemale)
                else
                    MilitaryScript.CustomItemsCommanderDivision = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderDivision)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomItemsCommanderArmyMale = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderArmyMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCommanderArmyFemale = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderArmyFemale)
                else
                    MilitaryScript.CustomItemsCommanderArmy = AddToFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderArmy)
                endif
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedCommander = true
    EndEvent

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akBaseItem as Armor
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomOutfitCommanderRegimentMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderRegimentMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCommanderRegimentFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderRegimentFemale)
                else
                    MilitaryScript.CustomOutfitCommanderRegiment = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderRegiment)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomOutfitCommanderDivisionMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderDivisionMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCommanderDivisionFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderDivisionFemale)
                else
                    MilitaryScript.CustomOutfitCommanderDivision = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderDivision)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomOutfitCommanderArmyMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderArmyMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCommanderArmyFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderArmyFemale)
                else
                    MilitaryScript.CustomOutfitCommanderArmy = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCommanderArmy)
                endif;/
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomOutfitCrossbowMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomOutfitCrossbowFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbowFemale)
                else
                    MilitaryScript.CustomOutfitCrossbow = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitCrossbow)
                endif/;
            endif
        elseif akBaseItem as Form
            if trooptype == 0
                if gender == 0
                    MilitaryScript.CustomItemsCommanderRegimentMale = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderRegimentMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCommanderRegimentFemale = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderRegimentFemale)
                else
                    MilitaryScript.CustomItemsCommanderRegiment = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderRegiment)
                endif
            elseif trooptype == 1
                if gender == 0
                    MilitaryScript.CustomItemsCommanderDivisionMale = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderDivisionMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCommanderDivisionFemale = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderDivisionFemale)
                else
                    MilitaryScript.CustomItemsCommanderDivision = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderDivision)
                endif
            elseif trooptype == 2
                if gender == 0
                    MilitaryScript.CustomItemsCommanderArmyMale = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderArmyMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCommanderArmyFemale = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderArmyFemale)
                else
                    MilitaryScript.CustomItemsCommanderArmy = RemoveFromFormArray(akBaseItem as Form, MilitaryScript.CustomItemsCommanderArmy)
                endif;/
            elseif trooptype == 3
                if gender == 0
                    MilitaryScript.CustomItemsCrossbowMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbowMale)
                elseif gender == 1
                    MilitaryScript.CustomItemsCrossbowFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbowFemale)
                else
                    MilitaryScript.CustomItemsCrossbow = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsCrossbow)
                endif/;
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedCommander = true
    EndEvent
    
EndState

State GuardReady

    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        if akBaseItem as Armor
            if gender == 0
                MilitaryScript.CustomOutfitGuardMale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitGuardMale)
            elseif gender == 1
                MilitaryScript.CustomOutfitGuardFemale = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitGuardFemale)
            else
                MilitaryScript.CustomOutfitGuard = AddToArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitGuard)
            endif
        elseif akBaseItem as Form
            if gender == 0
                MilitaryScript.CustomItemsGuardMale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsGuardMale)
            elseif gender == 1
                MilitaryScript.CustomItemsGuardFemale = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsGuardFemale)
            else
                MilitaryScript.CustomItemsGuard = AddToFormArray(akBaseItem, MilitaryScript.CustomItemsGuard)
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedTroop = true
    EndEvent

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akBaseItem as Armor
            if gender == 0
                MilitaryScript.CustomOutfitGuardMale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitGuardMale)
            elseif gender == 1
                MilitaryScript.CustomOutfitGuardFemale = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitGuardFemale)
            else
                MilitaryScript.CustomOutfitGuard = RemoveFromArmorArray(akBaseItem as Armor, MilitaryScript.CustomOutfitGuard)
            endif
        elseif akBaseItem as Form
            if gender == 0
                MilitaryScript.CustomItemsGuardMale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsGuardMale)
            elseif gender == 1
                MilitaryScript.CustomItemsGuardFemale = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsGuardFemale)
            else
                MilitaryScript.CustomItemsGuard = RemoveFromFormArray(akBaseItem, MilitaryScript.CustomItemsGuard)
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedTroop = true
    EndEvent
    
EndState

State UnitReady
    
    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        if akBaseItem as Armor
            int itemindex = UnitScript.CustomEquipment.Find(akBaseItem as Armor)
            if itemindex < 0
                UnitScript.CustomEquipment = AddToArmorArray(akBaseItem as Armor, UnitScript.CustomEquipment)
            endif
        else
            int itemindex = UnitScript.CustomItems.Find(akBaseItem)
            if itemindex < 0
                UnitScript.CustomItems = AddToFormArray(akBaseItem, UnitScript.CustomItems)
                UnitScript.CustomItemsAmount = AddToIntArray(aiItemCount, UnitScript.CustomItemsAmount)
            else
                UnitScript.CustomItemsAmount[itemindex] = GetItemCount(akBaseItem)
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedUnit = true
    EndEvent
    
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        if akBaseItem as Armor
            int itemindex = UnitScript.CustomEquipment.Find(akBaseItem as Armor)
            if GetItemCount(akBaseItem) == 0
                UnitScript.CustomEquipment = RemoveFromArmorArray(akBaseItem as Armor, UnitScript.CustomEquipment)
            endif
        else
            int itemindex = UnitScript.CustomItems.Find(akBaseItem)
            if GetItemCount(akBaseItem) == 0
                UnitScript.CustomItemsAmount[itemindex] = -42069
                UnitScript.CustomItems = RemoveFromFormArray(akBaseItem, UnitScript.CustomItems)
                UnitScript.CustomItemsAmount = RemoveFromIntArray(-42069, UnitScript.CustomItemsAmount)
            endif
        endif
        (CS_FactionMilitaryReport as CS_FactionMilitaryReportScript).ModifiedUnit = true
    EndEvent
    
EndState