;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__0551068E Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_ResearchFetchScript FetchScript = (GetOwningQuest() as CS_ResearchFetchScript)

FetchScript.TroopManage.Start()
FetchScript.Commander.ForceRefTo((FetchScript.TroopManage as CS_TroopManageMenuScript).ArmiesSelect1Menu(FetchScript.QuestContainer.GetRef()))
FetchScript.TroopManage.Stop()

if (GetOwningQuest() as CS_ResearchFetchScript).Commander.GetActorRef() != None
	FetchScript.CommanderQuest.ClearFactionsTemp(FetchScript.Commander.GetActorRef())
	GetOwningQuest().SetStage(90)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
