;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname QF_CS_FindHoldingBanner_05175427 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Holding
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Holding Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingInterior
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingInterior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingBanner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingBanner Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
CommanderTargets[8].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(8)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
CommanderTargets[4].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(4)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
CommanderTargets[6].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(6)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
CommanderTargets[3].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(3)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
InteriorMarker.ForceRefTo(Alias_HoldingInterior.GetReference())
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
CommanderTargets[9].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(9)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CommanderTargets[1].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(1)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
CommanderTargets[5].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(5)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
CommanderTargets[2].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(2)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
CommanderTargets[0].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(0)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
CommanderTargets[7].ForceRefTo(Alias_HoldingBanner.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshCommanderPackages(7)
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
BaseMarker.ForceRefTo(Alias_HoldingInterior.GetReference())
(HoldingsQuest as CS_ClaimAreaFunctions).RefreshGovPackages()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias[] Property CommanderTargets  Auto  

Quest Property HoldingsQuest  Auto  

Message Property FoundBannerMessage  Auto  

ReferenceAlias Property BaseMarker  Auto  

ReferenceAlias Property interiorMarker  Auto  
