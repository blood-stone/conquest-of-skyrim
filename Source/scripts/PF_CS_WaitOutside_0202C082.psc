;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname PF_CS_WaitOutside_0202C082 Extends Package Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
TroopInteriorNum.SetValue(TroopInteriorNum.GetValue() + 1)
If TroopInteriorNum.GetValue() > 6
	akActor.MoveTo(TempMarker)
Else
	akActor.AddToFaction(InteriorFollowerFaction)
	akActor.EvaluatePackage()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(Actor akActor)
;BEGIN CODE
akActor.MoveTo(Game.GetPlayer(), -40, 0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property TempMarker  Auto  

GlobalVariable Property TroopInteriorNum  Auto  

ReferenceAlias[] Property PersonalTroops  Auto  

ReferenceAlias Property PersonalTroop1  Auto  
ReferenceAlias Property PersonalTroop2  Auto  
ReferenceAlias Property PersonalTroop3  Auto  
ReferenceAlias Property PersonalTroop4  Auto  
ReferenceAlias Property PersonalTroop5  Auto  
ReferenceAlias Property PersonalTroop6  Auto  

Faction Property InteriorFollowerFaction  Auto  
