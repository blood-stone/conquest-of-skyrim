;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname CS__TIF__05384BDD Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as CS_BountyScript).TroopManage.Start()
Actor NewCommander = ((GetOwningQuest() as CS_BountyScript).TroopManage as CS_TroopManageMenuScript).ArmiesSelect1Menu((GetOwningQuest() as CS_BountyScript).BountyTarget)
if NewCommander
	(GetOwningQuest() as CS_BountyScript).Commander.ForceRefTo(NewCommander)
endif
(GetOwningQuest() as CS_BountyScript).TroopManage.Stop()

if (GetOwningQuest() as CS_BountyScript).Commander.GetActorRef() != None
	GetOwningQuest().SetStage(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
