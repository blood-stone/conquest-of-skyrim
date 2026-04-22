;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS_ClaimAreaQuestScript Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bandit004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit023
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit023 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit027
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit027 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit000
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit000 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit028
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit028 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit030
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit030 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit026
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit026 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit021
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit021 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ClaimedArea
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ClaimedArea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY bandit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_bandit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NewPlayerTerritory
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NewPlayerTerritory Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit029
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit029 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameChangerBanner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameChangerBanner Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit024
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit024 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit025
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit025 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit022
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit022 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FactionName
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FactionName Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit002 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE CS_ClaimAreaFunctions
Quest __temp = self as Quest
CS_ClaimAreaFunctions kmyQuest = __temp as CS_ClaimAreaFunctions
;END AUTOCAST
;BEGIN CODE
Location HoldingLoc = Alias_ClaimedArea.GetLocation()
	int i = 0
	If HoldingLocationsVanilla.HasForm(HoldingLoc)
		
		Location HoldingLocCS = HoldingLocations.GetAt(HoldingLocationsVanilla.Find(HoldingLoc)) as Location
			
			if HoldingLocCS.GetKeywordData(PlayerOwner) != 1 && HoldingLocCS.HasKeyword(PlayerOwner) == 1 
				
				int banditnum = 0
				int alivecount = 0
				while banditnum < Bandits.Length
					if Bandits[banditnum].GetActorRef() != None
						if Bandits[banditnum].GetActorRef().IsDead() == 0 && Bandits[banditnum].GetActorRef().IsEnabled() == 1
							alivecount += 1
						endif
					endif
					banditnum += 1
				endwhile

				if alivecount == 0

					ClaimMessage.show()
					ObjectReference NewBanner = Game.GetPlayer().PlaceAtMe(Banner, abForcePersist=true)
					FactionNameHold.ForceRefTo(FactionNameGov.GetReference())
					NameChangerBanner.ForceRefTo(NewBanner)
					NameChangerBanner.Clear()
					NewBanner.MoveTo(Game.GetPlayer(), 120.0 * Math.Sin(Game.GetPlayer().GetAngleZ()), 120.0 * Math.Cos(Game.GetPlayer().GetAngleZ()), Game.GetPlayer().GetHeight() - 220.0, false)
					NewBanner.SetAngle(0, 0, Game.GetPlayer().GetAngleZ() - 90)
					ObjectReference NewBannerFlag = NewBanner.PlaceAtMe(FlagChanger, abForcePersist=true)
					NewBannerFlag.MoveTo(NewBanner, afXOffset=3, afZOffset=390)
					NewBanner.SetAngle(0, 0, NewBanner.GetAngleZ() + 180) 
					PlacedBanners.AddForm(NewBannerFlag)
					If FactionBannerFlag.GetOwningQuest().GetStage() == 0
						FactionBannerFlag.GetOwningQuest().SetStage(1)
					EndIf
					int index = 0
					while index < (AllHoldingsQuest as CS_ClaimAreaFunctions).Holdings.Length
						if (AllHoldingsQuest as CS_ClaimAreaFunctions).Holdings[index].GetLocation() == None
							(AllHoldingsQuest as CS_ClaimAreaFunctions).Holdings[index].ForceLocationTo(HoldingLocCS)
							(AllHoldingsQuest as CS_ClaimAreaFunctions).CommanderMarkers[index].ForceRefTo(NewBanner)
							(AllHoldingsQuest as CS_ClaimAreaFunctions).CommanderHoldings[index].ForceLocationTo(HoldingLoc)
							Alias_NewPlayerTerritory.ForceLocationTo(HoldingLocCS)
							HoldingLocCS.SetKeywordData(PlayerOwner, 1)
							MiscCount.SetValue(MiscCount.GetValue() + 1)
							if CapitalBase.GetLocation() == None
								CapitalBase.ForceLocationTo(HoldingLoc)
								kmyQuest.FindInteriorMarker(HoldingLoc)
							endif
							(TroopRespawnQuest as CS_RefreshTroopRespawn).UpdateLimit()
							debug.notification("")
							(AllHoldingsQuest as CS_ClaimAreaFunctions).IncreaseArmyLimit()
							;(AllHoldingsQuest as CS_ClaimAreaFunctions).ResetCommanderHoldings()
							index = (AllHoldingsQuest as CS_ClaimAreaFunctions).Holdings.Length
						endif
						index += 1
					endwhile

					if HoldingLoc.HasKeyword(CWOwner)

						HoldingLoc.SetKeywordData(CWOwner, 69)

					endif
				else
					debug.notification("You can not claim this area since there are still " + alivecount + " enemies alive!")
					stop()
				endif
			
			elseif HoldingLocCS.GetKeywordData(PlayerOwner) == 1
				debug.notification("You already claim this area!")
			else
				debug.notification("This area is unavailable for claiming!")
			endif

	Else
		debug.notification("This area is unavailable for claiming!")

	endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property ClaimMessage  Auto  

ReferenceAlias[] Property Bandits  Auto  

Activator Property Banner  Auto  

FormList Property HoldingLocationsVanilla  Auto  

FormList Property HoldingLocations  Auto  

Keyword Property PlayerOwner  Auto  

ReferenceAlias Property NameChangerBanner  Auto  

GlobalVariable Property MiscCount  Auto  

ReferenceAlias Property FactionNameGov  Auto  

ReferenceAlias Property FactionNameHold  Auto  

Keyword Property CWOwner  Auto  

Quest Property AllHoldingsQuest  Auto  

LocationAlias Property CapitalBase  Auto  

ReferenceAlias Property CapitalBaseMarker  Auto  

Quest Property TroopRespawnQuest  Auto  

ObjectReference Property BannerFlag  Auto  

ReferenceAlias Property FactionBannerFlag  Auto  

FormList Property PlacedBanners  Auto  

Activator Property FlagChanger  Auto  
