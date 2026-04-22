# Conquest of Skyrim Bugfix History

This file tracks bugs identified during community maintenance work, what was changed, where it was changed, and why.

Updated: 2026-04-22

## Current Session Fixes

### 1. Commanders and armies gathering at one base/cave

Reported behavior:
- NPC armies and commanders tend to gather in one location for no clear reason.
- They can be ordered elsewhere, but drift back to a specific cave/base.

Likely cause:
- Commanders were losing their assigned holding data and falling back to generic "no order" or base behavior.
- The live source had `CommanderFindNewMarkers()` effectively commented out, so commanders were not being reassigned to a valid holding/banner marker when that data was missing.

Changed files:
- [source/scripts/CS_ClaimAreaFunctions.psc](./source/scripts/CS_ClaimAreaFunctions.psc)

Changed code:
- Restored logic inside `CommanderFindNewMarkers(int ArmyNum)`.
- The function now:
  - looks for an available player-controlled holding,
  - skips holdings already assigned to another commander,
  - assigns the commander's holding alias,
  - resolves and assigns the holding banner marker,
  - refreshes commander packages afterward.

Why:
- Without a real assigned holding and banner marker, commanders can collapse back to fallback AI/package behavior and pile up in one location.

Status:
- Source fix added.
- Needs compile and in-game validation.

### 2. War takeover objectives not telling the player where the problem is

Reported behavior:
- During army/region takeover, the game can tell the player to stop something without making it clear where that action is happening.

Likely cause:
- Invasion objective quests were being displayed, but there was not enough player-facing context about which hold was still contested and what part of it was still enemy-controlled.

Changed files:
- [source/scripts/CS_TMScript.psc](./source/scripts/CS_TMScript.psc)

Changed code:
- Updated `DisplayInvasionObjectives(int holdnum)`.
- Added `ShowInvasionObjectiveHint(...)`.
- The script now produces a clearer notification when a hold remains contested, naming the hold and summarizing what is still enemy-controlled:
  - field control,
  - city,
  - fort,
  - or that the player's camp in that hold was lost.

Why:
- The original objective state changes were too opaque for the player to act on reliably.

Status:
- Source fix added.
- Needs compile and in-game validation.

### 3. Government-role NPCs wandering back to base while following the player

Reported behavior:
- NPCs assigned to roles such as steward, housecarl/ASIC, court mage, or similar positions can wander off while following the player.

Likely cause:
- A government attach script was forcing role NPCs back to base on cell attach.
- This behavior can conflict directly with follower state.

Changed files:
- [source/scripts/CS_GovScriptFunctions.psc](./source/scripts/CS_GovScriptFunctions.psc)
- Related trigger path: [source/scripts/CS_MoveGovToBaseAttach.psc](./source/scripts/CS_MoveGovToBaseAttach.psc)

Changed code:
- Updated `MoveGovToBase()`.
- Added `ShouldStayWithPlayer(Actor GovActor)`.
- Steward, ASIC/housecarl, blacksmith, and court mage are no longer forcibly moved back to the base flag while they are the player's teammate.

Why:
- Following the player should take priority over base-return logic.
- The old behavior would cause role NPCs to peel off from the player when a new cell attached.

Status:
- Source fix added.
- Needs compile and in-game validation.

### 4. Custom troop and commander outfits drifting or disappearing over time

Reported behavior:
- Custom outfits assigned to troops and commanders can disappear over time.
- Armors from other mods can be lost or replaced after a while.

Likely cause:
- Several outfit refresh paths were rebuilding equipment too aggressively.
- Custom outfit branches in troop upgrade logic were using `RemoveAllItems()` before reapplying gear.
- Regiment outfit update logic was also resetting or reapplying outfits in ways that could overwrite tracked custom gear.

Changed files:
- [source/scripts/CS_UpgradeTroopsMenu.psc](./source/scripts/CS_UpgradeTroopsMenu.psc)
- [source/scripts/CS_ArmyRegimentTroopScript.psc](./source/scripts/CS_ArmyRegimentTroopScript.psc)
- [source/scripts/CS_ArmyMissionTroopScript.psc](./source/scripts/CS_ArmyMissionTroopScript.psc)

Changed code:
- Reworked custom-outfit branches in `UpgradeGuard()` and `UpgradeTroop()` so they preserve inventory and re-equip missing custom outfit pieces instead of calling `RemoveAllItems()`.
- Added helper functions to check whether all tracked outfit forms are still present and to restore/equip only the missing pieces.
- Changed regiment troop update logic so custom-outfit troops are not hard-reset during outfit refresh.
- Changed regiment/mission troop outfit application so `SetOutfit()` is skipped for custom-outfit troops during these refresh paths, reducing long-term drift.

Why:
- Custom outfits should behave like persistent tracked equipment, not disposable state that gets wiped and rebuilt.
- `RemoveAllItems()` and repeated full outfit resets are hostile to mod-added armor and to any custom loadout the system is supposed to preserve.

Status:
- Source fix added.
- Needs compile and in-game validation.

Note:
- This fix is strongest for outfits managed through the mod's own custom-outfit system.
- If armor is manually added outside the mod's tracked custom outfit lists, other refresh systems may still overwrite it later.

## Notes and Remaining Risk

### Plugin-side AI/package risk

Some role-holder scripts are nearly empty:
- [source/scripts/CS_StewardHoldScript.psc](./source/scripts/CS_StewardHoldScript.psc)
- [source/scripts/CS_HousecarlScript.psc](./source/scripts/CS_HousecarlScript.psc)
- [source/scripts/CS_CourtMageHoldScript.psc](./source/scripts/CS_CourtMageHoldScript.psc)

This suggests some role behavior may still be controlled primarily by quest/package data inside `conquerskyrim.esp`, not just by Papyrus scripts.

Meaning:
- The follower fix above should reduce forced returns to base caused by script logic.
- If role NPCs still wander after compilation, the next place to inspect will be AI packages and quest alias package stacks in the plugin itself.

## Compile Targets

These are the scripts currently changed and expected to be compiled:
- `source/scripts/CS_ClaimAreaFunctions.psc`
- `source/scripts/CS_TMScript.psc`
- `source/scripts/CS_GovScriptFunctions.psc`

## Workflow Note

Papyrus source is expected under:
- `Conquest of Skyrim Current\\source\\scripts`

Compiler path provided for future work:
- `D:\\repository\\2026\\doticu-npc-party\\tools\\Papyrus`
