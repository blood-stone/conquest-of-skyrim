Scriptname CS_DiplomacyStancesScript extends Quest  

ReferenceAlias Property FactionActivator Auto

FormList Property CS_DiplomacyStanceMessages Auto

Quest Property CS_TutorialQuests01Diplomacy Auto

Function SetStances()
    CS_FactionManagementDiplomacy DiplomacyScript = FactionActivator.GetRef() as CS_FactionManagementDiplomacy
    
    int i = 0
    while i < DiplomacyScript.IssueStances.Length
        DiplomacyScript.IssueStances[i] = ((CS_DiplomacyStanceMessages.GetAt(i) as Message).show() - 1)
        i += 1
    endwhile
    
    if CS_TutorialQuests01Diplomacy.GetStage() == 0
        CS_TutorialQuests01Diplomacy.SetStage(1)
    endif
EndFunction