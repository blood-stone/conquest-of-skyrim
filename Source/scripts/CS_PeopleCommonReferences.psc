Scriptname CS_PeopleCommonReferences extends Quest  

ObjectReference Property CS_VoidMarker Auto

MiscObject Property CS_PersonRelationshipObject Auto

ReferenceAlias[] Property People Auto

CS_Person Property Player Auto

CS_Person Property PersonTalking Auto

CS_PersonInfoMenu Property CS_PersonInfo Auto

int next_open_slot

Function AddPerson(Actor NewPerson)
    if next_open_slot < People.Length
        People[next_open_slot].ForceRefTo(NewPerson)
        (People[next_open_slot] as CS_Person).SetUp()
        PersonTalking = (People[next_open_slot] as CS_Person)
        next_open_slot += 1
    else
        debug.notification("No more open slots available!")
    endif
EndFunction

Function TalkToPerson(CS_Person NewPerson)
    PersonTalking = NewPerson
EndFunction

Function ShowPersonInfo()
    CS_PersonInfo.ShowInfo(PersonTalking)
EndFunction