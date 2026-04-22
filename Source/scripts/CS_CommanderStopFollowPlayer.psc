;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname CS_CommanderStopFollowPlayer Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
akSpeaker.RemoveFromFaction(CommanderFaction)
akSpeaker.RemoveFromFaction(FollowerFaction)
int i = 0
while i < CommanderAlias.Length
	GlobalVariable RecruitCommander = RecruitCommanders.GetAt(i) as GlobalVariable
	If CommanderAlias[i].GetActorRef() == akSpeaker
		CommanderAlias[i].Clear()
		Commander2Alias[i].Clear()
		RecruitCommander.SetValue(1)
	EndIf
	i += 1
endwhile
int index = 0
while index < OutfitSteel.GetSize()
	Armor ArmorPart = OutfitSteel.GetAt(index) as Armor
	akSpeaker.UnEquipItem(ArmorPart)
	akSpeaker.RemoveItem(ArmorPart)
	index += 1
endwhile
akSpeaker.SetOutfit(akSpeaker.GetActorBase().GetOutfit())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property CommanderFaction  Auto  

ReferenceAlias[] Property CommanderAlias  Auto  

FormList Property RecruitCommanders  Auto  

FormList Property OutfitSteel  Auto  

Faction Property FollowerFaction  Auto  

ReferenceAlias[] Property Commander2Alias  Auto  
