;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname SF_CS_ArrestSceneWhiterun_020316EB Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ArrestMessage.show()
GuardFollower.Clear()
PrisonerNew.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property PrisonerNew  Auto  

ReferenceAlias Property GuardFollower  Auto  

Message Property ArrestMessage  Auto  

GlobalVariable Property PrisonersInWhiterun  Auto  

GlobalVariable Property PrisonersInWhiterunNonPermanent  Auto  
