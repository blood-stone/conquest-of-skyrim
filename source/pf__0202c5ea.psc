;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname PF__0202C5EA Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
akActor.SetOutfit(NewOutfits.GetAt(OutfitNum.GetValue() as int) as Outfit)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property NewOutfits  Auto  

GlobalVariable Property OutfitNum  Auto  
