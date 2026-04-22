Scriptname CS_FormationMGEFScript extends activemagiceffect  

ReferenceAlias Property Commander Auto

float Property XOffset Auto
float Property YOffset Auto
float Property CatchUpRadius Auto
float Property ZAngle Auto
float Property FollowRadius Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.KeepOffsetFromActor(Game.GetPlayer(), XOffset, YOffset, 0 as float, 0 as float, 0 as float, ZAngle, afCatchUpRadius = CatchUpRadius, afFollowRadius = FollowRadius as float)
EndEvent