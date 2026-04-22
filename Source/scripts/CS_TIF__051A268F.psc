;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname CS_TIF__051A268F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001, 150)
Actor TroopActor = akSpeaker.PlaceActorAtMe(Actor01) as Actor
	If ArmyPersonal.GetValue() == 1
		ArmyPersonalCount.SetValue(ArmyPersonalCount.GetValue() + 1)
		If Troop001.GetActorRef() == None
			Troop001.ForceRefTo(TroopActor)
		ElseIf Troop002.GetActorRef() == None
			Troop002.ForceRefTo(TroopActor)
		ElseIf Troop003.GetActorRef() == None
			Troop003.ForceRefTo(TroopActor)
		ElseIf Troop004.GetActorRef() == None
			Troop004.ForceRefTo(TroopActor)
		ElseIf Troop005.GetActorRef() == None
			Troop005.ForceRefTo(TroopActor)
		ElseIf Troop006.GetActorRef() == None
			Troop006.ForceRefTo(TroopActor)
		ElseIf Troop007.GetActorRef() == None
			Troop007.ForceRefTo(TroopActor)
		ElseIf Troop008.GetActorRef() == None
			Troop008.ForceRefTo(TroopActor)
		ElseIf Troop009.GetActorRef() == None
			Troop009.ForceRefTo(TroopActor)
		ElseIf Troop010.GetActorRef() == None
			Troop010.ForceRefTo(TroopActor)
		ElseIf Troop011.GetActorRef() == None
			Troop011.ForceRefTo(TroopActor)
		ElseIf Troop012.GetActorRef() == None
			Troop012.ForceRefTo(TroopActor)
		ElseIf Troop013.GetActorRef() == None
			Troop013.ForceRefTo(TroopActor)
		ElseIf Troop014.GetActorRef() == None
			Troop014.ForceRefTo(TroopActor)
		ElseIf Troop015.GetActorRef() == None
			Troop015.ForceRefTo(TroopActor)
		ElseIf Troop016.GetActorRef() == None
			Troop016.ForceRefTo(TroopActor)
		ElseIf Troop017.GetActorRef() == None
			Troop017.ForceRefTo(TroopActor)
		ElseIf Troop018.GetActorRef() == None
			Troop018.ForceRefTo(TroopActor)
		ElseIf Troop019.GetActorRef() == None
			Troop019.ForceRefTo(TroopActor)
		ElseIf Troop020.GetActorRef() == None
			Troop020.ForceRefTo(TroopActor)
		EndIf
		If ArmyPersonalCount.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army1.GetValue() == 1
		Army1Count.SetValue(Army1Count.GetValue() + 1)
		If Troop101.GetActorRef() == None
			Troop101.ForceRefTo(TroopActor)
		ElseIf Troop102.GetActorRef() == None
			Troop102.ForceRefTo(TroopActor)
		ElseIf Troop103.GetActorRef() == None
			Troop103.ForceRefTo(TroopActor)
		ElseIf Troop104.GetActorRef() == None
			Troop104.ForceRefTo(TroopActor)
		ElseIf Troop105.GetActorRef() == None
			Troop105.ForceRefTo(TroopActor)
		ElseIf Troop106.GetActorRef() == None
			Troop106.ForceRefTo(TroopActor)
		ElseIf Troop107.GetActorRef() == None
			Troop107.ForceRefTo(TroopActor)
		ElseIf Troop108.GetActorRef() == None
			Troop108.ForceRefTo(TroopActor)
		ElseIf Troop109.GetActorRef() == None
			Troop109.ForceRefTo(TroopActor)
		ElseIf Troop110.GetActorRef() == None
			Troop110.ForceRefTo(TroopActor)
		ElseIf Troop111.GetActorRef() == None
			Troop111.ForceRefTo(TroopActor)
		ElseIf Troop112.GetActorRef() == None
			Troop112.ForceRefTo(TroopActor)
		ElseIf Troop113.GetActorRef() == None
			Troop113.ForceRefTo(TroopActor)
		ElseIf Troop114.GetActorRef() == None
			Troop114.ForceRefTo(TroopActor)
		ElseIf Troop115.GetActorRef() == None
			Troop115.ForceRefTo(TroopActor)
		ElseIf Troop116.GetActorRef() == None
			Troop116.ForceRefTo(TroopActor)
		ElseIf Troop117.GetActorRef() == None
			Troop117.ForceRefTo(TroopActor)
		ElseIf Troop118.GetActorRef() == None
			Troop118.ForceRefTo(TroopActor)
		ElseIf Troop119.GetActorRef() == None
			Troop119.ForceRefTo(TroopActor)
		ElseIf Troop120.GetActorRef() == None
			Troop120.ForceRefTo(TroopActor)
		EndIf
		If Army1Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army2.GetValue() == 1
		Army2Count.SetValue(Army2Count.GetValue() + 1)
		If Troop201.GetActorRef() == None
			Troop201.ForceRefTo(TroopActor)
		ElseIf Troop202.GetActorRef() == None
			Troop202.ForceRefTo(TroopActor)
		ElseIf Troop203.GetActorRef() == None
			Troop203.ForceRefTo(TroopActor)
		ElseIf Troop204.GetActorRef() == None
			Troop204.ForceRefTo(TroopActor)
		ElseIf Troop205.GetActorRef() == None
			Troop205.ForceRefTo(TroopActor)
		ElseIf Troop206.GetActorRef() == None
			Troop206.ForceRefTo(TroopActor)
		ElseIf Troop207.GetActorRef() == None
			Troop207.ForceRefTo(TroopActor)
		ElseIf Troop208.GetActorRef() == None
			Troop208.ForceRefTo(TroopActor)
		ElseIf Troop209.GetActorRef() == None
			Troop209.ForceRefTo(TroopActor)
		ElseIf Troop210.GetActorRef() == None
			Troop210.ForceRefTo(TroopActor)
		ElseIf Troop211.GetActorRef() == None
			Troop211.ForceRefTo(TroopActor)
		ElseIf Troop212.GetActorRef() == None
			Troop212.ForceRefTo(TroopActor)
		ElseIf Troop213.GetActorRef() == None
			Troop213.ForceRefTo(TroopActor)
		ElseIf Troop214.GetActorRef() == None
			Troop214.ForceRefTo(TroopActor)
		ElseIf Troop215.GetActorRef() == None
			Troop215.ForceRefTo(TroopActor)
		ElseIf Troop216.GetActorRef() == None
			Troop216.ForceRefTo(TroopActor)
		ElseIf Troop217.GetActorRef() == None
			Troop217.ForceRefTo(TroopActor)
		ElseIf Troop218.GetActorRef() == None
			Troop218.ForceRefTo(TroopActor)
		ElseIf Troop219.GetActorRef() == None
			Troop219.ForceRefTo(TroopActor)
		ElseIf Troop220.GetActorRef() == None
			Troop220.ForceRefTo(TroopActor)
		EndIf
		If Army2Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army3.GetValue() == 1
		Army3Count.SetValue(Army3Count.GetValue() + 1)
		If Troop301.GetActorRef() == None
			Troop301.ForceRefTo(TroopActor)
		ElseIf Troop302.GetActorRef() == None
			Troop302.ForceRefTo(TroopActor)
		ElseIf Troop303.GetActorRef() == None
			Troop303.ForceRefTo(TroopActor)
		ElseIf Troop304.GetActorRef() == None
			Troop304.ForceRefTo(TroopActor)
		ElseIf Troop305.GetActorRef() == None
			Troop305.ForceRefTo(TroopActor)
		ElseIf Troop306.GetActorRef() == None
			Troop306.ForceRefTo(TroopActor)
		ElseIf Troop307.GetActorRef() == None
			Troop307.ForceRefTo(TroopActor)
		ElseIf Troop308.GetActorRef() == None
			Troop308.ForceRefTo(TroopActor)
		ElseIf Troop309.GetActorRef() == None
			Troop309.ForceRefTo(TroopActor)
		ElseIf Troop310.GetActorRef() == None
			Troop310.ForceRefTo(TroopActor)
		ElseIf Troop311.GetActorRef() == None
			Troop311.ForceRefTo(TroopActor)
		ElseIf Troop312.GetActorRef() == None
			Troop312.ForceRefTo(TroopActor)
		ElseIf Troop313.GetActorRef() == None
			Troop313.ForceRefTo(TroopActor)
		ElseIf Troop314.GetActorRef() == None
			Troop314.ForceRefTo(TroopActor)
		ElseIf Troop315.GetActorRef() == None
			Troop315.ForceRefTo(TroopActor)
		ElseIf Troop316.GetActorRef() == None
			Troop316.ForceRefTo(TroopActor)
		ElseIf Troop317.GetActorRef() == None
			Troop317.ForceRefTo(TroopActor)
		ElseIf Troop318.GetActorRef() == None
			Troop318.ForceRefTo(TroopActor)
		ElseIf Troop319.GetActorRef() == None
			Troop319.ForceRefTo(TroopActor)
		ElseIf Troop320.GetActorRef() == None
			Troop320.ForceRefTo(TroopActor)
		EndIf
		If Army3Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army4.GetValue() == 1
		Army4Count.SetValue(Army4Count.GetValue() + 1)
		If Troop401.GetActorRef() == None
			Troop401.ForceRefTo(TroopActor)
		ElseIf Troop402.GetActorRef() == None
			Troop402.ForceRefTo(TroopActor)
		ElseIf Troop403.GetActorRef() == None
			Troop403.ForceRefTo(TroopActor)
		ElseIf Troop404.GetActorRef() == None
			Troop404.ForceRefTo(TroopActor)
		ElseIf Troop405.GetActorRef() == None
			Troop405.ForceRefTo(TroopActor)
		ElseIf Troop406.GetActorRef() == None
			Troop406.ForceRefTo(TroopActor)
		ElseIf Troop407.GetActorRef() == None
			Troop407.ForceRefTo(TroopActor)
		ElseIf Troop408.GetActorRef() == None
			Troop408.ForceRefTo(TroopActor)
		ElseIf Troop409.GetActorRef() == None
			Troop409.ForceRefTo(TroopActor)
		ElseIf Troop410.GetActorRef() == None
			Troop410.ForceRefTo(TroopActor)
		ElseIf Troop411.GetActorRef() == None
			Troop411.ForceRefTo(TroopActor)
		ElseIf Troop412.GetActorRef() == None
			Troop412.ForceRefTo(TroopActor)
		ElseIf Troop413.GetActorRef() == None
			Troop413.ForceRefTo(TroopActor)
		ElseIf Troop414.GetActorRef() == None
			Troop414.ForceRefTo(TroopActor)
		ElseIf Troop415.GetActorRef() == None
			Troop415.ForceRefTo(TroopActor)
		ElseIf Troop416.GetActorRef() == None
			Troop416.ForceRefTo(TroopActor)
		ElseIf Troop417.GetActorRef() == None
			Troop417.ForceRefTo(TroopActor)
		ElseIf Troop418.GetActorRef() == None
			Troop418.ForceRefTo(TroopActor)
		ElseIf Troop419.GetActorRef() == None
			Troop419.ForceRefTo(TroopActor)
		ElseIf Troop420.GetActorRef() == None
			Troop420.ForceRefTo(TroopActor)
		EndIf
		If Army4Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army5.GetValue() == 1
		Army5Count.SetValue(Army5Count.GetValue() + 1)
		If Troop501.GetActorRef() == None
			Troop501.ForceRefTo(TroopActor)
		ElseIf Troop502.GetActorRef() == None
			Troop502.ForceRefTo(TroopActor)
		ElseIf Troop503.GetActorRef() == None
			Troop503.ForceRefTo(TroopActor)
		ElseIf Troop504.GetActorRef() == None
			Troop504.ForceRefTo(TroopActor)
		ElseIf Troop505.GetActorRef() == None
			Troop505.ForceRefTo(TroopActor)
		ElseIf Troop506.GetActorRef() == None
			Troop506.ForceRefTo(TroopActor)
		ElseIf Troop507.GetActorRef() == None
			Troop507.ForceRefTo(TroopActor)
		ElseIf Troop508.GetActorRef() == None
			Troop508.ForceRefTo(TroopActor)
		ElseIf Troop509.GetActorRef() == None
			Troop509.ForceRefTo(TroopActor)
		ElseIf Troop510.GetActorRef() == None
			Troop510.ForceRefTo(TroopActor)
		ElseIf Troop511.GetActorRef() == None
			Troop511.ForceRefTo(TroopActor)
		ElseIf Troop512.GetActorRef() == None
			Troop512.ForceRefTo(TroopActor)
		ElseIf Troop513.GetActorRef() == None
			Troop513.ForceRefTo(TroopActor)
		ElseIf Troop514.GetActorRef() == None
			Troop514.ForceRefTo(TroopActor)
		ElseIf Troop515.GetActorRef() == None
			Troop515.ForceRefTo(TroopActor)
		ElseIf Troop516.GetActorRef() == None
			Troop516.ForceRefTo(TroopActor)
		ElseIf Troop517.GetActorRef() == None
			Troop517.ForceRefTo(TroopActor)
		ElseIf Troop518.GetActorRef() == None
			Troop518.ForceRefTo(TroopActor)
		ElseIf Troop519.GetActorRef() == None
			Troop519.ForceRefTo(TroopActor)
		ElseIf Troop520.GetActorRef() == None
			Troop520.ForceRefTo(TroopActor)
		EndIf
		If Army5Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	Elseif Army6.GetValue() == 1
		Army6Count.SetValue(Army6Count.GetValue() + 1)
		If Troop601.GetActorRef() == None
			Troop601.ForceRefTo(TroopActor)
		ElseIf Troop602.GetActorRef() == None
			Troop602.ForceRefTo(TroopActor)
		ElseIf Troop603.GetActorRef() == None
			Troop603.ForceRefTo(TroopActor)
		ElseIf Troop604.GetActorRef() == None
			Troop604.ForceRefTo(TroopActor)
		ElseIf Troop605.GetActorRef() == None
			Troop605.ForceRefTo(TroopActor)
		ElseIf Troop606.GetActorRef() == None
			Troop606.ForceRefTo(TroopActor)
		ElseIf Troop607.GetActorRef() == None
			Troop607.ForceRefTo(TroopActor)
		ElseIf Troop608.GetActorRef() == None
			Troop608.ForceRefTo(TroopActor)
		ElseIf Troop609.GetActorRef() == None
			Troop609.ForceRefTo(TroopActor)
		ElseIf Troop610.GetActorRef() == None
			Troop610.ForceRefTo(TroopActor)
		ElseIf Troop611.GetActorRef() == None
			Troop611.ForceRefTo(TroopActor)
		ElseIf Troop612.GetActorRef() == None
			Troop612.ForceRefTo(TroopActor)
		ElseIf Troop613.GetActorRef() == None
			Troop613.ForceRefTo(TroopActor)
		ElseIf Troop614.GetActorRef() == None
			Troop614.ForceRefTo(TroopActor)
		ElseIf Troop615.GetActorRef() == None
			Troop615.ForceRefTo(TroopActor)
		ElseIf Troop616.GetActorRef() == None
			Troop616.ForceRefTo(TroopActor)
		ElseIf Troop617.GetActorRef() == None
			Troop617.ForceRefTo(TroopActor)
		ElseIf Troop618.GetActorRef() == None
			Troop618.ForceRefTo(TroopActor)
		ElseIf Troop619.GetActorRef() == None
			Troop619.ForceRefTo(TroopActor)
		ElseIf Troop620.GetActorRef() == None
			Troop620.ForceRefTo(TroopActor)
		EndIf
		If Army6Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	Elseif Army7.GetValue() == 1
		Army7Count.SetValue(Army7Count.GetValue() + 1)
		If Troop701.GetActorRef() == None
			Troop701.ForceRefTo(TroopActor)
		ElseIf Troop702.GetActorRef() == None
			Troop702.ForceRefTo(TroopActor)
		ElseIf Troop703.GetActorRef() == None
			Troop703.ForceRefTo(TroopActor)
		ElseIf Troop704.GetActorRef() == None
			Troop704.ForceRefTo(TroopActor)
		ElseIf Troop705.GetActorRef() == None
			Troop705.ForceRefTo(TroopActor)
		ElseIf Troop706.GetActorRef() == None
			Troop706.ForceRefTo(TroopActor)
		ElseIf Troop707.GetActorRef() == None
			Troop707.ForceRefTo(TroopActor)
		ElseIf Troop708.GetActorRef() == None
			Troop708.ForceRefTo(TroopActor)
		ElseIf Troop709.GetActorRef() == None
			Troop709.ForceRefTo(TroopActor)
		ElseIf Troop710.GetActorRef() == None
			Troop710.ForceRefTo(TroopActor)
		ElseIf Troop711.GetActorRef() == None
			Troop711.ForceRefTo(TroopActor)
		ElseIf Troop712.GetActorRef() == None
			Troop712.ForceRefTo(TroopActor)
		ElseIf Troop713.GetActorRef() == None
			Troop713.ForceRefTo(TroopActor)
		ElseIf Troop714.GetActorRef() == None
			Troop714.ForceRefTo(TroopActor)
		ElseIf Troop715.GetActorRef() == None
			Troop715.ForceRefTo(TroopActor)
		ElseIf Troop716.GetActorRef() == None
			Troop716.ForceRefTo(TroopActor)
		ElseIf Troop717.GetActorRef() == None
			Troop717.ForceRefTo(TroopActor)
		ElseIf Troop718.GetActorRef() == None
			Troop718.ForceRefTo(TroopActor)
		ElseIf Troop719.GetActorRef() == None
			Troop719.ForceRefTo(TroopActor)
		ElseIf Troop720.GetActorRef() == None
			Troop720.ForceRefTo(TroopActor)
		EndIf
		If Army7Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army8.GetValue() == 1
		Army8Count.SetValue(Army8Count.GetValue() + 1)
		If Troop801.GetActorRef() == None
			Troop801.ForceRefTo(TroopActor)
		ElseIf Troop802.GetActorRef() == None
			Troop802.ForceRefTo(TroopActor)
		ElseIf Troop803.GetActorRef() == None
			Troop803.ForceRefTo(TroopActor)
		ElseIf Troop804.GetActorRef() == None
			Troop804.ForceRefTo(TroopActor)
		ElseIf Troop805.GetActorRef() == None
			Troop805.ForceRefTo(TroopActor)
		ElseIf Troop806.GetActorRef() == None
			Troop806.ForceRefTo(TroopActor)
		ElseIf Troop807.GetActorRef() == None
			Troop807.ForceRefTo(TroopActor)
		ElseIf Troop808.GetActorRef() == None
			Troop808.ForceRefTo(TroopActor)
		ElseIf Troop809.GetActorRef() == None
			Troop809.ForceRefTo(TroopActor)
		ElseIf Troop810.GetActorRef() == None
			Troop810.ForceRefTo(TroopActor)
		ElseIf Troop811.GetActorRef() == None
			Troop811.ForceRefTo(TroopActor)
		ElseIf Troop812.GetActorRef() == None
			Troop812.ForceRefTo(TroopActor)
		ElseIf Troop813.GetActorRef() == None
			Troop813.ForceRefTo(TroopActor)
		ElseIf Troop814.GetActorRef() == None
			Troop814.ForceRefTo(TroopActor)
		ElseIf Troop815.GetActorRef() == None
			Troop815.ForceRefTo(TroopActor)
		ElseIf Troop816.GetActorRef() == None
			Troop816.ForceRefTo(TroopActor)
		ElseIf Troop817.GetActorRef() == None
			Troop817.ForceRefTo(TroopActor)
		ElseIf Troop818.GetActorRef() == None
			Troop818.ForceRefTo(TroopActor)
		ElseIf Troop819.GetActorRef() == None
			Troop819.ForceRefTo(TroopActor)
		ElseIf Troop820.GetActorRef() == None
			Troop820.ForceRefTo(TroopActor)
		EndIf
		If Army8Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army9.GetValue() == 1
		Army9Count.SetValue(Army9Count.GetValue() + 1)
		If Troop901.GetActorRef() == None
			Troop901.ForceRefTo(TroopActor)
		ElseIf Troop902.GetActorRef() == None
			Troop902.ForceRefTo(TroopActor)
		ElseIf Troop903.GetActorRef() == None
			Troop903.ForceRefTo(TroopActor)
		ElseIf Troop904.GetActorRef() == None
			Troop904.ForceRefTo(TroopActor)
		ElseIf Troop905.GetActorRef() == None
			Troop905.ForceRefTo(TroopActor)
		ElseIf Troop906.GetActorRef() == None
			Troop906.ForceRefTo(TroopActor)
		ElseIf Troop907.GetActorRef() == None
			Troop907.ForceRefTo(TroopActor)
		ElseIf Troop908.GetActorRef() == None
			Troop908.ForceRefTo(TroopActor)
		ElseIf Troop909.GetActorRef() == None
			Troop909.ForceRefTo(TroopActor)
		ElseIf Troop910.GetActorRef() == None
			Troop910.ForceRefTo(TroopActor)
		ElseIf Troop911.GetActorRef() == None
			Troop911.ForceRefTo(TroopActor)
		ElseIf Troop912.GetActorRef() == None
			Troop912.ForceRefTo(TroopActor)
		ElseIf Troop913.GetActorRef() == None
			Troop913.ForceRefTo(TroopActor)
		ElseIf Troop914.GetActorRef() == None
			Troop914.ForceRefTo(TroopActor)
		ElseIf Troop915.GetActorRef() == None
			Troop915.ForceRefTo(TroopActor)
		ElseIf Troop916.GetActorRef() == None
			Troop916.ForceRefTo(TroopActor)
		ElseIf Troop917.GetActorRef() == None
			Troop917.ForceRefTo(TroopActor)
		ElseIf Troop918.GetActorRef() == None
			Troop918.ForceRefTo(TroopActor)
		ElseIf Troop919.GetActorRef() == None
			Troop919.ForceRefTo(TroopActor)
		ElseIf Troop920.GetActorRef() == None
			Troop920.ForceRefTo(TroopActor)
		EndIf
		If Army9Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	ElseIf Army10.GetValue() == 1
		Army10Count.SetValue(Army10Count.GetValue() + 1)
		If Troop1001.GetActorRef() == None
			Troop1001.ForceRefTo(TroopActor)
		ElseIf Troop1002.GetActorRef() == None
			Troop1002.ForceRefTo(TroopActor)
		ElseIf Troop1003.GetActorRef() == None
			Troop1003.ForceRefTo(TroopActor)
		ElseIf Troop1004.GetActorRef() == None
			Troop1004.ForceRefTo(TroopActor)
		ElseIf Troop1005.GetActorRef() == None
			Troop1005.ForceRefTo(TroopActor)
		ElseIf Troop1006.GetActorRef() == None
			Troop1006.ForceRefTo(TroopActor)
		ElseIf Troop1007.GetActorRef() == None
			Troop1007.ForceRefTo(TroopActor)
		ElseIf Troop1008.GetActorRef() == None
			Troop1008.ForceRefTo(TroopActor)
		ElseIf Troop1009.GetActorRef() == None
			Troop1009.ForceRefTo(TroopActor)
		ElseIf Troop1010.GetActorRef() == None
			Troop1010.ForceRefTo(TroopActor)
		ElseIf Troop1011.GetActorRef() == None
			Troop1011.ForceRefTo(TroopActor)
		ElseIf Troop1012.GetActorRef() == None
			Troop1012.ForceRefTo(TroopActor)
		ElseIf Troop1013.GetActorRef() == None
			Troop1013.ForceRefTo(TroopActor)
		ElseIf Troop1014.GetActorRef() == None
			Troop1014.ForceRefTo(TroopActor)
		ElseIf Troop1015.GetActorRef() == None
			Troop1015.ForceRefTo(TroopActor)
		ElseIf Troop1016.GetActorRef() == None
			Troop1016.ForceRefTo(TroopActor)
		ElseIf Troop1017.GetActorRef() == None
			Troop1017.ForceRefTo(TroopActor)
		ElseIf Troop1018.GetActorRef() == None
			Troop1018.ForceRefTo(TroopActor)
		ElseIf Troop1019.GetActorRef() == None
			Troop1019.ForceRefTo(TroopActor)
		ElseIf Troop1020.GetActorRef() == None
			Troop1020.ForceRefTo(TroopActor)
		EndIf
		If Army10Count.GetValue() == 20
			AllowRecruitment.SetValue(0)
		EndIf
	EndIf
NameChanger.ForceRefTo(TroopActor)
NameChanger.Clear()
DailyTroopSpawned.SetValue(DailyTroopSpawned.GetValue()+1)
DailyTroopSpawnedMinus5.SetValue(DailyTroopLimit.GetValue() - 5)
If DailyTroopSpawned.GetValue() == 1
	RespawnTime.SetValue(GameDaysPassed.GetValue() + 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property Actor01  Auto  

MiscObject Property Gold001  Auto  

GlobalVariable Property RespawnTime  Auto  

GlobalVariable Property DailyTroopSpawned  Auto  

GlobalVariable Property DailyTroopLimit  Auto  

GlobalVariable Property GameDaysPassed  Auto  

GlobalVariable Property DailyTroopSpawnedMinus5  Auto  

ReferenceAlias Property Troop001  Auto  
ReferenceAlias Property Troop002  Auto  
ReferenceAlias Property Troop003  Auto  
ReferenceAlias Property Troop004  Auto  
ReferenceAlias Property Troop005  Auto  
ReferenceAlias Property Troop006  Auto  
ReferenceAlias Property Troop007  Auto  
ReferenceAlias Property Troop008  Auto  
ReferenceAlias Property Troop009  Auto  
ReferenceAlias Property Troop010  Auto  
ReferenceAlias Property Troop011  Auto  
ReferenceAlias Property Troop012  Auto  
ReferenceAlias Property Troop013  Auto  
ReferenceAlias Property Troop014  Auto  
ReferenceAlias Property Troop015  Auto  
ReferenceAlias Property Troop016  Auto  
ReferenceAlias Property Troop017  Auto  
ReferenceAlias Property Troop018  Auto  
ReferenceAlias Property Troop019  Auto  
ReferenceAlias Property Troop020  Auto  

ReferenceAlias Property Troop101  Auto  
ReferenceAlias Property Troop102  Auto  
ReferenceAlias Property Troop103  Auto  
ReferenceAlias Property Troop104  Auto  
ReferenceAlias Property Troop105  Auto  
ReferenceAlias Property Troop106  Auto  
ReferenceAlias Property Troop107  Auto  
ReferenceAlias Property Troop108  Auto  
ReferenceAlias Property Troop109  Auto  
ReferenceAlias Property Troop110  Auto  
ReferenceAlias Property Troop111  Auto  
ReferenceAlias Property Troop112  Auto  
ReferenceAlias Property Troop113  Auto  
ReferenceAlias Property Troop114  Auto  
ReferenceAlias Property Troop115  Auto  
ReferenceAlias Property Troop116  Auto  
ReferenceAlias Property Troop117  Auto  
ReferenceAlias Property Troop118  Auto  
ReferenceAlias Property Troop119  Auto  
ReferenceAlias Property Troop120  Auto  

ReferenceAlias Property Troop201  Auto  
ReferenceAlias Property Troop202  Auto  
ReferenceAlias Property Troop203  Auto  
ReferenceAlias Property Troop204  Auto  
ReferenceAlias Property Troop205  Auto  
ReferenceAlias Property Troop206  Auto  
ReferenceAlias Property Troop207  Auto  
ReferenceAlias Property Troop208  Auto  
ReferenceAlias Property Troop209  Auto  
ReferenceAlias Property Troop210  Auto  
ReferenceAlias Property Troop211  Auto  
ReferenceAlias Property Troop212  Auto  
ReferenceAlias Property Troop213  Auto  
ReferenceAlias Property Troop214  Auto  
ReferenceAlias Property Troop215  Auto  
ReferenceAlias Property Troop216  Auto  
ReferenceAlias Property Troop217  Auto  
ReferenceAlias Property Troop218  Auto  
ReferenceAlias Property Troop219  Auto  
ReferenceAlias Property Troop220  Auto  

ReferenceAlias Property Troop301  Auto  
ReferenceAlias Property Troop302  Auto  
ReferenceAlias Property Troop303  Auto  
ReferenceAlias Property Troop304  Auto  
ReferenceAlias Property Troop305  Auto  
ReferenceAlias Property Troop306  Auto  
ReferenceAlias Property Troop307  Auto  
ReferenceAlias Property Troop308  Auto  
ReferenceAlias Property Troop309  Auto  
ReferenceAlias Property Troop310  Auto  
ReferenceAlias Property Troop311  Auto  
ReferenceAlias Property Troop312  Auto  
ReferenceAlias Property Troop313  Auto  
ReferenceAlias Property Troop314  Auto  
ReferenceAlias Property Troop315  Auto  
ReferenceAlias Property Troop316  Auto  
ReferenceAlias Property Troop317  Auto  
ReferenceAlias Property Troop318  Auto  
ReferenceAlias Property Troop319  Auto  
ReferenceAlias Property Troop320  Auto  

ReferenceAlias Property Troop401  Auto  
ReferenceAlias Property Troop402  Auto  
ReferenceAlias Property Troop403  Auto  
ReferenceAlias Property Troop404  Auto  
ReferenceAlias Property Troop405  Auto  
ReferenceAlias Property Troop406  Auto  
ReferenceAlias Property Troop407  Auto  
ReferenceAlias Property Troop408  Auto  
ReferenceAlias Property Troop409  Auto  
ReferenceAlias Property Troop410  Auto  
ReferenceAlias Property Troop411  Auto  
ReferenceAlias Property Troop412  Auto  
ReferenceAlias Property Troop413  Auto  
ReferenceAlias Property Troop414  Auto  
ReferenceAlias Property Troop415  Auto  
ReferenceAlias Property Troop416  Auto  
ReferenceAlias Property Troop417  Auto  
ReferenceAlias Property Troop418  Auto  
ReferenceAlias Property Troop419  Auto  
ReferenceAlias Property Troop420  Auto  

ReferenceAlias Property Troop501  Auto  
ReferenceAlias Property Troop502  Auto  
ReferenceAlias Property Troop503  Auto  
ReferenceAlias Property Troop504  Auto  
ReferenceAlias Property Troop505  Auto  
ReferenceAlias Property Troop506  Auto  
ReferenceAlias Property Troop507  Auto  
ReferenceAlias Property Troop508  Auto  
ReferenceAlias Property Troop509  Auto  
ReferenceAlias Property Troop510  Auto  
ReferenceAlias Property Troop511  Auto  
ReferenceAlias Property Troop512  Auto  
ReferenceAlias Property Troop513  Auto  
ReferenceAlias Property Troop514  Auto  
ReferenceAlias Property Troop515  Auto  
ReferenceAlias Property Troop516  Auto  
ReferenceAlias Property Troop517  Auto  
ReferenceAlias Property Troop518  Auto  
ReferenceAlias Property Troop519  Auto  
ReferenceAlias Property Troop520  Auto  

ReferenceAlias Property Troop601  Auto  
ReferenceAlias Property Troop602  Auto  
ReferenceAlias Property Troop603  Auto  
ReferenceAlias Property Troop604  Auto  
ReferenceAlias Property Troop605  Auto  
ReferenceAlias Property Troop606  Auto  
ReferenceAlias Property Troop607  Auto  
ReferenceAlias Property Troop608  Auto  
ReferenceAlias Property Troop609  Auto  
ReferenceAlias Property Troop610  Auto  
ReferenceAlias Property Troop611  Auto  
ReferenceAlias Property Troop612  Auto  
ReferenceAlias Property Troop613  Auto  
ReferenceAlias Property Troop614  Auto  
ReferenceAlias Property Troop615  Auto  
ReferenceAlias Property Troop616  Auto  
ReferenceAlias Property Troop617  Auto  
ReferenceAlias Property Troop618  Auto  
ReferenceAlias Property Troop619  Auto  
ReferenceAlias Property Troop620  Auto  

ReferenceAlias Property Troop701  Auto  
ReferenceAlias Property Troop702  Auto  
ReferenceAlias Property Troop703  Auto  
ReferenceAlias Property Troop704  Auto  
ReferenceAlias Property Troop705  Auto  
ReferenceAlias Property Troop706  Auto  
ReferenceAlias Property Troop707  Auto  
ReferenceAlias Property Troop708  Auto  
ReferenceAlias Property Troop709  Auto  
ReferenceAlias Property Troop710  Auto  
ReferenceAlias Property Troop711  Auto  
ReferenceAlias Property Troop712  Auto  
ReferenceAlias Property Troop713  Auto  
ReferenceAlias Property Troop714  Auto  
ReferenceAlias Property Troop715  Auto  
ReferenceAlias Property Troop716  Auto  
ReferenceAlias Property Troop717  Auto  
ReferenceAlias Property Troop718  Auto  
ReferenceAlias Property Troop719  Auto  
ReferenceAlias Property Troop720  Auto  

ReferenceAlias Property Troop801  Auto  
ReferenceAlias Property Troop802  Auto  
ReferenceAlias Property Troop803  Auto  
ReferenceAlias Property Troop804  Auto  
ReferenceAlias Property Troop805  Auto  
ReferenceAlias Property Troop806  Auto  
ReferenceAlias Property Troop807  Auto  
ReferenceAlias Property Troop808  Auto  
ReferenceAlias Property Troop809  Auto  
ReferenceAlias Property Troop810  Auto  
ReferenceAlias Property Troop811  Auto  
ReferenceAlias Property Troop812  Auto  
ReferenceAlias Property Troop813  Auto  
ReferenceAlias Property Troop814  Auto  
ReferenceAlias Property Troop815  Auto  
ReferenceAlias Property Troop816  Auto  
ReferenceAlias Property Troop817  Auto  
ReferenceAlias Property Troop818  Auto  
ReferenceAlias Property Troop819  Auto  
ReferenceAlias Property Troop820  Auto  

ReferenceAlias Property Troop901  Auto  
ReferenceAlias Property Troop902  Auto  
ReferenceAlias Property Troop903  Auto  
ReferenceAlias Property Troop904  Auto  
ReferenceAlias Property Troop905  Auto  
ReferenceAlias Property Troop906  Auto  
ReferenceAlias Property Troop907  Auto  
ReferenceAlias Property Troop908  Auto  
ReferenceAlias Property Troop909  Auto  
ReferenceAlias Property Troop910  Auto  
ReferenceAlias Property Troop911  Auto  
ReferenceAlias Property Troop912  Auto  
ReferenceAlias Property Troop913  Auto  
ReferenceAlias Property Troop914  Auto  
ReferenceAlias Property Troop915  Auto  
ReferenceAlias Property Troop916  Auto  
ReferenceAlias Property Troop917  Auto  
ReferenceAlias Property Troop918  Auto  
ReferenceAlias Property Troop919  Auto  
ReferenceAlias Property Troop920  Auto  

ReferenceAlias Property Troop1001  Auto  
ReferenceAlias Property Troop1002  Auto  
ReferenceAlias Property Troop1003  Auto  
ReferenceAlias Property Troop1004  Auto  
ReferenceAlias Property Troop1005  Auto  
ReferenceAlias Property Troop1006  Auto  
ReferenceAlias Property Troop1007  Auto  
ReferenceAlias Property Troop1008  Auto  
ReferenceAlias Property Troop1009  Auto  
ReferenceAlias Property Troop1010  Auto  
ReferenceAlias Property Troop1011  Auto  
ReferenceAlias Property Troop1012  Auto  
ReferenceAlias Property Troop1013  Auto  
ReferenceAlias Property Troop1014  Auto  
ReferenceAlias Property Troop1015  Auto  
ReferenceAlias Property Troop1016  Auto  
ReferenceAlias Property Troop1017  Auto  
ReferenceAlias Property Troop1018  Auto  
ReferenceAlias Property Troop1019  Auto  
ReferenceAlias Property Troop1020  Auto  

GlobalVariable Property Army1  Auto  
GlobalVariable Property Army2  Auto  
GlobalVariable Property Army3  Auto  
GlobalVariable Property Army4  Auto  
GlobalVariable Property Army5  Auto  
GlobalVariable Property Army6  Auto  
GlobalVariable Property Army7  Auto  
GlobalVariable Property Army8  Auto  
GlobalVariable Property Army9  Auto  
GlobalVariable Property Army10  Auto  
GlobalVariable Property ArmyPersonal  Auto  

GlobalVariable Property Army1Count  Auto  
GlobalVariable Property Army2Count  Auto  
GlobalVariable Property Army3Count  Auto  
GlobalVariable Property Army4Count  Auto  
GlobalVariable Property Army5Count  Auto  
GlobalVariable Property Army6Count  Auto  
GlobalVariable Property Army7Count  Auto  
GlobalVariable Property Army8Count  Auto  
GlobalVariable Property Army9Count  Auto  
GlobalVariable Property Army10Count  Auto  
GlobalVariable Property ArmyPersonalCount  Auto  

GlobalVariable Property AllowRecruitment  Auto  

ReferenceAlias Property NameChanger  Auto  
