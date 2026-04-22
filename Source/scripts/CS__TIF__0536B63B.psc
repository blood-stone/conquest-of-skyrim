;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname CS__TIF__0536B63B Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_BountyScript).TroopManage.Start()
Actor NewCommander = ((GetOwningQuest() as CS_BountyScript).TroopManage as CS_TroopManageMenuScript).ArmiesSelect1Menu((GetOwningQuest() as CS_BountyScript).BountyTarget)
if NewCommander
	(GetOwningQuest() as CS_BountyScript).Commander.ForceRefTo(NewCommander)
endif
(GetOwningQuest() as CS_BountyScript).TroopManage.Stop()

if (GetOwningQuest() as CS_BountyScript).Commander.GetActorRef() != None
	(CommanderQuest as CS_PatrolHoldScript).ClearFactionsTemp((GetOwningQuest() as CS_BountyScript).Commander.GetActorRef())
	GetOwningQuest().SetStage(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CommanderQuest  Auto  
