Scriptname CS_ArmyTroopSpawnerScript extends ObjectReference  

ObjectReference Property TroopRegiment Auto hidden
ObjectReference Property SpawnPoint Auto hidden

int Property TroopNum Auto hidden

Actor Troop
Actor Settler
;/
Function SetTroop(int Num, ObjectReference Regiment)
    TroopNum = Num
    TroopRegiment = Regiment
EndFunction
    
Function UpdateActor()
    
EndFunction

Function SetTroopState()
    CS_ArmyRegimentTroops Troops = TroopRegiment as CS_ArmyRegimentTroops
    
    if Troops.AliveTroopBases[TroopNum]
        (Troop as CS_FactionWarTroopScript).GoToState("Alive")
    elseif Troops.TroopBases[TroopNum]
        (Troop as CS_FactionWarTroopScript).GoToState("Dead")
    endif
EndFunction
;/
Event OnCellAttach()
    UpdateActor()
EndEvent/;
;/
Event OnUpdate()
    UpdateActor()
EndEvent

State Alive
    
    Function UpdateActor()
        if SpawnPoint
            MoveTo(SpawnPoint)
            SpawnPoint = None
        endif
        
        SetTroopState()
        ActorBase TroopBase = (TroopRegiment as CS_ArmyRegimentTroops).TroopBases[TroopNum]
        
        if !Troop
            debug.trace("No troop detected, spawning...")
            Troop = PlaceAtMe(TroopBase) as Actor
            (Troop as CS_FactionWarTroopScript).SetUp(TroopRegiment, TroopNum, self)
        elseif Troop.GetActorBase() != TroopBase
            Actor TroopToDelete = Troop
            TroopToDelete.Disable()
            Troop = TroopToDelete.PlaceAtMe(TroopBase) as Actor
            TroopToDelete.Delete()
            (Troop as CS_FactionWarTroopScript).SetUp(TroopRegiment, TroopNum, self)
        elseif !Troop.Is3DLoaded()
            debug.trace("Troop 3D Not Loaded")
            Troop.MoveTo(self as ObjectReference)
            ;Troop.RegisterForSingleUpdate(0.1)
        else
            debug.trace("Sending Troop update..., troopstate = " + (Troop as CS_FactionWarTroopScript).GetState())
            Troop.RegisterForSingleUpdate(0.1)
        endif
    EndFunction

EndState/;