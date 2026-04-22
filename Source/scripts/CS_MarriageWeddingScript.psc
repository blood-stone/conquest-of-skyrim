Scriptname CS_MarriageWeddingScript extends Quest  

ReferenceAlias Property Spouse Auto
ReferenceAlias Property Sponsor Auto
ReferenceAlias Property Priest Auto

Scene Property WeddingScene Auto

Faction Property CS_MarriagePlayerSiblingInLaw Auto
Faction Property CS_MarriagePlayerChildInLaw Auto
Faction Property CS_MarriagePlayerParentInLaw Auto
Faction Property CS_MarriagePlayerAuntUncleInLaw Auto
Faction Property CS_MarriagePlayerNieceNephewInLaw Auto
Faction Property CS_MarriagePlayerCousinInLaw Auto
Faction Property CS_MarriagePlayerGrandparentInLaw Auto
Faction Property CS_MarriagePlayerGrandchildInLaw Auto
Faction Property CS_MarriagePlayerFamily Auto
Faction Property CS_JarlFaction Auto

GlobalVariable Property GameDaysPassed Auto

AssociationType Property Siblings Auto
AssociationType Property ParentChild Auto
AssociationType Property AuntUncle Auto
AssociationType Property Cousins Auto
AssociationType Property GrandparentGrandchild Auto

CS_GetNPCFamilyScript Property GetNPCFamilyScript Auto
CS_MarriageScript Property MarriageScript Auto

float Property WeddingDay Auto

Function StrengthenFamilyRelations()
    if Sponsor.GetActorRef()
        Actor[] SponsorFamily = GetNPCFamilyScript.GetNPCFamily(Sponsor.GetActorRef())
        Actor SponsorSpouse = GetNPCFamilyScript.GetNPCSpouse(Sponsor.GetActorRef())

        AddToPlayerFamily(Sponsor.GetActorRef())
        
        int i = 0
        while i < SponsorFamily.Length
            if SponsorFamily[i] && SponsorFamily[i]
                AddToPlayerFamily(SponsorFamily[i])
            endif
            i += 1
        endwhile
        if SponsorSpouse
            SponsorSpouse.SetRelationshipRank(Game.GetPlayer(), 3)
        endif
    else
        Actor[] SpouseFamily = GetNPCFamilyScript.GetNPCFamily(Spouse.GetActorRef())
        int i = 0
        while i < SpouseFamily.Length
            AddToPlayerFamily(SpouseFamily[i])
            i += 1
        endwhile
    endif
EndFunction

Function AddToPlayerFamily(Actor Person)
    if Person != Spouse.GetActorRef()
        if Person.HasAssociation(Siblings, Spouse.GetActorRef())
            Person.AddToFaction(CS_MarriagePlayerSiblingInLaw)
            debug.trace("Adding " + Person + " to Siblings")
        elseif Person.HasAssociation(ParentChild, Spouse.GetActorRef())
            if Person.HasParentRelationship(Spouse.GetActorRef())
                Person.AddToFaction(CS_MarriagePlayerParentInLaw)
                debug.trace("Adding " + Person + " to Parents")
            else
                Person.AddToFaction(CS_MarriagePlayerChildInLaw)
                debug.trace("Adding " + Person + " to Children")
            endif
        elseif Person.HasAssociation(AuntUncle, Spouse.GetActorRef())
            if Person.HasParentRelationship(Spouse.GetActorRef())
                Person.AddToFaction(CS_MarriagePlayerAuntUncleInLaw)
                debug.trace("Adding " + Person + " to AuntUncles")
            else
                Person.AddToFaction(CS_MarriagePlayerNieceNephewInLaw)
                debug.trace("Adding " + Person + " to NieceNephews")
            endif
        elseif Person.HasAssociation(Cousins, Spouse.GetActorRef())
            Person.AddToFaction(CS_MarriagePlayerCousinInLaw)
            debug.trace("Adding " + Person + " to Cousins")
        elseif Person.HasAssociation(GrandparentGrandchild, Spouse.GetActorRef())
            if Person.HasParentRelationship(Spouse.GetActorRef())
                Person.AddToFaction(CS_MarriagePlayerGrandparentInLaw)
                debug.trace("Adding " + Person + " to Grandparent")
            else
                Person.AddToFaction(CS_MarriagePlayerGrandchildInLaw)
                debug.trace("Adding " + Person + " to Grandchild")
            endif
        endif
        Person.AddToFaction(CS_MarriagePlayerFamily)
        Person.SetRelationshipRank(Game.GetPlayer(), 3)
    endif
EndFunction

Event OnUpdateGameTime()
    if GameDaysPassed.GetValue() >= WeddingDay
        SetStage(10)
    endif
EndEvent