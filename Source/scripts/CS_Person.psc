Scriptname CS_Person extends ReferenceAlias  

CS_Opinion[] Property Opinions Auto hidden

CS_PersonRelationship[] Property Relationships Auto hidden ;What this person thinks of another person (One-sided)

CS_PersonSkills Property Skills Auto hidden

CS_PersonTask Property CurrentTask Auto hidden
CS_PersonTask Property TempTask Auto hidden

int PlayerRelationshipIndex = -1

;SetUp

Function SetUp()
    Relationships = new CS_PersonRelationship[128]
    Opinions = new CS_Opinion[20]
EndFunction

;Relationships

CS_PersonRelationship Function FindRelationship(CS_Person TargetPerson)
    CS_PeopleCommonReferences CommonReferences = (self as ReferenceAlias).GetOwningQuest() as CS_PeopleCommonReferences
    
    if TargetPerson == CommonReferences.Player && PlayerRelationshipIndex >= 0
        return Relationships[PlayerRelationshipIndex]
    endif
    
    int i = 0
    while i < Relationships.Length
        if Relationships[i].TargetPerson == TargetPerson
            return Relationships[i]
        elseif Relationships[i] == None
            return None
        endif
        i += 1
    endwhile
EndFunction

Function SetRelationship(CS_Person TargetPerson, int new_value)
    CS_PersonRelationship relationship = FindRelationship(TargetPerson)
    if relationship
        relationship.SetRelationshipValue(new_value)
    else
        StartRelationship(TargetPerson, new_value)
    endif
EndFunction

Function StartRelationship(CS_Person TargetPerson, int initial_value = 0)
    CS_PeopleCommonReferences CommonReferences = (self as ReferenceAlias).GetOwningQuest() as CS_PeopleCommonReferences
    ObjectReference NewRelationship = CommonReferences.CS_VoidMarker.PlaceAtMe(CommonReferences.CS_PersonRelationshipObject)
    
    if initial_value == 0
        initial_value = GetActorRef().GetRelationshipRank(TargetPerson.GetActorRef())
    endif
    
    (NewRelationship as CS_PersonRelationship).TargetPerson = TargetPerson
    (NewRelationship as CS_PersonRelationship).SetRelationshipValue(initial_value)
    
    int next_open_slot = Relationships.Find(None)
    if next_open_slot >= 0
        Relationships[next_open_slot] = (NewRelationship as CS_PersonRelationship)
        
        if TargetPerson == CommonReferences.Player
            PlayerRelationshipIndex = next_open_slot
        endif
    else
        debug.notification("No more open relationship slots!")
    endif
EndFunction

Event OnActivate(ObjectReference akActionRef)
    Actor PlayerRef = Game.GetPlayer()
    if akActionRef == PlayerRef
        CS_PeopleCommonReferences CommonReferences = (self as ReferenceAlias).GetOwningQuest() as CS_PeopleCommonReferences
        CommonReferences.TalkToPerson(self)
        if GetActorRef().GetRelationshipRank(PlayerRef) > Relationships[PlayerRelationshipIndex].GetRelationshipValue()
            Relationships[PlayerRelationshipIndex].SetRelationshipValue(GetActorRef().GetRelationshipRank(PlayerRef))
        endif
    endif
EndEvent