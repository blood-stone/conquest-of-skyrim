Scriptname CS_AttackCampScript extends Quest  

int Property holdnum Auto
int Property enemyfactionnum Auto
int Property AttackersInitial Auto
int Property DefendersInitial Auto
int Property TroopsRemainingAttackers Auto
int Property TroopsRemainingDefenders Auto

Location Property HoldLoc Auto

LocationAlias Property Camp Auto

ReferenceAlias[] Property Defenders Auto
ReferenceAlias[] Property DefenderSpawn Auto
ReferenceAlias[] Property Attackers Auto
ReferenceAlias[] Property AttackerSpawn Auto

Keyword Property LandSuperiority Auto
Keyword Property ArmiesPatrolling Auto
Keyword Property ArmiesAttacking Auto

FormList Property AllLocationsCS Auto
FormList Property AllCampLocationsImp Auto
FormList Property AllCampLocationsSons Auto

GlobalVariable Property TroopsRemainingDefendersPercent Auto
GlobalVariable Property TroopsRemainingAttackersPercent Auto

ActorBase Property ImperialSoldier Auto
ActorBase Property ImperialArcher Auto
ActorBase Property ImperialCommander Auto

ActorBase Property StormcloakSoldier Auto
ActorBase Property StormcloakArcher Auto
ActorBase Property StormcloakCommander Auto

CS_TMScript Property TMDataImp Auto
CS_TMScript Property TMDataSons Auto

Function SetUp()
	if enemyfactionnum == 11
		holdnum = AllCampLocationsImp.Find(Camp.GetLocation())

		HoldLoc = AllLocationsCS.GetAt(holdnum) as Location

		if HoldLoc.GetKeywordData(LandSuperiority) == enemyfactionnum
			DefendersInitial = TMDataImp.TMData.GetKeywordData(ArmiesPatrolling) as int
		else
			DefendersInitial = TMDataImp.TMData.GetKeywordData(ArmiesAttacking) as int
		endif


	elseif enemyfactionnum == 12
		holdnum = AllCampLocationsSons.Find(Camp.GetLocation())

		HoldLoc = AllLocationsCS.GetAt(holdnum) as Location

		if HoldLoc.GetKeywordData(LandSuperiority) == enemyfactionnum
			DefendersInitial = TMDataSons.TMData.GetKeywordData(ArmiesPatrolling) as int
		else
			DefendersInitial = TMDataSons.TMData.GetKeywordData(ArmiesAttacking) as int
		endif

	endif

	TroopsRemainingDefenders = DefendersInitial
	TroopsRemainingAttackers = AttackersInitial
	TroopsRemainingDefendersPercent.SetValue(100)
	TroopsRemainingAttackersPercent.SetValue(100)
	UpdateCurrentInstanceGlobal(TroopsRemainingDefendersPercent)
	UpdateCurrentInstanceGlobal(TroopsRemainingAttackersPercent)

	SpawnDefenders()

EndFunction

Function SpawnDefenders()
	int i = 0
	while i < Defenders.Length && i < DefendersInitial
		Actor Troop
		int randomint = utility.randomint(0, 1)
		int randomspawn = utility.randomint(0, 4)
		if randomint == 0
			if enemyfactionnum == 11
				Troop = DefenderSpawn[randomspawn].GetRef().PlaceAtMe(ImperialSoldier) as Actor
			elseif enemyfactionnum == 12
				Troop = DefenderSpawn[randomspawn].GetRef().PlaceAtMe(StormcloakSoldier) as Actor
			endif
		elseif randomint == 1
			if enemyfactionnum == 11
				Troop = DefenderSpawn[randomspawn].GetRef().PlaceAtMe(ImperialArcher) as Actor
			elseif enemyfactionnum == 12
				Troop = DefenderSpawn[randomspawn].GetRef().PlaceAtMe(StormcloakArcher) as Actor
			endif
		endif
		Defenders[i].ForceRefTo(Troop)
		i += 1
	endwhile
EndFunction
