Scriptname CS_PersonRelationship extends ObjectReference  

int RelationshipValue ;-10 (Hated) - 10 (Revered)

CS_Person Property TargetPerson Auto

Function SetRelationshipValue(int new_value)
    RelationshipValue = new_value
EndFunction

int Function GetRelationshipValue()
    return RelationshipValue
EndFunction