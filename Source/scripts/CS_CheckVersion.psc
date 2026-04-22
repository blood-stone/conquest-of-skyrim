Scriptname CS_CheckVersion extends ReferenceAlias  

Event OnPlayerLoadGame()
    CS_GovScriptFunctions GovScriptFunctions = GetOwningQuest() as CS_GovScriptFunctions

    if GovScriptFunctions.Version.GetValue() < 0.3
        debug.MessageBox("Conquest of Skyrim: Older version detected. You need to use this update on a save that has never seen the mod. Alternatively, if you haven't started your faction prior to updating, you can uninstall the mod, load your save, save the game, exit, reinstall the mod, and load the new save and it should work.")
    else
        bool updated = false

        if GovScriptFunctions.Version.GetValue() < 0.3001
            if TMImps.AtWarPlayer == true
                if Game.GetPlayer().IsInFaction(TMImps.ArmyFaction) || Game.GetPlayer().IsInFaction(TMImps.ArmyFactionNPC)
                    Game.GetPlayer().RemoveFromFaction(TMImps.ArmyFaction)
                    Game.GetPlayer().RemoveFromFaction(TMImps.ArmyFactionNPC)
                endif
            endif

            if TMSons.AtWarPlayer == true
                if Game.GetPlayer().IsInFaction(TMSons.ArmyFaction) || Game.GetPlayer().IsInFaction(TMSons.ArmyFactionNPC)
                    Game.GetPlayer().RemoveFromFaction(TMSons.ArmyFaction)
                    Game.GetPlayer().RemoveFromFaction(TMSons.ArmyFactionNPC)
                endif
            endif

            GovScriptFunctions.Version.SetValue(0.3001)
            updated = true
        endif

        if GovScriptFunctions.Version.GetValue() < 0.3003
            CourtScript.UpdateTo0Point3Point3()
            GovScriptFunctions.Version.SetValue(0.3003)
            updated = true
        endif

        if GovScriptFunctions.Version.GetValue() < 0.3005
            if GovScriptFunctions.CapitalGlobal.GetValueInt() >= 0 && GovScriptFunctions.ASIC.GetActorRef()
                GovScriptFunctions.Housecarls[GovScriptFunctions.CapitalGlobal.GetValueInt()].ForceRefTo(GovScriptFunctions.ASIC.GetActorRef())
            endif
            GovScriptFunctions.Version.SetValue(0.3005)
            updated = true
        endif

        if GovScriptFunctions.Version.GetValue() < 0.3007
            if GetOwningQuest().GetStage() >= 1
                if GovScriptFunctions.TMImp.CWStartQuest.IsRunning()
                    GovScriptFunctions.TMImp.CWStartQuest.FailAllObjectives()
                    GovScriptFunctions.TMImp.CWStartQuest.Stop()
                endif

                if GovScriptFunctions.TMSons.CWStartQuest.IsRunning()
                    GovScriptFunctions.TMSons.CWStartQuest.FailAllObjectives()
                    GovScriptFunctions.TMSons.CWStartQuest.Stop()
                endif

                if GovScriptFunctions.TMImp.AtWarPlayer && !GovScriptFunctions.TMImp.TrucePlayer
                    GovScriptFunctions.TMImp.UnRegisterForUpdateGameTime()
                    GovScriptFunctions.TMImp.RegisterForUpdateGameTime(24)
                endif

                if GovScriptFunctions.TMSons.AtWarPlayer && !GovScriptFunctions.TMSons.TrucePlayer
                    GovScriptFunctions.TMSons.UnRegisterForUpdateGameTime()
                    GovScriptFunctions.TMSons.RegisterForUpdateGameTime(24)
                endif
            endif
            GovScriptFunctions.Version.SetValue(0.3007)
            updated = true
        endif

        if GovScriptFunctions.Version.GetValue() < 0.3008
            if GetOwningQuest().GetStage() >= 1
                if GovScriptFunctions.TMImp.Defeated
                    GovScriptFunctions.TMImp.CheckAllHoldings()
                endif

                if GovScriptFunctions.TMSons.Defeated
                    GovScriptFunctions.TMSons.CheckAllHoldings()
                endif
            endif
            GovScriptFunctions.Version.SetValue(0.3008)
            updated = true
        endif
        
        if GovScriptFunctions.Version.GetValue() < 0.3009
            if CourtScript.IsRunning()
                CourtScript.Stop()
                Utility.Wait(0.5)
                CourtScript.Start()
            endif
        endif

        ;/
        
        if GovScriptFunctions.Version.GetValue() < 0.4000
            if GetOwningQuest().GetStage() >= 1
                GovScriptFunctions.LoyaltyScript.SetUpInitialJarlLoyalties()
            endif
            GovScriptFunctions.Version.SetValue(0.4000)
            updated = true
        endif

        /;
        
        if updated
            debug.notification("Conquest of Skyrim updated to 0.3.9!")
        endif
    endif
EndEvent

CS_TMScript Property TMImps Auto
CS_TMScript Property TMSons Auto
CS_CourtScript Property CourtScript Auto