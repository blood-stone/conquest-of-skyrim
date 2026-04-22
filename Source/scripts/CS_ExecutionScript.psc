Scriptname CS_ExecutionScript extends Quest  

ReferenceAlias[] Property Executionees  Auto  
ReferenceAlias Property ChoppingBlock Auto

ReferenceAlias Property Alias_ExecutioneeStandMarker Auto

ActorBase Property Player Auto

Actor Property DuplicatePlayer Auto

Armor Property ExecutionHood Auto
Armor Property ClothesPrisonerRags Auto
Armor Property PrisonerCuffs Auto
Armor Property Gag Auto

ObjectReference Property DuplicateXMarker Auto

Function NextExecutionee()
    int FoundPrisoner = 0
    int i = 0
    while i < Executionees.Length
        if Executionees[i].GetActorRef() != None && Executionees[i].GetActorRef().IsDead() != 1
            Executionees[0].ForceRefTo(Executionees[i].GetActorRef())
            Executionees[0].GetActorRef().EvaluatePackage()
            SetStage(15)
            FoundPrisoner = 1
        endif
        i += 1
    endwhile
    if FoundPrisoner == 0
        SetStage(20)
    endif
EndFunction

Function DuplicateExecutionee(ReferenceAlias Executionee)
    If Executionee.GetActorRef() != None && Executionee.GetActorRef() != Game.GetPlayer()
        if Executionee.GetActorRef().GetActorBase().IsUnique() == 1
            Actor DuplicateExecutionee = Alias_ExecutioneeStandMarker.GetRef().PlaceActorAtMe(Executionee.GetActorRef().GetActorBase())
            ExecutedNPCs.AddForm(Executionee.GetActorRef())
            Executionee.GetActorRef().disable()
            Executionee.ForceRefTo(DuplicateExecutionee)
            DuplicateExecutionee.GetActorBase().SetEssential(false)
            DuplicateExecutionee.GetActorBase().SetProtected(false)
        endif
    ElseIf Executionee.GetActorRef() == Game.GetPlayer()
        Actor PlayerRef = Game.GetPlayer()
        Game.ForceThirdPerson()
        PlayerRef.SetAlpha(0.0)
        ;DuplicateXMarker.MoveTo(Game.GetPlayer(), afZOffset=-100)
        Actor DuplicateExecutionee = DuplicateXMarker.PlaceActorAtMe(Game.GetForm(0x7) as ActorBase)
        DuplicateExecutionee.EquipItem(ExecutionHood)
        ;DuplicateExecutionee.Enable()
        Executionee.ForceRefTo(DuplicateExecutionee)
        Executionee.GetActorRef().EquipItem(ExecutionHood, true)
        DuplicateExecutionee.SetAlpha(1.0)
        ;DuplicateExecutionee.UnEquipItem(ExecutionHood)
        DuplicateExecutionee.EquipItem(ClothesPrisonerRags)
        ;DuplicateExecutionee.EquipItem(Gag)
    EndIf
EndFunction

Function KillAllExecutionees()
    int i = 0
    while i < Executionees.Length
        if Executionees[i].GetActorRef() != None && Executionees[i].GetActorRef().IsDead() != 1
            Executionees[i].GetActorRef().kill()
        endif
        i += 1
    endwhile
EndFunction

Scene Property ExecutionRepeatScene  Auto  

FormList Property ExecutedNPCs  Auto  
