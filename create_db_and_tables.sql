CREATE DATABASE `lolmatchups` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE lolmatchups;

CREATE TABLE `champion` (
  `champion_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  PRIMARY KEY (`champion_id`),
  UNIQUE KEY `champion_id_UNIQUE` (`champion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `item` (
  `item_id` int(10) unsigned NOT NULL,
  `description` varchar(900) NOT NULL,
  `child_id1` int(11) DEFAULT NULL,
  `child_id2` int(11) DEFAULT NULL,
  `child_id3` int(11) DEFAULT NULL,
  `child_id4` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_id`),
  UNIQUE KEY `item_id_UNIQUE` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `mastery` (
  `mastery_id` int(10) unsigned NOT NULL,
  `name` varchar(20) NOT NULL,
  `description_rank1` varchar(200) NOT NULL,
  `description_rank2` varchar(100) DEFAULT NULL,
  `description_rank3` varchar(100) DEFAULT NULL,
  `description_rank4` varchar(100) DEFAULT NULL,
  `tree` varchar(10) NOT NULL,
  `index` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`mastery_id`),
  UNIQUE KEY `mastery_id_UNIQUE` (`mastery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player` (
  `summoner_id` int(10) unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `rank` varchar(45) DEFAULT NULL,
  `level` int(10) unsigned NOT NULL,
  `last_update_match_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`summoner_id`),
  UNIQUE KEY `summoner_id_UNIQUE` (`summoner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_champion_stat` (
  `summoner_id` int(10) unsigned NOT NULL,
  `champion_id` int(10) unsigned NOT NULL,
  `played_as_won` int(10) unsigned NOT NULL DEFAULT '0',
  `played_as_total` int(10) unsigned NOT NULL DEFAULT '0',
  `played_against_won` int(10) unsigned NOT NULL DEFAULT '0',
  `played_against_total` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`summoner_id`,`champion_id`),
  KEY `fk_player_champion_id_idx` (`champion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_items` (
  `matchup_id` int(10) unsigned NOT NULL,
  `item_id1` int(10) unsigned DEFAULT NULL,
  `item_id2` int(10) unsigned DEFAULT NULL,
  `item_id3` int(10) unsigned DEFAULT NULL,
  `item_id4` int(10) unsigned DEFAULT NULL,
  `item_id5` int(10) unsigned DEFAULT NULL,
  `item_id6` int(10) unsigned DEFAULT NULL,
  `item_id7` int(10) unsigned DEFAULT NULL,
  `won` int(10) unsigned NOT NULL DEFAULT '0',
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `player_mastery` (
  `matchup_id` int(10) unsigned NOT NULL,
  `offense_values` varchar(100) NOT NULL,
  `defense_values` varchar(100) NOT NULL,
  `utility_values` varchar(100) NOT NULL,
  PRIMARY KEY (`matchup_id`),
  UNIQUE KEY `matchup_id_UNIQUE` (`matchup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_matchup` (
  `matchup_id` int(10) unsigned NOT NULL,
  `summoner_id` int(10) unsigned NOT NULL,
  `player_champion_id` int(10) unsigned NOT NULL,
  `opponent_champion_id` int(10) unsigned NOT NULL,
  `lane` varchar(10) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `won` int(10) unsigned NOT NULL DEFAULT '0',
  `played` int(10) unsigned NOT NULL DEFAULT '0',
  `kills` int(10) unsigned NOT NULL DEFAULT '0',
  `deaths` int(10) unsigned NOT NULL DEFAULT '0',
  `assists` int(10) unsigned NOT NULL DEFAULT '0',
  `cumulative_creep_score` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchup_id`),
  UNIQUE KEY `matchup_id_UNIQUE` (`matchup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_rune_set` (
  `matchup_id` int(10) unsigned NOT NULL,
  `rune_id1` int(10) unsigned DEFAULT NULL,
  `rune_id2` int(10) unsigned DEFAULT NULL,
  `rune_id3` int(10) unsigned DEFAULT NULL,
  `rune_id4` int(10) unsigned DEFAULT NULL,
  `rune_id5` int(10) unsigned DEFAULT NULL,
  `rune_id6` int(10) unsigned DEFAULT NULL,
  `rune_id7` int(10) unsigned DEFAULT NULL,
  `rune_id8` int(10) unsigned DEFAULT NULL,
  `rune_id9` int(10) unsigned DEFAULT NULL,
  `rune_id10` int(10) unsigned DEFAULT NULL,
  `rune_id11` int(10) unsigned DEFAULT NULL,
  `rune_id12` int(10) unsigned DEFAULT NULL,
  `rune_id13` int(10) unsigned DEFAULT NULL,
  `rune_id14` int(10) unsigned DEFAULT NULL,
  `rune_id15` int(10) unsigned DEFAULT NULL,
  `rune_id16` int(10) unsigned DEFAULT NULL,
  `rune_id17` int(10) unsigned DEFAULT NULL,
  `rune_id18` int(10) unsigned DEFAULT NULL,
  `rune_id19` int(10) unsigned DEFAULT NULL,
  `rune_id20` int(10) unsigned DEFAULT NULL,
  `rune_id21` int(10) unsigned DEFAULT NULL,
  `rune_id22` int(10) unsigned DEFAULT NULL,
  `rune_id23` int(10) unsigned DEFAULT NULL,
  `rune_id24` int(10) unsigned DEFAULT NULL,
  `rune_id25` int(10) unsigned DEFAULT NULL,
  `rune_id26` int(10) unsigned DEFAULT NULL,
  `rune_id27` int(10) unsigned DEFAULT NULL,
  `rune_id28` int(10) unsigned DEFAULT NULL,
  `rune_id29` int(10) unsigned DEFAULT NULL,
  `rune_id30` int(10) unsigned DEFAULT NULL,
  `won` int(10) unsigned NOT NULL DEFAULT '0',
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `player_summoner_spells` (
  `matchup_id` int(10) unsigned NOT NULL,
  `ss_id1` int(10) unsigned NOT NULL,
  `ss_id2` int(10) unsigned NOT NULL,
  `won` int(10) unsigned NOT NULL DEFAULT '0',
  `used` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`matchup_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rune` (
  `rune_id` int(10) unsigned NOT NULL,
  `name` varchar(60) NOT NULL,
  `type` varchar(15) NOT NULL,
  `tier` int(10) unsigned NOT NULL,
  `effect` varchar(100) NOT NULL,
  PRIMARY KEY (`rune_id`),
  UNIQUE KEY `rune_id_UNIQUE` (`rune_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `summoner_spell` (
  `summoner_spell_id` int(10) unsigned NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` varchar(300) NOT NULL,
  `summoner_level` int(10) unsigned NOT NULL,
  PRIMARY KEY (`summoner_spell_id`),
  UNIQUE KEY `summoner_spell_id_UNIQUE` (`summoner_spell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
