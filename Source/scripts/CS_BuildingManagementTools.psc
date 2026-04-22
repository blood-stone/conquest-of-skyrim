Scriptname CS_BuildingManagementTools extends ObjectReference  

CS_BuildingManagementScript Property Building Auto

MiscObject Property Tool Auto
;/
Function UpdateTools()
    if Building.Workers < GetItemCount(ToolTiers)
        

Function SetToolModifier()
    float ToolModifier = GetItemCount(Tool) as float/Building.Workers/;
    