Scriptname CS_ProtestScript extends Quest  

LocationAlias Property City Auto

float Property ProtestDay Auto
GlobalVariable Property GameDaysPassed Auto

Actor Property OldOrganizer Auto

Function AssignFaction()
	If (LoyaltyScript.ConvertVanillaToCS(City.GetLocation())).GetKeywordData(LoyaltyScript.NoFood) == 1
		Organizer.GetActorRef().AddToFaction(NoFoodFaction)
	EndIf

	If (LoyaltyScript.ConvertVanillaToCS(City.GetLocation())).GetKeywordData(LoyaltyScript.NoGarrison) == 1
		Organizer.GetActorRef().AddToFaction(NoGarrisonFaction)
	EndIf

	If (LoyaltyScript.ConvertVanillaToCS(City.GetLocation())).GetKeywordData(LoyaltyScript.NoCourt) == 1
		Organizer.GetActorRef().AddToFaction(NoCourtFaction)
	EndIf

	If (LoyaltyScript.ConvertVanillaToCS(City.GetLocation())).GetKeywordData(LoyaltyScript.Parties) == 1
		Organizer.GetActorRef().AddToFaction(PartyFaction)
	EndIf
EndFunction

Function RemoveAllFactions()
	Organizer.GetActorRef().RemoveFromFaction(NoFoodFaction)
	Organizer.GetActorRef().RemoveFromFaction(NoGarrisonFaction)
	Organizer.GetActorRef().RemoveFromFaction(NoCourtFaction)
	Organizer.GetActorRef().RemoveFromFaction(PartyFaction)
EndFunction

Function DuplicateOrganizer()
	Actor NewOrganizer = Organizer.GetActorRef().PlaceAtMe(Organizer.GetActorRef().GetActorBase()) as Actor
	OldOrganizer = Organizer.GetActorRef()
	Organizer.GetActorRef().disable()
	Organizer.ForceRefTo(NewOrganizer)
EndFunction

Function MoveCitizensToMarkers()
	int i = 0
	while i < Citizens.Length
		Citizens[i].GetActorRef().MoveTo(CitizenMarkers[i].GetReference())
		i += 1
	endwhile
EndFunction

Function SpawnGuard()
	Actor Guard = Game.GetPlayer().PlaceAtMe(GuardBase) as Actor
	GuardFollower.ForceRefTo(Guard)
EndFunction

Function StartProtest()
	ProtestScene.ForceStart()
EndFunction

Function ArrestOrganizer()
	ArrestGuard.ForceRefTo(GuardFollower.GetActorRef())
	Arrestee.ForceRefTo(Organizer.GetActorRef())
	Organizer.GetActorRef().AddToFaction(CrimeTreasonFaction)
	GuardFollower.Clear()
	Organizer.Clear()
	LoyaltyScript.AdjustLoyalty(LoyaltyScript.ConvertVanillaToCS(City.GetLocation()), 10)
	ArrestScene.ForceStart()
EndFunction

Function UnDuplicateOrganizer()
	Organizer.GetActorRef().disable()
	OldOrganizer.enable()
EndFunction

Event OnUpdateGameTime()
	If math.floor(GameDaysPassed.GetValue()) >= ProtestDay && GetStage() >= 10 && Game.GetPlayer().IsInLocation(City.GetLocation()) == 0
		SetStage(101)
	EndIf
EndEvent
ReferenceAlias[] Property Citizens  Auto  

ReferenceAlias[] Property CitizenMarkers  Auto  

ReferenceAlias Property Organizer Auto

Scene Property ProtestScene  Auto  

Faction Property NoFoodFaction Auto
Faction Property NoGarrisonFaction Auto
Faction Property NoCourtFaction Auto
Faction Property PartyFaction Auto

Message Property ProtestMessage  Auto  

Scene Property DemandsScene  Auto  

ActorBase Property GuardBase  Auto  

ReferenceAlias Property GuardFollower  Auto  

Scene Property ArrestScene  Auto  

ReferenceAlias Property ArrestGuard  Auto  

ReferenceAlias Property Arrestee  Auto  

Faction Property CrimeTreasonFaction  Auto  

CS_LoyaltyCheckScript Property LoyaltyScript Auto

Faction Property prisonerFaction  Auto  
