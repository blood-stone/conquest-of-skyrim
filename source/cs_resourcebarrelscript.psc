Scriptname CS_ResourceBarrelScript extends ObjectReference  

CS_EconomyVariableFunctions Property EconomyScript Auto
CS_AttackCityScript Property AttackCityScript Auto
CS_RaidVillageScript Property RaidVillage Auto

FormList Property AllVanillaLocations Auto

Activator Property ResourceBarrelGold Auto
Activator Property ResourceBarrelFood Auto
Activator Property ResourceBarrelWood Auto
Activator Property ResourceBarrelMetal Auto

Sound Property CoinSound Auto
Sound Property FoodSound Auto
Sound Property MetalSound Auto
Sound Property WoodSound Auto

bool Property Village Auto

Event OnActivate(ObjectReference akActivator)
	int citynum = GetCityNum()
	if RaidVillage.IsRunning() && RaidVillage.holdnum == citynum
		Village = true
	endif
	if GetBaseObject() == ResourceBarrelFood
		PillageFood(citynum)
		disable()
	elseif GetBaseObject() == ResourceBarrelMetal
		PillageMetal(citynum)
		disable()
	elseif GetBaseObject() == ResourceBarrelWood
		PillageWood(citynum)
		disable()
	elseif GetBaseObject() == ResourceBarrelGold
		PillageGold(citynum)
		disable()
	endif
	if Village
		RaidVillage.CheckAllBarrels()
	elseif AttackCityScript.IsRunning() && AttackCityScript.citynum == citynum
		AttackCityScript.CheckAllBarrels()
	endif
EndEvent

Function PillageGold(int citynum)
	Location City = EconomyScript.AllLocations.GetAt(citynum) as Location
		int NewGold
		if Village 
			NewGold = math.floor(0.50*(RaidVillage.CoinInitial as float))
		else
			NewGold = math.floor(0.25*(AttackCityScript.CoinInitial as float))
		endif
		EconomyScript.CoinTotalPlayer.Mod(NewGold)
		City.SetKeywordData(EconomyScript.Treasury, City.GetKeywordData(EconomyScript.Treasury) - NewGold)
		CoinSound.Play(Game.GetPlayer())
		debug.notification(NewGold + " gold has been added raided!")
EndFunction

Function PillageFood(int citynum)
	Location City = EconomyScript.AllLocations.GetAt(citynum) as Location
		int NewFood
		if Village 
			NewFood = math.floor(0.50*(RaidVillage.FoodInitial as float))
		else
			NewFood = math.floor(0.25*(AttackCityScript.FoodInitial as float))
		endif
		EconomyScript.FoodTotalPlayer.Mod(NewFood)
		City.SetKeywordData(EconomyScript.FoodReserve, City.GetKeywordData(EconomyScript.FoodReserve) - NewFood)
		FoodSound.Play(Game.GetPlayer())
		debug.notification(NewFood + " food has been added raided!")
EndFunction

Function PillageMetal(int citynum)
	Location City = EconomyScript.AllLocations.GetAt(citynum) as Location
		int NewMetal
		if Village 
			NewMetal = math.floor(0.50*(RaidVillage.MetalInitial as float))
		else
			NewMetal = math.floor(0.25*(AttackCityScript.MetalInitial as float))
		endif
		EconomyScript.MetalTotalPlayer.Mod(NewMetal)
		City.SetKeywordData(EconomyScript.MetalReserve, City.GetKeywordData(EconomyScript.MetalReserve) - NewMetal)
		MetalSound.Play(Game.GetPlayer())
		debug.notification(NewMetal + " metal has been added raided!")
EndFunction

Function PillageWood(int citynum)
	Location City = EconomyScript.AllLocations.GetAt(citynum) as Location
		int NewWood
		if Village 
			NewWood = math.floor(0.50*(RaidVillage.WoodInitial as float))
		else
			NewWood = math.floor(0.25*(AttackCityScript.WoodInitial as float))
		endif
		EconomyScript.WoodTotalPlayer.Mod(NewWood)
		City.SetKeywordData(EconomyScript.WoodReserve, City.GetKeywordData(EconomyScript.WoodReserve) - NewWood)
		WoodSound.Play(Game.GetPlayer())
		debug.notification(NewWood + " wood has been added raided!")
EndFunction

int Function GetCityNum()
	Actor PlayerRef = Game.GetPlayer()
	int citynum = -1
	int i = 0
	bool foundcity = false
	while i < AllVanillaLocations.GetSize() && foundcity == false
		if Game.GetPlayer().IsInLocation(AllVanillaLocations.GetAt(i) as Location)
			citynum = i
			foundcity = true
		endif
		i += 1
	endwhile

	return citynum
EndFunction