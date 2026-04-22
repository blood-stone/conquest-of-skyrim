;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname QF_CS_Startup_050F6245 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
int i = 0
int index
while i < SiegeDefenders.Length
	index = 0
	while index < SiegeDefenders[i].GetSize()
		Actor Defender = SiegeDefenders[i].GetAt(index) as Actor
		if Defender.IsInFaction(DefenseImpFaction) == 1
			Defender.disable()
		elseif Defender.IsInFaction(DefenseSonsFaction) == 1
			Defender.disable()
		endif
		index += 1
	endwhile
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList[] Property SiegeDefenders  Auto  

Faction Property DefenseImpFaction  Auto  

Faction Property DefenseSonsFaction  Auto  
