Scriptname CS_GetNPCFamilyScript extends Quest  

ReferenceAlias Property TargetNPC Auto

ReferenceAlias[] Property FamilyMembers Auto
ReferenceAlias Property TargetSpouse Auto

Quest Property GetNPCFamilyQuest Auto

Actor[] Function GetNPCFamily(Actor Target)

	if GetNPCFamilyQuest.IsRunning()
		GetNPCFamilyQuest.Stop()
	endif

	TargetNPC.ForceRefTo(Target)

	GetNPCFamilyQuest.Start()
	Actor[] NPCFamily = new Actor[5]
	int i = 0
	while i < FamilyMembers.Length
		if FamilyMembers[i].GetActorRef()
			NPCFamily[i] = FamilyMembers[i].GetActorRef()
		endif
		i += 1
	endwhile

	GetNPCFamilyQuest.Stop()

	return NPCFamily
EndFunction

Actor Function GetNPCSpouse(Actor Target)

	if GetNPCFamilyQuest.IsRunning()
		GetNPCFamilyQuest.Stop()
	endif

	TargetNPC.ForceRefTo(Target)

	GetNPCFamilyQuest.Start()

	Actor Spouse = TargetSpouse.GetActorRef()

	GetNPCFamilyQuest.Stop()

	return Spouse
EndFunction