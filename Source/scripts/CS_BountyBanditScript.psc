Scriptname CS_BountyBanditScript extends Quest  

FormList Property BountyLocations Auto

LocationRefType Property Boss  Auto  

Keyword Property PlayerOwner  Auto  

LocationAlias Property Hold  Auto  
LocationAlias Property BountyLocation  Auto  

Function FindBountyLocation()
	int i = utility.randomint(0, BountyLocations.GetSize() - 1)
	BountyLocation.ForceLocationTo(BountyLocations.GetAt(i) as Location)
EndFunction