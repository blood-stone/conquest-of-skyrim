;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname CS__QF_CS_PublicSpeaker_05A87A15 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Public_SpeakerStandMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Public_SpeakerStandMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCS
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CityCS Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Public_Speaker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Public_Speaker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Public_Speaker.GetActorRef().delete()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int citynum = AllLocations.Find(Alias_City.GetLocation())
Alias_CityCS.ForceLocationTo(AllLocationsCS.GetAt(citynum) as Location)

Actor PublicSpeakerActor = Alias_Public_SpeakerStandMarker.GetRef().PlaceActorAtMe(PublicSpeaker)
Alias_Public_Speaker.ForceRefTo(PublicSpeakerActor)
Alias_Public_Speaker.GetActorRef().MoveTo(Alias_Public_SpeakerStandMarker.GetRef())
RegisterForUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property PublicSpeakerScene  Auto  

ActorBase Property PublicSpeaker  Auto  

FormList Property AllLocations  Auto  

FormList Property AllLocationsCS  Auto  
