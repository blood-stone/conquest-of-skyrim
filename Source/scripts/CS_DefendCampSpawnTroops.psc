Scriptname CS_DefendCampSpawnTroops extends ReferenceAlias  

Event OnCellAttach()
	(GetOwningQuest() as CS_DefendCampScript).SpawnAll()
EndEvent