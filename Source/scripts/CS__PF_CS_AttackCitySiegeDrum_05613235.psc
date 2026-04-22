;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__PF_CS_AttackCitySiegeDrum_05613235 Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
CS_AttackCitySiegeScript SiegeScript = GetOwningQuest() as CS_AttackCitySiegeScript
SoundInstance = (SiegeScript.Attackers[0] as CS_AttackCitySiegeDrummerScript).SoundInstance
Sound.StopInstance(SoundInstance)
akActor.UnequipItem(SiegeScript.WarDrums)
akActor.RemoveItem(SiegeScript.WarDrums, 1)
debug.SendAnimationEvent(akActor, "IdleForceDefaultState")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property soundInstance  Auto  
