;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__QF_CS_CityManagementChang_050893AE Extends Quest Hidden

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;/if CS_CityManagement.IsRunning() && !(CS_CityManagement as CS_CityManagementScript).CityAlias.GetLocation().IsLoaded()
	debug.trace("Player has moved from " + (CS_CityManagement as CS_CityManagementScript).CityAlias.GetLocation().GetName() + " to " + Alias_City.GetLocation().GetName()) 
	(CS_CityManagement as CS_CityManagementScript).PurgeCityData()
	(CS_CityManagement as CS_CityManagementScript).Stop()
	while CS_CityManagement.IsRunning()
		debug.trace("Waiting for city management to transfer...")
		utility.wait(0.1)
	endwhile
endif
debug.trace("Sending new city management story event")
CS_StoryCityManagement.SendStoryEvent(Alias_City.GetLocation())/;
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property CS_StoryCityManagement  Auto  

Quest Property CS_CityManagement  Auto  
