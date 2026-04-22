Scriptname CS_BardBandScript extends Quest  

import CS_CommonFunctions

Scene[] Property BardBandSongs Auto

ActorBase Property CS_Bard Auto

ReferenceAlias Property BardLead Auto
ReferenceAlias Property Bard1 Auto
ReferenceAlias Property Bard2 Auto

ReferenceAlias Property BardLeadMarker Auto
ReferenceAlias Property Bard1Marker Auto
ReferenceAlias Property Bard2Marker Auto

Idle Property IdleStop Auto

int Property Continuous Auto

Function PlayChosenSong(int songnum)
    
EndFunction

Function SpawnBardsAtStage(ObjectReference LeadMarker, ObjectReference Marker1, ObjectReference Marker2)
    BardLeadMarker.ForceRefTo(LeadMarker)
    Bard1Marker.ForceRefTo(Marker1)
    Bard2Marker.ForceRefTo(Marker2)
    
    BardLead.ForceRefTo(LeadMarker.PlaceAtMe(CS_Bard) as Actor)
    Bard1.ForceRefTo(Marker1.PlaceAtMe(CS_Bard) as Actor)
    Bard2.ForceRefTo(Marker2.PlaceAtMe(CS_Bard) as Actor)
EndFunction

Function PlaySongs(int PlayContinuous)
    Continuous = PlayContinuous
    
    int songlimit = BardBandSongs.Length - 1
    int randomsongnum = utility.randomint(0, songlimit)
    Scene ChosenSong = BardBandSongs[randomsongnum]
    
    ChosenSong.Start()
EndFunction

Function ChooseNewSong(Scene SongJustPlayed)
    Scene[] ApplicableSongs = BardBandSongs
    
    ApplicableSongs = RemoveFromSceneArray(SongJustPlayed, ApplicableSongs)
    int songlimit = ApplicableSongs.Length - 1
    int randomsongnum = utility.randomint(0, songlimit)
    Scene ChosenSong = ApplicableSongs[randomsongnum]
    
    ChosenSong.Start()
EndFunction

Function StopPlaying()
    Continuous = 0
    int i = 0
    while i < BardBandSongs.Length
        BardBandSongs[i].Stop()
        i += 1
    endwhile
    BardLead.GetActorRef().PlayIdle(IdleStop)
    Bard1.GetActorRef().PlayIdle(IdleStop)
    Bard2.GetActorRef().PlayIdle(IdleStop)
    BardLead.TryToDisable() ;interrupts bard if in the middle of song
    utility.wait(0.1)
    BardLead.TryToEnable()
EndFunction

Function DeleteBand()
    BardLead.TryToDisable()
    Bard1.TryToDisable()
    Bard2.TryToDisable()
    
    BardLead.GetActorRef().delete()
    Bard1.GetActorRef().delete()
    Bard2.GetActorRef().delete()
    
    Stop()
EndFunction