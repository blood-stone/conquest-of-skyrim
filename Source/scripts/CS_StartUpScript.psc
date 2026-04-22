Scriptname CS_StartUpScript extends Quest  

GlobalVariable Property CS_FactionStarted Auto

Spell Property CS_ClaimAreaSpell Auto
Spell Property CS_FactionManagement Auto
Spell Property FactionManagementMilitarySpell Auto
Spell Property CS_AB_GatherWood Auto

Book Property CS_SettingsMenuBook Auto

Actor Property PlayerRef Auto

ObjectReference Property BannerRoomTeleport Auto
ObjectReference Property PreviousLoc Auto
ObjectReference Property FactionActivatorMarker Auto

Activator Property CS_FactionManagementActivator Auto
FormList Property CS_MajorFactions Auto
FormList Property CS_FactionActivatorsHolds Auto
FormList Property CS_FactionActivatorsMajor Auto

ObjectReference Property FactionActivator Auto

Keyword Property CS_StoryStartUp Auto
Keyword Property CS_StoryTM Auto

CS_SelectName Property CS_FactionNameUpdater Auto

CS_Faction Property CS_FactionPlayer Auto

Function StartUp()
    CS_FactionStarted.SetValue(1)
    PlayerRef.AddSpell(CS_ClaimAreaSpell)
    PlayerRef.AddItem(CS_SettingsMenuBook, 1)
    CS_FactionPlayer.Name.SetNewName()
    PreviousLoc.MoveTo(PlayerRef)
    PlayerRef.MoveTo(BannerRoomTeleport);/
    CS_FactionActivatorsMajor.AddForm(FactionActivator)
    (FactionActivator as CS_FactionManagementEconomy).RegisterForSingleUpdate(0.1)
    (FactionActivator as CS_FactionManagementMilitary).SetUp()/;
    PlayerRef.AddSpell(CS_FactionManagement)
    PlayerRef.AddSpell(FactionManagementMilitarySpell)
    PlayerRef.AddSpell(CS_AB_GatherWood)
    CS_StoryStartUp.SendStoryEvent(akRef1 = FactionActivator)
    ;CS_StoryTM.SendStoryEventAndWait()
    Stop()
EndFunction

Function StartUpExistingFaction(ObjectReference ExistingFactionActivator)
    CS_FactionStarted.SetValue(1)
    PlayerRef.AddSpell(CS_ClaimAreaSpell)
    PlayerRef.AddItem(CS_SettingsMenuBook, 1)
    CS_FactionNameUpdater.Start()
    CS_FactionNameUpdater.FactionActivator = FactionActivator
    (FactionActivator as CS_FactionManagementDiplomacy).FactionBanner = (ExistingFactionActivator as CS_FactionManagementDiplomacy).FactionBanner
    (FactionActivator as CS_FactionManagementDiplomacy).FactionName = (ExistingFactionActivator as CS_FactionManagementDiplomacy).FactionName
    (FactionActivator as CS_FactionManagementDiplomacy).FactionNamePrefix = (ExistingFactionActivator as CS_FactionManagementDiplomacy).FactionNamePrefix
    (FactionActivator as CS_FactionManagementOwnership).FactionOwnerActivator = (ExistingFactionActivator as CS_FactionManagementOwnership).FactionOwnerActivator
    (FactionActivator as CS_FactionManagementEconomy).RegisterForSingleUpdate(0.1)
    (FactionActivator as CS_FactionManagementMilitary).SetUp()
    PlayerRef.AddSpell(CS_FactionManagement)
    PlayerRef.AddSpell(FactionManagementMilitarySpell)
    PlayerRef.AddSpell(CS_AB_GatherWood)
    CS_StoryStartUp.SendStoryEvent(akRef1 = FactionActivator)
    ;CS_StoryTM.SendStoryEventAndWait()
    Stop()
EndFunction