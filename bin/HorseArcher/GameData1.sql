--------------------------------------------------------------
----	GameData1	------------------------------------------
--	Author: Sasabmeg										--
--	DateCreated: 8/26/2022 9:39:42 PM						--
--------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------
----	Notes:	----------------------------------------------------------------------------------------------------------
--	To make it not crash in case similar mods add same primary key values, all new rows are tried to be deleted first.	--
--	This does not ensure compatibility with other mods, but no/less crash. Bugs still could be a thing.					--
--------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------
--	Scythian special adjustment	for balance			--
------------------------------------------------------

update Units
set RangedCombat = 30, Maintenance= 1
where UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

--------------------------------------------------------------
--	Scythian Saka Horse Archer replaces common Horse Archer	--
--------------------------------------------------------------
delete from UnitReplaces where CivUniqueUnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER' and ReplacesUnitType = 'UNIT_HORSE_ARCHER';
INSERT INTO UnitReplaces (CivUniqueUnitType, ReplacesUnitType) VALUES ('UNIT_SCYTHIAN_HORSE_ARCHER', 'UNIT_HORSE_ARCHER');

----------------------------------------------
--	Ranged Cavalry can move after attack	--
----------------------------------------------
--delete from Types where Type = 'ABILITY_MOVE_AFTER_ATTACK' and Kind = 'KIND_ABILITY';
INSERT INTO Types (Type, Kind) VALUES ('ABILITY_MOVE_AFTER_ATTACK', 'KIND_ABILITY');

--delete from UnitAbilities where UnitAbilityType = 'ABILITY_MOVE_AFTER_ATTACK';
INSERT INTO UnitAbilities (UnitAbilityType, Name, Description, Inactive, ShowFloatTextWhenEarned, Permanent) 
VALUES ('ABILITY_MOVE_AFTER_ATTACK', 'LOC_ABILITY_MOVE_AFTER_ATTACK_NAME', 'LOC_ABILITY_MOVE_AFTER_ATTACK_DESCRIPTION', '0', '0', '1');

--delete from UnitAbilityModifiers where UnitAbilityType = 'ABILITY_MOVE_AFTER_ATTACK' and ModifierId = 'MOD_MOVE_AFTER_ATTACKING';
INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES ('ABILITY_MOVE_AFTER_ATTACK', 'MOD_MOVE_AFTER_ATTACKING');

--delete from TypeTags where Type = 'ABILITY_MOVE_AFTER_ATTACK' and Tag = 'CLASS_RANGED_CAVALRY';
INSERT INTO TypeTags (Type, Tag) VALUES ('ABILITY_MOVE_AFTER_ATTACK', 'CLASS_RANGED_CAVALRY');
