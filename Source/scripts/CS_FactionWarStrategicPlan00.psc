Scriptname CS_FactionWarStrategicPlan00 extends MiscObject

; Lists the required relative powers for this strat plan
int Property RequiredDiplomaticPower Auto
int Property RequiredIntelligencePower Auto
int Property RequiredMilitaryPower Auto
int Property RequiredEconomicPower Auto

; Strategic attributes for plan

int Property Aggression Auto ;0 = completely defensive (all troops stay defending), 5 = completely aggressive (all troops attacking)
int Property Risk Auto ;0 = not willing to act without 100% intel, 5 = willing to act with 0% intel
int Property Patience Auto ;0 = wants to conclude war as quickly as possible, 5 = willing to draw war out as long as possible
int Property Brutality Auto ;0 = not willing to commit any brutal acts (village raiding, torturing, caravan raiding) against enemy, 5 = willing to commit all brutal acts (brutal acts can lower enemy war support)
int[] Property WarSupport Auto ;0 = faction citizens do not support the war at all, 5 = faction citizens completely support war
