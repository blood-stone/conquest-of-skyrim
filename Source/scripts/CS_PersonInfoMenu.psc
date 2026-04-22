Scriptname CS_PersonInfoMenu extends Quest  

CS_Person Person

ReferenceAlias Property PersonAlias Auto
ReferenceAlias[] Property Relationships Auto

Message Property CS_PersonInfoStart Auto
Message Property CS_PersonInfoRelationships Auto

Function ShowInfo(CS_Person PersonToShow)
    Start()
    Person = PersonToShow
    PersonAlias.ForceRefTo(Person.GetActorRef())
    
    int Response = 0
    while Response < 5
        Response = CS_PersonInfoStart.show()
        
        if Response == 1
            ShowRelationships()
        endif
    endwhile
EndFunction

Function ShowRelationships()
    int[] RelationshipValues = new int[128]
    
    int i = 0
    while i < Person.Relationships.Length
        if Person.Relationships[i] != None
            Relationships[i].ForceRefTo(Person.Relationships[i].TargetPerson.GetActorRef())
            RelationshipValues[i] = Person.Relationships[i].GetRelationshipValue()
        else
            i = Person.Relationships.Length
        endif
        i += 1
    endwhile
    
    int Response = CS_PersonInfoRelationships.show(RelationshipValues[0], RelationshipValues[1], RelationshipValues[2], \
    RelationshipValues[3], RelationshipValues[4])
    
EndFunction