create database dota;

use dota;

DELIMITER //

create table primary_attribute_count (
  attribute varchar(50),
  occurences int,
  primary key (attribute)
);

insert into primary_attribute_count values('agi', 0);
insert into primary_attribute_count values('int', 0);
insert into primary_attribute_count values('str', 0);

create table attack_type_count (
  attack_type varchar(50),
  occurences int,
  primary key(attack_type)
);

insert into attack_type_count values('Melee', 0);
insert into attack_type_count values('Ranged', 0);

create table heroes (
  id int,
  name varchar(50),
  primary_attribute varchar(50),
  attack_type varchar(50),
  primary key (id)
);

create trigger primary_attribute_frequency
before insert on heroes
for each row
begin
  update primary_attribute_count set occurences = occurences + 1
    where attribute = NEW.primary_attribute;
end;

create trigger attack_type_frequency
before insert on heroes
for each row
begin
  update attack_type_count set occurences = occurences + 1
    where attack_type = NEW.attack_type;
end;

insert into heroes values (1, 'Anti-Mage', 'agi', 'Melee');
insert into heroes values (2, 'Axe', 'str', 'Melee');
insert into heroes values (3, 'Bane', 'int', 'Ranged');
insert into heroes values (4, 'Bloodseeker', 'agi', 'Melee');
insert into heroes values (5, 'Crystal Maiden', 'int', 'Ranged');
insert into heroes values (6, 'Drow Ranger', 'agi', 'Ranged');
insert into heroes values (7, 'Earthshaker', 'str', 'Melee');
insert into heroes values (8, 'Juggernaut', 'agi', 'Melee');
insert into heroes values (9, 'Mirana', 'agi', 'Ranged');
insert into heroes values (10, 'Morphling', 'agi', 'Ranged');
insert into heroes values (11, 'Shadow Fiend', 'agi', 'Ranged');
insert into heroes values (12, 'Phantom Lancer', 'agi', 'Melee');
insert into heroes values (13, 'Puck', 'int', 'Ranged');
insert into heroes values (14, 'Pudge', 'str', 'Melee');
insert into heroes values (15, 'Razor', 'agi', 'Ranged');
insert into heroes values (16, 'Sand King', 'str', 'Melee');
insert into heroes values (17, 'Storm Spirit', 'int', 'Ranged');
insert into heroes values (18, 'Sven', 'str', 'Melee');
insert into heroes values (19, 'Tiny', 'str', 'Melee');
insert into heroes values (20, 'Vengeful Spirit', 'agi', 'Ranged');
insert into heroes values (21, 'Windranger', 'int', 'Ranged');
insert into heroes values (22, 'Zeus', 'int', 'Ranged');
insert into heroes values (23, 'Kunkka', 'str', 'Melee');
insert into heroes values (25, 'Lina', 'int', 'Ranged');
insert into heroes values (26, 'Lion', 'int', 'Ranged');
insert into heroes values (27, 'Shadow Shaman', 'int', 'Ranged');
insert into heroes values (28, 'Slardar', 'str', 'Melee');
insert into heroes values (29, 'Tidehunter', 'str', 'Melee');
insert into heroes values (30, 'Witch Doctor', 'int', 'Ranged');
insert into heroes values (31, 'Lich', 'int', 'Ranged');
insert into heroes values (32, 'Riki', 'agi', 'Melee');
insert into heroes values (33, 'Enigma', 'int', 'Ranged');
insert into heroes values (34, 'Tinker', 'int', 'Ranged');
insert into heroes values (35, 'Sniper', 'agi', 'Ranged');
insert into heroes values (36, 'Necrophos', 'int', 'Ranged');
insert into heroes values (37, 'Warlock', 'int', 'Ranged');
insert into heroes values (38, 'Beastmaster', 'str', 'Melee');
insert into heroes values (39, 'Queen of Pain', 'int', 'Ranged');
insert into heroes values (40, 'Venomancer', 'agi', 'Ranged');
insert into heroes values (41, 'Faceless Void', 'agi', 'Melee');
insert into heroes values (42, 'Wraith King', 'str', 'Melee');
insert into heroes values (43, 'Death Prophet', 'int', 'Ranged');
insert into heroes values (44, 'Phantom Assassin', 'agi', 'Melee');
insert into heroes values (45, 'Pugna', 'int', 'Ranged');
insert into heroes values (46, 'Templar Assassin', 'agi', 'Ranged');
insert into heroes values (47, 'Viper', 'agi', 'Ranged');
insert into heroes values (48, 'Luna', 'agi', 'Ranged');
insert into heroes values (49, 'Dragon Knight', 'str', 'Melee');
insert into heroes values (50, 'Dazzle', 'int', 'Ranged');
insert into heroes values (51, 'Clockwerk', 'str', 'Melee');
insert into heroes values (52, 'Leshrac', 'int', 'Ranged');
insert into heroes values (53, 'Nature''s Prophet', 'int', 'Ranged');
insert into heroes values (54, 'Lifestealer', 'str', 'Melee');
insert into heroes values (55, 'Dark Seer', 'int', 'Melee');
insert into heroes values (56, 'Clinkz', 'agi', 'Ranged');
insert into heroes values (57, 'Omniknight', 'str', 'Melee');
insert into heroes values (58, 'Enchantress', 'int', 'Ranged');
insert into heroes values (59, 'Huskar', 'str', 'Ranged');
insert into heroes values (60, 'Night Stalker', 'str', 'Melee');
insert into heroes values (61, 'Broodmother', 'agi', 'Melee');
insert into heroes values (62, 'Bounty Hunter', 'agi', 'Melee');
insert into heroes values (63, 'Weaver', 'agi', 'Ranged');
insert into heroes values (64, 'Jakiro', 'int', 'Ranged');
insert into heroes values (65, 'Batrider', 'int', 'Ranged');
insert into heroes values (66, 'Chen', 'int', 'Ranged');
insert into heroes values (67, 'Spectre', 'agi', 'Melee');
insert into heroes values (68, 'Ancient Apparition', 'int', 'Ranged');
insert into heroes values (69, 'Doom', 'str', 'Melee');
insert into heroes values (70, 'Ursa', 'agi', 'Melee');
insert into heroes values (71, 'Spirit Breaker', 'str', 'Melee');
insert into heroes values (72, 'Gyrocopter', 'agi', 'Ranged');
insert into heroes values (73, 'Alchemist', 'str', 'Melee');
insert into heroes values (74, 'Invoker', 'int', 'Ranged');
insert into heroes values (75, 'Silencer', 'int', 'Ranged');
insert into heroes values (76, 'Outworld Devourer', 'int', 'Ranged');
insert into heroes values (77, 'Lycan', 'str', 'Melee');
insert into heroes values (78, 'Brewmaster', 'str', 'Melee');
insert into heroes values (79, 'Shadow Demon', 'int', 'Ranged');
insert into heroes values (80, 'Lone Druid', 'agi', 'Ranged');
insert into heroes values (81, 'Chaos Knight', 'str', 'Melee');
insert into heroes values (82, 'Meepo', 'agi', 'Melee');
insert into heroes values (83, 'Treant Protector', 'str', 'Melee');
insert into heroes values (84, 'Ogre Magi', 'int', 'Melee');
insert into heroes values (85, 'Undying', 'str', 'Melee');
insert into heroes values (86, 'Rubick', 'int', 'Ranged');
insert into heroes values (87, 'Disruptor', 'int', 'Ranged');
insert into heroes values (88, 'Nyx Assassin', 'agi', 'Melee');
insert into heroes values (89, 'Naga Siren', 'agi', 'Melee');
insert into heroes values (90, 'Keeper of the Light', 'int', 'Ranged');
insert into heroes values (91, 'Io', 'str', 'Ranged');
insert into heroes values (92, 'Visage', 'int', 'Ranged');
insert into heroes values (93, 'Slark', 'agi', 'Melee');
insert into heroes values (94, 'Medusa', 'agi', 'Ranged');
insert into heroes values (95, 'Troll Warlord', 'agi', 'Ranged');
insert into heroes values (96, 'Centaur Warrunner', 'str', 'Melee');
insert into heroes values (97, 'Magnus', 'str', 'Melee');
insert into heroes values (98, 'Timbersaw', 'str', 'Melee');
insert into heroes values (99, 'Bristleback', 'str', 'Melee');
insert into heroes values (100, 'Tusk', 'str', 'Melee');
insert into heroes values (101, 'Skywrath Mage', 'int', 'Ranged');
insert into heroes values (102, 'Abaddon', 'str', 'Melee');
insert into heroes values (103, 'Elder Titan', 'str', 'Melee');
insert into heroes values (104, 'Legion Commander', 'str', 'Melee');
insert into heroes values (105, 'Techies', 'int', 'Ranged');
insert into heroes values (106, 'Ember Spirit', 'agi', 'Melee');
insert into heroes values (107, 'Earth Spirit', 'str', 'Melee');
insert into heroes values (108, 'Underlord', 'str', 'Melee');
insert into heroes values (109, 'Terrorblade', 'agi', 'Melee');
insert into heroes values (110, 'Phoenix', 'str', 'Ranged');
insert into heroes values (111, 'Oracle', 'int', 'Ranged');
insert into heroes values (112, 'Winter Wyvern', 'int', 'Ranged');
insert into heroes values (113, 'Arc Warden', 'agi', 'Ranged');
insert into heroes values (114, 'Monkey King', 'agi', 'Melee');
insert into heroes values (119, 'Dark Willow', 'int', 'Ranged');
insert into heroes values (120, 'Pangolier', 'agi', 'Melee');
insert into heroes values (121, 'Grimstroke', 'int', 'Ranged');
insert into heroes values (126, 'Void Spirit', 'int', 'Melee');
insert into heroes values (128, 'Snapfire', 'str', 'Ranged');
insert into heroes values (129, 'Mars', 'str', 'Melee');

create table hero_stats (
  id int,
  attack_range int,
  base_agi int,
  base_armor int,
  base_health int,
  base_int int,
  base_mana int,
  base_mana_regen int,
  base_str int,
  int_gain float,
  agi_gain float,
  str_gain float,
  primary key (id)
);

insert into hero_stats values (1, 150, 24, -1, 200, 12, 75, 0, 23, 1.8, 3, 1.3);
insert into hero_stats values (2, 150, 20, -1, 200, 18, 75, 0, 25, 1.6, 2.2, 3.4);
insert into hero_stats values (3, 400, 23, 1, 200, 23, 75, 0, 23, 2.6, 2.6, 2.6);
insert into hero_stats values (4, 150, 22, 2, 200, 18, 75, 0, 24, 1.7, 3.4, 2.7);
insert into hero_stats values (5, 600, 16, -1, 200, 14, 75, 1, 18, 3.3, 1.6, 2.2);
insert into hero_stats values (6, 625, 20, -3, 200, 15, 75, 0, 18, 1.4, 2.9, 1.9);
insert into hero_stats values (7, 150, 12, 2, 200, 16, 75, 0, 22, 1.8, 1.4, 3.7);
insert into hero_stats values (8, 150, 34, 0, 200, 14, 75, 0, 20, 1.4, 2.8, 2.2);
insert into hero_stats values (9, 630, 18, -1, 200, 22, 75, 0.4, 18, 1.9, 3.7, 2.2);
insert into hero_stats values (10, 350, 24, -2, 200, 15, 75, 0, 22, 1.5, 4.3, 3);
insert into hero_stats values (11, 500, 20, 0, 200, 18, 75, 0.3, 19, 2.2, 3.5, 2.7);
insert into hero_stats values (12, 150, 29, 0, 200, 19, 75, 0, 19, 2, 3.2, 2.2);
insert into hero_stats values (13, 550, 22, -3, 200, 23, 75, 0, 17, 3.5, 2.2, 2.4);
insert into hero_stats values (14, 150, 14, -2, 200, 16, 75, 0, 25, 1.5, 1.5, 4);
insert into hero_stats values (15, 475, 22, -1, 200, 21, 75, 0, 22, 1.8, 2.1, 2.6);
insert into hero_stats values (16, 150, 19, -1, 200, 19, 75, 0, 22, 1.8, 1.8, 3);
insert into hero_stats values (17, 480, 22, 2, 200, 23, 75, 0, 21, 3.9, 1.5, 2);
insert into hero_stats values (18, 150, 21, 1, 200, 16, 75, 0, 22, 1.3, 2, 3.2);
insert into hero_stats values (19, 150, 0, 0, 200, 17, 75, 0, 28, 2.2, 0, 4.1);
insert into hero_stats values (20, 400, 20, 0, 200, 17, 75, 0, 19, 1.5, 3.8, 2.4);
insert into hero_stats values (21, 600, 17, -1, 200, 18, 75, 0, 18, 3, 1.4, 3);
insert into hero_stats values (22, 380, 11, 1, 200, 22, 75, 0.25, 21, 3.3, 1.2, 2.1);
insert into hero_stats values (23, 150, 14, 1, 200, 18, 75, 0, 24, 1.5, 1.3, 3.8);
insert into hero_stats values (25, 670, 23, 1, 200, 30, 75, 0, 20, 3.7, 1.8, 2.4);
insert into hero_stats values (26, 600, 15, -1, 200, 18, 75, 0, 18, 3.5, 1.5, 2.2);
insert into hero_stats values (27, 400, 16, 1, 200, 19, 75, 0, 23, 3.5, 1.6, 2.3);
insert into hero_stats values (28, 150, 17, 3, 200, 15, 75, 0, 21, 1.5, 2.4, 3.6);
insert into hero_stats values (29, 150, 15, 0, 200, 16, 75, 0, 22, 1.7, 1.5, 3.5);
insert into hero_stats values (30, 600, 13, -1, 200, 22, 75, 0, 18, 3.3, 1.4, 2.3);
insert into hero_stats values (31, 550, 15, -1, 200, 24, 75, 0.75, 20, 4.1, 2, 2.1);
insert into hero_stats values (32, 150, 18, 3, 200, 14, 75, 0, 18, 1.3, 1.4, 2.4);
insert into hero_stats values (33, 500, 14, 2, 200, 16, 75, 0, 21, 3.6, 1, 2.5);
insert into hero_stats values (34, 500, 13, 2, 200, 30, 75, 0.75, 18, 3.3, 1.2, 2.5);
insert into hero_stats values (35, 550, 21, -1, 200, 15, 75, 0, 19, 2.6, 3.4, 1.7);
insert into hero_stats values (36, 500, 12, 1, 200, 21, 75, 0, 18, 2.9, 1.3, 2.8);
insert into hero_stats values (37, 600, 10, 1, 200, 25, 75, 0, 26, 3.1, 1, 3);
insert into hero_stats values (38, 150, 18, -1, 200, 16, 75, 0, 23, 1.9, 1.6, 2.9);
insert into hero_stats values (39, 550, 22, 0, 200, 25, 75, 0, 18, 2.9, 2.5, 2.3);
insert into hero_stats values (40, 450, 26, 0, 200, 19, 75, 0, 19, 1.8, 3.2, 2.1);
insert into hero_stats values (41, 150, 23, 0, 200, 15, 75, 0, 24, 1.5, 3, 2.4);
insert into hero_stats values (42, 150, 18, -1, 200, 18, 75, 0, 22, 1.6, 1.7, 3.2);
insert into hero_stats values (43, 600, 14, 0, 200, 24, 75, 0, 19, 3.5, 1.4, 3.1);
insert into hero_stats values (44, 150, 23, 1, 200, 15, 75, 0, 21, 1.4, 3.4, 2.2);
insert into hero_stats values (45, 630, 16, 0, 200, 24, 75, 0.5, 19, 5.2, 1.3, 2);
insert into hero_stats values (46, 140, 23, 1, 200, 20, 75, 0, 19, 2, 3.2, 2.4);
insert into hero_stats values (47, 575, 21, -2, 200, 15, 75, 0, 21, 1.8, 2.5, 2.4);
insert into hero_stats values (48, 330, 18, 0, 200, 18, 75, 0, 18, 1.9, 3.6, 2.2);
insert into hero_stats values (49, 150, 19, 0, 200, 18, 75, 0, 19, 1.7, 2, 3.6);
insert into hero_stats values (50, 550, 21, -1, 200, 25, 75, 0, 18, 3.7, 1.7, 2.5);
insert into hero_stats values (51, 150, 13, 0, 200, 18, 75, 0, 26, 1.5, 2.3, 3.7);
insert into hero_stats values (52, 600, 23, 0, 200, 22, 75, 0, 18, 3.5, 2.3, 2.3);
insert into hero_stats values (53, 600, 22, 2, 200, 23, 75, 0, 21, 3.7, 3.6, 2.6);
insert into hero_stats values (54, 150, 18, 1, 200, 15, 75, 0, 25, 1.8, 2.4, 2.4);
insert into hero_stats values (55, 150, 12, 3, 200, 21, 75, 0, 20, 3.1, 1.8, 3.1);
insert into hero_stats values (56, 625, 22, 0, 200, 18, 75, 0.25, 14, 1.7, 2.7, 2.2);
insert into hero_stats values (57, 150, 15, 2, 200, 15, 75, 0, 22, 1.8, 1.8, 3.6);
insert into hero_stats values (58, 575, 19, 1, 200, 22, 75, 0, 17, 3.6, 1.8, 1.7);
insert into hero_stats values (59, 400, 15, -1, 200, 18, 75, 0, 21, 1.5, 1.4, 3.4);
insert into hero_stats values (60, 150, 18, 2, 200, 13, 75, 0, 23, 1.6, 2.3, 3.2);
insert into hero_stats values (61, 150, 15, 0, 200, 18, 75, 0, 18, 2, 2.8, 2.8);
insert into hero_stats values (62, 150, 21, 3, 200, 19, 75, 0, 20, 2, 2.6, 2.5);
insert into hero_stats values (63, 425, 14, 0, 200, 13, 75, 0.4, 16, 1.8, 3.6, 2);
insert into hero_stats values (64, 400, 10, 1, 200, 26, 75, 0, 27, 3.2, 1.2, 3);
insert into hero_stats values (65, 375, 15, 0, 200, 22, 75, 0, 28, 2.9, 1.5, 2.9);
insert into hero_stats values (66, 650, 15, -1, 200, 19, 75, 0, 25, 3.2, 2.1, 2);
insert into hero_stats values (67, 150, 23, 0, 200, 16, 75, 0, 23, 1.9, 2.1, 2.5);
insert into hero_stats values (68, 675, 20, -1, 200, 23, 75, 0, 20, 3.4, 2.2, 1.9);
insert into hero_stats values (69, 175, 11, -1, 200, 15, 75, 0, 26, 2.1, 0.9, 4);
insert into hero_stats values (70, 150, 18, 1, 200, 16, 75, 0, 24, 1.5, 2.4, 2.8);
insert into hero_stats values (71, 150, 17, 2, 200, 14, 75, 0, 29, 1.8, 1.7, 3.1);
insert into hero_stats values (72, 365, 19, 2, 200, 19, 75, 0, 22, 2.1, 3.6, 2.3);
insert into hero_stats values (73, 150, 22, -1, 200, 25, 75, 0, 25, 1.8, 1.2, 2.4);
insert into hero_stats values (74, 600, 14, 0, 200, 15, 75, 0, 18, 4.6, 1.9, 2.4);
insert into hero_stats values (75, 600, 22, -1, 200, 25, 75, 0, 19, 2.9, 2.4, 2.7);
insert into hero_stats values (76, 450, 24, 1.5, 200, 30, 75, 0, 21, 4.2, 2, 2.9);
insert into hero_stats values (77, 150, 16, -1, 200, 19, 75, 0, 26, 1.4, 1, 3.4);
insert into hero_stats values (78, 150, 22, -2, 200, 15, 75, 0, 23, 1.6, 2, 3.7);
insert into hero_stats values (79, 500, 18, 0, 200, 21, 75, 0, 23, 3.3, 2.2, 2.6);
insert into hero_stats values (80, 550, 20, -2, 200, 13, 75, 0, 18, 1.4, 2.8, 2.7);
insert into hero_stats values (81, 150, 14, 1, 200, 18, 75, 0, 22, 1.2, 1.4, 3.4);
insert into hero_stats values (82, 150, 24, 3, 200, 20, 75, 0, 24, 1.6, 1.8, 1.8);
insert into hero_stats values (83, 150, 15, -1, 200, 20, 75, 0.5, 25, 1.8, 2, 3.7);
insert into hero_stats values (84, 150, 14, 6, 200, 15, 75, 0, 23, 2.5, 1.9, 3.5);
insert into hero_stats values (85, 150, 10, 1, 200, 27, 75, 0, 22, 2.8, 0.8, 2.8);
insert into hero_stats values (86, 550, 23, 0, 200, 25, 75, 0, 21, 3.1, 2.5, 2);
insert into hero_stats values (87, 625, 15, 0, 200, 20, 75, 0, 21, 2.9, 1.4, 2.4);
insert into hero_stats values (88, 150, 19, 1, 200, 18, 75, 0, 18, 2.1, 2.5, 2.5);
insert into hero_stats values (89, 150, 21, 3, 200, 21, 75, 0, 22, 2, 3.5, 2.8);
insert into hero_stats values (90, 600, 15, -1, 200, 23, 75, 0, 16, 3.2, 1.6, 2.3);
insert into hero_stats values (91, 500, 14, 1, 200, 23, 75, 0, 17, 1.7, 1.6, 3);
insert into hero_stats values (92, 600, 11, -2, 200, 22, 75, 0, 22, 2.9, 1.3, 2.8);
insert into hero_stats values (93, 150, 21, 0, 200, 16, 75, 0, 21, 1.7, 1.7, 1.9);
insert into hero_stats values (94, 600, 22, -1, 200, 19, 75, 0, 15, 3.4, 3.6, 1.5);
insert into hero_stats values (95, 500, 21, -1, 200, 13, 75, 0, 21, 1, 3.3, 2.5);
insert into hero_stats values (96, 150, 15, 0, 200, 15, 75, 0, 27, 1.6, 1, 4.6);
insert into hero_stats values (97, 150, 15, 1, 200, 19, 75, 0, 25, 1.7, 2.5, 3.5);
insert into hero_stats values (98, 150, 16, -1, 200, 23, 75, 0.25, 23, 2.7, 1.6, 3.2);
insert into hero_stats values (99, 150, 17, 1, 200, 14, 75, 0, 22, 2.8, 1.8, 2.9);
insert into hero_stats values (100, 150, 23, 0, 200, 18, 75, 0, 23, 1.7, 2.1, 3.9);
insert into hero_stats values (101, 625, 13, -2, 200, 25, 75, 0, 21, 4.1, 0.8, 2);
insert into hero_stats values (102, 150, 23, -1, 200, 18, 75, 0, 23, 2, 1.5, 3);
insert into hero_stats values (103, 150, 14, 0, 200, 23, 75, 0, 24, 1.6, 1.8, 3);
insert into hero_stats values (104, 150, 18, 0, 200, 20, 75, 0, 26, 2.2, 1.7, 3.3);
insert into hero_stats values (105, 700, 14, 5, 200, 25, 75, 1, 19, 3.3, 1.3, 2.5);
insert into hero_stats values (106, 150, 22, -1, 200, 20, 75, 0, 21, 1.8, 2.6, 2.6);
insert into hero_stats values (107, 150, 17, 0, 200, 20, 75, 0, 21, 2.1, 1.5, 4.4);
insert into hero_stats values (108, 150, 12, 3, 200, 17, 75, 0, 25, 2.3, 1.6, 3.3);
insert into hero_stats values (109, 150, 22, 7, 200, 19, 75, 0, 15, 1.6, 4.8, 1.7);
insert into hero_stats values (110, 500, 12, -1, 200, 18, 75, 0, 23, 1.8, 1.3, 3.7);
insert into hero_stats values (111, 620, 15, 0, 200, 26, 75, 0.5, 20, 4, 1.7, 2.4);
insert into hero_stats values (112, 425, 16, -1, 200, 26, 75, 0, 26, 3.6, 1.9, 2.6);
insert into hero_stats values (113, 625, 15, -2, 200, 24, 75, 0, 25, 2.6, 2.4, 3);
insert into hero_stats values (114, 300, 22, -2, 200, 20, 75, 0, 19, 1.8, 3.7, 2.8);
insert into hero_stats values (119, 475, 18, -1, 200, 18, 75, 0, 20, 3.5, 1.6, 2);
insert into hero_stats values (120, 150, 18, 1, 200, 16, 75, 0, 17, 1.9, 3.2, 2.5);
insert into hero_stats values (121, 550, 18, 0, 200, 23, 75, 0, 21, 3.8, 1.9, 2.4);
insert into hero_stats values (126, 200, 19, -1, 200, 24, 75, 0.6, 22, 3.1, 2.2, 2.6);
insert into hero_stats values (128, 500, 16, 1, 200, 18, 75, 0, 20, 2.2, 1.9, 3.3);
insert into hero_stats values (129, 250, 20, -1, 200, 17, 75, 0, 23, 1.4, 1.9, 3.2);


-- create procedure get_hero_stats(IN hero varchar(50))
-- begin
--   select
--     a.name,
--     a.attack_type,
--     a.primary_attribute,
--     b.attack_range,
--     b.base_agi,
--     b.base_armor,
--     b.base_health,
--     b.base_mana,
--     b.base_mana_regen,
--     b.base_str,
--     b.int_gain,
--     b.agi_gain,
--     b.str_gain
--   from
--     heroes a,
--     hero_stats b
--   where
--     (a.id = hero and b.id = hero) or (lower(hero) = lower(a.name) and a.id = b.id);
-- end //
-- DELIMITER ;

-- DELIMITER //
-- create function compute_winrate(hero varchar(50))
--   returns float
-- begin
--   declare total_wins int;
--   declare total_games int;
--   select
--     sum(wins)
--   into
--     total_wins
--   from
--     heroes a, matchups b
--   where
--     (a.id = hero and b.id = hero) or (lower(hero) = lower(a.name) and a.id = b.id);
--   select
--     sum(games)
--   into
--     total_games
--   from
--     heroes a, matchups b
--   where
--     (a.id = hero and b.id = hero) or (lower(hero) = lower(a.name) and a.id = b.id);
--   return (total_wins / total_games);
-- end;
-- //
-- DELIMITER ;

-- DELIMITER //
-- create procedure get_heroes_by_winrate()
-- begin
--   select
--     name, compute_winrate(id) as winrate
--   from
--     heroes
--   order by winrate desc
--   limit 10;
-- end //
-- DELIMITER ;