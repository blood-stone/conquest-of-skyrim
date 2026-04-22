Scriptname CS_SettingsMenuReadBook extends ObjectReference  

Quest Property SettingsMenu Auto

Event OnRead()
    if SettingsMenu.IsRunning()
        SettingsMenu.Stop()
        Utility.Wait(0.5)
    endif
    SettingsMenu.Start()
EndEvent