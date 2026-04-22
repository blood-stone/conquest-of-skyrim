Scriptname CS_CWMapBackButtonScript extends ObjectReference  

ObjectReference Property HoldMap Auto
ObjectReference Property WholeMap Auto

Activator Property WholeMapActivator  Auto  

Sound Property BookOpen Auto

Event OnActivate(ObjectReference akActivatorRef)
    self.disable()
    (HoldMap as CS_CWMapActivatorHoldScript).RemoveAllFlags()
    HoldMap.disable()
    HoldMap.delete()
    WholeMap.enable()
    BookOpen.Play(Game.GetPlayer())
    (WholeMap as CS_CivilWarMapActivatorScript).GoToState("Empty")
    (WholeMap as CS_CivilWarMapActivatorScript).HoldMap = None
    (WholeMap as CS_CivilWarMapActivatorScript).ResetFlags()
EndEvent
