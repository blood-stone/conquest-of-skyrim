Scriptname CS_CatapultScript extends Quest  

QF_CS_CatapultQuest_050F0F33 Property CatapultScript Auto

Function DisableCatapults(int citynum)
	CatapultScript.Catapults.SetValue(0)
	int i = 0
	int catapultnum

	catapultnum = 0
	while catapultnum < CatapultScript.CatapultList[citynum].GetSize()
		ObjectReference Catapult = CatapultScript.CatapultList[citynum].GetAt(catapultnum) as ObjectReference
		ObjectReference CatapultOp = CatapultScript.CatapultOpsList[citynum].GetAt(catapultnum) as ObjectReference
		Catapult.disable()
		CatapultOp.disable()
		CatapultScript.CatapultOpsArray[catapultnum].Clear()
		catapultnum += 1
	endwhile


EndFunction