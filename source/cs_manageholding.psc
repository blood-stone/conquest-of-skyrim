Scriptname CS_ManageHolding extends ObjectReference  

Quest Property HoldingsQuest Auto

bool Property IsActivated Auto

Event OnActivate(ObjectReference akActionRef)
	if IsActivated == false
		IsActivated = true
		Location NewHolding = (HoldingsQuest as CS_ClaimAreaFunctions).ConvertLocToCS(Holding = self.GetCurrentLocation())
		(HoldingsQuest as CS_ClaimAreaFunctions).ManageHoldingMenu(Holding = NewHolding, SelectedBanner=self)
		IsActivated = false
	endif
EndEvent
