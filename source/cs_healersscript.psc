Scriptname CS_HealersScript extends Quest  

bool Function CheckAliveHealers()
	bool healeralive = false
	int i = 0
	while i < Healers.Length && healeralive == false
		if Healers[i].GetActorRef() != None
			healeralive = true
		endif
		i += 1
	endwhile
	return healeralive
EndFunction

Function HealersEvaluatePackages()
	int i = 0
	while i < Healers.Length
		if Healers[i].GetActorRef() != None
			Healers[i].GetActorRef().EvaluatePackage()
		endif
		i += 1		
	endwhile
EndFunction

Function CheckHealerTargets()
	int i = 0
	bool foundtarget = false
	while i < HealerTargets.Length && !foundtarget
		if HealerTargets[i].GetActorRef()
			if !HealerTargets[i].GetActorRef().IsDead() && HealerTargets[i].GetActorRef().GetActorValuePercentage("Health") < 1
				foundtarget = true
			endif
		endif
		i += 1
	endwhile

	if !foundtarget
		Stop()
	else
		HealersEvaluatePackages()
	endif
EndFunction

Event OnUpdate()
	Reset()
EndEvent

ReferenceAlias[] Property Healers  Auto  
ReferenceAlias[] Property HealerTargets  Auto  

bool Property HealersCoolingDown=false Auto