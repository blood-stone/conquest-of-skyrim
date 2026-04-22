;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__PF_CS_HealerHealSelf_054C4657 Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
akActor.SetAV("Magicka", 99999)
debug.trace("First heal triggered")
int i = 0
int healednum = 0
int healednummax = 0
if HealerLevel.GetValue() <  5
	healednummax = HealerLevel.GetValue() as int
else
	healednummax = 20
endif

HealerTargets = (GetOwningQuest() as CS_HealersScript).HealerTargets

if Game.GetPlayer().GetActorValuePercentage("Health") < 1
	FastHealing.Cast(akActor, Game.GetPlayer())
endif

while i < HealerTargets.Length && healednum < healednummax
	if HealerTargets[i].GetActorRef() != None
		if HealerTargets[i].GetActorRef().GetActorValuePercentage("Health") < 1
			FastHealing.Cast(akActor, HealerTargets[i].GetActorRef())
			healednum += 1
		endif
	endif
	i += 1
endwhile

if !(GetOwningQuest() as CS_HealersScript).HealersCoolingdown
	GetOwningQuest().RegisterForSingleUpdate(10 - 2*HealerLevel.GetValueint())
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property HealOther  Auto  

ReferenceAlias[] Property HealerTargets  Auto  

GlobalVariable Property HealerLevel  Auto  

SPELL Property HealingHands  Auto  

SPELL Property FastHealing  Auto  
