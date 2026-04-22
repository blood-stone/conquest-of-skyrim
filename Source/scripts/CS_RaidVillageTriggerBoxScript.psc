Scriptname CS_RaidVillageTriggerBoxScript extends ObjectReference  

Quest Property RaidVillageQuest Auto

LocationAlias Property VillageAlias Auto

ReferenceAlias Property FollowerCommander Auto

Location Property Village Auto

GlobalVariable Property PlayerIsFollowed Auto

Keyword Property StoryRaidVillage Auto

Event OnCellAttach()
    if IsEnabled() && FollowerCommander.GetActorRef()
        StoryRaidVillage.SendStoryEvent(Village)
    endif
EndEvent