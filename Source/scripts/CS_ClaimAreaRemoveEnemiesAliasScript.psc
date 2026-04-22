Scriptname CS_ClaimAreaRemoveEnemiesAliasScript extends ReferenceAlias  

Event OnInit()
    if GetRef() && GetRef().IsEnabled()
        GetRef().Disable()
    Endif
EndEvent