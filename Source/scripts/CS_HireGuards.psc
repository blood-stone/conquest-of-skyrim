Scriptname CS_HireGuards extends ObjectReference  

Event OnActivate(ObjectReference akActionRef)
	Menu()
EndEvent

Function Menu(int Response = 0)
	Response = RecruitGuardsMessage.show()
	If Response == 0
		Game.GetPlayer().RemoveItem(Gold001, 1000)
		int i = 0
		while i < GuardPosters.GetSize()
			ObjectReference GuardPoster = GuardPosters.GetAt(i) as ObjectReference
			GuardPoster.enable()
			If (GuardPoster as Actor).IsDead() == 1
				(GuardPoster as Actor).Resurrect()
			EndIf
			i += 1
		endwhile
		i = 0
		while i < 3*BarracksLevel.GetValue()
			ObjectReference Guard = Guards.GetAt(i) as ObjectReference
			Guard.enable()
			If (Guard as Actor).IsDead() == 1
				(Guard as Actor).Resurrect()
			EndIf
			GarrisonCount.SetValue(GarrisonCount.GetValue() + 1)
			i += 1
		endwhile	
	EndIf
EndFunction

FormList Property Guards  Auto  

Message Property RecruitGuardsMessage  Auto  

GlobalVariable Property BarracksLevel  Auto  

GlobalVariable Property GarrisonCount  Auto  

MiscObject Property Gold001  Auto  

FormList Property GuardPosters  Auto  
