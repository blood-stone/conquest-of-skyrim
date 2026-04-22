;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS__TIF__05D5BEAE Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
CS_PotentialSponsorScript SponsorScript = GetOwningQuest() as CS_PotentialSponsorScript
SponsorScript.MarriageOfferSponsorNum = 1
SponsorScript.MarryFamilyMember(SponsorScript.MarriageOfferSponsorNum)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
