Scriptname CS_PublicSpeakerAliasScript extends ReferenceAlias  

Event OnUnload()
    UnRegisterForUpdate()
    if !Game.GetPlayer().IsInLocation(City.GetLocation())
        GetOwningQuest().Stop()
    endif
EndEvent

Event OnLoad()
    RegisterForUpdate(5)
EndEvent

Event OnUpdate()
    if !PublicSpeakerScene.IsPlaying()
        if Game.GetPlayer().IsInLocation(City.GetLocation())
            PublicSpeakerScene.Start()
        endif
    endif
EndEvent


Scene Property PublicSpeakerScene Auto

LocationAlias Property City Auto