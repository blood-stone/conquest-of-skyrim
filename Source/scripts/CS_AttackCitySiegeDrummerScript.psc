Scriptname CS_AttackCitySiegeDrummerScript extends ReferenceAlias  

int Property SoundInstance Auto

Event OnLoad()

	CS_AttackCitySiegeScript SiegeScript = GetOwningQuest() as CS_AttackCitySiegeScript

	if SiegeScript.DrummersEnabled.GetValue() == 1
		GetActorRef().AddToFaction(SiegeScript.DrummerFaction)
		GetActorRef().EvaluatePackage()
		Utility.Wait(3)
		GetActorRef().RemoveItem(GetActorRef().GetEquippedShield())
		;GetActorRef().AddItem(SiegeScript.WarDrums, 1)
		;GetActorRef().EquipItem(SiegeScript.WarDrums, true)
		SoundInstance = SiegeScript.DrumsSound.Play(GetActorRef())
		Sound.SetInstanceVolume(SoundInstance, 3)
		debug.sendAnimationEvent(GetActorRef(), "IdleDrumStart")
	endif

EndEvent