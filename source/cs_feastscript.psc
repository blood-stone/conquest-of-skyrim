Scriptname CS_FeastScript extends Quest  

float Property FeastDay Auto

GlobalVariable Property GameDaysPassed Auto

ReferenceAlias[] Property Guests Auto
ReferenceAlias Property PalaceEntranceMarker Auto

FormList Property GuestList Auto

Function MoveGuestsToPalace()
	int i = 0
	while i < Guests.Length
		if Guests[i].GetActorRef() && !Guests[i].GetRef().IsNearPlayer()
			Guests[i].GetActorRef().MoveTo(PalaceEntranceMarker.GetRef())
		endif
		i += 1
	endwhile	
EndFunction

Function AddGuestsToAliases()
	int i = 0
	while i < Guests.Length
		if GuestList.GetAt(i) as Actor
			Guests[i].ForceRefTo(GuestList.GetAt(i) as Actor)
		endif
		i += 1
	endwhile
EndFunction

Event OnUpdateGameTime()
	if GameDaysPassed.GetValue() >= FeastDay
		SetStage(10)
	endif
EndEvent