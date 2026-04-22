Scriptname CS_PotentialSponsorScript extends Quest Conditional 

Quest Property GetSponsorFamily Auto
Quest Property MQ104 Auto
Quest Property MQ305 Auto
Quest Property C00VilkasTrainingQuest Auto
Quest Property C03 Auto
Quest Property C06 Auto
Quest Property CWObj Auto

Keyword Property CS_StoryMarriage Auto

Faction Property CS_SponsorFaction Auto
Faction Property CS_Sponsor1000Faction Auto
Faction Property CS_Sponsor5000Faction Auto
Faction Property CS_Sponsor10000Faction Auto
Faction Property CS_SponsorPromisedFaction Auto
Faction Property CS_JarlFaction Auto

FormList Property CS_AllFamilyFactions Auto
FormList Property CS_FamilyTitlesMale Auto
FormList Property CS_FamilyTitlesFemale Auto
FormList Property CS_DiplomacySponsors1000 Auto
FormList Property CS_DiplomacySponsors5000 Auto
FormList Property CS_DiplomacySponsors10000 Auto
FormList Property CS_FactionActivatorsHolds Auto
FormList Property CS_CityManagementActivators Auto

ReferenceAlias Property PlayerFactionActivatorAlias Auto

ReferenceAlias Property SponsorStagingAlias Auto
ReferenceAlias Property FoundSponsorSpouse Auto
ReferenceAlias[] Property FoundSponsorFamily Auto

ReferenceAlias Property Sponsor Auto
ReferenceAlias Property SponsorSpouse Auto
ReferenceAlias Property FamilyTitle Auto
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

Message Property CS_SponsorsStartMessage Auto

int Property MarriageOfferSponsorNum=-1 Auto

int Property PlayerReputation Auto Conditional
int Property PlayerAskValue Auto Conditional
int Property PlayerOfferValue Auto Conditional
int Property OpinionAgreement Auto Conditional

int Property PlayerCoinAsk Auto

bool Property OfferAccepted Auto Conditional

ObjectReference CityActivator
ObjectReference FactionActivator

CS_RefreshTroopRespawn Property TroopRespawn Auto
CS_PatrolHoldScript Property CommanderScript Auto
CS_MarriageScript Property MarriageScript Auto
CS_PublicOpinionScript Property PublicOpinion Auto
FavorDialogueScript Property DialogueFavorGeneric Auto

Function SetUp(Actor Person)
    CityActivator = None
    FactionActivator = None
    Sponsor.ForceRefTo(Person)
    if Person.IsInFaction(CS_JarlFaction)
        int holdnum = -1
        
        int i = 0
        while i < CS_FactionActivatorsHolds.GetSize() && holdnum == -1
            ObjectReference FactionManagementActivator = (CS_FactionActivatorsHolds.GetAt(i) as ObjectReference)
            if (FactionManagementActivator as CS_FactionManagementOwnership).Leader == Person
                holdnum = i
                FactionActivator = FactionManagementActivator
            endif
            i += 1
        endwhile
    else
        int holdnum = -1
        ActorBase PersonBase = Person.GetActorBase()
        
        int i = 0
        while i < CS_CityManagementActivators.GetSize() && holdnum == -1
            ObjectReference CityManagementActivator = (CS_CityManagementActivators.GetAt(i) as ObjectReference)
            if (CityManagementActivator as CS_CityManagementPopulation).Nobles.Find(PersonBase) >= 0
                holdnum = i
                CityActivator = CityManagementActivator
                FactionActivator = (CityManagementActivator as CS_CityManagementOwnership).FactionOwnerActivator
            endif
            i += 1
        endwhile
    endif
EndFunction

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
    
    FamilyTitle.Clear()
    i = 0
    bool foundfamilytitle = false
    while i < CS_AllFamilyFactions.GetSize() && !foundfamilytitle
        if PotentialSponsor.IsInFaction(CS_AllFamilyFactions.GetAt(i) as Faction)
            if PotentialSponsor.GetActorBase().GetSex() == 0
                FamilyTitle.ForceRefTo(CS_FamilyTitlesMale.GetAt(i) as ObjectReference)
            elseif PotentialSponsor.GetActorBase().GetSex() == 1
                FamilyTitle.ForceRefTo(CS_FamilyTitlesFemale.GetAt(i) as ObjectReference)
            endif
            foundfamilytitle = true
        endif
        i += 1
    endwhile
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
    if FamilyMemberNum < 6
        debug.trace("Sending " + FamilyMemberNum + " Story Event")
        CS_StoryMarriage.SendStoryEvent(akRef1 = Sponsor.GetActorRef(), akRef2 = SponsorFamily[FamilyMemberNum].GetActorRef())
    else
        debug.trace("Sending Sponsor Story Event")
        if !Sponsor.GetActorRef()
            debug.trace("Can't find sponsor")
        endif
        CS_StoryMarriage.SendStoryEvent(akRef1 = Sponsor.GetActorRef())
    endif
EndFunction

Function CalculateMarriageOfferValue(string OfferPerson)

    PlayerAskValue = 1000
    PlayerOfferValue = 10000 ; CHANGE TO 0 WHEN DONE!!!

    if OfferPerson == "Player"
        MarriageOfferPlayer.ForceRefTo(Game.GetPlayer())
        PlayerOfferValue += PlayerReputation*50
        PlayerOfferValue += OpinionAgreement*50
    elseif OfferPerson == "Child1"
        PlayerOfferValue += PlayerReputation*25
        PlayerOfferValue += OpinionAgreement*50
        MarriageOfferPlayer.ForceRefTo(PlayerChild1.GetActorRef())
    elseif OfferPerson == "Child2"
        PlayerOfferValue += PlayerReputation*25
        PlayerOfferValue += OpinionAgreement*50
        MarriageOfferPlayer.ForceRefTo(PlayerChild2.GetActorRef())
    endif

    CalculateProposalSuccess()
EndFunction

Function CalculateProposalSuccess()
    if PlayerOfferValue >= PlayerAskValue
        OfferAccepted = true
    endif
EndFunction

Function AddSponsorToPromised(Actor PotentialSponsor)
    PotentialSponsor.AddToFaction(CS_SponsorPromisedFaction)
EndFunction

Function StartSponsor()
    CS_FactionManagementEconomy EconomyScript = PlayerFactionActivatorAlias.GetRef() as CS_FactionManagementEconomy
    
    if PlayerCoinAsk == 1000
        CS_DiplomacySponsors1000.AddForm(Sponsor.GetActorRef().GetActorBase())
        EconomyScript.AddSponsor(Sponsor.GetActorRef(), 1000)
    elseif PlayerCoinAsk == 5000
        CS_DiplomacySponsors5000.AddForm(Sponsor.GetActorRef().GetActorBase())
        EconomyScript.AddSponsor(Sponsor.GetActorRef(), 5000)
    elseif PlayerCoinAsk == 10000
        CS_DiplomacySponsors10000.AddForm(Sponsor.GetActorRef().GetActorBase())
        EconomyScript.AddSponsor(Sponsor.GetActorRef(), 10000)
    endif
    
    CS_SponsorsStartMessage.show(PlayerCoinAsk as float)
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

Function GetActorOpinionOfPlayer(Actor PotentialSponsor)
    OpinionAgreement = PublicOpinion.GetActorOpinionOfActor(PotentialSponsor, Game.GetPlayer())
EndFunction

Function CalculateTerms(Actor PotentialSponsor, int AskCoin)
    PlayerCoinAsk = AskCoin
    int InitialDifficulty = AskCoin/100
    int holdnum = PublicOpinion.GetPersonHold(PotentialSponsor)
    
    if CityActivator
        ((self as Quest) as CS_ConvinceScript).SetConvinceDifficulty(PotentialSponsor, InitialDifficulty, CityActivator)
    else
        ((self as Quest) as CS_ConvinceScript).SetConvinceDifficulty(PotentialSponsor, InitialDifficulty, FactionActivator)
    endif
EndFunction