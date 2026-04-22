;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_CS_FactionGovernmentRepub_0505DD57 Extends Quest Hidden

;BEGIN ALIAS PROPERTY President
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_President Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunSenator1Candidate2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunSenator1Candidate2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunSenator2Candidate1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunSenator2Candidate1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunSenator1Candidate1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunSenator1Candidate1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WhiterunSenator2Candidate2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WhiterunSenator2Candidate2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Candidate Selection
debug.notification("Candidate selection started")

int i = 0
while i < AllHoldings.GetSize()
	GlobalVariable Holding = AllHoldings.GetAt(i) as GlobalVariable
	If Holding.GetValue() == 1
		int index = 0
		int residentnum = 0
		while index == 0
			residentnum = utility.randomint(0, Residents[i].GetSize() - 1)
			Actor Resident1 = Residents[i].GetAt(residentnum) as Actor
			If Resident1.IsDead() != 1
				If Resident1.IsInFaction(PartyTradition)
					Alias_WhiterunSenator1Candidate1.ForceRefTo(Resident1)
					index = 100
				EndIf
			EndIf
		endwhile
		index = 0
		while index == 0
			residentnum = utility.randomint(0, Residents[i].GetSize() - 1)
			Actor Resident2 = Residents[i].GetAt(residentnum) as Actor
			If Resident2 != Alias_WhiterunSenator1Candidate1.GetActorRef()
				If Resident2.IsInFaction(PartyModern)
					If Resident2.IsDead() != 1
						Alias_WhiterunSenator1Candidate2.ForceRefTo(Resident2)
						index = 100
					EndIf
				EndIf
			EndIf
		endwhile
		index = 0
		while index == 0
			residentnum = utility.randomint(0, Residents[i].GetSize() - 1)
			Actor Resident3 = Residents[i].GetAt(residentnum) as Actor
			If Resident3 != Alias_WhiterunSenator1Candidate1.GetActorRef()
				If Resident3 != Alias_WhiterunSenator1Candidate2.GetActorRef()
					If Resident3.IsInFaction(PartyTradition)
						If Resident3.IsDead() != 1
							Alias_WhiterunSenator2Candidate1.ForceRefTo(Resident3)
							index = 100
						EndIf
					EndIf
				EndIf
			EndIf
		endwhile
		index = 0
		while index == 0
			residentnum = utility.randomint(0, Residents[i].GetSize() - 1)
			Actor Resident4 = Residents[i].GetAt(residentnum) as Actor
			If Resident4 != Alias_WhiterunSenator1Candidate1.GetActorRef()
				If Resident4 != Alias_WhiterunSenator1Candidate2.GetActorRef()
					If Resident4 != Alias_WhiterunSenator2Candidate1.GetActorRef()
						If Resident4.IsInFaction(PartyModern)
							If Resident4.IsDead() != 1
								Alias_WhiterunSenator2Candidate2.ForceRefTo(Resident4)
								index = 100
							EndIf
						EndIf
					EndIf
				EndIf
			EndIf
		endwhile
	endif
	i += 1
endwhile

CandidateMessage.show()
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
int i = 0
while i < PartyMembersModern.GetSize()
	Actor Member = PartyMembersModern.GetAt(i) as Actor
	Member.AddToFaction(PartyModern)
	i += 1
endwhile

i = 0
while i < PartyMembersTraditional.GetSize()
	Actor Member = PartyMembersTraditional.GetAt(i) as Actor
	Member.AddToFaction(PartyTradition)
	i += 1
endwhile

SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
int i = 0
while i < AllHoldings.GetSize()
	GlobalVariable Holding = AllHoldings.GetAt(i) as GlobalVariable
	If Holding.GetValue() == 1
		int ModernVote1 = 0
		int TraditionalVote1 = 0
		int randomchoice = 0
		int index = 0
		while index < Residents[i].GetSize()
			Actor Voter = Residents[i].GetAt(index) as Actor
			If Voter.IsDead() != 1
				If Voter.IsInFaction(PartyModern)
					ModernVote1 += 1
				ElseIf Voter.IsInFaction(PartyTradition)
					TraditionalVote1 += 1
				Else
					randomchoice = utility.randomint(4, 5)
					If randomchoice == 4
						ModernVote1 += 1
					ElseIf randomchoice == 5
						TraditionalVote1 += 1
					EndIf
				EndIf
			EndIf
			index += 1
		endwhile
		If ModernVote1 > TraditionalVote1
			Senator1[i].ForceRefTo(Alias_WhiterunSenator1Candidate1.GetActorRef())
			Senator1Win1.show(ModernVote1, TraditionalVote1)
		ElseIf TraditionalVote1 > ModernVote1
			Senator1[i].ForceRefTo(Alias_WhiterunSenator1Candidate2.GetActorRef())
			Senator1Win2.show(TraditionalVote1, ModernVote1)
		Else
			debug.notification("A tie has occurred!")
		EndIf
		int ModernVote2 = 0
		int TraditionalVote2 = 0
		index = 0
		while index < Residents[i].GetSize()
			Actor Voter = Residents[i].GetAt(index) as Actor
			If Voter.IsDead() != 1
				If Voter.IsInFaction(PartyModern)
					ModernVote2 += 1
				ElseIf Voter.IsInFaction(PartyTradition)
					TraditionalVote2 += 1
				Else
					randomchoice = utility.randomint(4, 5)
					If randomchoice == 4
						ModernVote2 += 1
					ElseIf randomchoice == 5
						TraditionalVote2 += 1
					EndIf
				EndIf
			EndIf
			index += 1
		endwhile
		If ModernVote2 > TraditionalVote2
			Senator2[i].ForceRefTo(Alias_WhiterunSenator2Candidate1.GetActorRef())
			Senator2Win1.show(ModernVote2, TraditionalVote2)
		ElseIf TraditionalVote2 > ModernVote2
			Senator2[i].ForceRefTo(Alias_WhiterunSenator2Candidate2.GetActorRef())
			Senator2Win2.show(TraditionalVote2, ModernVote2)
		Else
			debug.notification("A tie has occurred!")
		EndIf
	endif
	i += 1
endwhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList[] Property Residents  Auto  

FormList Property AllHoldings  Auto  

Message Property CandidateMessage  Auto  

Faction Property PartyTradition  Auto  

Faction Property PartyModern  Auto  

FormList Property PartyMembersTraditional  Auto  

FormList Property PartyMembersModern  Auto  

ReferenceAlias[] Property Senator1  Auto  

ReferenceAlias[] Property Senator2  Auto  

GlobalVariable Property VoteNumber1  Auto  

GlobalVariable Property VoteNumber2  Auto  

Message Property Senator1Win1  Auto  

Message Property Senator1Win2  Auto  

Message Property Senator2Win1  Auto  

Message Property Senator2Win2  Auto  
