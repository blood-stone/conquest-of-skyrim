Scriptname CS_PublicOpinionScript extends Quest conditional

;/

Issues for each hold:
00 = CW;;; -1 = Empire, 0 = Neutral, 1 = Stormcloaks
01 = Thalmor;;; -1 = Support Thalmor, 0 = Neutral, 1 = Oppose Thalmor
02 = Magic;;; -1 = Support Ban, 0 = Moderate/Neutral, 1 = Oppose Regulation
03 = Races;;; -1 = Full Rights, 0 = Limited/Neutral, 1 = No Rights
04 = Vampire;;; -1 = Support Extermination, 0 = Neutral, 1 = Support Coexistance
05 = Werewolf;;; -1 = Support Extermination, 0 = Neutral, 1 = Support Coexistance
06 = Forsworn;;; -1 = Support Suppression, 0 = Neutral, 1 = Support Forsworn
07 = Talos;;; -1 = Support Ban, 0 = Neutral, 1 = Support Freedom of Worship
08 = Skooma;;; -1 = Support Ban, 0 = Moderate Regulation/Neutral, 1 = Support Decriminalization

/;
int[] Property StancesCityMarkath Auto
int[] Property StancesCityRiften Auto
int[] Property StancesCitySolitude Auto
int[] Property StancesCityWhiterun Auto
int[] Property StancesCityWindhelm Auto
int[] Property StancesMinorCityDawnstar Auto
int[] Property StancesMinorCityFalkreath Auto
int[] Property StancesMinorCityMorthal Auto
int[] Property StancesMinorCityWinterhold Auto
int[] Property StancesFactionImp Auto
int[] Property StancesFactionSons Auto

int[] Property ImportanceCityMarkath Auto
int[] Property ImportanceCityRiften Auto
int[] Property ImportanceCitySolitude Auto
int[] Property ImportanceCityWhiterun Auto
int[] Property ImportanceCityWindhelm Auto
int[] Property ImportanceMinorCityDawnstar Auto
int[] Property ImportanceMinorCityFalkreath Auto
int[] Property ImportanceMinorCityMorthal Auto
int[] Property ImportanceMinorCityWinterhold Auto
int[] Property ImportanceFactionImp Auto
int[] Property ImportanceFactionSons Auto

int Property Agreement00 Auto conditional
int Property Agreement01 Auto conditional
int Property Agreement02 Auto conditional
int Property Agreement03 Auto conditional
int Property Agreement04 Auto conditional
int Property Agreement05 Auto conditional
int Property Agreement06 Auto conditional
int Property Agreement07 Auto conditional
int Property Agreement08 Auto conditional

;Current Jarls
ActorBase Property Igmund Auto
ActorBase Property Laila Auto
ActorBase Property ElisifTheFair Auto
ActorBase Property BalgruuftheGreater Auto
ActorBase Property Ulfric Auto
ActorBase Property SkaldtheElder Auto
ActorBase Property Siddgeir Auto
ActorBase Property IdgrodRavencrone Auto
ActorBase Property Korir Auto

;Potential Jarls
ActorBase Property Thongvor Auto
ActorBase Property Maven Auto
ActorBase Property VignarGrayMane Auto
ActorBase Property Brunwulf Auto
ActorBase Property BrinaMerilis Auto
ActorBase Property Dengeir Auto
ActorBase Property Sorli Auto
ActorBase Property Kraldar Auto

;Potential Sponsors
ActorBase Property OlfridBattleBorn Auto
ActorBase Property Rorik Auto
ActorBase Property Erikur Auto
ActorBase Property Torbjorn Auto
ActorBase Property Nazeem Auto
ActorBase Property Thonar Auto
ActorBase Property Hemming Auto
ActorBase Property Sabjorn Auto
ActorBase Property OrthusEndario Auto
ActorBase Property Bolli Auto
ActorBase Property Endon Auto
ActorBase Property Ainethach Auto

FormList Property CS_PotentialSponsors Auto
FormList Property PlayerStancesMenu Auto

Faction Property GovImperial Auto
Faction Property GovSons Auto

GlobalVariable[] Property PlayerStances Auto

Function GetPlayerStancesMenu()
    int Response = (PlayerStancesMenu.GetAt(0) as Message).show()
    if Response == 0
        int i = 1
        int stancenum = 0
        while i < PlayerStances.Length
            int StanceResponse = (PlayerStancesMenu.GetAt(i) as Message).show()
            if i == 3 || i == 8
                if StanceResponse == 0
                    PlayerStances[stancenum].SetValue(-1)
                elseif StanceResponse == 2
                    PlayerStances[stancenum].SetValue(1)
                else
                    PlayerStances[stancenum].SetValue(0)
                endif
            else
                if StanceResponse == 0
                    PlayerStances[stancenum].SetValue(-1)
                elseif StanceResponse == 1
                    PlayerStances[stancenum].SetValue(1)
                else
                    PlayerStances[stancenum].SetValue(0)
                endif
            endif
            i += 1
            stancenum += 1
        endwhile
    endif
EndFunction

Function SetAgreement(int issuenum, int agreementnum)
    if issuenum == 0
        Agreement00 = agreementnum
    elseif issuenum == 1
        Agreement01 = agreementnum
    elseif issuenum == 2
        Agreement02 = agreementnum
    elseif issuenum == 3
        Agreement03 = agreementnum
    elseif issuenum == 4
        Agreement04 = agreementnum
    elseif issuenum == 5
        Agreement05 = agreementnum
    elseif issuenum == 6
        Agreement06 = agreementnum
    elseif issuenum == 7
        Agreement07 = agreementnum
    elseif issuenum == 8
        Agreement08 = agreementnum
    endif
EndFunction

int Function GetPublicOpinionOfActor(Actor Person, int holdnum)
    int PublicOpinion = 0
    int[] HoldStances = GetHoldStances(holdnum)
    int[] HoldImportance = GetHoldImportance(holdnum)
    
    int[] ActorStances
    if Person == Game.GetPlayer()
        ActorStances = new int[9]
        int i = 0
        while i < ActorStances.Length
            ActorStances[i] = PlayerStances[i].GetValueInt()
            i += 1
        endwhile
    else
        ActorStances = GetActorStances(Person)
    endif
    
    int i = 0
    while i < 9
        int IssueAgreementScore
        
        IssueAgreementScore = math.abs(ActorStances[i] - HoldStances[i]) as int
        
        if IssueAgreementScore == 0
            PublicOpinion += HoldImportance[i]*3
        elseif IssueAgreementScore == 2
            PublicOpinion -= HoldImportance[i]*3
        endif
        
        i += 1
    endwhile
    
    return PublicOpinion
EndFunction

int Function GetActorOpinionOfActor(Actor Person, Actor Person2)
    int Opinion = 0
    int[] ActorStances = GetActorStances(Person)
    int[] Actor2Stances = GetActorStances(Person2)
    
    int i = 0
    while i < 9
        int IssueAgreementScore
        
        IssueAgreementScore = math.abs(Actor2Stances[i] - ActorStances[i]) as int
        
        if IssueAgreementScore == 0
            Opinion += 11
            SetAgreement(i, 1)
        elseif IssueAgreementScore == 1
            Opinion -= 5
            SetAgreement(i, 0)
        elseif IssueAgreementScore == 2
            Opinion -= 11
            SetAgreement(i, -1)
        else
            SetAgreement(i, 0)
        endif
        
        i += 1
    endwhile
    
    return Opinion
EndFunction

int Function GetFactionOpinionOfActor(Actor Person, int factionnum)
    int Opinion = 0
    int[] FactionStances = GetFactionStances(factionnum)
    int[] FactionImportance = GetFactionImportance(factionnum)
    int[] ActorStances = GetActorStances(Person)
    
    int i = 0
    while i < 9
        int IssueAgreementScore
        
        IssueAgreementScore = math.abs(FactionStances[i] - ActorStances[i]) as int
        
        if IssueAgreementScore == 0
            Opinion += FactionImportance[i]*3
        elseif IssueAgreementScore == 2
            Opinion -= FactionImportance[i]*3
        endif
        
        i += 1
    endwhile
    
    return Opinion
EndFunction

int[] Function GetActorStances(Actor Person)
    int[] Stances = new int[9]
    ActorBase PersonBase = Person.GetActorBase()
    
    if Person == Game.GetPlayer()
        int i = 0
        while i < Stances.Length
            Stances[i] = PlayerStances[i].GetValueInt()
            i += 1
        endwhile
    
    elseif Person.IsInFaction(GovImperial) || PersonBase == ElisiftheFair; Imperial Jarls

        if PersonBase == Igmund
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = 0
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = -1
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Maven
            Stances[0] = -1
            Stances[1] = -1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = -1
            Stances[8] = 0
        elseif PersonBase == ElisiftheFair
            Stances[0] = -1
            Stances[1] = -1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = -1
            Stances[8] = -1
        elseif PersonBase == BalgruuftheGreater
            Stances[0] = 0
            Stances[1] = 0
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 0
            Stances[8] = 0
        elseif PersonBase == Brunwulf
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 1
        elseif PersonBase == BrinaMerilis
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == Siddgeir
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == IdgrodRavencrone
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = 0
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Kraldar
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        endif
        
    elseif Person.IsInFaction(GovSons) ; Stormcloak Jarls
           
        if PersonBase == Thongvor
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = -1
            Stances[3] = 1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = -1
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Laila
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == VignarGrayMane
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = -1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == Ulfric
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == SkaldtheElder
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == Dengeir
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = 0
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == Sorli
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = -1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Korir
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 1
        endif
        
    elseif CS_PotentialSponsors.HasForm(PersonBase)
        if PersonBase == OlfridBattleBorn
            Stances[0] = -1
            Stances[1] = 0
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Rorik
            Stances[0] = 0
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == Erikur
            Stances[0] = -1
            Stances[1] = -1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = -1
            Stances[8] = -1
        elseif PersonBase == Torbjorn
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = -1
            Stances[3] = 1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Nazeem
            Stances[0] = 0
            Stances[1] = 0
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 0
            Stances[8] = 0
        elseif PersonBase == Thonar
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = 0
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = -1
            Stances[7] = 1
            Stances[8] = -1
        elseif PersonBase == Hemming
            Stances[0] = -1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 1
        elseif PersonBase == Sabjorn
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = 0
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == OrthusEndario
            Stances[0] = -1
            Stances[1] = -1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = -1
            Stances[5] = -1
            Stances[6] = 0
            Stances[7] = -1
            Stances[8] = -1
        elseif PersonBase == Bolli
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 0
            Stances[3] = -1
            Stances[4] = 0
            Stances[5] = 0
            Stances[6] = 0
            Stances[7] = 1
            Stances[8] = 0
        elseif PersonBase == Ainethach
            Stances[0] = 1
            Stances[1] = 1
            Stances[2] = 1
            Stances[3] = -1
            Stances[4] = 0
            Stances[5] = 0
            Stances[6] = 1
            Stances[7] = 1
            Stances[8] = 1
        endif
    endif
    
    return Stances
EndFunction

int Function GetPersonHold(Actor Person)
    int holdnum = -1
    ActorBase PersonBase = Person.GetActorBase()
        
    if CS_PotentialSponsors.HasForm(PersonBase)
        if PersonBase == OlfridBattleBorn
            holdnum = 3
        elseif PersonBase == Rorik
            holdnum = 13
        elseif PersonBase == Erikur
            holdnum = 2
        elseif PersonBase == Torbjorn
            holdnum = 4
        elseif PersonBase == Nazeem
            holdnum = 3
        elseif PersonBase == Thonar
            holdnum = 0
        elseif PersonBase == Hemming
            holdnum = 1
        elseif PersonBase == Sabjorn
            holdnum = 3
        elseif PersonBase == OrthusEndario
            holdnum = 4
        elseif PersonBase == Bolli
            holdnum = 1
        elseif PersonBase == Ainethach
            holdnum = 11
        elseif PersonBase == Maven
            holdnum = 1
        elseif PersonBase == VignarGrayMane
            holdnum = 3   
        elseif PersonBase == Thongvor
            holdnum = 0
        endif
    else
        holdnum = -1
    endif
    
    return holdnum
EndFunction

int[] Function GetFactionStances(int factionnum)
    int[] FactionStances
    
    if factionnum == 11
        FactionStances = StancesFactionImp
    elseif factionnum == 12
        FactionStances = StancesFactionSons
    endif
    
    return FactionStances
EndFunction

int[] Function GetFactionImportance(int factionnum)
    int[] FactionImportance
    
    if factionnum == 11
        FactionImportance = ImportanceFactionImp
    elseif factionnum == 12
        FactionImportance = ImportanceFactionSons
    endif
    
    return FactionImportance
EndFunction

int[] Function GetHoldStances(int holdnum)
    int[] HoldStances
    
    if holdnum == 0
        HoldStances = StancesCityMarkath
    elseif holdnum == 1
        HoldStances = StancesCityRiften
    elseif holdnum == 2
        HoldStances = StancesCitySolitude
    elseif holdnum == 3
        HoldStances = StancesCityWhiterun
    elseif holdnum == 4
        HoldStances = StancesCityWindhelm
    elseif holdnum == 5
        HoldStances = StancesMinorCityDawnstar
    elseif holdnum == 6
        HoldStances = StancesMinorCityFalkreath
    elseif holdnum == 7
        HoldStances = StancesMinorCityMorthal
    elseif holdnum == 8
        HoldStances = StancesMinorCityWinterhold
    endif
    
    return HoldStances
EndFunction

int[] Function GetHoldImportance(int holdnum)
    int[] HoldImportance
    
    if holdnum == 0
        HoldImportance = ImportanceCityMarkath
    elseif holdnum == 1
        HoldImportance = ImportanceCityRiften
    elseif holdnum == 2
        HoldImportance = ImportanceCitySolitude
    elseif holdnum == 3
        HoldImportance = ImportanceCityWhiterun
    elseif holdnum == 4
        HoldImportance = ImportanceCityWindhelm
    elseif holdnum == 5
        HoldImportance = ImportanceMinorCityDawnstar
    elseif holdnum == 6
        HoldImportance = ImportanceMinorCityFalkreath
    elseif holdnum == 7
        HoldImportance = ImportanceMinorCityMorthal
    elseif holdnum == 8
        HoldImportance = ImportanceMinorCityWinterhold
    endif
    
    return HoldImportance
EndFunction