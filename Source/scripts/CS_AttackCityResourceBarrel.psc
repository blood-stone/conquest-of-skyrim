Scriptname CS_AttackCityResourceBarrel extends ReferenceAlias  

State Activated
    
    Event OnUpdate()
        if GetRef()
            (GetRef() as CS_ResourceBarrelScript).citynum = (GetOwningQuest() as CS_AttackCityFinalScript).citynum
            (GetRef() as CS_ResourceBarrelScript).GoToState("AllowActivation")
        endif
        
        TryToEnable()
    EndEvent

EndState