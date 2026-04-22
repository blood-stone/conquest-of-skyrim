;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_TIF__0202C5E5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
ChangingName.SetValue(1)
(GovQuest as CS_SelectName).ChangeName()
(GovQuest as CS_SelectName).UpdateGuardNames()
Utility.Wait(1)
int i = 0
while i < AllArmyTroops.Length
	NameChanger.ForceRefTo(AllArmyTroops[i].GetActorRef())
	NameChanger.Clear()
	i += 1
endwhile
debug.notification("Rename complete")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ChestObject  Auto  

Quest Property GovQuest  Auto  

FormList[] Property GuardFormLists  Auto  

ReferenceAlias Property NameChanger  Auto  

ReferenceAlias Property ChestRef  Auto  

ReferenceAlias[] Property AllArmyTroops  Auto  

FormList Property NameList  Auto  

ReferenceAlias Property PlayerAlias  Auto  

CS_NameStoring Property QuestScript Auto

Quest Property NameChangeQuest  Auto  

GlobalVariable Property ChangingName  Auto  

ReferenceAlias Property ChestRef2  Auto  

ObjectReference Property FactionNameChestObject  Auto  

ReferenceAlias Property ChestRef3  Auto  
