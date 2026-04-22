Scriptname CS_InfluenceScript extends Quest  

FormList Property CS_AllLocations Auto

Faction Property CS_SponsoredByPlayerFaction Auto

CS_EconomyUpdaterNewScript Property CS_EconomyUpdaterNew Auto

Function AddShopSponsor(Actor Merchant)
    int citynum = -1
    int i = 0
    while i < CS_AllLocations.GetSize() && citynum == -1
        if Merchant.IsInLocation(CS_AllLocations.GetAt(i) as Location)
            citynum = i
            ((CS_EconomyUpdaterNew.EconomyHoldUpdaters[citynum] as Quest) as CS_InfluenceHoldUpdaterScript).ShopsSponsoredByPlayer += 1
            Merchant.AddToFaction(CS_SponsoredByPlayerFaction)
        endif
        i += 1
    endwhile
EndFunction