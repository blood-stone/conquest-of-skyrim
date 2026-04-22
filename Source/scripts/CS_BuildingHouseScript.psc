Scriptname CS_BuildingHouseScript extends ObjectReference  

ActorBase Property CS_DBSettler Auto

int Property Level Auto
int Property Infrastructure Auto
int Property OccupantsAmount Auto
int Property Unemployed Auto
int Property PopIncreaseAmount Auto

FormList Property CS_BuildingPrioritiesFood Auto

string Property type Auto ; Commoner/Noble
string Property HouseType Auto ; Mansion/House/Slum

Function SetUp()
    Infrastructure = 100
    Unemployed = OccupantsAmount
EndFunction