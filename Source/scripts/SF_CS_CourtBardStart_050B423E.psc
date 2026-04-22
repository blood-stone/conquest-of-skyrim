;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname SF_CS_CourtBardStart_050B423E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int scenenum = utility.randomint(0, BardScenes.Length - 1)
BardScenes[scenenum].Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Bard  Auto  

Scene[] Property BardScenes  Auto  
