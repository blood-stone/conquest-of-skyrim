Scriptname CS_BannerChangeToPlayer extends ObjectReference  
{Changes the banner to a player banner}

Message Property BannerMessage Auto

Event OnActivate(ObjectReference akActionRef)
	Menu()
EndEvent

Function Menu(int Response = 0)
	Response = BannerMessage.show()
	If Response == 0
		XMarker.enable()
		If StateOfWar.GetValue() != 1
			StateOfWar.SetValue(1)
			WarQuest.SetStage(10)
		EndIf
		WarQuest.SetObjectiveCompleted(ObjNum)
		If FactionStart.GetValue() == 0
			int i = 0
			while i < ArmyQuests.GetSize()
				Quest ArmyQuest = ArmyQuests.GetAt(i) as Quest
				ArmyQuest.Start()
				i += 1
			endwhile
			FactionStart.SetValue(1)
		EndIf
		EnemyVillageCount.SetValue(EnemyVillageCount.GetValue() - 1)
		VillageHoldingValue.SetValue(1)
		PlayerVillageCount.SetValue(PlayerVillageCount.GetValue() + 1)
		CommandQuest.Start()
		If CapitalHold.GetValue() == 1
			If OtherVillage.GetValue() == 1
				WarQuest.SetStage(50)
			EndIf
		EndIf
	EndIf
EndFunction


ObjectReference Property XMarker  Auto  
{Captured Marker}

GlobalVariable Property TaxTimeInitial  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property StateOfWar  Auto  

GlobalVariable Property EnemyVillageCount  Auto  

GlobalVariable Property PlayerVillageCount  Auto  

Quest Property WarQuest  Auto  

GlobalVariable Property VillageHoldingValue  Auto  

ObjectReference Property TroopClearer  Auto  

GlobalVariable Property AllowCapture  Auto  

GlobalVariable Property CapitalHold  Auto  

FormList Property ArmyQuests  Auto  

GlobalVariable Property FactionStart  Auto  

ObjectReference Property GuardMarker1  Auto  

ObjectReference Property GuardMarker2  Auto  

Quest Property CommandQuest  Auto  

ObjectReference Property GarrisonMarkerImp  Auto  

ObjectReference Property GarrisonMarkerSons  Auto  

Int Property ObjNum  Auto  

GlobalVariable Property OtherVillage  Auto  
