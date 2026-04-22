Scriptname CS_TroopRecruiterScript extends Quest  

CS_PatrolHoldScript Property CommanderScript Auto
CS_TroopManageMenuScript Property ManageArmy Auto
CS_UpgradeTroopsMenu Property UpgradeTroops Auto
CS_TroopFormUpScript Property CS_TroopFormUp Auto

FormList Property ArmyQuests Auto
FormList Property GroupFactions Auto 
FormList Property TroopGarrisons Auto
FormList Property AttackTroopsCity Auto
FormList Property AttackTroopsFort Auto
FormList Property AttackTroopsCamp Auto

FormList Property DestructionMageSpellsFire Auto
FormList Property DestructionMageSpellsFrost Auto
FormList Property DestructionMageSpellsShock Auto

GlobalVariable Property DestructionMageLevel Auto
GlobalVariable Property DailyTroopSpawned Auto

GlobalVariable Property AllowMale Auto
GlobalVariable Property AllowFemale Auto

Faction Property ArmyPatrolFaction Auto
Faction Property ArmyAttackFaction Auto
Faction Property AttackingCityFaction Auto
Faction Property AttackingFortFaction Auto
Faction Property AttackingCampFaction Auto
Faction Property DestructionMageFireFaction Auto
Faction Property DestructionMageFrostFaction Auto
Faction Property DestructionMageShockFaction Auto

bool Property BeingUsed=false Auto

Function RecruitTroop(int armynum, int TroopType, int destructionmage = -1)

    if CommanderScript.Commanders[armynum].GetActorRef().Is3DLoaded() == true


        SpawnTroop(armynum, TroopType, destructionmage)

    else

        ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).AddTroopCountUnspawned(TroopType, destructionmage)

    endif

    DailyTroopSpawned.Mod(1)
    ((ArmyQuests.GetAt(armynum) as Quest) as CS_ArmyTroopDeath).AddTroopCount(TroopType, destructionmage)
    (ManageArmy.TroopCounts.GetAt(armynum) as GlobalVariable).Mod(1)

    If ManageArmy.GovQuest.GetStage() == 6
        ManageArmy.FactionStartRecruitTroop.SetValue(1)
        ManageArmy.GovQuest.SetStage(7)
    endIf

EndFunction


Function SpawnTroop(int armynum, int TroopType, int destructionmage = -1)

        BeingUsed = true

        debug.trace("Spawning Troop")
        Actor Troop
        if destructionmage  == -1
            Troop = CommanderScript.Commanders[armynum].GetActorRef().PlaceAtMe(ManageArmy.Troops[TroopType], abForcePersist = True, abInitiallyDisabled = True) as Actor
        else
            Troop = CommanderScript.Commanders[armynum].GetActorRef().PlaceAtMe(ManageArmy.DestructionMages[destructionmage], abForcePersist = True, abInitiallyDisabled = True) as Actor
        endif
        Troop.AllowPCDialogue(true)
        Troop.IgnoreFriendlyHits(true)
    if armynum == 0
        Int i = 0
        while i < ManageArmy.ArmyTroops1.length
            if ManageArmy.ArmyTroops1[i].GetActorRef() == none
                ManageArmy.ArmyTroops1[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 1
        Int i = 0
        while i < ManageArmy.ArmyTroops2.length
            if ManageArmy.ArmyTroops2[i].GetActorRef() == none
                ManageArmy.ArmyTroops2[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 2
        Int i = 0
        while i < ManageArmy.ArmyTroops3.length
            if ManageArmy.ArmyTroops3[i].GetActorRef() == none
                ManageArmy.ArmyTroops3[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 3
        Int i = 0
        while i < ManageArmy.ArmyTroops4.length
            if ManageArmy.ArmyTroops4[i].GetActorRef() == none
                ManageArmy.ArmyTroops4[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 4
        Int i = 0
        while i < ManageArmy.ArmyTroops5.length
            if ManageArmy.ArmyTroops5[i].GetActorRef() == none
                ManageArmy.ArmyTroops5[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 5
        Int i = 0
        while i < ManageArmy.ArmyTroops6.length
            if ManageArmy.ArmyTroops6[i].GetActorRef() == none
                ManageArmy.ArmyTroops6[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 6
        Int i = 0
        while i < ManageArmy.ArmyTroops7.length
            if ManageArmy.ArmyTroops7[i].GetActorRef() == none
                ManageArmy.ArmyTroops7[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 7
        Int i = 0
        while i < ManageArmy.ArmyTroops8.length
            if ManageArmy.ArmyTroops8[i].GetActorRef() == none
                ManageArmy.ArmyTroops8[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 8
        Int i = 0
        while i < ManageArmy.ArmyTroops9.length
            if ManageArmy.ArmyTroops9[i].GetActorRef() == none
                ManageArmy.ArmyTroops9[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 9
        Int i = 0
        while i < ManageArmy.ArmyTroops10.length
            if ManageArmy.ArmyTroops10[i].GetActorRef() == none
                ManageArmy.ArmyTroops10[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 10
        Int i = 0
        while i < ManageArmy.ArmyTroops11.length
            if ManageArmy.ArmyTroops11[i].GetActorRef() == none
                ManageArmy.ArmyTroops11[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 11
        Int i = 0
        while i < ManageArmy.ArmyTroops12.length
            if ManageArmy.ArmyTroops12[i].GetActorRef() == none
                ManageArmy.ArmyTroops12[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 12
        Int i = 0
        while i < ManageArmy.ArmyTroops13.length
            if ManageArmy.ArmyTroops13[i].GetActorRef() == none
                ManageArmy.ArmyTroops13[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 13
        Int i = 0
        while i < ManageArmy.ArmyTroops14.length
            if ManageArmy.ArmyTroops14[i].GetActorRef() == none
                ManageArmy.ArmyTroops14[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 14
        Int i = 0
        while i < ManageArmy.ArmyTroops15.length
            if ManageArmy.ArmyTroops15[i].GetActorRef() == none
                ManageArmy.ArmyTroops15[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 15
        Int i = 0
        while i < ManageArmy.ArmyTroops16.length
            if ManageArmy.ArmyTroops16[i].GetActorRef() == none
                ManageArmy.ArmyTroops16[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 16
        Int i = 0
        while i < ManageArmy.ArmyTroops17.length
            if ManageArmy.ArmyTroops17[i].GetActorRef() == none
                ManageArmy.ArmyTroops17[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 17
        Int i = 0
        while i < ManageArmy.ArmyTroops18.length
            if ManageArmy.ArmyTroops18[i].GetActorRef() == none
                ManageArmy.ArmyTroops18[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 18
        Int i = 0
        while i < ManageArmy.ArmyTroops19.length
            if ManageArmy.ArmyTroops19[i].GetActorRef() == none
                ManageArmy.ArmyTroops19[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 19
        Int i = 0
        while i < ManageArmy.ArmyTroops20.length
            if ManageArmy.ArmyTroops20[i].GetActorRef() == none
                ManageArmy.ArmyTroops20[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 20
        Int i = 0
        while i < ManageArmy.ArmyTroops21.length
            if ManageArmy.ArmyTroops21[i].GetActorRef() == none
                ManageArmy.ArmyTroops21[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 21
        Int i = 0
        while i < ManageArmy.ArmyTroops22.length
            if ManageArmy.ArmyTroops22[i].GetActorRef() == none
                ManageArmy.ArmyTroops22[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 22
        Int i = 0
        while i < ManageArmy.ArmyTroops23.length
            if ManageArmy.ArmyTroops23[i].GetActorRef() == none
                ManageArmy.ArmyTroops23[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 23
        Int i = 0
        while i < ManageArmy.ArmyTroops24.length
            if ManageArmy.ArmyTroops24[i].GetActorRef() == none
                ManageArmy.ArmyTroops24[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 24
        Int i = 0
        while i < ManageArmy.ArmyTroops25.length
            if ManageArmy.ArmyTroops25[i].GetActorRef() == none
                ManageArmy.ArmyTroops25[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 25
        Int i = 0
        while i < ManageArmy.ArmyTroops26.length
            if ManageArmy.ArmyTroops26[i].GetActorRef() == none
                ManageArmy.ArmyTroops26[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 26
        Int i = 0
        while i < ManageArmy.ArmyTroops27.length
            if ManageArmy.ArmyTroops27[i].GetActorRef() == none
                ManageArmy.ArmyTroops27[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 27
        Int i = 0
        while i < ManageArmy.ArmyTroops28.length
            if ManageArmy.ArmyTroops28[i].GetActorRef() == none
                ManageArmy.ArmyTroops28[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 28
        Int i = 0
        while i < ManageArmy.ArmyTroops29.length
            if ManageArmy.ArmyTroops29[i].GetActorRef() == none
                ManageArmy.ArmyTroops29[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    elseIf armynum == 29
        Int i = 0
        while i < ManageArmy.ArmyTroops30.length
            if ManageArmy.ArmyTroops30[i].GetActorRef() == none
                ManageArmy.ArmyTroops30[i].ForceRefTo(Troop as objectreference)
                i = 100
            else
                i += 1
            endIf
        endWhile
    endIf
        if (ArmyQuests.GetAt(armynum) as CS_ArmyTroopDeath).IsVampire
            Troop.AddToFaction(UpgradeTroops.PlayerVampireFaction)
            Troop.SetEyeTexture(UpgradeTroops.RedEyeTexture)
        endif
        (Troop as CS_UpgradeTroopOnAttach).armynum = armynum
        Troop.AddToFaction(GroupFactions.GetAt(armynum) as Faction)

        If CommanderScript.Commanders[armynum].GetActorRef().Is3DLoaded() && !CommanderScript.Commanders[armynum].GetActorRef().IsInFaction(ArmyAttackFaction) && !CommanderScript.Commanders[armynum].GetActorRef().IsInFaction(ArmyPatrolFaction)
            Troop.enable()
            Troop.MoveTo(CommanderScript.Commanders[armynum].GetActorRef())
        EndIf
        
        If CommanderScript.Commanders[armynum].GetActorRef() == CS_TroopFormUp.Commander.GetActorRef()
            int i = 0
            bool foundalias = false
            while i < CS_TroopFormUp.Troops.Length && !foundalias
                if !CS_TroopFormUp.Troops[i].GetActorRef()
                    CS_TroopFormUp.Troops[i].ForceRefTo(Troop)
                    foundalias = true
                endif
                i += 1
            endwhile
        EndIf

        BeingUsed = false
EndFunction