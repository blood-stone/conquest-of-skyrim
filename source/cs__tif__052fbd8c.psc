;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS__TIF__052FBD8C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
((GetOwningQuest() as CS_GovScriptFunctions).HouseQuest as HousePurchaseScript).HPWhiterun.SetValue(0)
(GetOwningQuest() as CS_GovScriptFunctions).HousecarlWhiterun.enable()
(GetOwningQuest() as CS_GovScriptFunctions).HousecarlWhiterun.MoveTo(Game.GetPlayer(),0, -200)
(GetOwningQuest() as CS_GovScriptFunctions).BedroomWhiterun.enable()
(GetOwningQuest() as CS_GovScriptFunctions).HouseQuest.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
