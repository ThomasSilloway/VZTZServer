ALTER TABLE `character_data`
	ADD COLUMN `pvp_current_death_streak` INT DEFAULT 0 AFTER `deleted_at`;
	
ALTER TABLE `character_data`
	ADD COLUMN `pvp_infamy` INT DEFAULT 0 AFTER `pvp_current_death_streak`;
	
ALTER TABLE `character_data`
	ADD COLUMN `pvp_vitality` INT DEFAULT 0 AFTER `pvp_infamy`;

-- Update to velious only
UPDATE rule_values
SET rule_value = 2
WHERE rule_name = 'Expansion:CurrentExpansion';

-- Turn off tutorial
UPDATE rule_values SET rule_value=2 WHERE ruleset_id=1 AND rule_name="World:ExpansionSettings" LIMIT 1;
UPDATE rule_values SET rule_value='false' WHERE ruleset_id=1 AND rule_name="World:UseClientBasedExpansionSettings" LIMIT 1;
UPDATE rule_values SET rule_value=0 WHERE ruleset_id=1 AND rule_name="World:EnableTutorialButton" LIMIT 1;
UPDATE rule_values SET rule_value=0 WHERE ruleset_id=1 AND rule_name="World:TutorialZoneID" LIMIT 1;

-- Try to make starting zone the race zones - was -1 before
UPDATE start_zones
SET min_expansion = 0, max_expansion = 0;


-- Fix errors

ALTER TABLE `character_buffs`
	ADD COLUMN `caster_charid` INT DEFAULT 0;

ALTER TABLE `character_buffs`
	ADD COLUMN `client` INT DEFAULT 0;
	
ALTER TABLE `character_buffs`
	ADD COLUMN `last_effect` INT DEFAULT 0;	
	
ALTER TABLE `character_buffs`
	ADD COLUMN `pvp` INT DEFAULT 1;	
	
CREATE TABLE `character_pvp_entries` (
	`victim_name` VARCHAR(64) NULL,
	`victim_level` INT DEFAULT 0,
	`victim_race` INT DEFAULT 0,
	`victim_class` INT DEFAULT 0,
	`killer_id` INT DEFAULT 0,
	`victim_id` INT DEFAULT 0,
	`zone` INT DEFAULT 0,
	`timestamp` DATETIME DEFAULT 0,
	`points` INT DEFAULT 0
);
