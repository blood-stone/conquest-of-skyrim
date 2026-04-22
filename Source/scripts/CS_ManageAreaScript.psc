Scriptname CS_ManageAreaScript extends Quest  conditional

Message Property CS_ManageAreaMenuStartNoType Auto
Message Property CS_ManageAreaMenuStartBuild Auto
Message Property CS_ManageAreaMenuStart Auto
Message Property CS_ManageAreaMenuUpgrade Auto
Message Property CS_ManageAreaMenuGuards Auto
Message Property CS_ManageAreaMenuWorkers Auto
Message Property CS_ManageAreaMenuWorkersLodge Auto

LocationAlias Property Area Auto

ReferenceAlias Property BuildingChest Auto
ReferenceAlias Property AreaType Auto
ReferenceAlias Property Banner Auto
ReferenceAlias Property BuildType Auto
ReferenceAlias Property Resource Auto
ReferenceAlias Property CaptureMarker Auto

int Property AreaTypeNum Auto
int Property CanTakeMenuAction Auto conditional

float Property GuardNum Auto conditional
float Property WorkerNum Auto conditional
float Property Level Auto conditional
float Property LodgeLevel Auto conditional
float Property ResourceOutput Auto

GlobalVariable Property CS_ManageAreaCost Auto

ObjectReference[] Property AreaTypes Auto
ObjectReference[] Property Resources Auto

FormList Property CS_AllHolds Auto

Keyword Property CS_LocTypeMine Auto
Keyword Property CS_PlayerDefended Auto
Keyword Property CS_MiscType Auto
Keyword Property CS_MiscWorkers Auto
Keyword Property CS_MiscBuilding1 Auto
Keyword Property CS_MiscBuilding2 Auto
Keyword Property CS_MiscResourceOutput Auto
Keyword Property CS_MiscResourceOutputPerWorker Auto
Keyword Property CS_MiscMarkerFarm Auto
Keyword Property CS_MiscMarkerLumber Auto
Keyword[] Property CS_MiscMarkerWorkers Auto

CS_EconomyUpdaterNewScript Property EconomyUpdater Auto
CS_EconomyFactionUpdaterNewScript Property EconomyPlayer Auto
CS_BuildingScript BuildingScript
CS_CityManagementReportScript Property CS_CityManagementReport Auto

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, \
  int aiValue1, int aiValue2)
    CS_CityManagementReport.Stop()
    CS_CityManagementReport.Start()
    CS_CityManagementReport.MenuEconomyBaseBuilding(BuildingChest.GetRef())
    Stop()
EndEvent