;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname CS__SF_CS_PlayerPrisonGuardGe_05A5A0CB Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CS_PlayerPrisonScript PlayerPrisonScript = GetOwningQuest() as CS_PlayerPrisonScript
PlayerPrisonScript.JailDoor.GetRef().Lock(false)
PlayerPrisonScript.JailDoor.GetRef().Activate(PlayerPrisonScript.JailGuard.GetActorRef())
PlayerPrisonScript.PreparePlayerForMoving()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
