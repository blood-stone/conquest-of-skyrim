Scriptname CS_CityEventSpeechTriggerScript extends ReferenceAlias  

LocationAlias Property City Auto

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == Game.GetPlayer() && GetOwningQuest().GetStage() == 5
        GetOwningQuest().SetStage(10)
    endif
EndEvent

Event OnCellDetach()
    CS_FeastScript FeastScript = (GetOwningQuest() as CS_FeastScript)
    if !City.GetLocation().IsLoaded()
        GetOwningQuest().UnRegisterForUpdateGameTime()
        GetOwningQuest().Stop()
    elseif FeastScript.EntertainmentType > 0
        if FeastScript.EntertainmentType == 2
            FeastScript.CS_BardBand.StopPlaying()
        endif
    endif
EndEvent

Event OnCellAttach()
    CS_FeastScript FeastScript = (GetOwningQuest() as CS_FeastScript)
    if FeastScript.EntertainmentType > 0
        if FeastScript.BardsSpawned == 0
            if FeastScript.EntertainmentType == 1
                FeastScript.SpawnBard()
            elseif FeastScript.EntertainmentType == 2
                FeastScript.SpawnBand()
            endif
        else
            if FeastScript.EntertainmentType == 1
                FeastScript.BardSongs.PlaySong(FeastScript.Bard.GetRef(), Instrument = "Instrumental")
            elseif FeastScript.EntertainmentType == 2
                FeastScript.CS_BardBand.PlaySongs(1)
            endif
        endif
    endif
EndEvent