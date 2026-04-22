Scriptname CS_PlacedObjectActivatorTrainingField extends ObjectReference  

ObjectReference Property CityManagementActivator Auto

CS_CityManagementReportScript Property CS_CityManagementReport Auto

Auto State CanActivate
    
    Event OnActivate(ObjectReference akActionRef)
        
        GoToState("Activating")
        CS_CityManagementReport.Stop()
        CS_CityManagementReport.Start()
        CS_CityManagementReport.SetCity(CityManagementActivator)
        CS_CityManagementReport.MenuMilitaryRegiment()
        GoToState("CanActivate")
        
    EndEvent
    
EndState