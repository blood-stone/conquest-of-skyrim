Scriptname CS_FortCommandersScript extends Quest  

ReferenceAlias[] Property FortCommanders Auto

LocationAlias Property FortPersonnelFort Auto

ObjectReference[] Property Positions Auto

FormList Property AllFortLocations Auto
FormList Property AllFortGarrisons Auto

Quest Property FortPersonnelQuest Auto

Keyword Property CS_StoryFortPersonnel Auto

Faction Property FortCommandersFaction Auto

CS_TroopManageMenuScript Property ManageArmy Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_BattleTrackerScript Property BattleTracker Auto

Function AssignCommander(Actor Commander, int fortnum)
    if FortCommanders[fortnum].GetActorRef()
        CommanderScript.ClearFactions(FortCommanders[fortnum].GetActorRef())
    endif
    Commander.AddToFaction(FortCommandersFaction)
    FortCommanders[fortnum].ForceRefTo(Commander)
    CommanderScript.ArmyScripts[CommanderScript.GetCommanderArmyNum(Commander)].CurrentTask = CommanderScript.TaskBarrelsDefendFort.GetAt(fortnum) as ObjectReference
    AssignFortPersonnel(Commander, fortnum)
EndFunction

Function MoveCommanderToPosition(ReferenceAlias Commander)
    int commandernum = FortCommanders.Find(Commander)
    Commander.GetActorRef().MoveTo(Positions[commandernum])
EndFunction

Function MovePersonnelToPosition(ReferenceAlias Commander)
    int FortNum = FortCommanders.Find(Commander)
    if !BattleTracker.Forts[FortNum]
        CS_StoryFortPersonnel.SendStoryEvent(AllFortLocations.GetAt(FortNum) as Location)
    endif
EndFunction

int Function GetFortCommanderNum(Actor Commander)
    int i = 0
    int fortnum = -1
    while i < FortCommanders.Length && fortnum == -1
        if FortCommanders[i].GetActorRef() == Commander
            fortnum = i
        endif
        i += 1
    endwhile

    return fortnum
EndFunction

Function FireFortCommander(Actor Commander)
    int i = 0
    bool foundcommander = false
    int fortnum = -1
    while i < FortCommanders.Length && foundcommander == false
        if Commander == FortCommanders[i].GetActorRef()
            fortnum = i
            foundcommander = true
        endif
        i += 1
    endwhile

    (AllFortGarrisons.GetAt(fortnum) as FormList).Revert()
    FortCommanders[fortnum].Clear()
    Commander.RemoveFromFaction(FortCommandersFaction)
    CommanderScript.ClearFactions(Commander)
EndFunction

Function FortCommanderTempLeave(Actor Commander)
    int fortnum = GetFortCommanderNum(Commander)
    (AllFortGarrisons.GetAt(fortnum) as FormList).Revert()  
EndFunction

Function AssignFortPersonnel(Actor Commander, int fortnum)

    int armynum = CommanderScript.GetCommanderArmyNum(Commander)
    CommanderScript.ArmyScripts[armynum].SpawnNewUnspawnedTroops(Commander)
    FormList Garrison = AllFortGarrisons.GetAt(fortnum) as FormList
    Garrison.Revert()

                if armynum == 0
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops1.Length
                        If ManageArmy.ArmyTroops1[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops1[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 1
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops2.Length
                        If ManageArmy.ArmyTroops2[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops2[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 2
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops3.Length
                        If ManageArmy.ArmyTroops3[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops3[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 3
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops4.Length
                        If ManageArmy.ArmyTroops4[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops4[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 4
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops5.Length
                        If ManageArmy.ArmyTroops5[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops5[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 5
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops6.Length
                        If ManageArmy.ArmyTroops6[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops6[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 6
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops7.Length
                        If ManageArmy.ArmyTroops7[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops7[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 7
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops8.Length
                        If ManageArmy.ArmyTroops8[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops8[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 8
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops9.Length
                        If ManageArmy.ArmyTroops9[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops9[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                elseif armynum == 9
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops10.Length
                        If ManageArmy.ArmyTroops10[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops10[troopnum].GetActorRef())
                        endif
                        troopnum += 1
                    endwhile
                ElseIf armynum == 10
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops11.Length
                        If ManageArmy.ArmyTroops11[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops11[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 11
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops12.Length
                        If ManageArmy.ArmyTroops12[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops12[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 12
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops13.Length
                        If ManageArmy.ArmyTroops13[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops13[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 13
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops14.Length
                        If ManageArmy.ArmyTroops14[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops14[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 14
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops15.Length
                        If ManageArmy.ArmyTroops15[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops15[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 15
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops16.Length
                        If ManageArmy.ArmyTroops16[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops16[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 16
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops17.Length
                        If ManageArmy.ArmyTroops17[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops17[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 17
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops18.Length
                        If ManageArmy.ArmyTroops18[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops18[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 18
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops19.Length
                        If ManageArmy.ArmyTroops19[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops19[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 19
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops20.Length
                        If ManageArmy.ArmyTroops20[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops20[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 20
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops21.Length
                        If ManageArmy.ArmyTroops21[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops21[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 21
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops22.Length
                        If ManageArmy.ArmyTroops22[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops22[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 22
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops23.Length
                        If ManageArmy.ArmyTroops23[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops23[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 23
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops24.Length
                        If ManageArmy.ArmyTroops24[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops24[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 24
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops25.Length
                        If ManageArmy.ArmyTroops25[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops25[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 25
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops26.Length
                        If ManageArmy.ArmyTroops26[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops26[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 26
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops27.Length
                        If ManageArmy.ArmyTroops27[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops27[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 27
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops28.Length
                        If ManageArmy.ArmyTroops28[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops28[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 28
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops29.Length
                        If ManageArmy.ArmyTroops29[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops29[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                ElseIf armynum == 29
                    int troopnum = 0
                    while troopnum < ManageArmy.ArmyTroops30.Length
                        If ManageArmy.ArmyTroops30[troopnum].GetActorRef() != None
                            Garrison.AddForm(ManageArmy.ArmyTroops30[troopnum].GetActorRef())
                        EndIf
                        troopnum += 1
                    endwhile
                endif

EndFunction