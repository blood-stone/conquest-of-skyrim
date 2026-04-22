Scriptname CS_TriggerBoxAttackCityScript extends ObjectReference  

ObjectReference Property City Auto

CS_FactionManagementDiplomacy Property CS_FactionPlayer Auto

Keyword Property CS_StoryAttackCity Auto

ObjectReference Property PlayerRef Auto

;Function CheckWar() -- checks to see if the city's owner is at war with player. Starts battle if true.

bool Function CheckWar()
    ObjectReference FactionOwner = (City as CS_CityManagementOwnership).FactionOwnerActivator
    if (FactionOwner as CS_FactionManagementDiplomacy).AtWarPlayer == 1
        int EnemyNum = CS_FactionPlayer.Enemies.Find(FactionOwner)
        ObjectReference WarRef = CS_FactionPlayer.Wars[EnemyNum]
        CS_StoryAttackCity.SendStoryEvent((City as CS_CityManagementOwnership).VanillaCity, City, WarRef)
    else
        return false
    endif
EndFunction

Event OnTriggerEnter(ObjectReference akActionRef)
    if akActionRef == PlayerRef
        CheckWar()
    endif
EndEvent