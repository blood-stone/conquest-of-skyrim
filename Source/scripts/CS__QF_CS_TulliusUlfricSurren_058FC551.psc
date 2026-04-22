;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname CS__QF_CS_TulliusUlfricSurren_058FC551 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GalmarOrRikke
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GalmarOrRikke Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UlfricOrTullius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_UlfricOrTullius Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_TulliusUlfricSurrenderScript
Quest __temp = self as Quest
CS_TulliusUlfricSurrenderScript kmyQuest = __temp as CS_TulliusUlfricSurrenderScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(0)
;Alias_UlfricOrTullius.GetActorRef().SetNoBleedoutRecovery(true)
Alias_UlfricOrTullius.GetActorRef().RemoveFromAllFactions()
Alias_UlfricOrTullius.GetActorRef().AddToFaction(kmyQuest.JarlCitizenFaction)
Alias_UlfricOrTullius.GetActorRef().SetCrimeFaction(None)
Alias_UlfricOrTullius.GetActorRef().IgnoreFriendlyHits(true)
Alias_UlfricOrTullius.GetActorRef().SetGhost(false)
Alias_GalmarOrRikke.GetActorRef().RemoveFromAllFactions()
Alias_GalmarOrRikke.GetActorRef().AddToFaction(kmyQuest.JarlCitizenFaction)
Alias_GalmarOrRikke.GetActorRef().SetCrimeFaction(None)
Alias_GalmarOrRikke.GetActorRef().IgnoreFriendlyHits(true)
Alias_GalmarOrRikke.GetActorRef().SetGhost(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE CS_TulliusUlfricSurrenderScript
Quest __temp = self as Quest
CS_TulliusUlfricSurrenderScript kmyQuest = __temp as CS_TulliusUlfricSurrenderScript
;END AUTOCAST
;BEGIN CODE
;Death
Alias_UlfricOrTullius.GetActorRef().GetActorBase().SetEssential(false)
Alias_GalmarOrRikke.GetActorRef().GetActorBase().SetEssential(false)
Alias_GalmarOrRikke.GetActorRef().StartCombat(Game.GetPlayer())
SetObjectiveCompleted(0)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_TulliusUlfricSurrenderScript
Quest __temp = self as Quest
CS_TulliusUlfricSurrenderScript kmyQuest = __temp as CS_TulliusUlfricSurrenderScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.TransferOwnership.MakeCitizen(Alias_UlfricOrTullius.GetActorRef(), kmyQuest.citynum)
kmyQuest.TransferOwnership.MakeCitizen(Alias_GalmarOrRikke.GetActorRef(), kmyQuest.citynum)
Alias_UlfricOrTullius.GetActorRef().EvaluatePackage()
Alias_GalmarOrRikke.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Exile or Free
SetObjectiveCompleted(0)
;Alias_UlfricOrTullius.GetActorRef().SetNoBleedoutRecovery(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
