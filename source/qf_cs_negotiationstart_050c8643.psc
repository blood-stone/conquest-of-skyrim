;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname QF_CS_NegotiationStart_050C8643 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HostASIC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostASIC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostStewardSeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostStewardSeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestASICSeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestASICSeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostStewardStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostStewardStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostASICSeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostASICSeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostLeaderSeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostLeaderSeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostASICStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostASICStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestLeaderStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestLeaderStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecondConcessionCityCounter
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SecondConcessionCityCounter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestASICStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestASICStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HostCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Palace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Palace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecondConcessionCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_SecondConcessionCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestStewardSeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestStewardSeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestASIC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestASIC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HostLeaderStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HostLeaderStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestStewardStand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestStewardStand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestLeaderSeat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GuestLeaderSeat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GuestCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GuestCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FirstConcessionCityCounter
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FirstConcessionCityCounter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FirstConcessionCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FirstConcessionCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NegotiationTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NegotiationTable Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Player asks for city, Guest asks for reparations
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE CS_NegotiationScript
Quest __temp = self as Quest
CS_NegotiationScript kmyQuest = __temp as CS_NegotiationScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(20)
kmyQuest.UnMakeFriends()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveFailed(20)
Game.EnablePlayerControls()
Alias_GuestLeader.GetActorRef().IgnoreFriendlyHits(false)
Alias_GuestASIC.GetActorRef().IgnoreFriendlyHits(false)
Alias_GuestSteward.GetActorRef().IgnoreFriendlyHits(false)
Alias_HostLeader.GetActorRef().IgnoreFriendlyHits(false)
Alias_HostASIC.GetActorRef().IgnoreFriendlyHits(false)
Alias_HostSteward.GetActorRef().IgnoreFriendlyHits(false)
TableDisabler.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Stages 251-255, Player asks for City
;Stages 256-260, Player asks for Minor City
;Stages 261-265, Player asks for Fort
;Stages 266-270, Player asks for Reparations
;Stages 271-275, Player asks for Nothing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player asks for city, Guest asks for city
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE CS_NegotiationScript
Quest __temp = self as Quest
CS_NegotiationScript kmyQuest = __temp as CS_NegotiationScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Game.DisablePlayerControls()
Alias_GuestLeader.GetActorRef().IgnoreFriendlyHits(true)
Alias_GuestASIC.GetActorRef().IgnoreFriendlyHits(true)
Alias_GuestSteward.GetActorRef().IgnoreFriendlyHits(true)
Alias_HostLeader.GetActorRef().IgnoreFriendlyHits(true)
Alias_HostASIC.GetActorRef().IgnoreFriendlyHits(true)
Alias_HostSteward.GetActorRef().IgnoreFriendlyHits(true)
Game.GetPlayer().DispelAllSpells()
Game.GetPlayer().StopCombatAlarm()
kmyQuest.EvaluateNegotiatingPackages()
if !kmyQuest.PeaceTalkStart.IsPlaying()
	kmyQuest.PeaceTalkStart.ForceStart()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveFailed(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
TableDisabler.Stop()
Alias_NegotiationTable.GetReference().EnableNoWait()
if Game.GetPlayer().IsInLocation(Alias_Palace.GetLocation())
	SetStage(10)
else
	SetObjectiveDisplayed(5)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player asks for city; Guest asks for nothing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE CS_NegotiationScript
Quest __temp = self as Quest
CS_NegotiationScript kmyQuest = __temp as CS_NegotiationScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnRegisterForUpdateGameTime()
kmyQuest.Reparations.SetValue(0)
If Alias_Palace.GetLocation() == RiftenMistveilKeepLocation
	int i = 0
	while i < RiftenSeats.Length
		RiftenSeats[i].enable()
		i += 1
	endwhile
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Player asks for city, Guest asks for fort
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE CS_NegotiationScript
Quest __temp = self as Quest
CS_NegotiationScript kmyQuest = __temp as CS_NegotiationScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.UnregisterForUpdateGameTime()
SetObjectiveCompleted(20)
Game.EnablePlayerControls()
Alias_GuestLeader.GetActorRef().IgnoreFriendlyHits(false)
Alias_GuestASIC.GetActorRef().IgnoreFriendlyHits(false)
Alias_GuestSteward.GetActorRef().IgnoreFriendlyHits(false)
Alias_HostLeader.GetActorRef().IgnoreFriendlyHits(false)
Alias_HostASIC.GetActorRef().IgnoreFriendlyHits(false)
Alias_HostSteward.GetActorRef().IgnoreFriendlyHits(false)
kmyQuest.ClearVariables()
TableDisabler.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_NegotiationScript
Quest __temp = self as Quest
CS_NegotiationScript kmyQuest = __temp as CS_NegotiationScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MakeFriends()
kmyQuest.NegotiationDay = Math.Floor(kmyQuest.GameDaysPassed.GetValue()) + 1
kmyQuest.RegisterForUpdateGameTime(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_NegotiationScript
Quest __temp = self as Quest
CS_NegotiationScript kmyQuest = __temp as CS_NegotiationScript
;END AUTOCAST
;BEGIN CODE
If Alias_Palace.GetLocation() == RiftenMistveilKeepLocation
	int i = 0
	while i < RiftenSeats.Length
		RiftenSeats[i].disable()
		i += 1
	endwhile
EndIf
kmyQuest.MoveGuestsToTable()
kmyQuest.EvaluateNegotiatingPackages()
kmyQuest.PeaceTalkStart.ForceStart()
SetObjectiveCompleted(5)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Player asks for city, Guest asks for minor city
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property HostStartScene  Auto  

Quest Property TableDisabler  Auto  

ObjectReference[] Property RiftenSeats  Auto  

Location Property RiftenLocation  Auto  

Location Property RiftenMistveilKeepLocation  Auto  
