Scriptname CS_PotentialSponsorScript extends Quest Conditional 

Quest Property GetSponsorFamily Auto
Quest Property MQ104 Auto
Quest Property MQ305 Auto
Quest Property C00VilkasTrainingQuest Auto
Quest Property C03 Auto
Quest Property C06 Auto
Quest Property CWObj Auto

ReferenceAlias Property SponsorStagingAlias Auto
ReferenceAlias Property FoundSponsorSpouse Auto
ReferenceAlias[] Property FoundSponsorFamily Auto

ReferenceAlias Property Sponsor Auto
ReferenceAlias Property SponsorSpouse Auto
ReferenceAlias[] Property SponsorFamily Auto

ReferenceAlias Property PlayerChildOriginal1 Auto
ReferenceAlias Property PlayerChildOriginal2 Auto
ReferenceAlias Property PlayerSpouseOriginal Auto
ReferenceAlias Property PlayerChild1 Auto
ReferenceAlias Property PlayerChild2 Auto
ReferenceAlias Property PlayerSpouse Auto

ReferenceAlias Property MarriageOfferPlayer Auto
ReferenceAlias Property MarriageSponsor Auto

GlobalVariable Property CoinSponsors Auto

int Property MarriageOfferSponsorNum=-1 Auto

int Property PlayerReputation Auto Conditional
int Property PlayerAskValue Auto Conditional
int Property PlayerOfferValue Auto Conditional

int Property PlayerCoinAsk Auto

bool Property OfferAccepted Auto Conditional


CS_RefreshTroopRespawn Property TroopRespawn Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_MarriageScript Property MarriageScript Auto

Function GetSponsorFamily(Actor PotentialSponsor)
	OfferAccepted = false
	PlayerAskValue = 0
	PlayerOfferValue = 0
	MarriageOfferSponsorNum = -1
	ClearSponsorFamily()

	Sponsor.ForceRefTo(PotentialSponsor)
	SponsorStagingAlias.ForceRefTo(PotentialSponsor)

	GetSponsorFamily.Start()
	if FoundSponsorSpouse.GetActorRef()
		SponsorSpouse.ForceRefTo(FoundSponsorSpouse.GetActorRef())
	endif

	int i = 0
	while i < SponsorFamily.Length
		if FoundSponsorFamily[i].GetActorRef()
			SponsorFamily[i].ForceRefTo(FoundSponsorFamily[i].GetActorRef())
		endif
		i += 1
	endwhile

	GetSponsorFamily.Stop()

	if PlayerSpouseOriginal.GetActorRef()
		PlayerSpouse.ForceRefTo(PlayerSpouseOriginal.GetActorRef())
	endif

	if PlayerChildOriginal1.GetActorRef()
		PlayerChild1.ForceRefTo(PlayerChildOriginal1.GetActorRef())
	endif

	if PlayerChildOriginal2.GetActorRef()
		PlayerChild2.ForceRefTo(PlayerChildOriginal2.GetActorRef())
	endif
EndFunction

Function ClearSponsorFamily()
	SponsorSpouse.TryToClear()

	int i = 0
	while i < SponsorFamily.Length
		SponsorFamily[i].TryToClear()
		i += 1
	endwhile
EndFunction

Function MarryFamilyMember(int FamilyMemberNum)
	MarriageSponsor.ForceRefTo(Sponsor.GetActorRef())
	if FamilyMemberNum < 6
		MarriageScript.StartMarriage(SponsorFamily[FamilyMemberNum].GetActorRef())
	else
		MarriageScript.StartMarriage(Sponsor.GetActorRef())
	endif
EndFunction

Function CalculateMarriageOfferValue(string OfferPerson)

	PlayerAskValue += 1000

	if OfferPerson == "Player"
		MarriageOfferPlayer.ForceRefTo(Game.GetPlayer())
		PlayerOfferValue += PlayerReputation*100
	elseif OfferPerson == "Child1"
		PlayerOfferValue += PlayerReputation*75
		MarriageOfferPlayer.ForceRefTo(PlayerChild1.GetActorRef())
	elseif OfferPerson == "Child2"
		PlayerOfferValue += PlayerReputation*75
		MarriageOfferPlayer.ForceRefTo(PlayerChild2.GetActorRef())
	endif

	CalculateProposalSuccess()
EndFunction

Function CalculateProposalSuccess()
	if PlayerOfferValue >= PlayerAskValue
		OfferAccepted = true
	endif
EndFunction

Function StartTerms()
	CoinSponsors.Mod(PlayerCoinAsk)
EndFunction

Function CalculatePlayerReputation()
	float ArmyCount = 0
	int i = 0
	while i < CommanderScript.ArmyScripts.Length
		ArmyCount += CommanderScript.ArmyScripts[i].TroopCount
		i += 1
	endwhile

	float MiscCount = TroopRespawn.MiscCount.GetValue()
	float FortCount = TroopRespawn.FortCount.GetValue()
	float VillageCount = TroopRespawn.VillageCount.GetValue()
	float MinorCityCount = TroopRespawn.MinorCityCount.GetValue()
	float MajorCityCount = TroopRespawn.MajorCityCount.GetValue()

	int QuestReputation = 0
	if MQ104.IsStageDone(80) ;Adds Reputation for Main Quests
		QuestReputation += 800
	endif

	if MQ305.IsStageDone(200)
		QuestReputation += 1200
	endif

	if C00VilkasTrainingQuest.IsStageDone(200) ;Adds Reputation for Companions
		QuestReputation += 200
	endif

	if C03.IsStageDone(20)
		QuestReputation += 600
	endif

	if C06.IsStageDone(200)
		QuestReputation += 1200
	endif

	if CWObj.IsStageDone(255) ;Adds Reputation for completing Civil War
		QuestReputation += 1200
	endif

	PlayerReputation = math.floor(ArmyCount*0.10 + MiscCount*2 + FortCount*2 + VillageCount*2 + MinorCityCount*10 + MajorCityCount*20 + QuestReputation)
EndFunction