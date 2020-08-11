-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Май 03 2020 г., 22:47
-- Версия сервера: 5.7.23-24
-- Версия PHP: 7.3.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `u0831230_eussi`
--

-- --------------------------------------------------------

--
-- Структура таблицы `acccomments`
--

CREATE TABLE `acccomments` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `commentID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `isSpam` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
CREATE TABLE `encoded` (
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `accounts`
--

CREATE TABLE `accounts` (
  `coins` int(11) NOT NULL,
  `userName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `accountID` int(11) NOT NULL,
  `saveData` longtext COLLATE utf8_unicode_ci NOT NULL,
  `isAdmin` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `friends` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `blockedBy` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `blocked` varchar(1024) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `mS` int(11) NOT NULL DEFAULT '0',
  `frS` int(11) NOT NULL DEFAULT '0',
  `cS` int(11) NOT NULL DEFAULT '0',
  `youtubeurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `twitch` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `registerDate` int(11) NOT NULL DEFAULT '0',
  `friendsCount` int(11) NOT NULL DEFAULT '0',
  `saveKey` blob NOT NULL,
  `discordID` bigint(20) NOT NULL DEFAULT '0',
  `discordLinkReq` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `actions`
--

CREATE TABLE `actions` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `value3` int(11) NOT NULL DEFAULT '0',
  `value4` int(11) NOT NULL DEFAULT '0',
  `value5` int(11) NOT NULL DEFAULT '0',
  `value6` int(11) NOT NULL DEFAULT '0',
  `account` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------
CREATE TABLE `exec` ( `date` TEXT NOT NULL ) ENGINE = InnoDB; 
CREATE TABLE `exec2` ( `date` TEXT NOT NULL ) ENGINE = InnoDB; 
CREATE TABLE `sonIP` ( `IP` TEXT NOT NULL ) ENGINE = InnoDB; 

--
-- Структура таблицы `bannedips`
--

CREATE TABLE `bannedips` (
  `IP` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `blocks`
--

CREATE TABLE `blocks` (
  `ID` int(11) NOT NULL,
  `person1` int(11) NOT NULL,
  `person2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cl`
--

CREATE TABLE `cl` (
  `IP` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `clIP` (
  `IP` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `comments`
--

CREATE TABLE `comments` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `secret` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `levelID` int(11) NOT NULL,
  `commentID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `likes` int(11) NOT NULL DEFAULT '0',
  `percent` int(11) NOT NULL DEFAULT '0',
  `isSpam` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `cpshares`
--

CREATE TABLE `cpshares` (
  `shareID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `dailyfeatures`
--

CREATE TABLE `dailyfeatures` (
  `feaID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `demon`
--

CREATE TABLE `demon` (
  `id` int(11) NOT NULL,
  `moder` text NOT NULL,
  `demonType` text NOT NULL,
  `Stars` text NOT NULL,
  `LevelID` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `exploit`
--

CREATE TABLE `exploit` (
  `id` int(11) NOT NULL,
  `date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='for safe coins';

-- --------------------------------------------------------

--
-- Структура таблицы `friendreqs`
--

CREATE TABLE `friendreqs` (
  `accountID` int(11) NOT NULL,
  `toAccountID` int(11) NOT NULL,
  `comment` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `uploadDate` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `isNew` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `friendships`
--

CREATE TABLE `friendships` (
  `ID` int(11) NOT NULL,
  `person1` int(11) NOT NULL,
  `person2` int(11) NOT NULL,
  `isNew1` int(11) NOT NULL,
  `isNew2` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `gauntlets`
--

CREATE TABLE `gauntlets` (
  `ID` int(11) NOT NULL,
  `level1` int(11) NOT NULL,
  `level2` int(11) NOT NULL,
  `level3` int(11) NOT NULL,
  `level4` int(11) NOT NULL,
  `level5` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `levels`
--

CREATE TABLE `levels` (
  `gameVersion` int(11) NOT NULL,
  `binaryVersion` int(11) NOT NULL DEFAULT '0',
  `userName` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `levelID` int(11) NOT NULL,
  `levelName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `levelDesc` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `levelVersion` int(11) NOT NULL,
  `levelLength` int(11) NOT NULL DEFAULT '0',
  `audioTrack` int(11) NOT NULL,
  `auto` int(11) NOT NULL,
  `password` int(11) NOT NULL,
  `original` int(11) NOT NULL,
  `twoPlayer` int(11) NOT NULL DEFAULT '0',
  `songID` int(11) NOT NULL DEFAULT '0',
  `objects` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `requestedStars` int(11) NOT NULL DEFAULT '0',
  `extraString` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `levelString` longtext COLLATE utf8_unicode_ci,
  `levelInfo` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `secret` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `starDifficulty` int(11) NOT NULL DEFAULT '0' COMMENT '0=N/A 10=EASY 20=NORMAL 30=HARD 40=HARDER 50=INSANE 50=AUTO 50=DEMON',
  `downloads` int(11) NOT NULL DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `starDemon` int(1) NOT NULL DEFAULT '0',
  `starAuto` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `starStars` int(11) NOT NULL DEFAULT '0',
  `uploadDate` varchar(1337) COLLATE utf8_unicode_ci NOT NULL,
  `updateDate` bigint(11) NOT NULL,
  `rateDate` bigint(20) NOT NULL DEFAULT '0',
  `starCoins` int(11) NOT NULL DEFAULT '0',
  `starFeatured` int(11) NOT NULL DEFAULT '0',
  `starHall` int(11) NOT NULL DEFAULT '0',
  `starEpic` int(11) NOT NULL DEFAULT '0',
  `starDemonDiff` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL,
  `extID` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `unlisted` int(11) NOT NULL,
  `originalReup` int(11) NOT NULL DEFAULT '0' COMMENT 'used for levelReupload.php',
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `isCPShared` int(11) NOT NULL DEFAULT '0',
  `isDeleted` int(11) NOT NULL DEFAULT '0',
  `isLDM` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `levelscores`
--

CREATE TABLE `levelscores` (
  `scoreID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `percent` int(11) NOT NULL,
  `uploadDate` int(11) NOT NULL,
  `attempts` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `links`
--

CREATE TABLE `links` (
  `ID` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `targetAccountID` int(11) NOT NULL,
  `server` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `targetUserID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `mappacks`
--

CREATE TABLE `mappacks` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `levels` varchar(512) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entered as "ID of level 1, ID of level 2, ID of level 3" for example "13,14,15" (without the "s)',
  `stars` int(11) NOT NULL,
  `coins` int(11) NOT NULL,
  `difficulty` int(11) NOT NULL,
  `rgbcolors` varchar(11) COLLATE utf8_unicode_ci NOT NULL COMMENT 'entered as R,G,B',
  `colors2` varchar(11) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `messages`
--

CREATE TABLE `messages` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `subject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `accID` int(11) NOT NULL,
  `messageID` int(11) NOT NULL,
  `toAccountID` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `secret` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unused',
  `isNew` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `modactions`
--

CREATE TABLE `modactions` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `value2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `value3` int(11) NOT NULL DEFAULT '0',
  `value4` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `value5` int(11) NOT NULL DEFAULT '0',
  `value6` int(11) NOT NULL DEFAULT '0',
  `account` int(11) NOT NULL DEFAULT '0',
  `value7` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `moder`
--

CREATE TABLE `moder` (
  `id` int(11) NOT NULL,
  `moder` text NOT NULL,
  `lvl` text NOT NULL,
  `diff` text NOT NULL,
  `isNormal` text,
  `isDemon` text,
  `isAuto` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Структура таблицы `modipperms`
--

CREATE TABLE `modipperms` (
  `categoryID` int(11) NOT NULL,
  `actionFreeCopy` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `modips`
--

CREATE TABLE `modips` (
  `ID` int(11) NOT NULL,
  `IP` varchar(69) COLLATE utf8_unicode_ci NOT NULL,
  `isMod` int(11) NOT NULL,
  `accountID` int(11) NOT NULL,
  `modipCategory` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `poll`
--

CREATE TABLE `poll` (
  `accountID` int(11) NOT NULL,
  `pollOption` varchar(255) NOT NULL,
  `optionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `quests`
--

CREATE TABLE `quests` (
  `ID` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `reward` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `reports`
--

CREATE TABLE `reports` (
  `ID` int(11) NOT NULL,
  `levelID` int(11) NOT NULL,
  `hostname` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `roleassign`
--

CREATE TABLE `roleassign` (
  `assignID` bigint(20) NOT NULL,
  `roleID` bigint(20) NOT NULL,
  `accountID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `roleID` bigint(11) NOT NULL,
  `priority` int(11) NOT NULL DEFAULT '0',
  `roleName` varchar(255) NOT NULL,
  `commandRate` int(11) NOT NULL DEFAULT '0',
  `commandFeature` int(11) NOT NULL DEFAULT '0',
  `commandEpic` int(11) NOT NULL DEFAULT '0',
  `commandUnepic` int(11) NOT NULL DEFAULT '0',
  `commandVerifycoins` int(11) NOT NULL DEFAULT '0',
  `commandDaily` int(11) NOT NULL DEFAULT '0',
  `commandWeekly` int(11) NOT NULL DEFAULT '0',
  `commandDelete` int(11) NOT NULL DEFAULT '0',
  `commandSetacc` int(11) NOT NULL DEFAULT '0',
  `commandRenameOwn` int(11) NOT NULL DEFAULT '1',
  `commandRenameAll` int(11) NOT NULL DEFAULT '0',
  `commandPassOwn` int(11) NOT NULL DEFAULT '1',
  `commandPassAll` int(11) NOT NULL DEFAULT '0',
  `commandDescriptionOwn` int(11) NOT NULL DEFAULT '1',
  `commandDescriptionAll` int(11) NOT NULL DEFAULT '0',
  `commandPublicOwn` int(11) NOT NULL DEFAULT '1',
  `commandPublicAll` int(11) NOT NULL DEFAULT '0',
  `commandUnlistOwn` int(11) NOT NULL DEFAULT '1',
  `commandUnlistAll` int(11) NOT NULL DEFAULT '0',
  `commandSharecpOwn` int(11) NOT NULL DEFAULT '1',
  `commandSharecpAll` int(11) NOT NULL DEFAULT '0',
  `commandSongOwn` int(11) NOT NULL DEFAULT '1',
  `commandSongAll` int(11) NOT NULL DEFAULT '0',
  `profilecommandDiscord` int(11) NOT NULL DEFAULT '1',
  `actionRateDemon` int(11) NOT NULL DEFAULT '0',
  `actionRateStars` int(11) NOT NULL DEFAULT '0',
  `actionRateDifficulty` int(11) NOT NULL DEFAULT '0',
  `actionRequestMod` int(11) NOT NULL DEFAULT '0',
  `toolLeaderboardsban` int(11) NOT NULL DEFAULT '0',
  `toolPackcreate` int(11) NOT NULL DEFAULT '0',
  `toolModactions` int(11) NOT NULL DEFAULT '0',
  `dashboardModTools` int(11) NOT NULL DEFAULT '0',
  `modipCategory` int(11) NOT NULL DEFAULT '0',
  `isDefault` int(11) NOT NULL DEFAULT '0',
  `commentColor` varchar(11) NOT NULL DEFAULT '000,000,000',
  `modBadgeLevel` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`roleID`, `priority`, `roleName`, `commandRate`, `commandFeature`, `commandEpic`, `commandUnepic`, `commandVerifycoins`, `commandDaily`, `commandWeekly`, `commandDelete`, `commandSetacc`, `commandRenameOwn`, `commandRenameAll`, `commandPassOwn`, `commandPassAll`, `commandDescriptionOwn`, `commandDescriptionAll`, `commandPublicOwn`, `commandPublicAll`, `commandUnlistOwn`, `commandUnlistAll`, `commandSharecpOwn`, `commandSharecpAll`, `commandSongOwn`, `commandSongAll`, `profilecommandDiscord`, `actionRateDemon`, `actionRateStars`, `actionRateDifficulty`, `actionRequestMod`, `toolLeaderboardsban`, `toolPackcreate`, `toolModactions`, `dashboardModTools`, `modipCategory`, `isDefault`, `commentColor`, `modBadgeLevel`) VALUES
(1, 4, 'superAdmin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '0.128.255', 2),
(2, 3, 'Admin', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, '148,000,211', 2),
(3, 2, 'Rater', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 0, 0, 1, 1, 1, 0, '127,255,212', 2),
(4, 1, 'Sander', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, '000,255,000', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `shmal`
--

CREATE TABLE `shmal` (
  `121` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `shmal`
--

INSERT INTO `shmal` (`121`) VALUES
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol'),
('lol');

-- --------------------------------------------------------

--
-- Структура таблицы `songs`
--

CREATE TABLE `songs` (
  `ID` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `authorID` int(11) NOT NULL,
  `authorName` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `download` varchar(1337) COLLATE utf8_unicode_ci NOT NULL,
  `hash` varchar(256) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `isDisabled` int(11) NOT NULL DEFAULT '0',
  `levelsCount` int(11) NOT NULL DEFAULT '0',
  `reuploadTime` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `suggest`
--

CREATE TABLE `suggest` (
  `id` int(11) NOT NULL,
  `suggestBy` int(11) NOT NULL DEFAULT '0',
  `suggestLevelId` int(11) NOT NULL DEFAULT '0',
  `suggestDifficulty` int(11) NOT NULL DEFAULT '0' COMMENT '0 - NA 10 - Easy 20 - Normal 30 - Hard 40 - Harder 50 - Insane/Demon/Auto',
  `suggestStars` int(11) NOT NULL DEFAULT '0',
  `suggestFeatured` int(11) NOT NULL DEFAULT '0',
  `suggestAuto` int(11) NOT NULL DEFAULT '0',
  `suggestDemon` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `test`
--

CREATE TABLE `test` (
  `lol` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `test`
--

INSERT INTO `test` (`lol`) VALUES
('lol'),
('lol'),
('lol'),
('lol'),
('lol');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `isRegistered` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `extID` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `userName` varchar(69) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'undefined',
  `stars` int(11) NOT NULL DEFAULT '0',
  `demons` int(11) NOT NULL DEFAULT '0',
  `icon` int(11) NOT NULL DEFAULT '0',
  `color1` int(11) NOT NULL DEFAULT '0',
  `color2` int(11) NOT NULL DEFAULT '3',
  `iconType` int(11) NOT NULL DEFAULT '0',
  `coins` int(11) NOT NULL DEFAULT '0',
  `userCoins` int(11) NOT NULL DEFAULT '0',
  `special` int(11) NOT NULL DEFAULT '0',
  `gameVersion` int(11) NOT NULL DEFAULT '0',
  `secret` varchar(69) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `accIcon` int(11) NOT NULL DEFAULT '0',
  `accShip` int(11) NOT NULL DEFAULT '0',
  `accBall` int(11) NOT NULL DEFAULT '0',
  `accBird` int(11) NOT NULL DEFAULT '0',
  `accDart` int(11) NOT NULL DEFAULT '0',
  `accRobot` int(11) DEFAULT '0',
  `accGlow` int(11) NOT NULL DEFAULT '0',
  `creatorPoints` double NOT NULL DEFAULT '0',
  `IP` varchar(69) COLLATE utf8_unicode_ci NOT NULL DEFAULT '127.0.0.1',
  `lastPlayed` int(11) NOT NULL DEFAULT '0',
  `diamonds` int(11) NOT NULL DEFAULT '0',
  `orbs` int(11) NOT NULL DEFAULT '0',
  `completedLvls` int(11) NOT NULL DEFAULT '0',
  `accSpider` int(11) NOT NULL DEFAULT '0',
  `accExplosion` int(11) NOT NULL DEFAULT '0',
  `chest1time` int(11) NOT NULL DEFAULT '0',
  `chest2time` int(11) NOT NULL DEFAULT '0',
  `chest1count` int(11) NOT NULL DEFAULT '0',
  `chest2count` int(11) NOT NULL DEFAULT '0',
  `isBanned` int(11) NOT NULL DEFAULT '0',
  `isCreatorBanned` int(11) NOT NULL DEFAULT '0',
  `UserPrefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_croatian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `acccomments`
--
ALTER TABLE `acccomments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `userID` (`userID`);

--
-- Индексы таблицы `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`accountID`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `isAdmin` (`isAdmin`);

--
-- Индексы таблицы `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `bannedips`
--
ALTER TABLE `bannedips`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `blocks`
--
ALTER TABLE `blocks`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `ID` (`ID`);

--
-- Индексы таблицы `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`commentID`),
  ADD KEY `levelID` (`levelID`);

--
-- Индексы таблицы `cpshares`
--
ALTER TABLE `cpshares`
  ADD PRIMARY KEY (`shareID`);

--
-- Индексы таблицы `dailyfeatures`
--
ALTER TABLE `dailyfeatures`
  ADD PRIMARY KEY (`feaID`);

--
-- Индексы таблицы `demon`
--
ALTER TABLE `demon`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `exploit`
--
ALTER TABLE `exploit`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `friendreqs`
--
ALTER TABLE `friendreqs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `toAccountID` (`toAccountID`);

--
-- Индексы таблицы `friendships`
--
ALTER TABLE `friendships`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `person1` (`person1`),
  ADD KEY `person2` (`person2`),
  ADD KEY `isNew1` (`isNew1`),
  ADD KEY `isNew2` (`isNew2`);

--
-- Индексы таблицы `gauntlets`
--
ALTER TABLE `gauntlets`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `level5` (`level5`);

--
-- Индексы таблицы `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`levelID`),
  ADD KEY `levelID` (`levelID`),
  ADD KEY `levelName` (`levelName`),
  ADD KEY `starDifficulty` (`starDifficulty`),
  ADD KEY `starFeatured` (`starFeatured`),
  ADD KEY `starEpic` (`starEpic`),
  ADD KEY `starDemonDiff` (`starDemonDiff`),
  ADD KEY `userID` (`userID`),
  ADD KEY `likes` (`likes`),
  ADD KEY `downloads` (`downloads`),
  ADD KEY `starStars` (`starStars`),
  ADD KEY `songID` (`songID`),
  ADD KEY `audioTrack` (`audioTrack`),
  ADD KEY `levelLength` (`levelLength`),
  ADD KEY `twoPlayer` (`twoPlayer`);

--
-- Индексы таблицы `levelscores`
--
ALTER TABLE `levelscores`
  ADD PRIMARY KEY (`scoreID`),
  ADD KEY `levelID` (`levelID`);

--
-- Индексы таблицы `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `mappacks`
--
ALTER TABLE `mappacks`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`messageID`),
  ADD KEY `toAccountID` (`toAccountID`);

--
-- Индексы таблицы `modactions`
--
ALTER TABLE `modactions`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `moder`
--
ALTER TABLE `moder`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `modipperms`
--
ALTER TABLE `modipperms`
  ADD PRIMARY KEY (`categoryID`);

--
-- Индексы таблицы `modips`
--
ALTER TABLE `modips`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `poll`
--
ALTER TABLE `poll`
  ADD PRIMARY KEY (`optionID`);

--
-- Индексы таблицы `quests`
--
ALTER TABLE `quests`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`ID`);

--
-- Индексы таблицы `roleassign`
--
ALTER TABLE `roleassign`
  ADD PRIMARY KEY (`assignID`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`roleID`);

--
-- Индексы таблицы `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `suggest`
--
ALTER TABLE `suggest`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `userName` (`userName`),
  ADD KEY `stars` (`stars`),
  ADD KEY `demons` (`demons`),
  ADD KEY `coins` (`coins`),
  ADD KEY `userCoins` (`userCoins`),
  ADD KEY `gameVersion` (`gameVersion`),
  ADD KEY `creatorPoints` (`creatorPoints`),
  ADD KEY `diamonds` (`diamonds`),
  ADD KEY `orbs` (`orbs`),
  ADD KEY `completedLvls` (`completedLvls`),
  ADD KEY `isBanned` (`isBanned`),
  ADD KEY `isCreatorBanned` (`isCreatorBanned`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `acccomments`
--
ALTER TABLE `acccomments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `accounts`
--
ALTER TABLE `accounts`
  MODIFY `accountID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `actions`
--
ALTER TABLE `actions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `bannedips`
--
ALTER TABLE `bannedips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `blocks`
--
ALTER TABLE `blocks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `comments`
--
ALTER TABLE `comments`
  MODIFY `commentID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `cpshares`
--
ALTER TABLE `cpshares`
  MODIFY `shareID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `dailyfeatures`
--
ALTER TABLE `dailyfeatures`
  MODIFY `feaID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `demon`
--
ALTER TABLE `demon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `exploit`
--
ALTER TABLE `exploit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `friendreqs`
--
ALTER TABLE `friendreqs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `friendships`
--
ALTER TABLE `friendships`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `gauntlets`
--
ALTER TABLE `gauntlets`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `levels`
--
ALTER TABLE `levels`
  MODIFY `levelID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `levelscores`
--
ALTER TABLE `levelscores`
  MODIFY `scoreID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `links`
--
ALTER TABLE `links`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `mappacks`
--
ALTER TABLE `mappacks`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `messages`
--
ALTER TABLE `messages`
  MODIFY `messageID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `modactions`
--
ALTER TABLE `modactions`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `moder`
--
ALTER TABLE `moder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `modipperms`
--
ALTER TABLE `modipperms`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `modips`
--
ALTER TABLE `modips`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `poll`
--
ALTER TABLE `poll`
  MODIFY `optionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `quests`
--
ALTER TABLE `quests`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `reports`
--
ALTER TABLE `reports`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `roleassign`
--
ALTER TABLE `roleassign`
  MODIFY `assignID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `roleID` bigint(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `songs`
--
ALTER TABLE `songs`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `suggest`
--
ALTER TABLE `suggest`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
