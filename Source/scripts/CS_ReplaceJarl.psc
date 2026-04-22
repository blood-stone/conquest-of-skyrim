Scriptname CS_ReplaceJarl extends Quest  

ReferenceAlias[] Property Jarls Auto

Function ReplaceJarl(int citynum, Actor NewJarl)
	Jarls[citynum].ForceRefTo(NewJarl)
EndFunction
