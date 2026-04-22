;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 31
Scriptname QF_CS_TroopDeath_0201D611 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(14) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(6) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(0) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(8) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(13) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(1) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(12) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(2) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(3) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(7) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(9) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(11) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(10) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(5) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
GlobalVariable GarrisonCount = Garrisons.GetAt(4) as GlobalVariable
GarrisonCount.SetValue(GarrisonCount.GetValue() - 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property Garrisons  Auto  
