Scriptname CS_PlayerFactionMessagingScript extends Quest  

ReferenceAlias Property SelectedFaction  Auto  
ReferenceAlias Property SelectedFactionJarl  Auto

Function SelectFaction(ObjectReference FactionActivator)
    SelectedFaction.ForceRefTo(FactionActivator)
    SelectedFactionJarl.ForceRefTo((FactionActivator as CS_FactionManagementOwnership).Leader)
EndFunction