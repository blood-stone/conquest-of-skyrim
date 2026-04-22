Scriptname CS_WhiterunAtWar extends Quest  

GlobalVariable Property StateOfWar  Auto  

Faction Property Faction01  Auto  

Faction Property Faction02  Auto  

Faction Property Faction03  Auto  

Faction Property Faction04  Auto  


If StateOfWar == 1
	Faction01.SetEnemy(Faction02)
	Faction01.SetEnemy(Faction03)
	Faction01.SetEnemy(Faction04)
	Faction02.SetEnemy(Faction01)
	Faction03.SetEnemy(Faction01)
	Faction04.SetEnemy(Faction01)
	PlayerFaction.SetEnemy(Faction02)
	PlayerFaction.SetEnemy(Faction03)
	PlayerFaction.SetEnemy(Faction04)
	Faction02.SetEnemy(PlayerFaction)
	Faction03.SetEnemy(PlayerFaction)
	Faction04.SetEnemy(PlayerFaction)
EndIf
Activator Property Banner  Auto  
