;/ Decompiled by Champollion V1.0.1
Source   : CS_TIF__0202C5E5.psc
Modified : 2022-03-27 05:22:31
Compiled : 2022-03-27 05:22:32
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS_TIF__0202C5E5 extends TopicInfo hidden

;-- Properties --------------------------------------
referencealias property NameChanger auto
referencealias property ChestRef auto
quest property NameChangeQuest auto
quest property GovQuest auto
referencealias property PlayerAlias auto
referencealias property ChestRef2 auto
referencealias property ChestRef3 auto
objectreference property FactionNameChestObject auto
referencealias[] property AllArmyTroops auto
formlist[] property GuardFormLists auto
objectreference property ChestObject auto
globalvariable property ChangingName auto
cs_namestoring property QuestScript auto
formlist property NameList auto

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function Fragment_1(objectreference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	ChangingName.SetValue(1 as Float)
	(GovQuest as cs_selectname).ChangeName()
	(GovQuest as cs_selectname).UpdateGuardNames()
	utility.Wait(1 as Float)
	Int i = 0
	while i < AllArmyTroops.length
		NameChanger.ForceRefTo(AllArmyTroops[i].GetActorRef() as objectreference)
		NameChanger.Clear()
		i += 1
	endWhile
	debug.notification("Rename complete")
endFunction

; Skipped compiler generated GotoState
