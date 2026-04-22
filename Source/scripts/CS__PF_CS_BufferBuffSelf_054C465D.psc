;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__PF_CS_BufferBuffSelf_054C465D Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
akActor.SetAV("Magicka", 9999999)
debug.trace("Buffer Triggered")
Utility.Wait(3)
debug.trace("Buffing Allies...")
Buff[AlterationMageLevel.GetValueInt()].Cast(akActor, akActor)
if !Game.GetPlayer().HasMagicEffect(BuffEffects[AlterationMageLevel.GetValueInt()])
	Buff[AlterationMageLevel.GetValueInt()].Cast(akActor, Game.GetPlayer())
endif
int i = 0
while i < BufferTargets.Length
	if BufferTargets[i].GetActorRef()
		if !BufferTargets[i].GetActorRef().HasMagicEffect(BuffEffects[AlterationMageLevel.GetValueInt()])
			debug.trace("Ally buffed")
			Buff[AlterationMageLevel.GetValueInt()].Cast(akActor, BufferTargets[i].GetActorRef())
		endif
	endif
	i += 1
endwhile
GetOwningQuest().Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL[] Property Buff  Auto  

GlobalVariable Property AlterationMageLevel  Auto  

ReferenceAlias[] Property BufferTargets  Auto  

MagicEffect[] Property BuffEffects  Auto  
