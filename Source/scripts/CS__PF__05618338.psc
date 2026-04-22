;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__PF__05618338 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
CS_AttackCityScript AttackCityScript = GetOwningQuest() as CS_AttackCityScript
akActor.RemoveItem(akActor.GetEquippedShield())
akActor.ForceAV("SpeedMult", 80)
akActor.AddItem(AttackCityScript.WarDrums, 1)
akActor.RemoveItem(AttackCityScript.WarDrums, 1)
debug.SendAnimationEvent(akActor, "IdleDrumStart")
SoundInstance = AttackCityScript.BattleDrumsSound.Play(akActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
CS_AttackCityScript AttackCityScript = GetOwningQuest() as CS_AttackCityScript
Sound.StopInstance(SoundInstance)
debug.SendAnimationEvent(akActor, "IdleForceDefaultState")
akActor.ForceAV("SpeedMult", 100)
akActor.AddItem(AttackCityScript.WarDrums, 1)
akActor.RemoveItem(AttackCityScript.WarDrums, 1)
akActor.RemoveFromFaction(AttackCityScript.DrummerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Int Property soundInstance  Auto  
