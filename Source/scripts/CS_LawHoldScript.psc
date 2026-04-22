Scriptname CS_LawHoldScript extends Quest  

FormList Property CS_LawsCivilRights Auto
FormList Property CS_LawsReligion Auto
FormList Property CS_LawsMagic Auto
FormList Property CS_LawsEconomy Auto ;0: Minimum Wage, 1: Maximum Rent, 2: Tax Rates Commoner, 3: Tax Rates Nobility
FormList Property CS_LawsCrime Auto
FormList Property CS_LawsSecurity Auto

;Initial Law Values
int[] Property initialLawsCivilRights Auto
int[] Property initialLawsReligion Auto
int[] Property initialLawsMagic Auto
int[] Property initialLawsEconomy Auto
int[] Property initialLawsCrime Auto
int[] Property initialLawsSecurity Auto

;Opinions: 
;index 0 = Civil Rights, 1 = Religion, 2 = Magic, 3 = Economy, 4 = Crime, 5 = Security
;values -1 = Oppose, 0 = Neutral, 1 = Support
int[] Property OpinionsJarl Auto
int[] Property OpinionsNobility Auto
int[] Property OpinionsCommoner Auto
int[] Property OpinionsGuard Auto

int[] Property initialOpinionsJarlImp Auto
int[] Property initialOpinionsJarlSons Auto

Actor Property Jarl Auto

CS_RecruitJarl Property CS_FactionGovernment Auto

Function SetUpJarlOpinions()
    int citynum = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).holdnum
    Jarl = CS_FactionGovernment.JarlAliases[citynum].GetActorRef()
    CS_GovPositions GovPositions = CS_FactionGovernment.InitialGovPositions

    if (GovPositions.JarlsImp[citynum] as Actor).GetActorBase() == Jarl.GetActorBase()
        int i = 0
        while i < OpinionsJarl.Length
            OpinionsJarl[i] = initialOpinionsJarlImp[i]
            i += 1
        endwhile
    elseif (GovPositions.JarlsSons[citynum] as Actor).GetActorBase() == Jarl.GetActorBase()
        int i = 0
        while i < OpinionsJarl.Length
            OpinionsJarl[i] = initialOpinionsJarlSons[i]
            i += 1
        endwhile
    else
        int i = 0
        while i < OpinionsJarl.Length
            OpinionsJarl[i] = 0
            i += 1
        endwhile
    endif
    
EndFunction

Function SetUpLaws(FormList LawList, int[] initialLaws)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    
    int i = 0
    while i < LawList.GetSize()
        City.SetKeywordData(LawList.GetAt(i) as Keyword, initialLaws[i])
        i += 1
    endwhile
EndFunction

Function SetUpInitialLaws()
    SetUpLaws(CS_LawsCivilRights, initialLawsCivilRights)
    SetUpLaws(CS_LawsReligion, initialLawsReligion)
    SetUpLaws(CS_LawsMagic, initialLawsMagic)
    SetUpLaws(CS_LawsEconomy, InitialLawsEconomy)
    SetUpLaws(CS_LawsCrime, initialLawsCrime)
    SetUpLaws(CS_LawsSecurity, initialLawsSecurity)
EndFunction

FormList[] Function GetBestLawGroups(string group)
    int NumLawGroups = 0
    FormList[] BestLawGroupsLong = new FormList[6]

    if group == "Nobility"
        int i = 0
        while i < BestLawGroupsLong.Length
            if OpinionsNobility[i] != 0 && (OpinionsNobility[i] == OpinionsJarl[i] || OpinionsJarl[i] == 0)
                if i == 0
                    BestLawGroupsLong[NumLawGroups] = CS_LawsCivilRights
                elseif i == 1
                    BestLawGroupsLong[NumLawGroups] = CS_LawsReligion
                elseif i == 2
                    BestLawGroupsLong[NumLawGroups] = CS_LawsMagic
                elseif i == 3
                    BestLawGroupsLong[NumLawGroups] = CS_LawsEconomy
                    ;elseif i == 4
                    ;BestLawGroupsLong[NumLawGroups] = CS_LawsCrime
                elseif i == 5
                    BestLawGroupsLong[NumLawGroups] = CS_LawsSecurity
                endif
                
                if i != 4
                    NumLawGroups += 1
                endif
            endif
            i += 1
        endwhile
    elseif group == "Commoners"
        int i = 0
        while i < BestLawGroupsLong.Length
            if OpinionsCommoner[i] != 0 && (OpinionsCommoner[i] == OpinionsJarl[i] || OpinionsJarl[i] == 0)
                if i == 0
                    BestLawGroupsLong[NumLawGroups] = CS_LawsCivilRights
                elseif i == 1
                    BestLawGroupsLong[NumLawGroups] = CS_LawsReligion
                elseif i == 2
                    BestLawGroupsLong[NumLawGroups] = CS_LawsMagic
                elseif i == 3
                    BestLawGroupsLong[NumLawGroups] = CS_LawsEconomy
                    ;elseif i == 4
                    ;BestLawGroupsLong[NumLawGroups] = CS_LawsCrime
                elseif i == 5
                    BestLawGroupsLong[NumLawGroups] = CS_LawsSecurity
                endif
                
                if i != 4
                    NumLawGroups += 1
                endif
            endif
            i += 1
        endwhile
    endif
    
    FormList[] BestLawGroups
    
    if NumLawGroups == 0
        return None
    elseif NumLawGroups == 1
        BestLawGroups = new FormList[1]
    elseif NumLawGroups == 2
        BestLawGroups = new FormList[2]
    elseif NumLawGroups == 3
        BestLawGroups = new FormList[3]
    elseif NumLawGroups == 4
        BestLawGroups = new FormList[4]
    elseif NumLawGroups == 5
        BestLawGroups = new FormList[5]
    elseif NumLawGroups == 6
        return BestLawGroupsLong
    endif
    
    if NumLawGroups >= 1
        BestLawGroups[0] = BestLawGroupsLong[0]
        if NumLawGroups >= 2
            BestLawGroups[1] = BestLawGroupsLong[1]
            if NumLawGroups >= 3
                BestLawGroups[2] = BestLawGroupsLong[2]
                if NumLawGroups >= 4
                    BestLawGroups[3] = BestLawGroupsLong[3]
                    if NumLawGroups >= 5
                        BestLawGroups[4] = BestLawGroupsLong[4]
                        if NumLawGroups >= 6
                            BestLawGroups[5] = BestLawGroupsLong[5]
                        endif
                    endif
                endif
            endif
        endif
    endif
        
    return BestLawGroups
EndFunction

FormList Function GetLawGroup(string group, FormList[] BestLawGroups)
    int randint = utility.randomint(0, BestLawGroups.Length - 1)

    return BestLawGroups[randint]
EndFunction

Keyword Function FindLawToAdjust(FormList LawList, string passorrevoke)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    int i = 0
    while i < LawList.GetSize()
        Keyword Law = LawList.GetAt(i) as Keyword
        if City.GetKeywordData(Law) == 0 && passorrevoke == "Pass"
            return Law
        elseif City.GetKeywordData(Law) >= 1 && passorrevoke == "Revoke"
            return Law
        endif
        i += 1
    endwhile
EndFunction

int Function GetLawGroupNum(FormList LawList)
    if LawList == CS_LawsCivilRights
        return 0
    elseif LawList == CS_LawsReligion
        return 1
    elseif LawList == CS_LawsMagic
        return 2
    elseif LawList == CS_LawsEconomy
        return 3
    elseif LawList == CS_LawsCrime
        return 4
    elseif LawList == CS_LawsSecurity
        return 5
    endif
EndFunction

int Function GetLawOpinion(string group, int LawListNum, int passorrevoke)
    if group == "Nobility"
        if OpinionsNobility[LawListNum] == 0
            return 0
        elseif passorrevoke == OpinionsNobility[LawListNum]
            return 1
        else
            return -1
        endif
    elseif group == "Commoners"
        if OpinionsCommoner[LawListNum] == 0
            return 0
        elseif passorrevoke == OpinionsCommoner[LawListNum]
            return 1
        else
            return -1
        endif
    endif
    
    return 0
EndFunction

bool Function JarlChangeLaw(string group)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    int citynum = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).holdnum
    
    FormList[] BestLawGroups = GetBestLawGroups(group)
    FormList LawGroup = GetLawGroup(group, BestLawGroups)
    Keyword Law = FindLawToAdjust(LawGroup, "Pass")
    if Law
        City.SetKeywordData(Law, 1)
        int LawGroupNum = GetLawGroupNum(LawGroup)
        debug.trace("Jarl of City " + citynum + " passed law in group " + LawGroupNum)
        ((self as Quest) as CS_InfluenceHoldUpdaterScript).AdjustJarlInfluence("Nobility", 10*GetLawOpinion("Nobility", LawGroupNum, -1))
        ((self as Quest) as CS_InfluenceHoldUpdaterScript).AdjustJarlInfluence("Commoners", 10*GetLawOpinion("Commoners", LawGroupNum, -1))
        ;((self as Quest) as CS_InfluenceHoldUpdaterScript).AdjustJarlInfluence("Guards", 10*GetLawOpinion("Guards", LawGroupNum, -1))
        return true
    else
        Law = FindLawToAdjust(LawGroup, "Revoke")
        if Law
            City.SetKeywordData(Law, City.GetKeywordData(Law) - 1)
            int LawGroupNum = GetLawGroupNum(LawGroup)
            debug.trace("Jarl of City " + citynum + " revoked law in group " + LawGroupNum)
            ((self as Quest) as CS_InfluenceHoldUpdaterScript).AdjustJarlInfluence("Nobility", 10*GetLawOpinion("Nobility", LawGroupNum, 1))
            ((self as Quest) as CS_InfluenceHoldUpdaterScript).AdjustJarlInfluence("Commoners", 10*GetLawOpinion("Commoners", LawGroupNum, 1))
        ;((self as Quest) as CS_InfluenceHoldUpdaterScript).AdjustJarlInfluence("Guards", 10*GetLawOpinion("Guards", LawGroupNum, 1))
            return true
        else
            return false
        endif
    endif
        
EndFunction

;/
int Function GetLawOpinion(string lawtype)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    FormList LawList
    int lawscale = 0
    
    if lawtype == "Economy"
        LawList = CS_LawsEconomy
    elseif lawtype == "Privilege"
        LawList = CS_LawsPrivilege
    elseif lawtype == "Representation"
        LawList = CS_LawsRepresentation
    elseif lawtype == "Guards"
        LawList = CS_LawsGuard
    endif
    
    int i = 0
    while i < LawList.GetSize()
        int lawscalechange = math.floor(20/(LawList.GetSize() as float))
        if City.GetKeywordData(LawList.GetAt(i) as Keyword) > 0
            lawscale += lawscalechange*(City.GetKeywordData(LawList.GetAt(i) as Keyword) as int)
        endif
        i += 1
    endwhile
        
    debug.trace(lawtype + " is currently set to " + lawscale)
    return lawscale
EndFunction

Function JarlLawDecision(string lawtype, int lawscale, string petitioningside)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    int citynum = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).holdnum
    Jarl = CS_FactionGovernment.JarlAliases[citynum].GetActorRef()
    FormList LawList
    int changelawchance = 0
    int jarlopinion = 0
    
    if lawtype == "Economy"
        LawList = CS_LawsEconomy
        jarlopinion = JarlOpinionEconomy
    elseif lawtype == "Privilege"
        LawList = CS_LawsPrivilege
        jarlopinion = JarlOpinionPrivilege
    elseif lawtype == "Representation"
        LawList = CS_LawsRepresentation
        jarlopinion = JarlOpinionRepresentation
    elseif lawtype == "Guards"
        LawList = CS_LawsGuard
        jarlopinion = JarlOpinionSecurity
    endif
    
    debug.trace("Jarl " + Jarl + " from City " + citynum + " " + lawtype + " Opinion = " + jarlopinion)
    
    if petitioningside == "Greater"
        if lawscale < 20
            changelawchance += 60
        elseif lawscale < 50
            changelawchance += 40
        elseif lawscale < 80
            changelawchance += 20
        endif
        
        if jarlopinion == 1
            changelawchance += 40
        elseif jarlopinion == 0
            changelawchance -= 25
        elseif jarlopinion == -1
            changelawchance -= 40
        endif
    elseif petitioningside == "Lesser"
        if lawscale > 80
            changelawchance += 60
        elseif lawscale > 50
            changelawchance += 40
        elseif lawscale > 20
            changelawchance += 20
        endif
        
        if jarlopinion == 1
            changelawchance -= 40
        elseif jarlopinion == 0
            changelawchance -= 25
        elseif jarlopinion == -1
            changelawchance += 40
        endif
    endif
    
    int randomdecision = utility.randomint(1, 99)
    if randomdecision < changelawchance
        int changemagnitude = math.ceiling((changelawchance as float - randomdecision as float)/40)
        if petitioningside == "Lesser"
            changemagnitude = -changemagnitude
        endif
        Keyword Law = JarlFindLaw(LawList, changemagnitude, petitioningside)
        if Law
            int newlawvalue = City.GetKeywordData(Law) as int + changemagnitude
            ChangeLaw(Law, newlawvalue)
            debug.trace("Jarl has changed " + lawtype + " laws in order to benefit the " + petitioningside + " side")
        endif
    endif
EndFunction

Keyword Function JarlFindLaw(FormList LawList, int lawchangevalue, string petitioningside)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    Keyword PreferredLawKeyword
    
    int i = 2; CHANGE BACK TO 0 WHEN DONE!!!!!!!!!!!!!
    while i < LawList.GetSize()
        Keyword LawKeyword = LawList.GetAt(i) as Keyword
        if petitioningside == "Greater" && (City.GetKeywordData(LawKeyword) + lawchangevalue) <= 10 && (!PreferredLawKeyword || City.GetKeywordData(LawKeyword) as int < City.GetKeywordData(PreferredLawKeyword) as int)
            PreferredLawKeyword = LawKeyword
        elseif petitioningside == "Lesser" && (City.GetKeywordData(LawKeyword) + lawchangevalue) >= 0 && (!PreferredLawKeyword || City.GetKeywordData(LawKeyword) as int > City.GetKeywordData(PreferredLawKeyword) as int)
            PreferredLawKeyword = LawKeyword
        endif
        i += 1
    endwhile
    
    if !PreferredLawKeyword
        i = 2; CHANGE BACK TO 0 WHEN DONE!!!!!!!!!!!!!
        while i < LawList.GetSize()
            Keyword LawKeyword = LawList.GetAt(i) as Keyword
            if petitioningside == "Greater" && (City.GetKeywordData(LawKeyword) + 1) <= 10 && (!PreferredLawKeyword || City.GetKeywordData(LawKeyword) as int < City.GetKeywordData(PreferredLawKeyword) as int)
                PreferredLawKeyword = LawKeyword
            elseif petitioningside == "Lesser" && (City.GetKeywordData(LawKeyword) - 1) >= 0 && (!PreferredLawKeyword || City.GetKeywordData(LawKeyword) as int > City.GetKeywordData(PreferredLawKeyword) as int)
                PreferredLawKeyword = LawKeyword
            endif
            i += 1
        endwhile
    endif
    
    if PreferredLawKeyword
        return PreferredLawKeyword
    else
        debug.trace("No law can be changed to further benefit the " + petitioningside + " side")
        return None
    endif
EndFunction

Function ChangeLaw(Keyword Law, int newvalue)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    CS_InfluenceHoldUpdaterScript InfluenceHold = ((self as Quest) as CS_InfluenceHoldUpdaterScript)
    CS_EconomyHoldUpdaterNewScript EconomyHold = ((self as Quest) as CS_EconomyHoldUpdaterNewScript)
    int initialvalue = City.GetKeywordData(Law) as int
    int newlawvalue = newvalue
    if newvalue < 0
        newlawvalue = 0
    elseif newvalue > 10
        newlawvalue = 10
    endif
    
    if Law
        City.SetKeywordData(Law, newlawvalue)
        if CS_LawsGuard.HasForm(Law)
            int lawdifference = newlawvalue - initialvalue
            int initialinfluenceguard = InfluenceHold.InfluenceGuards
            int initialinfluenceNobility = InfluenceHold.InfluenceNobility
            int initialinfluenceCommoner = InfluenceHold.InfluenceCommoner
            InfluenceHold.JarlInfluenceGuards = InfluenceHold.JarlInfluenceGuards + 5*lawdifference
            InfluenceHold.JarlInfluenceNobility = InfluenceHold.JarlInfluenceNobility - 5*lawdifference
            InfluenceHold.JarlInfluenceCommoner = InfluenceHold.JarlInfluenceCommoner - 5*lawdifference
            if Jarl == Game.GetPlayer()
                InfluenceHold.InfluenceGuards = InfluenceHold.InfluenceGuards + 5*lawdifference
                InfluenceHold.InfluenceNobility = InfluenceHold.InfluenceNobility - 5*lawdifference
                InfluenceHold.InfluenceCommoner = InfluenceHold.InfluenceCommoner - 5*lawdifference
                InfluenceHold.ShowInfluenceMessage("Guards", initialinfluenceguard)
                InfluenceHold.ShowInfluenceMessage("Commoners", initialinfluenceCommoner)
                InfluenceHold.ShowInfluenceMessage("Nobility", initialinfluenceNobility)
            endif
        else
            int lawdifference = newlawvalue - initialvalue
            int initialinfluenceNobility = InfluenceHold.InfluenceNobility
            int initialinfluenceCommoner = InfluenceHold.InfluenceCommoner
            if Law == CS_LawsEconomy.GetAt(2) as Keyword
                InfluenceHold.JarlInfluenceCommoner = InfluenceHold.JarlInfluenceCommoner + 5*lawdifference
                ((self as Quest) as CS_EconomyHoldUpdaterNewScript).UpdateTaxes("Commoners")
            elseif Law == CS_LawsEconomy.GetAt(3) as Keyword
                InfluenceHold.JarlInfluenceNobility = InfluenceHold.JarlInfluenceNobility - 5*lawdifference
                ((self as Quest) as CS_EconomyHoldUpdaterNewScript).UpdateTaxes("Nobility")
            else
                InfluenceHold.JarlInfluenceNobility = InfluenceHold.JarlInfluenceNobility - 5*lawdifference
                InfluenceHold.JarlInfluenceCommoner = InfluenceHold.JarlInfluenceCommoner + 5*lawdifference
                if Law == CS_LawsEconomy.GetAt(0) as Keyword
                    ((self as Quest) as CS_EconomyHoldUpdaterNewScript).UpdateWages()
                elseif Law == CS_LawsEconomy.GetAt(1) as Keyword 
                    ((self as Quest) as CS_EconomyHoldUpdaterNewScript).UpdateRent()
                endif
            endif
            if Jarl == Game.GetPlayer()
                if Law == CS_LawsEconomy.GetAt(2) as Keyword
                    InfluenceHold.InfluenceCommoner = InfluenceHold.InfluenceCommoner + 5*lawdifference
                elseif Law == CS_LawsEconomy.GetAt(3) as Keyword
                    InfluenceHold.InfluenceNobility = InfluenceHold.InfluenceNobility - 5*lawdifference
                else
                    InfluenceHold.InfluenceNobility = InfluenceHold.InfluenceNobility - 5*lawdifference
                    InfluenceHold.InfluenceCommoner = InfluenceHold.InfluenceCommoner + 5*lawdifference
                endif
                InfluenceHold.ShowInfluenceMessage("Commoners", initialinfluenceCommoner)
                InfluenceHold.ShowInfluenceMessage("Nobility", initialinfluenceNobility)
            endif
        endif
    endif
EndFunction/;

string Function GetLawValues(string lawtype)
    Location City = ((self as Quest) as CS_EconomyHoldUpdaterNewScript).City
    FormList LawList
    string values = ""
    
    if lawtype == "Civil Rights"
        LawList = CS_LawsCivilRights
    elseif lawtype == "Religion"
        LawList = CS_LawsReligion
    elseif lawtype == "Magic"
        LawList = CS_LawsMagic
    elseif lawtype == "Economy"
        LawList = CS_LawsEconomy
    elseif lawtype == "Crime"
        LawList = CS_LawsCrime
    elseif lawtype == "Security"
        LawList = CS_LawsSecurity
    endif
    
    int i = 0
    while i < LawList.GetSize()
        values += " "
        values += (City.GetKeywordData(LawList.GetAt(i) as Keyword) as int) as string
        i += 1
    endwhile

    return values
EndFunction