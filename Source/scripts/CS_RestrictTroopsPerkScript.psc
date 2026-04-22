Scriptname CS_RestrictTroopsPerkScript extends Quest  

GlobalVariable Property PlayerIsFollowed  Auto  

FormList Property FollowCommander  Auto  

Function AddRemoveTroopPerk()
	int i = 0
	int PlayerFollowed = 0
	while i < FollowCommander.GetSize()
		if (FollowCommander.GetAt(i) as GlobalVariable).GetValue() == 0
			PlayerIsFollowed.SetValue(1)
			PlayerFollowed = 1
		endif
		i += 1
	endwhile
	If PlayerFollowed == 0
		PlayerIsFollowed.SetValue(0)
	EndIf
EndFunction