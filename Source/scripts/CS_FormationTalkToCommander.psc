Scriptname CS_FormationTalkToCommander extends ReferenceAlias  

bool InConversation

;Event OnActivate(ObjectReference akActionRef)
;    InConversation = true
;    (GetOwningQuest() as CS_TroopFormUpScript).ArmyWait()
;    RegisterForUpdate(0.5)
;EndEvent

;Event OnUpdate()
;    if InConversation && !GetActorRef().IsInDialogueWithPlayer()
;        InConversation = false
;        (GetOwningQuest() as CS_TroopFormUpScript).ArmyStopWait()
;        UnRegisterForUpdate()
;    endif
;EndEvent