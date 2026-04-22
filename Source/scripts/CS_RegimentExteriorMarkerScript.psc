Scriptname CS_RegimentExteriorMarkerScript extends ReferenceAlias  
;/
Event OnLoad()
    
    if (GetOwningQuest() as CS_RegimentScript).OrdersNum == 0
    
        (GetOwningQuest() as CS_RegimentScript).SpawnTroops()
        
    endif
    
EndEvent/;