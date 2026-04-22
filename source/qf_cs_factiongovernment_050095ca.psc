;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname QF_CS_FactionGovernment_050095CA Extends Quest Hidden

;BEGIN ALIAS PROPERTY EnemyCity2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InvadeLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_InvadeLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spymaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spymaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AttackCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity6
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlDawnstar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlDawnstar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FirstCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FirstCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlMarkarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlMarkarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MessagingCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_MessagingCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity5
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerArmyName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerArmyName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlMorthal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlMorthal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArmySecondInCommand
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArmySecondInCommand Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerTitle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerTitle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAliasWithTitle
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAliasWithTitle Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeaderShorsStone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeaderShorsStone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Blacksmith
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Blacksmith Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameChangerFaction
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameChangerFaction Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackCampPlayerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackCampPlayerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ParadeCityPrevious
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ParadeCityPrevious Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardMorthal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardMorthal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY UpgradeCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_UpgradeCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutfitChangerMkI
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OutfitChangerMkI Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionFlag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionFlag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlWindhelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlWindhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity4
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LawAlias1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LawAlias1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardDawnstar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardDawnstar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeaderDragonBridge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeaderDragonBridge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeaderRorikstead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeaderRorikstead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeaderRiverwood
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeaderRiverwood Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackCampSonsMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackCampSonsMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackFort
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AttackFort Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlChoose
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlChoose Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeaderKarthwasten
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeaderKarthwasten Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardMarkarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardMarkarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardSolitude
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardSolitude Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LawAlias0
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LawAlias0 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlChooseCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_JarlChooseCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackCityCS
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AttackCityCS Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HousecarlWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HousecarlWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MessagingPerson
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MessagingPerson Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWindhelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWindhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ParadeCommander
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ParadeCommander Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ParadeCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ParadeCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CapitalCS
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CapitalCS Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaseMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaseMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity3
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Traveller
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Traveller Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardRiften
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardRiften Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourtMage
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourtMage Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlMorthal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlMorthal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity0
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity0 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CapitalPalace
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CapitalPalace Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OutfitChangerMkII
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OutfitChangerMkII Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity7
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlWhiterun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlWhiterun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardWinterhold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardWinterhold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardWindhelm
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardWindhelm Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameChangerSpyMkI
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameChangerSpyMkI Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LeaderIvarstead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LeaderIvarstead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameChangerMkI
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameChangerMkI Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LawCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_LawCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LawStatue
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LawStatue Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AttackHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnemyCity8
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_EnemyCity8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlMarkarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlMarkarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AttackCampImpMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AttackCampImpMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY JarlDawnstar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JarlDawnstar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE CS_SelectName
Quest __temp = self as Quest
CS_SelectName kmyQuest = __temp as CS_SelectName
;END AUTOCAST
;BEGIN CODE
FactionStarted.SetValue(1)
Game.GetPlayer().AddSpell(BannerSpell)
Game.GetPlayer().AddItem(SettingsMenu, 1)
kmyQuest.ChangeName()
PreviousLoc.MoveTo(Game.GetPlayer())
Game.GetPlayer().MoveTo(BannerRoomTeleport)
(GovQuest as CS_ChangeWarMaps).ReplaceMaps()
(GovQuest as CS_GovScriptFunctions).SetUpFactionOwners()
(GovQuest as CS_GovScriptFunctions).TMImp.Start()
(GovQuest as CS_GovScriptFunctions).TMSons.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(12)
SetObjectiveDisplayed(13)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
SetObjectiveCompleted(13)
SetObjectiveDisplayed(14)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(11)
SetObjectiveDisplayed(12)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
setObjectiveCompleted(1)
SetObjectiveDisplayed(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(3)
SetObjectiveDisplayed(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(6)
SetObjectiveDisplayed(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(0)
SetObjectiveDisplayed(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveCompleted(7)
SetObjectiveDisplayed(8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(4)
SetObjectiveDisplayed(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(2)
SetObjectiveDisplayed(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(16)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
SetObjectiveCompleted(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
SetObjectiveCompleted(16)
SetObjectiveDisplayed(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(9)
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
SetObjectiveCompleted(14)
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
SetObjectiveCompleted(8)
SetObjectiveDisplayed(9)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property FactionStarted  Auto  

SPELL Property BannerSpell  Auto  

GlobalVariable Property GovCosts  Auto  

ObjectReference Property BannerRoomTeleport  Auto  

ObjectReference Property PreviousLoc  Auto  

Quest Property GovQuest  Auto  

SPELL Property SettingsSpell  Auto  

Book Property SettingsMenu  Auto  
