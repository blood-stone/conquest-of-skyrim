;/ Decompiled by Champollion V1.0.1
Source   : CS__TIF__052FBDA1.psc
Modified : 2022-04-19 11:43:42
Compiled : 2022-04-19 11:43:44
User     : Emilio
Computer : DESKTOP-EH9BGO7
/;
scriptName CS__TIF__052FBDA1 extends TopicInfo hidden

;-- Properties --------------------------------------

;-- Variables ---------------------------------------

;-- Functions ---------------------------------------

; Skipped compiler generated GotoState

; Skipped compiler generated GetState

function Fragment_0(ObjectReference akSpeakerRef)

	actor akSpeaker = akSpeakerRef as actor
	(self.GetOwningQuest() as cs_recruitjarl).CityChoose.ForceLocationTo((self.GetOwningQuest() as cs_recruitjarl).AllLocations.GetAt(1) as location)
endFunction
