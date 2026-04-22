Scriptname CS_FixBannerOnLoadScript extends ReferenceAlias  

Keyword Property CS_StoryFixBanner Auto

Event OnPlayerLoadGame()
    CS_StoryFixBanner.SendStoryEvent()
EndEvent