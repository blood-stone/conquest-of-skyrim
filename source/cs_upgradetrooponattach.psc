Scriptname CS_UpgradeTroopOnAttach extends Actor

CS_UpgradeTroopsMenu Property CS_UpgradeTroopsReport Auto
bool Property NoArmy Auto
bool Property FlaggedForReset Auto
bool Property FlaggedForDeath Auto

int Property armynum Auto

Event OnLoad()
    debug.trace("Upgrade Troop " + self + " triggered from load")
    UpgradeTroop(self)
EndEvent

Event OnInIt()
    if Is3DLoaded()
        debug.trace("Upgrading troop " + self + " triggered from oninit")
        UpgradeTroop(self)
    endif
EndEvent

Function AssignTitle()
    CS_UpgradeTroopsReport.OutfitChanger.ForceRefTo(self)
    ;CS_UpgradeTroopsReport.OutfitChanger.Clear()
EndFunction

Function UpgradeTroop(Actor Troop)

        int TroopType = CS_UpgradeTroopsReport.BaseTroop.Find(Troop.GetActorBase())

        if TroopType < 0
            TroopType = 0
            NoArmy = true
        endif

        AssignTitle()

    if !Troop.IsInFaction(CS_UpgradeTroopsReport.CreatureFaction) && !Troop.IsInFaction(CS_UpgradeTroopsReport.DwarvenFaction)

        if !CS_UpgradeTroopsReport.AllowedRaces.HasForm(Troop.GetRace()) || FlaggedForReset
        
                FlaggedForReset = false
                debug.trace("Resetting troop " + self + ", type = " + TroopType + "...")
                Troop.reset(self)

            else

            ;if (CS_UpgradeTroopsReport.AllArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).IsVampire && !Troop.IsInFaction(CS_UpgradeTroopsReport.CreatureFaction)
            ;   Troop.SetEyeTexture(CS_UpgradeTroopsReport.RedEyeTexture)
            ;   Troop.AddPerk(CS_UpgradeTroopsReport.VampirePerk1)
            ;endif

            AddArmyEquipment()

        ;   if TroopType < 4
        ;           if CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() == -1
        ;               if CS_UpgradeTroopsReport.CustomOutfitsGendered[TroopType].GetValue() == 1
        ;                   if Troop.GetLeveledActorBase().GetSex() == 0
        ;                       if !HasAllItems(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType])
        ;                           debug.trace("Upgrading troop...")
        ;                           Troop.RemoveAllItems()
        ;                           AddArmyEquipment()
        ;                           int outfitpiece = 0
        ;                           while outfitpiece < CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetSize()
        ;                               if Troop.GetItemCount(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece)) == 0
        ;                                   if CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece) as Ammo != None
        ;                                       Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece), 200)
        ;                                   else
        ;                                       Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece), 1)
        ;                                   endif
        ;                               endif
        ;                               if CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece) as Armor != None
        ;                                   Troop.EquipItem(CS_UpgradeTroopsReport.CustomOutfitsMale[TroopType].GetAt(outfitpiece), true)
        ;                               endif
        ;                               outfitpiece += 1
        ;                           endwhile
        ;                       endif
        ;                   elseif Troop.GetLeveledActorBase().GetSex() == 1
        ;                       if !HasAllItems(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType])
        ;                           debug.trace("Upgrading troop...")
        ;                           Troop.RemoveAllItems()
        ;                           AddArmyEquipment()
        ;                           int outfitpiece = 0
        ;                           while outfitpiece < CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetSize()
        ;                               if Troop.GetItemCount(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece)) == 0
        ;                                   if CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece) as Ammo != None
        ;                                       Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece), 200)
        ;                                   else
        ;                                       Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece), 1)
        ;                                   endif
        ;                               endif
        ;                               if CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece) as Armor != None
        ;                                   Troop.EquipItem(CS_UpgradeTroopsReport.CustomOutfitsFemale[TroopType].GetAt(outfitpiece), true)
        ;                               endif
        ;                               outfitpiece += 1
        ;                           endwhile
        ;                       endif
        ;                   endif
        ;               else
        ;                   if !HasAllItems(CS_UpgradeTroopsReport.CustomOutfits[TroopType])
        ;                       debug.trace("Upgrading troop...")
        ;                       Troop.RemoveAllItems()
        ;                       AddArmyEquipment()
        ;                       int outfitpiece = 0
        ;                       while outfitpiece < CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetSize()
        ;                           if Troop.GetItemCount(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece)) == 0
        ;                               if CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece) as Ammo != None
        ;                                   Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece), 200)
        ;                               else
        ;                                   Troop.AddItem(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece), 1)
        ;                               endif
        ;                           endif
        ;                           if CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece) as Armor != None
        ;                               Troop.EquipItem(CS_UpgradeTroopsReport.CustomOutfits[TroopType].GetAt(outfitpiece), true)
        ;                           endif
        ;                           outfitpiece += 1
        ;                       endwhile
        ;                   endif
        ;               endif
        ;           else
        ;               FormList NewOutfit = (CS_UpgradeTroopsReport.Outfits[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int) as FormList)
        ;               If !HasAllItems(NewOutfit) || !HasAllItems(CS_UpgradeTroopsReport.CustomOutfitsArmy.GetAt(armynum) as FormList)
        ;                   debug.trace("Upgrading troop...")
        ;                   Troop.RemoveAllItems()
        ;                   AddArmyEquipment()
        ;                   int outfitpiece = 0
        ;                   while outfitpiece < NewOutfit.GetSize()
        ;                       Troop.EquipItem(NewOutfit.GetAt(outfitpiece) as Armor, true)
        ;                       outfitpiece += 1
        ;                   endwhile
        ;                   if TroopType < 5
        ;                       if CS_UpgradeTroopsReport.Swords[TroopType]
        ;                           Troop.AddItem((CS_UpgradeTroopsReport.Swords[TroopType].GetAt(utility.randomint(0, CS_UpgradeTroopsReport.Swords[TroopType].GetSize() - 1)) as FormList).GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int) as Weapon, 1)
        ;                       endif
;
;                               if CS_UpgradeTroopsReport.Shields[TroopType]
;                                   Troop.EquipItem(CS_UpgradeTroopsReport.Shields[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int) as Armor)
;                               endif
;
;                               if CS_UpgradeTroopsReport.Bows[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int)
;                                   Troop.AddItem(CS_UpgradeTroopsReport.Bows[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int) as Weapon, 1)
;                               endif
;
;                               if CS_UpgradeTroopsReport.Crossbows[TroopType]
;                                   Troop.AddItem(CS_UpgradeTroopsReport.Crossbows[TroopType], 1)
;                               endif
;
;                               if CS_UpgradeTroopsReport.Ammos[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int)
;                                   Troop.AddItem(CS_UpgradeTroopsReport.Ammos[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int) as Ammo, 100)
;                                   Troop.EquipItem(CS_UpgradeTroopsReport.Ammos[TroopType].GetAt(CS_UpgradeTroopsReport.OutfitNum[TroopType].GetValue() as int) as Ammo)
;                               endif
;
;;                              If TroopType == 3
;                                   Troop.AddItem(CS_UpgradeTroopsReport.CrossbowBolts, 100)
;                                   Troop.EquipItem(CS_UpgradeTroopsReport.CrossbowBolts)
;                               EndIf
;                           endif
;                       EndIf
;                   endif
;           if TroopType >= 5 && TroopType < 9
;               int MageTroopType
;               if destructionmagetype == 1
;                   MageTroopType = 0
;                   AddDestructionSpells(Troop, MageTroopType)
;               elseif destructionmagetype == 2
;                   MageTroopType = 1
;                   AddDestructionSpells(Troop, MageTroopType)
;               elseif destructionmagetype == 3
;                   MageTroopType = 2
;                   AddDestructionSpells(Troop, MageTroopType)
;               elseif TroopType == 6
;                   MageTroopType = 3
;               elseif TroopType == 7
;                   MageTroopType = 4
;               elseif TroopType == 8
;                   MageTroopType = 5
;               endif
;                   if CS_UpgradeTroopsReport.MageOutfitNums[MageTroopType].GetValue() == -1
;                       if CS_UpgradeTroopsReport.CustomOutfitsGenderedMage[MageTroopType].GetValue() == 1
;                           if Troop.GetLeveledActorBase().GetSex() == 0
;                               if !HasAllItems(CS_UpgradeTroopsReport.CustomMageOutfitsMale.GetAt(MageTroopType) as FormList)
;                                   debug.trace("Upgrading troop...")
;                                   Troop.RemoveAllItems()
;                                   AddArmyEquipment()
;                                   int outfitpiece = 0
;                                   while outfitpiece < (CS_UpgradeTroopsReport.CustomMageOutfitsMale.GetAt(MageTroopType) as FormList).GetSize()
;                                       if Troop.GetItemCount((CS_UpgradeTroopsReport.CustomMageOutfitsMale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece)) == 0
;                                           Troop.AddItem((CS_UpgradeTroopsReport.CustomMageOutfitsMale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece), 1)
;                                       endif
;                                       if (CS_UpgradeTroopsReport.CustomMageOutfitsMale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece) as Armor != None
;                                           Troop.EquipItem((CS_UpgradeTroopsReport.CustomMageOutfitsMale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece), true)
;                                       endif
;                                       outfitpiece += 1
;                                   endwhile
;                               endif
;                           elseif Troop.GetLeveledActorBase().GetSex() == 1
;                               if !HasAllItems(CS_UpgradeTroopsReport.CustomMageOutfitsFemale.GetAt(MageTroopType) as FormList)
;                                   debug.trace("Upgrading troop...")
;                                   Troop.RemoveAllItems()
;                                   AddArmyEquipment()
;                                   int outfitpiece = 0
;                                   while outfitpiece < (CS_UpgradeTroopsReport.CustomMageOutfitsFemale.GetAt(MageTroopType) as FormList).GetSize()
;                                       if Troop.GetItemCount((CS_UpgradeTroopsReport.CustomMageOutfitsFemale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece)) == 0
;                                           Troop.AddItem((CS_UpgradeTroopsReport.CustomMageOutfitsFemale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece), 1)
;                                       endif
;                                       if (CS_UpgradeTroopsReport.CustomMageOutfitsFemale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece) as Armor != None
;                                           Troop.EquipItem((CS_UpgradeTroopsReport.CustomMageOutfitsFemale.GetAt(MageTroopType) as FormList).GetAt(outfitpiece), true)
;                                       endif
;                                       outfitpiece += 1
;                                   endwhile
;                               endif
;                           endif
;                       else
;                           if !HasAllItems(CS_UpgradeTroopsReport.CustomMageOutfits.GetAt(MageTroopType) as FormList)
;                               debug.trace("Upgrading troop...")
;                               Troop.RemoveAllItems()
;                               AddArmyEquipment()
;                               int outfitpiece = 0
;                               while outfitpiece < (CS_UpgradeTroopsReport.CustomMageOutfits.GetAt(MageTroopType) as FormList).GetSize()
;                                   if Troop.GetItemCount((CS_UpgradeTroopsReport.CustomMageOutfits.GetAt(MageTroopType) as FormList).GetAt(outfitpiece)) == 0
;                                       Troop.AddItem((CS_UpgradeTroopsReport.CustomMageOutfits.GetAt(MageTroopType) as FormList).GetAt(outfitpiece), 1)
;                                   endif
;                                   if (CS_UpgradeTroopsReport.CustomMageOutfits.GetAt(MageTroopType) as FormList).GetAt(outfitpiece) as Armor != None
;                                       Troop.EquipItem((CS_UpgradeTroopsReport.CustomMageOutfits.GetAt(MageTroopType) as FormList).GetAt(outfitpiece), true)
;                                   endif
;                                   outfitpiece += 1
;                               endwhile
;                           endif
;                       endif
;                   else
;                       FormList NewOutfit = (CS_UpgradeTroopsReport.Outfits[TroopType].GetAt(CS_UpgradeTroopsReport.MageLevels[TroopType].GetValue() as int - 1) as FormList)
;                       If !HasAllItems(NewOutfit) || !HasAllItems(CS_UpgradeTroopsReport.CustomOutfitsArmy.GetAt(armynum) as FormList)
;                           debug.trace("Upgrading troop...")
;                           Troop.RemoveAllItems()
;                           AddArmyEquipment()
;                           int outfitpiece = 0
;                           while outfitpiece < NewOutfit.GetSize()
;                               Troop.EquipItem(NewOutfit.GetAt(outfitpiece) as Armor, true)
;                               outfitpiece += 1
;                           endwhile
;                       EndIf
;                   endif
;           endif
            debug.trace("Upgraded troop " + self + ", type = " + TroopType + "...")

        endif

    endif
EndFunction

Function AddArmyEquipment()
    if (CS_UpgradeTroopsReport.CustomOutfitsArmy.GetAt(armynum) as FormList).GetSize() > 0
        FormList ArmyOutfit = CS_UpgradeTroopsReport.CustomOutfitsArmy.GetAt(armynum) as FormList
        int i = 0
        while i < ArmyOutfit.GetSize()
            AddItem(ArmyOutfit.GetAt(i), 1)
            if ArmyOutfit.GetAt(i) as Armor != None
                EquipItem(ArmyOutfit.GetAt(i), true)
            endif
            i += 1
        endwhile
    endif
EndFunction

Function AddDestructionSpells(Actor Troop, int magetype)

            If magetype == 0
                int i = 0
                while i < CS_UpgradeTroopsReport.DestructionMageLevel.GetValueInt()
                    Troop.AddSpell(CS_UpgradeTroopsReport.DestructionSpellsFire.GetAt(i) as Spell)
                    if i == 5
                        Troop.RemoveSpell(CS_UpgradeTroopsReport.DestructionSpellsFire.GetAt(0) as Spell)
                    endif
                    i += 1
                endwhile
            ElseIf magetype == 1
                int i = 0
                while i < CS_UpgradeTroopsReport.DestructionMageLevel.GetValueInt()
                    Troop.AddSpell(CS_UpgradeTroopsReport.DestructionSpellsFrost.GetAt(i) as Spell)
                    if i == 5
                        Troop.RemoveSpell(CS_UpgradeTroopsReport.DestructionSpellsFrost.GetAt(0) as Spell)
                    endif
                    i += 1
                endwhile
            ElseIf magetype == 2
                int i = 0
                while i < CS_UpgradeTroopsReport.DestructionMageLevel.GetValueInt()
                    Troop.AddSpell(CS_UpgradeTroopsReport.DestructionSpellsShock.GetAt(i) as Spell)
                    if i == 5
                        Troop.RemoveSpell(CS_UpgradeTroopsReport.DestructionSpellsShock.GetAt(0) as Spell)
                    endif
                    i += 1
                endwhile
            EndIf

EndFunction

bool Function HasAllItems(FormList OutfitList)

    bool hasitems = true

    if OutfitList.GetSize() == 0

        hasitems = false

    else

        int i = 0

        while i < OutfitList.GetSize() && hasitems == true
            if GetItemCount(OutfitList.GetAt(i)) == 0 || IsEquipped(OutfitList.GetAt(i)) == 0
                hasitems = false
            endif
            i += 1
        endwhile

    endif

    return hasitems
EndFunction

int Function GetArmyNum()
    ;int armynum
    ;if NoArmy == true
    ;   armynum = -1
    ;else
    ;   armynum = -1
    ;   int i = 0
    ;   bool foundnum = false
    ;   while i < CS_UpgradeTroopsReport.ArmyGroupFactions.GetSize() && foundnum == false
            ;If IsInFaction(CS_UpgradeTroopsReport.ArmyGroupFactions.GetAt(i) as Faction)
                ;armynum = i
                ;foundnum = true
            ;endif
            ;i += 1
        ;endwhile
    ;endif

    ;return armynum
EndFunction
