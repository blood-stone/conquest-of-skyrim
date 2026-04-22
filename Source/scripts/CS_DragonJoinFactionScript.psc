Scriptname CS_DragonJoinFactionScript extends Quest  

ReferenceAlias[] Property Dragons Auto
ReferenceAlias Property SpeakingDragon Auto
ReferenceAlias Property RidingDragon Auto

Race Property TameDragonRace Auto

ObjectReference Property OrbitMarker1  Auto  
ObjectReference Property TestLocation  Auto  

Quest Property TameDragonQuest Auto

Scene Property ForceGreetScene Auto

Faction Property RidingDragonFaction Auto

Function RecruitDragon(Actor NewDragon)
	int aliasfound = 0
	int i = 0
	while i < Dragons.Length && aliasfound == 0
		if Dragons[i].GetActorRef() == None
			Dragons[i].ForceRefTo(NewDragon)
			aliasfound = 0
		endif
		i += 1
	endwhile
	(TameDragonQuest as DLC2TameDragonScript).FinishRelease()
	ForceGreetScene.Stop()
	NewDragon.AllowPCDialogue(true)
	SpeakingDragon.Clear()
	NewDragon.EvaluatePackage()
EndFunction

Function EnableDragonRiding(Actor Dragon)
	debug.notification("Adding Dragon to Riding")
	Dragon.AllowPCDialogue(false)
	RidingDragon.ForceRefTo(Dragon)
EndFunction

Function TestMoveMarker()
	OrbitMarker1.MoveTo(TestLocation)
EndFunction

Function ReEvaluateDragonPackages()
	int i = 0
	while i < Dragons.Length
		Dragons[i].GetActorRef().EvaluatePackage()
		i += 1
	endwhile
EndFunction