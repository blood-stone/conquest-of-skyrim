Scriptname CS_LawMenuScript extends Quest  Conditional


Location Property EntireFaction Auto

LocationAlias Property LawCity Auto

FormList Property AllLocations  Auto  
FormList Property AllHoldings  Auto  

ReferenceAlias Property LawAlias0 Auto
ReferenceAlias Property LawAlias1 Auto

int Property IntNum0 Auto conditional
int Property IntNum1 Auto conditional
int Property holdingnum Auto conditional

GlobalVariable Property GameDaysPassed  Auto  

CS_LoyaltyCheckScript Property LoyaltyCheck Auto

;Menu Start ----------------------------------------------------------------------------------------------------------------------------------------------

Message Property MenuStart Auto


Function LawMenuStart(int Response=0, int holding=-1)
	holdingnum = holding
	UpdateCurrentInstanceGlobal(GameDaysPassed)
	Response = MenuStart.show()
	if Response == 0
		LawMenuMilitary()
	elseif Response == 1
		LawMenuPunishment(holding=holding)
	elseif Response == 2
		LawMenuReligion1(holding=holding)
	endif
EndFunction


;Military Menu ----------------------------------------------------------------------------------------------------------------------------------------------

Message Property MenuMilitary Auto
Message Property MenuMilitaryConscription Auto
Message Property MenuMilitaryConscriptionFinal Auto

GlobalVariable Property MilitaryConscriptionNum Auto
GlobalVariable Property MilitaryConscriptionNumFinal Auto

Keyword Property RecruitablePercentage  Auto  

Function LawMenuMilitary(int Response=0)
	if holdingnum == -1
		LawCity.ForceLocationTo(EntireFaction)
	else
		LawCity.ForceLocationTo(AllLocations.GetAt(holdingnum) as Location)
	endif
	Response = MenuMilitary.show()
	if Response == 0
		LawMenuMilitaryConscription()
	elseif Response == 1
		LawMenuStart()
	endif
EndFunction

Function LawMenuMilitaryConscription(int Response=0)
	if holdingnum == -1
		if EntireFaction.GetKeywordData(RecruitablePercentage) == -1
			MilitaryConscriptionNum.SetValue(0)
		else
			MilitaryConscriptionNum.SetValue(100*EntireFaction.GetKeywordData(RecruitablePercentage))
		endif
	else
		Location Holding = AllLocations.GetAt(holdingnum) as Location
		if Holding.GetKeywordData(RecruitablePercentage) == -1
			MilitaryConscriptionNum.SetValue(0)
		else
			MilitaryConscriptionNum.SetValue(100*Holding.GetKeywordData(RecruitablePercentage))
		endif
	endif
	UpdateCurrentInstanceGlobal(MilitaryConscriptionNum)
	IntNum0 = MilitaryConscriptionNum.GetValue() as int
	Response = MenuMilitaryConscription.show()
	if Response < 5
		MilitaryConscriptionNumFinal.SetValue((Response)*25)
		LawMenuMilitaryConscriptionFinal()
	elseif Response == 5
		LawMenuMilitary()
	endif
EndFunction

Function LawMenuMilitaryConscriptionFinal(int Response=0)
	UpdateCurrentInstanceGlobal(MilitaryConscriptionNumFinal)
	Response = MenuMilitaryConscriptionFinal.show()
	if Response == 0
		MilitaryConscriptionNum.SetValue(MilitaryConscriptionNumFinal.GetValue())
		if holdingnum == -1
			SetFactionConscriptionPercentage((MilitaryConscriptionNumFinal.GetValue() as float)/100)
		else
			SetHoldConscriptionPercentage(holdingnum, (MilitaryConscriptionNumFinal.GetValue() as float)/100)
		endif
	elseif Response == 1
		LawMenuMilitaryConscription()
	endif
EndFunction



Function SetFactionConscriptionPercentage(float amount)
	float initialpercentage = EntireFaction.GetKeywordData(RecruitablePercentage)
	bool[] excludedholdings = new bool[14]
	int i = 0
	while i < AllLocations.GetSize()
		Location Holding = AllLocations.GetAt(i) as Location
		if Holding.GetKeywordData(RecruitablePercentage) != -1
			excludedholdings[i] = true
		else
			excludedholdings[i] = false
		endif
		i += 1
	endwhile
	LoyaltyCheck.AdjustLoyaltyAll(math.floor(20*(initialpercentage - amount)), excludedholdings)
	EntireFaction.SetKeywordData(RecruitablePercentage, amount)
EndFunction

Function SetHoldConscriptionPercentage(int holdingnum, float amount, int changeloyalty=1)
	Location Holding = AllLocations.GetAt(holdingnum) as Location
	float initialpercentage = Holding.GetKeywordData(RecruitablePercentage) as float
	if initialpercentage == -1
		initialpercentage = 0
	endif
	Holding.SetKeywordData(RecruitablePercentage, amount)
	if changeloyalty == 1
		LoyaltyCheck.AdjustLoyalty(Holding, math.floor(20*(initialpercentage - amount)))
	endif
EndFunction


;Crime Punishment Menu ----------------------------------------------------------------------------------------------------------------------------------------------

Message Property MenuPunishment Auto
Message Property MenuPunishmentSentence Auto
Message Property MenuPunishmentSentenceFinal Auto
Message Property MenuPunishmentSentenceFinalCancel Auto

FormList Property PunishmentBarrels Auto
FormList Property PunishmentSentenceBarrels Auto
FormList Property PunishmentKeywords Auto 

Function LawMenuPunishment(int Response=0, int holding)
	Response = MenuPunishment.show()
	if Response < PunishmentBarrels.GetSize()
		LawAlias0.ForceRefTo(PunishmentBarrels.GetAt(Response) as ObjectReference)
		int crimenum = PunishmentBarrels.Find(LawAlias0.GetReference())
		if holding == -1
			IntNum0 = EntireFaction.GetKeywordData(PunishmentKeywords.GetAt(crimenum) as Keyword) as int
		else
			IntNum0 = (AllLocations.GetAt(holding) as Location).GetKeywordData(PunishmentKeywords.GetAt(crimenum) as Keyword) as int
		endif
		LawMenuPunishmentSentence(holding=holding)
	elseif Response == PunishmentBarrels.GetSize()
		LawMenuStart()
	endif
EndFunction

Function LawMenuPunishmentSentence(int Response=0, int holding)
	Response = MenuPunishmentSentence.show()
	if Response < PunishmentSentenceBarrels.GetSize()
		LawAlias1.ForceRefTo(PunishmentSentenceBarrels.GetAt(Response) as ObjectReference)
		LawMenuPunishmentSentenceFinal(holding=holding)
	elseif Response == PunishmentSentenceBarrels.GetSize()
		LawMenuPunishmentSentenceFinal(holding=holding, cancel=true)
	elseif Response == PunishmentSentenceBarrels.GetSize() + 1
		LawMenuPunishment(holding=holding)
	endif
EndFunction

Function LawMenuPunishmentSentenceFinal(int Response=0, int holding, bool cancel=false)
	int punishmentnum = 0
	if cancel == false
		Response = MenuPunishmentSentenceFinal.show()
	else
		punishmentnum = -1
		Response = MenuPunishmentSentenceFinalCancel.show()
	endif
	if Response == 0
		SetPunishment(holding, punishmentnum)
	elseif Response == 1
		LawMenuPunishmentSentence(holding=holding)
	endif
EndFunction

Function SetPunishment(int holding, int punishmentnum=0)
		int crimenum = PunishmentBarrels.Find(LawAlias0.GetReference())
		if punishmentnum == 0
			punishmentnum = PunishmentSentenceBarrels.Find(LawAlias1.GetReference())
		endif
		if holding == -1
			EntireFaction.SetKeywordData((PunishmentKeywords.GetAt(crimenum) as Keyword), punishmentnum)
		else
			(AllLocations.GetAt(holding) as Location).SetKeywordData((PunishmentKeywords.GetAt(crimenum) as Keyword), punishmentnum)
		endif
EndFunction


;Religion Menu ------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Message Property MenuReligion1 Auto
Message Property MenuReligion2 Auto
Message Property MenuReligion3 Auto
Message Property MenuReligion4 Auto
Message Property MenuReligion5 Auto
Message Property MenuReligionChange Auto
Message Property MenuReligionChangeFinal Auto

FormList Property ReligionBarrels1 Auto
FormList Property ReligionBarrels2 Auto
FormList Property ReligionBarrels3 Auto
FormList Property ReligionBarrels4 Auto
FormList Property ReligionBarrels5 Auto
FormList Property ReligionChangeBarrels Auto
FormList Property ReligionKeywords Auto 
FormList Property ReligionBarrelsAll Auto
FormList Property ReligionAllowed Auto
FormList Property ReligionIllegal Auto
FormList Property ReligionRequired Auto
FormList Property AllShrines Auto
FormList Property AllStatues Auto

Static[] Property Statues Auto
Static[] Property Statues2 Auto

Activator[] Property Shrines Auto
Activator[] Property Shrines2 Auto

Activator Property ChosenShrine Auto
Static Property ChosenStatue Auto

ReferenceAlias Property StatueAlias Auto

Function LawMenuReligion1(int Response=0, int holding)
	ChosenShrine = None
	Response = MenuReligion1.show()
	if Response < ReligionBarrels1.GetSize()
		LawAlias0.ForceRefTo(ReligionBarrels1.GetAt(Response) as ObjectReference)
		ChosenShrine = Shrines[ReligionBarrels1.Find(LawAlias0.GetReference())]
		ChosenStatue = Statues[ReligionBarrels1.Find(LawAlias0.GetReference())]
		LawMenuReligionChange(holding=holding)
	elseif Response == ReligionBarrels1.GetSize()
		LawMenuReligion2(holding=holding)
	elseif Response == ReligionBarrels1.GetSize() + 1
		LawMenuStart(holding=holding)
	endif
EndFunction

Function LawMenuReligion2(int Response=0, int holding)
	Response = MenuReligion2.show()
	if Response == 0
		LawMenuReligion1(holding=holding)
	elseif Response - 1 < ReligionBarrels2.GetSize()
		LawAlias0.ForceRefTo(ReligionBarrels2.GetAt(Response - 1) as ObjectReference)
		ChosenShrine = Shrines2[ReligionBarrels2.Find(LawAlias0.GetReference())]
		ChosenStatue = Statues2[ReligionBarrels2.Find(LawAlias0.GetReference())]
		LawMenuReligionChange(holding=holding)
	elseif Response - 1 == ReligionBarrels2.GetSize()
		LawMenuReligion3(holding=holding)
	elseif Response - 2 == ReligionBarrels2.GetSize()
		LawMenuStart(holding=holding)
	endif
EndFunction

Function LawMenuReligion3(int Response=0, int holding)
	Response = MenuReligion3.show()
	if Response == 0
		LawMenuReligion2(holding=holding)
	elseif Response - 1 < ReligionBarrels3.GetSize()
		LawAlias0.ForceRefTo(ReligionBarrels3.GetAt(Response - 1) as ObjectReference)
		LawMenuReligionChange(holding=holding)
	elseif Response - 1 == ReligionBarrels3.GetSize()
		LawMenuReligion4(holding=holding)
	elseif Response - 2 == ReligionBarrels3.GetSize()
		LawMenuStart(holding=holding)
	endif
EndFunction

Function LawMenuReligion4(int Response=0, int holding)
	Response = MenuReligion4.show()
	if Response == 0
		LawMenuReligion3(holding=holding)
	elseif Response - 1 < ReligionBarrels4.GetSize()
		LawAlias0.ForceRefTo(ReligionBarrels4.GetAt(Response - 1) as ObjectReference)
		LawMenuReligionChange(holding=holding)
	elseif Response - 1 == ReligionBarrels4.GetSize()
		LawMenuReligion5(holding=holding)
	elseif Response - 2 == ReligionBarrels4.GetSize()
		LawMenuStart(holding=holding)
	endif
EndFunction

Function LawMenuReligion5(int Response=0, int holding)
	Response = MenuReligion5.show()
	if Response == 0
		LawMenuReligion4(holding=holding)
	elseif Response - 1 < ReligionBarrels5.GetSize()
		LawAlias0.ForceRefTo(ReligionBarrels5.GetAt(Response - 1) as ObjectReference)
		LawMenuReligionChange(holding=holding)
	elseif Response - 1 == ReligionBarrels5.GetSize()
		LawMenuStart(holding=holding)
	endif
EndFunction

Function LawMenuReligionChange(int Response=0, int holding)
	Response = MenuReligionChange.show()
	if Response < ReligionChangeBarrels.GetSize()
		LawAlias1.ForceRefTo(ReligionChangeBarrels.GetAt(Response) as ObjectReference)
		LawMenuReligionChangeFinal(holding=holding)
	elseif Response == ReligionChangeBarrels.GetSize()
		LawMenuReligion1(holding=holding)
	elseif Response == ReligionChangeBarrels.GetSize() + 1
		LawMenuReligionChange(holding=holding)
	endif
EndFunction

Function LawMenuReligionChangeFinal(int Response=0, int holding)
	Response = MenuReligionChangeFinal.show()
	if Response == 0
		if ReligionChangeBarrels.Find(LawAlias1.GetReference()) == 0
			DisableShrinesAndStatues()
			int deitynum = ReligionBarrelsAll.Find(LawAlias0.GetReference())
			Keyword DeityKeyword = ReligionKeywords.GetAt(deitynum) as Keyword

			if ReligionAllowed.Find(DeityKeyword) >= 0
				ReligionAllowed.RemoveAddedForm(DeityKeyword)
			endif

			if ReligionRequired.Find(DeityKeyword) >= 0
				ReligionRequired.RemoveAddedForm(DeityKeyword)
			endif

			ReligionIllegal.AddForm(DeityKeyword)

		elseif ReligionChangeBarrels.Find(LawAlias1.GetReference()) == 1
			EnableShrinesAndStatues()
			int deitynum = ReligionBarrelsAll.Find(LawAlias0.GetReference())
			Keyword DeityKeyword = ReligionKeywords.GetAt(deitynum) as Keyword

			if ReligionIllegal.Find(DeityKeyword) >= 0
				ReligionIllegal.RemoveAddedForm(DeityKeyword)
			endif

			if ReligionRequired.Find(DeityKeyword) >= 0
				ReligionRequired.RemoveAddedForm(DeityKeyword)
			endif

			ReligionAllowed.AddForm(DeityKeyword)

		elseif ReligionChangeBarrels.Find(LawAlias1.GetReference()) == 2
			EnableShrinesAndStatues()
			int deitynum = ReligionBarrelsAll.Find(LawAlias0.GetReference())
			Keyword DeityKeyword = ReligionKeywords.GetAt(deitynum) as Keyword

			if ReligionIllegal.Find(DeityKeyword) >= 0
				ReligionIllegal.RemoveAddedForm(DeityKeyword)
			endif

			if ReligionAllowed.Find(DeityKeyword) >= 0
				ReligionAllowed.RemoveAddedForm(DeityKeyword)
			endif

			ReligionRequired.AddForm(DeityKeyword)
		endif
	elseif Response == 1
		LawMenuReligionChange(holding=holding)
	endif
EndFunction

Function DisableShrinesAndStatues()
	int i = 0
	while i < AllShrines.GetSize()
		if (AllShrines.GetAt(i) as ObjectReference).GetBaseObject() == ChosenShrine
			(AllShrines.GetAt(i) as ObjectReference).disable()
		endif
		i += 1
	endwhile
	i = 0
	while i < AllStatues.GetSize()
		if (AllStatues.GetAt(i) as ObjectReference).GetBaseObject() == ChosenStatue
			(AllStatues.GetAt(i) as ObjectReference).disable()
		endif
		i += 1
	endwhile
EndFunction

Function EnableShrinesAndStatues()
	int i = 0
	while i < AllShrines.GetSize()
		if (AllShrines.GetAt(i) as ObjectReference).GetBaseObject() == ChosenShrine
			(AllShrines.GetAt(i) as ObjectReference).enable()
		endif
		i += 1
	endwhile
	i = 0
	while i < AllStatues.GetSize()
		if (AllStatues.GetAt(i) as ObjectReference).GetBaseObject() == ChosenStatue
			(AllStatues.GetAt(i) as ObjectReference).enable()
		endif
		i += 1
	endwhile
EndFunction