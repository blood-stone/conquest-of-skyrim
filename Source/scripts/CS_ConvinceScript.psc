Scriptname CS_ConvinceScript extends Quest

int Property ConvinceDifficulty Auto
int Property FactionNum Auto

FormList Property CS_AllHoldings Auto
FormList Property CS_AllFamilyFactions Auto

Faction Property CS_JarlFaction Auto

GlobalVariable Property CS_ConvinceDifficulty Auto
GlobalVariable Property CS_DialogueInfluenceCost Auto
GlobalVariable Property SpeechVeryEasy Auto
GlobalVariable Property SpeechEasy Auto
GlobalVariable Property SpeechAverage Auto
GlobalVariable Property SpeechHard Auto
GlobalVariable Property SpeechVeryHard Auto

ReferenceAlias Property PlayerFactionActivatorAlias Auto

CS_PublicOpinionScript Property CS_PublicOpinion Auto
CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

int Function GetDiplomaticPressure(ObjectReference JarlFaction)
    CS_FactionManagementOwnership OwnershipScript = JarlFaction as CS_FactionManagementOwnership
    ObjectReference ControllingFaction = OwnershipScript.FactionOwnerActivator
    if ControllingFaction
        CS_FactionManagementDiplomacy DiplomacyScript = ControllingFaction as CS_FactionManagementDiplomacy

        return DiplomacyScript.GetOpinion(PlayerFactionActivatorAlias.GetRef())
    else
        return 0
    endif
EndFunction

int Function GetFactionOpinion(ObjectReference JarlFaction)
    CS_FactionManagementDiplomacy DiplomacyScript = JarlFaction as CS_FactionManagementDiplomacy
    
    return DiplomacyScript.GetOpinion(PlayerFactionActivatorAlias.GetRef())
EndFunction

int Function GetNobilityInfluence(ObjectReference NobleCity)
    CS_CityManagementPopulation PopulationScript = NobleCity as CS_CityManagementPopulation
    
    return PopulationScript.InfluenceNobility
EndFunction

Function SetConvinceDifficulty(Actor Person, int InitialConvinceDifficulty, ObjectReference FactionActivator=None)
    ConvinceDifficulty = InitialConvinceDifficulty
    
    if Person.IsInFaction(CS_JarlFaction)
        int FactionOpinion = GetFactionOpinion(FactionActivator)
        int DiplomaticPressure = GetDiplomaticPressure(FactionActivator)
        ConvinceDifficulty -= (FactionOpinion + DiplomaticPressure)
    else
        int NobilityInfluence = GetNobilityInfluence(FactionActivator)
        ConvinceDifficulty -= NobilityInfluence
    endif
    
    int i = 0
    bool IsInFamily = false
    while i < CS_AllFamilyFactions.GetSize() && !IsInFamily
        if Person.IsInFaction(CS_AllFamilyFactions.GetAt(i) as Faction)
            IsInFamily = true
            ConvinceDifficulty -= 50
        endif
        i += 1
    endwhile
    
    if ConvinceDifficulty < 0
        ConvinceDifficulty = 0
    endif
    
    if ConvinceDifficulty > 100
        CS_ConvinceDifficulty.SetValue(ConvinceDifficulty)
    elseif ConvinceDifficulty >= 80
        CS_ConvinceDifficulty.SetValue(SpeechVeryHard.GetValue())
    elseif ConvinceDifficulty >= 60
        CS_ConvinceDifficulty.SetValue(SpeechHard.GetValue())
    elseif ConvinceDifficulty >= 40
        CS_ConvinceDifficulty.SetValue(SpeechAverage.GetValue())
    elseif ConvinceDifficulty >= 20
        CS_ConvinceDifficulty.SetValue(SpeechEasy.GetValue())
    elseif ConvinceDifficulty > 0
        CS_ConvinceDifficulty.SetValue(SpeechVeryEasy.GetValue())
    elseif ConvinceDifficulty == 0
        CS_ConvinceDifficulty.SetValue(0)
    endif
    
    debug.notification("Convince Difficulty: " + ConvinceDifficulty)
    
    CS_DialogueInfluenceCost.SetValue(math.floor(ConvinceDifficulty/2))
    UpdateCurrentInstanceGlobal(CS_DialogueInfluenceCost)
EndFunction