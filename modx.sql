-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Июн 08 2013 г., 14:37
-- Версия сервера: 5.5.31-0ubuntu0.13.04.1
-- Версия PHP: 5.4.9-4ubuntu2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `modx`
--

-- --------------------------------------------------------

--
-- Структура таблицы `modx_active_users`
--

CREATE TABLE IF NOT EXISTS `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Дамп данных таблицы `modx_active_users`
--

INSERT INTO `modx_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'admin', 1370677041, NULL, '2', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_categories`
--

CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `modx_categories`
--

INSERT INTO `modx_categories` (`id`, `category`) VALUES
(1, 'Demo Content'),
(2, 'Login'),
(3, 'Manager and Admin'),
(4, 'Search'),
(5, 'Navigation'),
(6, 'Forms'),
(7, 'Content'),
(8, 'System'),
(9, 'Шаблоны страниц'),
(10, 'SEO'),
(11, 'PHx');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_documentgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_document_groups`
--

CREATE TABLE IF NOT EXISTS `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_event_log`
--

CREATE TABLE IF NOT EXISTS `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `modx_event_log`
--

INSERT INTO `modx_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 17, 1367309548, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>'),
(2, 0, 1367309548, 2, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы системы MODx. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(3, 17, 1367310863, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>'),
(4, 17, 1368604353, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>'),
(5, 0, 1368607672, 2, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы системы MODx. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(6, 17, 1370677041, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_keyword_xref`
--

CREATE TABLE IF NOT EXISTS `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_log`
--

CREATE TABLE IF NOT EXISTS `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=538 ;

--
-- Дамп данных таблицы `modx_manager_log`
--

INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1367308049, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(2, 1367308050, 1, 'admin', 17, '-', '-', 'Editing settings'),
(3, 1367308052, 1, 'admin', 17, '-', '-', 'Editing settings'),
(4, 1367308056, 1, 'admin', 76, '-', '-', 'Element management'),
(5, 1367308068, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(6, 1367308187, 1, 'admin', 27, '1', '-', 'Editing resource'),
(7, 1367308218, 1, 'admin', 27, '1', '-', 'Editing resource'),
(8, 1367308220, 1, 'admin', 27, '1', '-', 'Editing resource'),
(9, 1367308529, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(10, 1367308534, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(11, 1367308773, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(12, 1367308977, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(13, 1367308977, 1, 'admin', 17, '-', '-', 'Editing settings'),
(14, 1367308994, 1, 'admin', 17, '-', '-', 'Editing settings'),
(15, 1367308996, 1, 'admin', 76, '-', '-', 'Element management'),
(16, 1367309164, 1, 'admin', 17, '-', '-', 'Editing settings'),
(17, 1367309363, 1, 'admin', 76, '-', '-', 'Element management'),
(18, 1367309364, 1, 'admin', 101, '-', 'New Plugin', 'Create new plugin'),
(19, 1367309449, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(20, 1367309449, 1, 'admin', 76, '-', '-', 'Element management'),
(21, 1367309451, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(22, 1367309464, 1, 'admin', 76, '-', '-', 'Element management'),
(23, 1367309467, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(24, 1367309484, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(25, 1367309484, 1, 'admin', 76, '-', '-', 'Element management'),
(26, 1367309489, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(27, 1367309495, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(28, 1367309495, 1, 'admin', 76, '-', '-', 'Element management'),
(29, 1367309499, 1, 'admin', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(30, 1367309502, 1, 'admin', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(31, 1367309509, 1, 'admin', 79, '2', '-', 'Saving Chunk (HTML Snippet)'),
(32, 1367309509, 1, 'admin', 76, '-', '-', 'Element management'),
(33, 1367309511, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(34, 1367309515, 1, 'admin', 27, '1', '-', 'Editing resource'),
(35, 1367309524, 1, 'admin', 17, '-', '-', 'Editing settings'),
(36, 1367309548, 1, 'admin', 30, '-', '-', 'Saving settings'),
(37, 1367309638, 1, 'admin', 76, '-', '-', 'Element management'),
(38, 1367309645, 1, 'admin', 102, '1', 'Quick Manager+', 'Edit plugin'),
(39, 1367309647, 1, 'admin', 103, '1', '-', 'Saving plugin'),
(40, 1367309648, 1, 'admin', 76, '-', '-', 'Element management'),
(41, 1367309649, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(42, 1367309651, 1, 'admin', 27, '1', '-', 'Editing resource'),
(43, 1367309660, 1, 'admin', 76, '-', '-', 'Element management'),
(44, 1367309664, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(45, 1367309779, 1, 'admin', 76, '-', '-', 'Element management'),
(46, 1367309781, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(47, 1367309809, 1, 'admin', 76, '-', '-', 'Element management'),
(48, 1367309811, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(49, 1367309813, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(50, 1367309817, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(51, 1367309819, 1, 'admin', 76, '-', '-', 'Element management'),
(52, 1367309842, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(53, 1367310011, 1, 'admin', 76, '-', '-', 'Element management'),
(54, 1367310012, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(55, 1367310052, 1, 'admin', 76, '-', '-', 'Element management'),
(56, 1367310053, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(57, 1367310070, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(58, 1367310072, 1, 'admin', 76, '-', '-', 'Element management'),
(59, 1367310074, 1, 'admin', 16, '4', 'MODxHost', 'Editing template'),
(60, 1367310076, 1, 'admin', 72, '-', '-', 'Adding a weblink'),
(61, 1367310077, 1, 'admin', 76, '-', '-', 'Element management'),
(62, 1367310080, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(63, 1367310096, 1, 'admin', 76, '-', '-', 'Element management'),
(64, 1367310099, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(65, 1367310104, 1, 'admin', 76, '-', '-', 'Element management'),
(66, 1367310107, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(67, 1367310139, 1, 'admin', 17, '-', '-', 'Editing settings'),
(68, 1367310155, 1, 'admin', 76, '-', '-', 'Element management'),
(69, 1367310289, 1, 'admin', 301, '1', 'blogContent', 'Edit Template Variable'),
(70, 1367310294, 1, 'admin', 303, '1', '-', 'Delete Template Variable'),
(71, 1367310294, 1, 'admin', 76, '-', '-', 'Element management'),
(72, 1367310295, 1, 'admin', 301, '2', 'Tags', 'Edit Template Variable'),
(73, 1367310299, 1, 'admin', 303, '2', '-', 'Delete Template Variable'),
(74, 1367310299, 1, 'admin', 76, '-', '-', 'Element management'),
(75, 1367310300, 1, 'admin', 301, '3', 'loginName', 'Edit Template Variable'),
(76, 1367310305, 1, 'admin', 303, '3', '-', 'Delete Template Variable'),
(77, 1367310305, 1, 'admin', 76, '-', '-', 'Element management'),
(78, 1367310519, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(79, 1367310521, 1, 'admin', 27, '1', '-', 'Editing resource'),
(80, 1367310532, 1, 'admin', 76, '-', '-', 'Element management'),
(81, 1367310535, 1, 'admin', 101, '-', 'New Plugin', 'Create new plugin'),
(82, 1367310594, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(83, 1367310594, 1, 'admin', 76, '-', '-', 'Element management'),
(84, 1367310598, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(85, 1367310601, 1, 'admin', 27, '1', '-', 'Editing resource'),
(86, 1367310604, 1, 'admin', 5, '1', '-', 'Saving resource'),
(87, 1367310604, 1, 'admin', 27, '1', '-', 'Editing resource'),
(88, 1367310610, 1, 'admin', 76, '-', '-', 'Element management'),
(89, 1367310612, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(90, 1367310614, 1, 'admin', 76, '-', '-', 'Element management'),
(91, 1367310625, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(92, 1367310835, 1, 'admin', 76, '-', '-', 'Element management'),
(93, 1367310847, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(94, 1367310848, 1, 'admin', 76, '-', '-', 'Element management'),
(95, 1367310851, 1, 'admin', 17, '-', '-', 'Editing settings'),
(96, 1367310863, 1, 'admin', 30, '-', '-', 'Saving settings'),
(97, 1367310865, 1, 'admin', 27, '1', '-', 'Editing resource'),
(98, 1367310869, 1, 'admin', 76, '-', '-', 'Element management'),
(99, 1367310877, 1, 'admin', 102, '8', 'Always stay', 'Edit plugin'),
(100, 1367310883, 1, 'admin', 103, '8', '-', 'Saving plugin'),
(101, 1367310883, 1, 'admin', 102, '8', 'Always stay', 'Edit plugin'),
(102, 1367310887, 1, 'admin', 76, '-', '-', 'Element management'),
(103, 1367310894, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(104, 1367310908, 1, 'admin', 76, '-', '-', 'Element management'),
(105, 1367310910, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(106, 1367310911, 1, 'admin', 27, '1', '-', 'Editing resource'),
(107, 1367310913, 1, 'admin', 76, '-', '-', 'Element management'),
(108, 1367310915, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(109, 1367310925, 1, 'admin', 76, '-', '-', 'Element management'),
(110, 1367310927, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(111, 1367310933, 1, 'admin', 76, '-', '-', 'Element management'),
(112, 1367310936, 1, 'admin', 17, '-', '-', 'Editing settings'),
(113, 1367310961, 1, 'admin', 76, '-', '-', 'Element management'),
(114, 1367310964, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(115, 1367310974, 1, 'admin', 76, '-', '-', 'Element management'),
(116, 1367310976, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(117, 1367311245, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(118, 1367311246, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(119, 1367311247, 1, 'admin', 76, '-', '-', 'Element management'),
(120, 1367311249, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(121, 1367311254, 1, 'admin', 76, '-', '-', 'Element management'),
(122, 1367311258, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(123, 1367311273, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(124, 1367311273, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(125, 1367311275, 1, 'admin', 76, '-', '-', 'Element management'),
(126, 1367311276, 1, 'admin', 102, '3', 'TinyMCE Rich Text Editor', 'Edit plugin'),
(127, 1367311279, 1, 'admin', 76, '-', '-', 'Element management'),
(128, 1367311281, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(129, 1367311283, 1, 'admin', 27, '1', '-', 'Editing resource'),
(130, 1367311285, 1, 'admin', 76, '-', '-', 'Element management'),
(131, 1367311288, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(132, 1367311308, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(133, 1367311308, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(134, 1367311310, 1, 'admin', 76, '-', '-', 'Element management'),
(135, 1367311312, 1, 'admin', 102, '3', 'TinyMCE Rich Text Editor', 'Edit plugin'),
(136, 1367311315, 1, 'admin', 76, '-', '-', 'Element management'),
(137, 1367311317, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(138, 1367311322, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(139, 1367311322, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(140, 1367311425, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(141, 1367311425, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(142, 1367311474, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(143, 1367311474, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(144, 1367311476, 1, 'admin', 76, '-', '-', 'Element management'),
(145, 1367311477, 1, 'admin', 102, '4', 'ManagerManager', 'Edit plugin'),
(146, 1367311479, 1, 'admin', 76, '-', '-', 'Element management'),
(147, 1367311480, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(148, 1367311484, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(149, 1367311484, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(150, 1367311588, 1, 'admin', 27, '1', '-', 'Editing resource'),
(151, 1367311590, 1, 'admin', 76, '-', '-', 'Element management'),
(152, 1367311592, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(153, 1367311594, 1, 'admin', 76, '-', '-', 'Element management'),
(154, 1367311601, 1, 'admin', 22, '16', 'Ditto', 'Editing Snippet'),
(155, 1367311612, 1, 'admin', 76, '-', '-', 'Element management'),
(156, 1367311752, 1, 'admin', 17, '-', '-', 'Editing settings'),
(157, 1367311780, 1, 'admin', 76, '-', '-', 'Element management'),
(158, 1367311784, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(159, 1367311853, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(160, 1367311853, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(161, 1367311855, 1, 'admin', 76, '-', '-', 'Element management'),
(162, 1367311857, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(163, 1367311881, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(164, 1367311881, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(165, 1367311883, 1, 'admin', 76, '-', '-', 'Element management'),
(166, 1367311884, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(167, 1367311885, 1, 'admin', 27, '1', '-', 'Editing resource'),
(168, 1367311907, 1, 'admin', 76, '-', '-', 'Element management'),
(169, 1367311909, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(170, 1367311914, 1, 'admin', 103, '7', '-', 'Saving plugin'),
(171, 1367311914, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(172, 1367312530, 1, 'admin', 76, '-', '-', 'Element management'),
(173, 1367312532, 1, 'admin', 102, '7', 'EditArea', 'Edit plugin'),
(174, 1367312535, 1, 'admin', 104, '7', '-', 'Delete plugin'),
(175, 1367312535, 1, 'admin', 76, '-', '-', 'Element management'),
(176, 1367312766, 1, 'admin', 76, '-', '-', 'Element management'),
(177, 1367312767, 1, 'admin', 101, '-', 'New Plugin', 'Create new plugin'),
(178, 1367312824, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(179, 1367312824, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(180, 1367312828, 1, 'admin', 76, '-', '-', 'Element management'),
(181, 1367312830, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(182, 1367312834, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(183, 1367312836, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(184, 1367312839, 1, 'admin', 76, '-', '-', 'Element management'),
(185, 1367312913, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(186, 1367312919, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(187, 1367312919, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(188, 1367313025, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(189, 1367313025, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(190, 1367313027, 1, 'admin', 76, '-', '-', 'Element management'),
(191, 1367313028, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(192, 1367313029, 1, 'admin', 76, '-', '-', 'Element management'),
(193, 1367313030, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(194, 1367313034, 1, 'admin', 76, '-', '-', 'Element management'),
(195, 1367313038, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(196, 1367313041, 1, 'admin', 76, '-', '-', 'Element management'),
(197, 1367313042, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(198, 1367313043, 1, 'admin', 76, '-', '-', 'Element management'),
(199, 1367313045, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(200, 1367313050, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(201, 1367313050, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(202, 1367313052, 1, 'admin', 17, '-', '-', 'Editing settings'),
(203, 1367313118, 1, 'admin', 76, '-', '-', 'Element management'),
(204, 1367313180, 1, 'admin', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(205, 1367313183, 1, 'admin', 76, '-', '-', 'Element management'),
(206, 1367313207, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(207, 1367313223, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(208, 1367313225, 1, 'admin', 76, '-', '-', 'Element management'),
(209, 1367313228, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(210, 1367313230, 1, 'admin', 76, '-', '-', 'Element management'),
(211, 1367313231, 1, 'admin', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(212, 1367313233, 1, 'admin', 76, '-', '-', 'Element management'),
(213, 1367313297, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(214, 1367313344, 1, 'admin', 76, '-', '-', 'Element management'),
(215, 1367313345, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(216, 1367313377, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(217, 1367313379, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(218, 1367313383, 1, 'admin', 76, '-', '-', 'Element management'),
(219, 1367313385, 1, 'admin', 102, '4', 'ManagerManager', 'Edit plugin'),
(220, 1367313386, 1, 'admin', 76, '-', '-', 'Element management'),
(221, 1367313407, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(222, 1367313426, 1, 'admin', 100, '-', '-', 'Previewing resource'),
(223, 1367313458, 1, 'admin', 76, '-', '-', 'Element management'),
(224, 1367313459, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(225, 1367313474, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(226, 1367313474, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(227, 1367313475, 1, 'admin', 76, '-', '-', 'Element management'),
(228, 1367313476, 1, 'admin', 27, '1', '-', 'Editing resource'),
(229, 1367313478, 1, 'admin', 76, '-', '-', 'Element management'),
(230, 1367313480, 1, 'admin', 22, '11', 'Reflect', 'Editing Snippet'),
(231, 1367313485, 1, 'admin', 76, '-', '-', 'Element management'),
(232, 1367313498, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(233, 1367313500, 1, 'admin', 76, '-', '-', 'Element management'),
(234, 1367313502, 1, 'admin', 102, '1', 'Quick Manager+', 'Edit plugin'),
(235, 1367313504, 1, 'admin', 103, '1', '-', 'Saving plugin'),
(236, 1367313504, 1, 'admin', 102, '1', 'Quick Manager+', 'Edit plugin'),
(237, 1367313506, 1, 'admin', 76, '-', '-', 'Element management'),
(238, 1367313508, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(239, 1367313509, 1, 'admin', 76, '-', '-', 'Element management'),
(240, 1367313510, 1, 'admin', 102, '1', 'Quick Manager+', 'Edit plugin'),
(241, 1367313513, 1, 'admin', 103, '1', '-', 'Saving plugin'),
(242, 1367313513, 1, 'admin', 102, '1', 'Quick Manager+', 'Edit plugin'),
(243, 1367313514, 1, 'admin', 76, '-', '-', 'Element management'),
(244, 1367313515, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(245, 1367313530, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(246, 1367313530, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(247, 1367313573, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(248, 1367313573, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(249, 1367313575, 1, 'admin', 76, '-', '-', 'Element management'),
(250, 1367313576, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(251, 1367313580, 1, 'admin', 76, '-', '-', 'Element management'),
(252, 1367313582, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(253, 1367313616, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(254, 1367313616, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(255, 1367313618, 1, 'admin', 76, '-', '-', 'Element management'),
(256, 1367313620, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(257, 1367313621, 1, 'admin', 76, '-', '-', 'Element management'),
(258, 1367313623, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(259, 1367313625, 1, 'admin', 76, '-', '-', 'Element management'),
(260, 1367313627, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(261, 1367313633, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(262, 1367313633, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(263, 1367313635, 1, 'admin', 76, '-', '-', 'Element management'),
(264, 1367313636, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(265, 1367313637, 1, 'admin', 76, '-', '-', 'Element management'),
(266, 1367313639, 1, 'admin', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(267, 1367313641, 1, 'admin', 76, '-', '-', 'Element management'),
(268, 1367313647, 1, 'admin', 102, '3', 'TinyMCE Rich Text Editor', 'Edit plugin'),
(269, 1367313654, 1, 'admin', 103, '3', '-', 'Saving plugin'),
(270, 1367313654, 1, 'admin', 102, '3', 'TinyMCE Rich Text Editor', 'Edit plugin'),
(271, 1367313655, 1, 'admin', 76, '-', '-', 'Element management'),
(272, 1367313657, 1, 'admin', 16, '4', 'MODxHost', 'Editing template'),
(273, 1367313658, 1, 'admin', 27, '1', '-', 'Editing resource'),
(274, 1367313663, 1, 'admin', 76, '-', '-', 'Element management'),
(275, 1367313665, 1, 'admin', 102, '3', 'TinyMCE Rich Text Editor', 'Edit plugin'),
(276, 1367313669, 1, 'admin', 103, '3', '-', 'Saving plugin'),
(277, 1367313669, 1, 'admin', 102, '3', 'TinyMCE Rich Text Editor', 'Edit plugin'),
(278, 1367313670, 1, 'admin', 76, '-', '-', 'Element management'),
(279, 1367313672, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(280, 1367313686, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(281, 1367313686, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(282, 1367313688, 1, 'admin', 76, '-', '-', 'Element management'),
(283, 1367313689, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(284, 1367313690, 1, 'admin', 76, '-', '-', 'Element management'),
(285, 1367313692, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(286, 1367313694, 1, 'admin', 76, '-', '-', 'Element management'),
(287, 1367313697, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(288, 1367313702, 1, 'admin', 76, '-', '-', 'Element management'),
(289, 1367313707, 1, 'admin', 102, '4', 'ManagerManager', 'Edit plugin'),
(290, 1367313709, 1, 'admin', 76, '-', '-', 'Element management'),
(291, 1367313711, 1, 'admin', 102, '2', 'Search Highlight', 'Edit plugin'),
(292, 1367313715, 1, 'admin', 76, '-', '-', 'Element management'),
(293, 1367313717, 1, 'admin', 102, '8', 'Always stay', 'Edit plugin'),
(294, 1367313724, 1, 'admin', 76, '-', '-', 'Element management'),
(295, 1367313727, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(296, 1367313733, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(297, 1367313733, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(298, 1367313734, 1, 'admin', 76, '-', '-', 'Element management'),
(299, 1367313737, 1, 'admin', 22, '11', 'Reflect', 'Editing Snippet'),
(300, 1367313738, 1, 'admin', 76, '-', '-', 'Element management'),
(301, 1367313742, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(302, 1367313765, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(303, 1367313765, 1, 'admin', 102, '9', 'Edit Area', 'Edit plugin'),
(304, 1367313766, 1, 'admin', 76, '-', '-', 'Element management'),
(305, 1367313769, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(306, 1367313771, 1, 'admin', 76, '-', '-', 'Element management'),
(307, 1367313772, 1, 'admin', 102, '9', 'Edit Area', 'Edit plugin'),
(308, 1367313775, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(309, 1367313775, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(310, 1367313809, 1, 'admin', 76, '-', '-', 'Element management'),
(311, 1367313814, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(312, 1367313849, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(313, 1367313849, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(314, 1367313851, 1, 'admin', 76, '-', '-', 'Element management'),
(315, 1367313852, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(316, 1367313906, 1, 'admin', 76, '-', '-', 'Element management'),
(317, 1367313907, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(318, 1367313918, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(319, 1367313918, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(320, 1367313942, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(321, 1367313942, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(322, 1367313944, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(323, 1367313944, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(324, 1367313949, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(325, 1367313949, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(326, 1367313950, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(327, 1367313950, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(328, 1367313952, 1, 'admin', 76, '-', '-', 'Element management'),
(329, 1367313953, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(330, 1367313955, 1, 'admin', 76, '-', '-', 'Element management'),
(331, 1367313956, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(332, 1367313961, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(333, 1367313961, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(334, 1367313963, 1, 'admin', 76, '-', '-', 'Element management'),
(335, 1367313964, 1, 'admin', 102, '5', 'Forgot Manager Login', 'Edit plugin'),
(336, 1367313967, 1, 'admin', 76, '-', '-', 'Element management'),
(337, 1367313969, 1, 'admin', 102, '4', 'ManagerManager', 'Edit plugin'),
(338, 1367313972, 1, 'admin', 76, '-', '-', 'Element management'),
(339, 1367313974, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(340, 1367313979, 1, 'admin', 103, '9', '-', 'Saving plugin'),
(341, 1367313979, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(342, 1368603285, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(343, 1368603288, 1, 'admin', 76, '-', '-', 'Element management'),
(344, 1368603297, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(345, 1368603301, 1, 'admin', 76, '-', '-', 'Element management'),
(346, 1368603756, 1, 'admin', 17, '-', '-', 'Editing settings'),
(347, 1368603847, 1, 'admin', 76, '-', '-', 'Element management'),
(348, 1368603849, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(349, 1368603862, 1, 'admin', 103, '6', '-', 'Saving plugin'),
(350, 1368603862, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(351, 1368604082, 1, 'admin', 76, '-', '-', 'Element management'),
(352, 1368604084, 1, 'admin', 102, '6', 'TransAlias', 'Edit plugin'),
(353, 1368604110, 1, 'admin', 27, '1', '-', 'Editing resource'),
(354, 1368604113, 1, 'admin', 31, '-', '-', 'Using file manager'),
(355, 1368604137, 1, 'admin', 27, '1', '-', 'Editing resource'),
(356, 1368604272, 1, 'admin', 76, '-', '-', 'Element management'),
(357, 1368604274, 1, 'admin', 17, '-', '-', 'Editing settings'),
(358, 1368604353, 1, 'admin', 30, '-', '-', 'Saving settings'),
(359, 1368604355, 1, 'admin', 27, '1', '-', 'Editing resource'),
(360, 1368604603, 1, 'admin', 27, '1', '-', 'Editing resource'),
(361, 1368605137, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(362, 1368605140, 1, 'admin', 27, '1', '-', 'Editing resource'),
(363, 1368605369, 1, 'admin', 27, '1', '-', 'Editing resource'),
(364, 1368607143, 1, 'admin', 76, '-', '-', 'Element management'),
(365, 1368607146, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(366, 1368607212, 1, 'admin', 79, '1', '-', 'Saving Chunk (HTML Snippet)'),
(367, 1368607212, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(368, 1368607214, 1, 'admin', 27, '1', '-', 'Editing resource'),
(369, 1368607372, 1, 'admin', 76, '-', '-', 'Element management'),
(370, 1368607419, 1, 'admin', 27, '1', '-', 'Editing resource'),
(371, 1368607437, 1, 'admin', 76, '-', '-', 'Element management'),
(372, 1368607439, 1, 'admin', 300, '-', 'New Template Variable', 'Create Template Variable'),
(373, 1368607460, 1, 'admin', 302, '-', '-', 'Save Template Variable'),
(374, 1368607460, 1, 'admin', 76, '-', '-', 'Element management'),
(375, 1368607461, 1, 'admin', 27, '1', '-', 'Editing resource'),
(376, 1368607465, 1, 'admin', 76, '-', '-', 'Element management'),
(377, 1368607467, 1, 'admin', 301, '4', 'Изображение', 'Edit Template Variable'),
(378, 1368607472, 1, 'admin', 302, '4', '-', 'Save Template Variable'),
(379, 1368607472, 1, 'admin', 76, '-', '-', 'Element management'),
(380, 1368607474, 1, 'admin', 76, '-', '-', 'Element management'),
(381, 1368607478, 1, 'admin', 102, '8', 'Always stay', 'Edit plugin'),
(382, 1368607480, 1, 'admin', 27, '1', '-', 'Editing resource'),
(383, 1368607482, 1, 'admin', 5, '1', '-', 'Saving resource'),
(384, 1368607482, 1, 'admin', 27, '1', '-', 'Editing resource'),
(385, 1368607498, 1, 'admin', 5, '1', '-', 'Saving resource'),
(386, 1368607498, 1, 'admin', 27, '1', '-', 'Editing resource'),
(387, 1368607501, 1, 'admin', 27, '1', '-', 'Editing resource'),
(388, 1368607672, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(389, 1368607914, 1, 'admin', 76, '-', '-', 'Element management'),
(390, 1368607916, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(391, 1368607931, 1, 'admin', 79, '1', '-', 'Saving Chunk (HTML Snippet)'),
(392, 1368607931, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(393, 1368607934, 1, 'admin', 27, '1', '-', 'Editing resource'),
(394, 1368607946, 1, 'admin', 76, '-', '-', 'Element management'),
(395, 1368607952, 1, 'admin', 16, '3', 'Minimal Template', 'Editing template'),
(396, 1368607980, 1, 'admin', 20, '3', '-', 'Saving template'),
(397, 1368607980, 1, 'admin', 16, '3', 'Главная страница', 'Editing template'),
(398, 1368607982, 1, 'admin', 76, '-', '-', 'Element management'),
(399, 1368607985, 1, 'admin', 16, '4', 'MODxHost', 'Editing template'),
(400, 1368608005, 1, 'admin', 21, '4', '-', 'Deleting template'),
(401, 1368608005, 1, 'admin', 76, '-', '-', 'Element management'),
(402, 1368608006, 1, 'admin', 16, '3', 'Главная страница', 'Editing template'),
(403, 1368608057, 1, 'admin', 20, '3', '-', 'Saving template'),
(404, 1368608057, 1, 'admin', 16, '3', 'Главная страница', 'Editing template'),
(405, 1368608058, 1, 'admin', 76, '-', '-', 'Element management'),
(406, 1368608061, 1, 'admin', 78, '2', 'WebLoginSideBar', 'Editing Chunk (HTML Snippet)'),
(407, 1368608064, 1, 'admin', 80, '2', '-', 'Deleting Chunk (HTML Snippet)'),
(408, 1368608064, 1, 'admin', 76, '-', '-', 'Element management'),
(409, 1368608066, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(410, 1368608084, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(411, 1368608084, 1, 'admin', 78, '3', 'header-css', 'Editing Chunk (HTML Snippet)'),
(412, 1368608086, 1, 'admin', 76, '-', '-', 'Element management'),
(413, 1368608087, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(414, 1368608200, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(415, 1368608200, 1, 'admin', 78, '4', 'header-js', 'Editing Chunk (HTML Snippet)'),
(416, 1368608201, 1, 'admin', 76, '-', '-', 'Element management'),
(417, 1368608204, 1, 'admin', 78, '4', 'header-js', 'Editing Chunk (HTML Snippet)'),
(418, 1368608206, 1, 'admin', 79, '4', '-', 'Saving Chunk (HTML Snippet)'),
(419, 1368608206, 1, 'admin', 78, '4', 'header-js', 'Editing Chunk (HTML Snippet)'),
(420, 1368608207, 1, 'admin', 76, '-', '-', 'Element management'),
(421, 1368608209, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(422, 1368608250, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(423, 1368608250, 1, 'admin', 78, '5', 'header-meta', 'Editing Chunk (HTML Snippet)'),
(424, 1368608251, 1, 'admin', 76, '-', '-', 'Element management'),
(425, 1368608253, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(426, 1368608255, 1, 'admin', 79, '1', '-', 'Saving Chunk (HTML Snippet)'),
(427, 1368608255, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(428, 1368608257, 1, 'admin', 76, '-', '-', 'Element management'),
(429, 1368608357, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(430, 1368608415, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(431, 1368608415, 1, 'admin', 78, '6', 'tilte', 'Editing Chunk (HTML Snippet)'),
(432, 1368608417, 1, 'admin', 76, '-', '-', 'Element management'),
(433, 1368608433, 1, 'admin', 77, '-', 'New Chunk', 'Creating a new Chunk (HTML Snippet)'),
(434, 1368608472, 1, 'admin', 79, '-', '-', 'Saving Chunk (HTML Snippet)'),
(435, 1368608472, 1, 'admin', 78, '7', 'title-h1', 'Editing Chunk (HTML Snippet)'),
(436, 1368608498, 1, 'admin', 76, '-', '-', 'Element management'),
(437, 1368608500, 1, 'admin', 16, '3', 'Главная страница', 'Editing template'),
(438, 1368608505, 1, 'admin', 20, '3', '-', 'Saving template'),
(439, 1368608505, 1, 'admin', 16, '3', 'Главная страница', 'Editing template'),
(440, 1368608516, 1, 'admin', 20, '3', '-', 'Saving template'),
(441, 1368608516, 1, 'admin', 16, '3', 'Главная страница', 'Editing template'),
(442, 1368608524, 1, 'admin', 76, '-', '-', 'Element management'),
(443, 1368608528, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(444, 1368608534, 1, 'admin', 79, '1', '-', 'Saving Chunk (HTML Snippet)'),
(445, 1368608534, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(446, 1368608535, 1, 'admin', 27, '1', '-', 'Editing resource'),
(447, 1368608537, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(448, 1368608542, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(449, 1368608550, 1, 'admin', 108, '2', 'EvoGallery', 'Edit module'),
(450, 1368608568, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(451, 1368608569, 1, 'admin', 76, '-', '-', 'Element management'),
(452, 1368608572, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(453, 1368608577, 1, 'admin', 79, '1', '-', 'Saving Chunk (HTML Snippet)'),
(454, 1368608577, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(455, 1368608578, 1, 'admin', 27, '1', '-', 'Editing resource'),
(456, 1368608579, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(457, 1368608581, 1, 'admin', 76, '-', '-', 'Element management'),
(458, 1368608583, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(459, 1368608587, 1, 'admin', 79, '1', '-', 'Saving Chunk (HTML Snippet)'),
(460, 1368608587, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(461, 1368608588, 1, 'admin', 76, '-', '-', 'Element management'),
(462, 1368608589, 1, 'admin', 27, '1', '-', 'Editing resource'),
(463, 1368608590, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(464, 1368608595, 1, 'admin', 27, '1', '-', 'Editing resource'),
(465, 1368608596, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(466, 1368608688, 1, 'admin', 76, '-', '-', 'Element management'),
(467, 1368609018, 1, 'admin', 76, '-', '-', 'Element management'),
(468, 1368609164, 1, 'admin', 76, '-', '-', 'Element management'),
(469, 1368609166, 1, 'admin', 76, '-', '-', 'Element management'),
(470, 1368609172, 1, 'admin', 101, '-', 'New Plugin', 'Create new plugin'),
(471, 1368609232, 1, 'admin', 103, '-', '-', 'Saving plugin'),
(472, 1368609232, 1, 'admin', 102, '11', 'PHx', 'Edit plugin'),
(473, 1368609374, 1, 'admin', 27, '1', '-', 'Editing resource'),
(474, 1368609374, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(475, 1368610270, 1, 'admin', 76, '-', '-', 'Element management'),
(476, 1368610278, 1, 'admin', 76, '-', '-', 'Element management'),
(477, 1368610281, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(478, 1368610331, 1, 'admin', 27, '1', '-', 'Editing resource'),
(479, 1368610332, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(480, 1368610354, 1, 'admin', 27, '1', '-', 'Editing resource'),
(481, 1368610354, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(482, 1368610357, 1, 'admin', 76, '-', '-', 'Element management'),
(483, 1368610358, 1, 'admin', 78, '6', 'tilte', 'Editing Chunk (HTML Snippet)'),
(484, 1368610455, 1, 'admin', 76, '-', '-', 'Element management'),
(485, 1368610580, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(486, 1368610595, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(487, 1368610595, 1, 'admin', 22, '18', 'phx:phpthumbof', 'Editing Snippet'),
(488, 1368610596, 1, 'admin', 76, '-', '-', 'Element management'),
(489, 1368610599, 1, 'admin', 22, '18', 'phx:phpthumbof', 'Editing Snippet'),
(490, 1368610605, 1, 'admin', 24, '18', '-', 'Saving Snippet'),
(491, 1368610605, 1, 'admin', 22, '18', 'phx:phpthumbof', 'Editing Snippet'),
(492, 1368610607, 1, 'admin', 76, '-', '-', 'Element management'),
(493, 1368610610, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(494, 1368610633, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(495, 1368610633, 1, 'admin', 22, '19', 'phx:docfield', 'Editing Snippet'),
(496, 1368610638, 1, 'admin', 24, '19', '-', 'Saving Snippet'),
(497, 1368610638, 1, 'admin', 22, '19', 'phx:docfield', 'Editing Snippet'),
(498, 1368610639, 1, 'admin', 76, '-', '-', 'Element management'),
(499, 1368610643, 1, 'admin', 23, '-', 'New snippet', 'Creating a new Snippet'),
(500, 1368610671, 1, 'admin', 24, '-', '-', 'Saving Snippet'),
(501, 1368610671, 1, 'admin', 22, '20', 'phx:rusdate', 'Editing Snippet'),
(502, 1368610672, 1, 'admin', 76, '-', '-', 'Element management'),
(503, 1368611185, 1, 'admin', 76, '-', '-', 'Element management'),
(504, 1368611187, 1, 'admin', 22, '16', 'Ditto', 'Editing Snippet'),
(505, 1368611194, 1, 'admin', 76, '-', '-', 'Element management'),
(506, 1368611510, 1, 'admin', 76, '-', '-', 'Element management'),
(507, 1368611512, 1, 'admin', 22, '7', 'MemberCheck', 'Editing Snippet'),
(508, 1368611534, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(509, 1368611536, 1, 'admin', 76, '-', '-', 'Element management'),
(510, 1368611538, 1, 'admin', 78, '3', 'header-css', 'Editing Chunk (HTML Snippet)'),
(511, 1368611552, 1, 'admin', 76, '-', '-', 'Element management'),
(512, 1368611555, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(513, 1368611588, 1, 'admin', 76, '-', '-', 'Element management'),
(514, 1368611589, 1, 'admin', 102, '4', 'ManagerManager', 'Edit plugin'),
(515, 1368611765, 1, 'admin', 76, '-', '-', 'Element management'),
(516, 1368611767, 1, 'admin', 102, '9', 'EditArea', 'Edit plugin'),
(517, 1368611911, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(518, 1368611913, 1, 'admin', 76, '-', '-', 'Element management'),
(519, 1368611915, 1, 'admin', 22, '11', 'Reflect', 'Editing Snippet'),
(520, 1368611986, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(521, 1368611988, 1, 'admin', 76, '-', '-', 'Element management'),
(522, 1368611990, 1, 'admin', 78, '4', 'header-js', 'Editing Chunk (HTML Snippet)'),
(523, 1368612012, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(524, 1368612014, 1, 'admin', 76, '-', '-', 'Element management'),
(525, 1368612016, 1, 'admin', 78, '5', 'header-meta', 'Editing Chunk (HTML Snippet)'),
(526, 1368612259, 1, 'admin', 76, '-', '-', 'Element management'),
(527, 1368612262, 1, 'admin', 22, '12', 'Personalize', 'Editing Snippet'),
(528, 1370676839, 1, 'admin', 27, '1', '-', 'Editing resource'),
(529, 1370676839, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(530, 1370676917, 1, 'admin', 27, '1', '-', 'Editing resource'),
(531, 1370676917, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(532, 1370676926, 1, 'admin', 26, '-', '-', 'Refreshing site'),
(533, 1370676928, 1, 'admin', 27, '1', '-', 'Editing resource'),
(534, 1370676928, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(535, 1370676932, 1, 'admin', 76, '-', '-', 'Element management'),
(536, 1370677030, 1, 'admin', 17, '-', '-', 'Editing settings'),
(537, 1370677041, 1, 'admin', 30, '-', '-', 'Saving settings');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_users`
--

CREATE TABLE IF NOT EXISTS `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_manager_users`
--

INSERT INTO `modx_manager_users` (`id`, `username`, `password`) VALUES
(1, 'admin', 'uncrypt>fe5149fab74f2d272cb68c2c8510af7c1115edcc');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_member_groups`
--

CREATE TABLE IF NOT EXISTS `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_portfolio_galleries`
--

CREATE TABLE IF NOT EXISTS `modx_portfolio_galleries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `keywords` text NOT NULL,
  `sortorder` smallint(7) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content`
--

CREATE TABLE IF NOT EXISTS `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '1',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0',
  `publishedby` int(10) NOT NULL DEFAULT '0',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`) VALUES
(1, 'document', 'text/html', 'MODX CMS Install Success', 'Welcome to the MODX Content Management System', '', 'minimal-base', '', 1, 0, 0, 0, 0, '', '<h3>Install Successful!</h3>\r\n<p>You have successfully installed MODX.</p>\r\n<h3>Getting Help</h3>\r\n<p>The <a href="http://forums.modx.com/" target="_blank">MODX Community</a> provides a great starting point to learn all things MODX, or you can also <a href="http://modxcms.com/learn/it.html">see some great learning resources</a> (books, tutorials, blogs and screencasts).</p>\r\n<p>Welcome to MODX!</p>', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1368607498, 0, 0, 0, 1130304721, 1, 'Base Install', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_htmlsnippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(1, 'mm_demo_rules', 'Default ManagerManager rules. Should be modified for your own sites.', 0, 8, 0, '// For everyone\r\nmm_default(''pub_date'');\r\nmm_default(''hide_menu'',true);\r\n\r\nmm_renameField(''template'',''Тип ресурса'');\r\nmm_changeFieldHelp(''template'', ''Выберите тип ресурса, в зависимости от типа изменяется его отображение'');\r\n\r\nmm_renameField(''longtitle'',''Заголовок title'');\r\n\r\nmm_renameField(''description'',''Заголовок h1'');\r\nmm_changeFieldHelp(''description'', ''Выводит на странице заголовок h1'');\r\n\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\n//mm_hideFields(''link_attributes'');\r\n//mm_hideFields(''description'');\r\n//mm_hideFields(''introtext'');\r\n//mm_hideFields(''template'');\r\n//mm_hideFields(''longtitle'');\r\n//mm_hideFields(''alias'');\r\n//mm_hideFields(''content'');\r\n//mm_hideFields(''menutitle'');\r\n\r\n// Перекидываем SEO\r\nmm_createTab(''SEO'', ''seo'', '''' );\r\nmm_moveFieldsToTab(''description,longtitle,meta-keywords,meta-description,seoOverride'', ''seo'', '''');\r\n\r\n// То, что нужно только админу\r\n//mm_widget_accessdenied(''36,69,26,30,34,43,44,50,63,75,81,84'',''<span>Доступ закрыт</span>Доступ к этому документу закрыт из соображений администратора.'',''!1'');\r\n\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\n//EvoGallery\r\nmm_widget_evogallery(2, ''Фотографии'', '''', ''3'');', 0),
(3, 'header-css', 'Подключения CSS файлов ', 0, 8, 0, '<base href="[(site_url)]" />\r\n<link href="css/styles.css" rel="stylesheet" type="text/css" />\r\n<link href="css/lightbox.css" rel="stylesheet" type="text/css" />\r\n<link href="css/nivo-slider.css" rel="stylesheet" type="text/css" />\r\n<link rel="icon" href="images/favicon.ico" type="image/vnd.microsoft.icon" />', 0),
(4, 'header-js', 'Подключения JavaScript', 0, 8, 0, '<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>', 0),
(5, 'header-meta', 'header-meta', 0, 8, 0, '<title>{{title}}</title>\r\n<base href="[(site_url)]"  />\r\n<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />\r\n<meta name="Keywords" content="[*meta-keywords*]" />\r\n<meta name="description" content="[*meta-description*]" />', 0),
(6, 'tilte', 'Заголовок страниц', 0, 10, 0, '[*longtitle:ne=``:then=`[*longtitle*]`:else=`[*pagetitle*]`*]', 0),
(7, 'title-h1', '', 0, 0, 0, '[*description:ne=``:then=`[*description*]`:else=`[*pagetitle*]`*]', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_keywords`
--

CREATE TABLE IF NOT EXISTS `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_modules`
--

CREATE TABLE IF NOT EXISTS `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Modules' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `modx_site_modules`
--

INSERT INTO `modx_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 3, 0, 0, '', 0, '', 0, 0, '', 1, '', 'include_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'EvoGallery', '<strong>1.1 Beta 1</strong> Gallery Management Module', 0, 0, 3, 0, 0, '', 0, '', 0, 0, '23636a8c613426979b9dea1ff0415abf', 1, '&docId=Root Document ID;integer;0 &phpthumbImage=PHPThumb config for images in JSON;textarea;{''w'': 940, ''h'': 940, ''q'': 95} &phpthumbThumb=PHPThumb config for thumbs in JSON;textarea;{''w'': 175, ''h'': 175, ''q'': 75} &savePath=Save path;string;assets/galleries &keepOriginal=Keep original images;list;Yes,No;Yes &randomFilenames=Random filenames;list;Yes,No;No', '/**\n * EvoGallery\n * Gallery Management Module\n * Written by Brian Stanback\n * jQuery rewrite and updates by Jeff Whitfield <jeff@collabpad.com>\n */\n\n$params[''modulePath''] = $modx->config[''base_path''].''assets/modules/evogallery/'';\ninclude_once($params[''modulePath''] . "classes/maketable.class.inc.php");\ninclude_once($params[''modulePath''] . "classes/management.class.inc.php");\n\nif (class_exists(''GalleryManagement''))\n	$manager = new GalleryManagement($params);\nelse\n	$modx->logEvent(1, 3, ''Error loading Portfolio Galleries management module'');\n\n$manager->checkGalleryTable();\n\necho $manager->execute();\n');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_depobj`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Module Dependencies' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_site_module_depobj`
--

INSERT INTO `modx_site_module_depobj` (`id`, `module`, `resource`, `type`) VALUES
(1, 2, 10, 30);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugins`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `modx_site_plugins`
--

INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'Quick Manager+', '<strong>1.5.5</strong> Enables QuickManager+ front end content editing support', 0, 3, 0, '// In manager\r\nif (isset($_SESSION[''mgrValidated''])) {\r\n\r\n    $show = TRUE;\r\n\r\n    if ($disabled  != '''') {\r\n        $arr = explode(",", $disabled );\r\n        if (in_array($modx->documentIdentifier, $arr)) {\r\n            $show = FALSE;\r\n        }\r\n    }\r\n\r\n    if ($show) {\r\n        // Replace [*#tv*] with QM+ edit TV button placeholders\r\n        if ($tvbuttons == ''true'') {\r\n            $e = $modx->Event;\r\n            if ($e->name == ''OnParseDocument'') {\r\n                 $output = &$modx->documentOutput;\r\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\r\n                 $modx->documentOutput = $output;\r\n             }\r\n         }\r\n        // In manager\r\n        if (isset($_SESSION[''mgrValidated''])) {\r\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\r\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\r\n        }\r\n    }\r\n}', 0, '&1=undefined;; &jqpath=Path to jQuery;text;assets/js/jquery-1.4.4.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ' '),
(2, 'Search Highlight', '<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results', 0, 4, 0, '/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.modx.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://modxcms.com/forums/index.php/topic,1237.0.html\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  ''utf8'' => ''UTF-8'',\n  ''latin1'' => ''ISO-8859-1'',\n  ''latin2'' => ''ISO-8859-2''\n);\n\nif (isset($_REQUEST[''searched'']) && isset($_REQUEST[''highlight''])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = ''<div class="searchTerms">Search Terms: '';\n     $removeText = ''Remove Highlighting'';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = ''oneword'';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[''searched'']));\n    $highlight = strip_tags(stripslashes($_REQUEST[''highlight'']));\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags(stripslashes($_REQUEST[''advsearch'']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[''searched'']);\n    $highlight = strip_tags($_REQUEST[''highlight'']);\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags($_REQUEST[''advsearch'']);\n  }\n\n  if ($advsearch != ''nowords'') {\n\n    $searchArray = array();\n    if ($advsearch == ''exactphrase'') $searchArray[0] = $searched;\n    else $searchArray = explode('' '', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(''term'' => $word, ''class'' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode("<body", $output); // break out the head\n\n    $highlightClass = explode('' '',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(''/[^A-Za-z0-9_-]/ms'', $value) == 1 ? '''' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == ''UTF-8'') ? ''iu'' : ''i'';\n    $lookBehind = ''/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)'';  // avoid a match with a html entity\n    $lookAhead = ''(?=[^>]*<)/''; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][''term''];\n      $class = $highlightClass[0].'' ''.$highlightClass[$searchTerms[$i][''class'']];\n\n      $highlightText .= ($i > 0) ? '', '' : '''';\n      $highlightText .= ''<span class="''.$class.''">''.$word.''</span>'';\n\n      $pattern = $lookBehind . preg_quote($word, ''/'') . $lookAhead . $pcreModifier;\n      $replacement = ''<span class="'' . $class . ''">${0}</span>'';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode("<body", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= ''<br /><a href="''.$removeUrl.''" class="ajaxSearch_removeHighlight">''.$removeText.''</a></div>'';\n\n    $output = str_replace(''<!--search_terms-->'',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}', 0, '', 0, ''),
(3, 'TinyMCE Rich Text Editor', '<strong>3.5.8</strong> Javascript WYSIWYG Editor', 0, 3, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce/plugin.tinymce.php'';\r\n', 0, '&customparams=Custom Parameters;textarea;valid_elements : "*[*]", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;95% &height=Height;text;500', 0, ' '),
(4, 'ManagerManager', '<strong>0.3.9</strong> Customize the MODx Manager to offer bespoke admin functions for end users.', 0, 3, 0, '// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php\n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end\n\n// ManagerManager requires jQuery 1.3+\n// The URL to the jQuery library. Choose from the configuration tab whether you want to use\n// a local copy (which defaults to the jQuery library distributed with ModX 1.0.1)\n// a remote copy (which defaults to the Google Code hosted version)\n// or specify a URL to a custom location.\n// Here we set some default values, because this is a convenient place to change them if we need to,\n// but you should configure your preference via the Configuration tab.\n$js_default_url_local = $modx->config[''site_url'']. ''/assets/js/jquery-1.4.4.min.js'';\n$js_default_url_remote = ''http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'';\n\n// You don''t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\n$asset_path = $modx->config[''base_path''] . ''assets/plugins/managermanager/mm.inc.php'';\ninclude $asset_path;', 0, '&config_chunk=Configuration Chunk;text;mm_demo_rules; &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &which_jquery=jQuery source;list;local (assets/js),remote (google code),manual url (specify below);local (assets/js) &js_src_type=jQuery URL override;text;', 0, ''),
(5, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 3, 0, 'if(!class_exists(''ForgotManagerPassword'')) {\n    class ForgotManagerPassword{\n        function ForgotManagerPassword(){\n            $this->errors = array();\n            $this->checkLang();\n        }\n\n        function getLink() {\n            global $_lang;\n\n            $link = <<<EOD\n<a id="ForgotManagerPassword-show_form" href="index.php?action=show_form">{$_lang[''forgot_your_password'']}</a>\nEOD;\n\n            return $link;\n        }\n\n        function getForm() {\n            global $_lang;\n\n            $form = <<<EOD\n<label id="FMP-email_label" for="FMP_email">{$_lang[''account_email'']}:</label>\n<input id="FMP-email" type="text" />\n<button id="FMP-email_button" type="button" onclick="window.location = ''index.php?action=send_email&email=''+document.getElementById(''FMP-email'').value;">{$_lang[''send'']}</button>\nEOD;\n\n            return $form;\n        }\n\n        /* Get user info including a hash unique to this user, password, and day */\n        function getUser($user_id=false, $username='''', $email='''', $hash='''') {\n            global $modx, $_lang;\n\n            $user_id = $user_id == false ? false : $modx->db->escape($user_id);\n            $username = $modx->db->escape($username);\n            $email = $modx->db->escape($email);\n            $hash = $modx->db->escape($hash);\n\n            $pre = $modx->db->config[''table_prefix''];\n            $site_id = $modx->config[''site_id''];\n            $today = date(''Yz''); // Year and day of the year\n            $wheres = array();\n            $where = '''';\n            $user = null;\n\n            if($user_id !== false) { $wheres[] = "usr.id = ''{$user_id}''"; }\n            if(!empty($username)) { $wheres[] = "usr.username = ''{$username}''"; }\n            if(!empty($email)) { $wheres[] = "attr.email = ''{$email}''"; }\n            if(!empty($hash)) { $wheres[] = "MD5(CONCAT(usr.username,usr.password,''{$site_id}'',''{$today}'')) = ''{$hash}''"; }\n\n            if($wheres) {\n                $where = '' WHERE ''.implode('' AND '',$wheres);\n                $sql = "SELECT usr.id, usr.username, attr.email, MD5(CONCAT(usr.username,usr.password,''{$site_id}'',''{$today}'')) AS hash\n                    FROM `{$pre}manager_users` usr\n                    INNER JOIN `{$pre}user_attributes` attr ON usr.id = attr.internalKey\n                    {$where}\n                    LIMIT 1;";\n\n                if($result = $modx->db->query($sql)){\n                    if($modx->db->getRecordCount($result)==1) {\n                        $user = $modx->db->getRow($result);\n                    }\n                }\n            }\n\n            if($user == null) { $this->errors[] = $_lang[''could_not_find_user'']; }\n\n            return $user;\n        }\n\n\n\n        /* Send an email with a link to login */\n        function sendEmail($to) {\n            global $modx, $_lang;\n\n            $subject = $_lang[''password_change_request''];\n            $headers  = "MIME-Version: 1.0\\r\\n".\n                "Content-type: text/html; charset=\\"{$modx->config[''modx_charset'']}\\"\\r\\n".\n                "From: MODx <{$modx->config[''emailsender'']}>\\r\\n".\n                "Reply-To: no-reply@{$_SERVER[''HTTP_HOST'']}\\r\\n".\n                "X-Mailer: PHP/".phpversion();\n\n            $user = $this->getUser(0, '''', $to);\n\n            if($user[''username'']) {\n                $body = <<<EOD\n<p>{$_lang[''forgot_password_email_intro'']} <a href="{$modx->config[''site_url'']}manager/processors/login.processor.php?username={$user[''username'']}&hash={$user[''hash'']}">{$_lang[''forgot_password_email_link'']}</a></p>\n<p>{$_lang[''forgot_password_email_instructions'']}</p>\n<p><small>{$_lang[''forgot_password_email_fine_print'']}</small></p>\nEOD;\n\n                $mail = mail($to, $subject, $body, $headers);\n                if(!$mail) { $this->errors[] = $_lang[''error_sending_email'']; }\n\n                return $mail;\n            }\n        }\n\n        function unblockUser($user_id) {\n            global $modx, $_lang;\n\n            $pre = $modx->db->config[''table_prefix''];\n            $modx->db->update(array(''blocked'' => 0, ''blockeduntil'' => 0, ''failedlogincount'' => 0), "`{$pre}user_attributes`", "internalKey = ''{$user_id}''");\n\n            if(!$modx->db->getAffectedRows()) { $this->errors[] = $_lang[''user_doesnt_exist'']; return; }\n\n            return true;\n        }\n\n        function checkLang() {\n            global $_lang;\n\n            $eng = array();\n            $eng[''forgot_your_password''] = ''Forgot your password?'';\n            $eng[''account_email''] = ''Account email'';\n            $eng[''send''] = ''Send'';\n            $eng[''password_change_request''] = ''Password change request'';\n            $eng[''forgot_password_email_intro''] = ''A request has been made to change the password on your account.'';\n            $eng[''forgot_password_email_link''] = ''Click here to complete the process.'';\n            $eng[''forgot_password_email_instructions''] = ''From there you will be able to change your password from the My Account menu.'';\n            $eng[''forgot_password_email_fine_print''] = ''* The URL above will expire once you change your password or after today.'';\n            $eng[''error_sending_email''] = ''Error sending email'';\n            $eng[''could_not_find_user''] = ''Could not find user'';\n            $eng[''user_doesnt_exist''] = ''User does not exist'';\n            $eng[''email_sent''] = ''Email sent'';\n\n            foreach($eng as $key=>$value) {\n                if(empty($_lang[$key])) { $_lang[$key] = $value; }\n            }\n        }\n\n        function getErrorOutput() {\n            $output = '''';\n\n            if($this->errors) {\n                $output = ''<span class="error">''.implode(''</span><span class="errors">'', $this->errors).''</span>'';\n            }\n\n            return $output;\n        }\n    }\n}\n\nglobal $_lang;\n\n$output = '''';\n$event_name = $modx->Event->name;\n$action = (empty($_GET[''action'']) ? '''' : (is_string($_GET[''action'']) ? $_GET[''action''] : ''''));\n$username = (empty($_GET[''username'']) ? false : (is_string($_GET[''username'']) ? $_GET[''username''] : ''''));\n$to = (empty($_GET[''email'']) ? '''' : (is_string($_GET[''email'']) ? $_GET[''email''] : ''''));\n$hash = (empty($_GET[''hash'']) ? false : (is_string($_GET[''hash'']) ? $_GET[''hash''] : ''''));\n$forgot = new ForgotManagerPassword();\n\nif($event_name == ''OnManagerLoginFormRender'') {\n    switch($action) {\n        case ''show_form'':\n            $output = $forgot->getForm();\n            break;\n        case ''send_email'':\n            if($forgot->sendEmail($to)) { $output = $_lang[''email_sent'']; }\n            break;\n        default:\n            $output = $forgot->getLink();\n            break;\n    }\n\n    if($forgot->errors) { $output = $forgot->getErrorOutput() . $forgot->getLink(); }\n}\n\nif($event_name == ''OnBeforeManagerLogin'' && $hash && $username) {\n    $user = $forgot->getUser(false, $username, '''', $hash);\n    if($user && is_array($user) && !$forgot->errors) {\n        $forgot->unblockUser($user[''id'']);\n    }\n}\n\nif($event_name == ''OnManagerAuthentication'' && $hash && $username) {\n    $user = $forgot->getUser(false, $username, '''', $hash);\n    $output = ($user !== null && count($forgot->errors) == 0) ? true : false;\n}\n\n$modx->Event->output($output);\n', 0, '', 0, ''),
(6, 'TransAlias', '<strong>1.0.2</strong> Human readible URL translation supporting multiple languages and overrides', 0, 3, 0, '/*\r\n * Initialize parameters\r\n */\r\nif (!isset ($alias)) { return ; }\r\nif (!isset ($plugin_dir) ) { $plugin_dir = ''transalias''; }\r\nif (!isset ($plugin_path) ) { $plugin_path = $modx->config[''base_path''].''assets/plugins/''.$plugin_dir; }\r\nif (!isset ($table_name)) { $table_name = ''common''; }\r\nif (!isset ($char_restrict)) { $char_restrict = ''lowercase alphanumeric''; }\r\nif (!isset ($remove_periods)) { $remove_periods = ''No''; }\r\nif (!isset ($word_separator)) { $word_separator = ''dash''; }\r\nif (!isset ($override_tv)) { $override_tv = ''''; }\r\n\r\nif (!class_exists(''TransAlias'')) {\r\n    require_once $plugin_path.''/transalias.class.php'';\r\n}\r\n$trans = new TransAlias($modx);\r\n\r\n/*\r\n * see if TV overrides the table name\r\n */\r\nif(!empty($override_tv)) {\r\n    $tvval = $trans->getTVValue($override_tv);\r\n    if(!empty($tvval)) {\r\n        $table_name = $tvval;\r\n    }\r\n}\r\n\r\n/*\r\n * Handle events\r\n */\r\n$e =& $modx->event;\r\nswitch ($e->name ) {\r\n    case ''OnStripAlias'':\r\n        if ($trans->loadTable($table_name, $remove_periods)) {\r\n            $output = $trans->stripAlias($alias,$char_restrict,$word_separator);\r\n            $e->output($output);\r\n            $e->stopPropagation();\r\n        }\r\n        break ;\r\n    default:\r\n        return ;\r\n}', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;legal characters &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, ' '),
(10, 'EvoGallery', '<strong>1.1 Beta 1</strong> Plugin for delete images on empty trash', 0, 3, 0, 'if (!isset($params[''modulePath''])) $params[''modulePath''] = $modx->config[''base_path''].''assets/modules/evogallery/'';\ninclude_once($params[''modulePath''] . "classes/management.class.inc.php");\nif (class_exists(''GalleryManagement''))\n	$manager = new GalleryManagement($params);\nelse\n	$modx->logEvent(1, 3, ''Error loading Portfolio Galleries management module'');\n$e =& $modx->event;\nswitch ($e->name ) {\n    case ''OnEmptyTrash'':\n		$manager->deleteImages(''contentid'',$ids);\n		break ;\n    default:\n        return ;\n}\n', 0, '', 0, '23636a8c613426979b9dea1ff0415abf'),
(9, 'EditArea', 'подсветка кода', 0, 3, 0, '$e = & $modx->Event;\r\nswitch ($e->name) { \r\n	case "OnRichTextEditorRegister":\r\n		$e->output("EditArea");\r\n		break;\r\n\r\n	case "OnRichTextEditorInit":\r\n		if($editor=="EditArea") {\r\n			$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/edit_area/edit_area_full.js"></script>'');\r\n			$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/ea_functions.js"></script>'');\r\n			foreach($elements as $element) {\r\n				$e->output(''<script type="text/javascript">initEditArea("''.$element.''", "''.$modx->config[''manager_language''].''", "html")</script>'');\r\n			}\r\n		}		\r\n		break;\r\n\r\n	case "OnChunkFormPrerender":\r\n		global $which_editor;\r\n		$which_editor = ''EditArea'';\r\n		break;\r\n\r\n	case "OnSnipFormRender":\r\n	case "OnPluginFormRender":	\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/edit_area/edit_area_full.js"></script>'');\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/ea_functions.js"></script>'');\r\n		$e->output(''<script type="text/javascript">initEditArea("post", "''.$modx->config[''manager_language''].''", "php")</script>'');\r\n		break;\r\n		\r\n	case "OnTempFormRender":\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/edit_area/edit_area_full.js"></script>'');\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/ea_functions.js"></script>'');\r\n		$e->output(''<script type="text/javascript">initEditArea("post", "''.$modx->config[''manager_language''].''", "html")</script>'');\r\n		break;\r\n	default :\r\n		return; // stop here - this is very important. \r\n		break; \r\n}', 0, '', 0, ' '),
(8, 'Always stay', 'всегда продолжить', 0, 8, 0, '$e = & $modx->Event;\r\nif ($e->name == "OnDocFormRender" ||\r\n    $e->name == "OnTempFormRender" ||\r\n    $e->name == "OnChunkFormRender" ||\r\n    $e->name == "OnSnipFormRender" ||\r\n    $e->name == "OnPluginFormRender"\r\n   ) {\r\n      $html = "\r\n          <script type=''text/javascript''>\r\n            if(!$(''stay'').value) $(''stay'').value=2;\r\n          </script>\r\n      ";\r\n      $e->output($html);\r\n}', 0, '', 0, ' '),
(11, 'PHx', 'Placeholders Extended', 0, 0, 0, '//<?php\r\n/**\r\n * phx \r\n * \r\n * (Placeholders Xtended) Adds the capability of output modifiers when using placeholders, template variables and settings tags\r\n *\r\n * @category    plugin\r\n * @version     2.1.4\r\n * @author		Armand "bS" Pondman (apondman@zerobarrier.nl)\r\n * @internal    @properties &phxdebug=Log events;int;0 &phxmaxpass=Max. Passes;int;50\r\n * @internal    @events OnParseDocument\r\n * @internal    @modx_category Manager and Admin\r\n */\r\n\r\ninclude_once $modx->config[''rb_base_dir''] . "plugins/phx/phx.parser.class.inc.php";\r\n\r\n$e = &$modx->Event;\r\n\r\n$PHx = new PHxParser($phxdebug,$phxmaxpass);\r\n\r\nswitch($e->name) {\r\n	case ''OnParseDocument'':\r\n		$PHx->OnParseDocument();\r\n		break;\r\n\r\n}', 0, '&phxdebug=Log events;int;0 &phxmaxpass=Max. Passes;int;50', 0, ' ');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `modx_site_plugin_events`
--

INSERT INTO `modx_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 31, 0),
(1, 28, 0),
(1, 13, 0),
(1, 3, 0),
(1, 92, 0),
(2, 3, 0),
(3, 85, 0),
(3, 87, 1),
(3, 88, 1),
(4, 28, 0),
(4, 29, 0),
(4, 35, 1),
(4, 53, 0),
(5, 80, 0),
(5, 81, 0),
(5, 93, 0),
(6, 100, 0),
(10, 98, 0),
(9, 47, 0),
(9, 41, 0),
(9, 87, 0),
(9, 88, 0),
(9, 35, 0),
(8, 47, 1),
(8, 41, 1),
(8, 35, 2),
(8, 29, 1),
(8, 23, 1),
(9, 22, 0),
(11, 92, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_snippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=21 ;

--
-- Дамп данных таблицы `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'AjaxSearch', '<strong>1.9.2</strong> Ajax and non-Ajax search that supports results highlighting', 0, 4, 0, '/**\n--------------------------------------------------------------------------------\n:: Preamble\n--------------------------------------------------------------------------------\nThe release 1.9 looks like the previous release, but it is a completely\nrefactored development.\n\nIt is partially based on the previous releases of AjaxSearch written by the\nfollowing authors:\n\n Coroico <coroico@wangba.fr>\n Jason Coward <jason@opengeek.com>\n Kyle Jaebker <kjaebker@muddydogpaws.com>\n Ryan Thrash  <ryan@vertexworks.com>\n\n--------------------------------------------------------------------------------\n:: Description\n--------------------------------------------------------------------------------\n\n        Ajax and non-Ajax search that supports results highlighting.\n\nThis snippet adds AJAX functionality on top of the robust content searching.\n\nWhat AjaxSearch do:\n- search in fields of the content an TV MODx tables\n- several customizable input forms available\n- search in a subset of documents\n- highlighting of searchword in the results returned\n- allow a filtering of search results\n- displaying of search results customizable thru templates\n- group the search results by categories\n- filter features (allow to set up specific search forms)\n\nIt could works in two modes:\n\najax mode :\n- search results displayed in current page through AJAX request\n- multiple search options including live search\n- available link to view all results in a new page when only a subset is returned\n- customize the number of results returned\n- offer two types for paginating the results\n- uses the MooTools or JQuery js library for AJAX and visual effects\n\nnon-ajax mode :\n- search results displayed in a new page or below on the same page\n- offer two types for paginating the results\n- works without JS enabled\n\nWhat AjaxSearch don''t :\n- search in dynamic content. AjaxSearch could retreive only data stored in\ndatabase. It can''t find something stored in a chunk or generated by a snippet.\n\nMORE : See the ajaxSearch.readme.txt file for more informations. \n\n----------------------------------------------------------------------------- */\n\n// ajaxSearch version being executed\ndefine(''AS_VERSION'', ''1.9.2'');\n// Path where ajaxSearch is installed\ndefine(''AS_SPATH'', ''assets/snippets/ajaxSearch/'');\n//include snippet file\ndefine(''AS_PATH'', MODX_BASE_PATH . AS_SPATH);\n\n//------------------------------------------------------------------------------\n// Configuration - general AjaxSearch snippet setup options\n//------------------------------------------------------------------------------\nglobal $modx;\n$tstart = $modx->getMicroTime();\n\n$cfg = array(); // current configuration\n$cfg[''version''] = AS_VERSION;\n\n// Load the default configuration $dcfg to get the default values\n$default = AS_PATH . ''configs/default.config.php'';\nif (file_exists($default)) include $default;\nelse return "<h3>AjaxSearch error: $default not found !<br />Check the existing of this file!</h3>";\nif (!isset($dcfg)) return "<h3>AjaxSearch error: default configuration array not defined in $default!<br /> Check the content of this file!</h3>";\n\nif ($dcfg[''version''] != AS_VERSION) return "<h3>AjaxSearch error: Version number mismatch. Check the content of the default configuration file!</h3>";\n\n// check the possible use of deprecated parameters (since 1.8.5)\n$readme = "ajaxSearch_version_192.txt";\nif (isset($searchWordList)) return "<h3>AjaxSearch error: searchWordList is a deprecated parameter. Read " . $readme . " file.</h3>";\nif (isset($resultsPage)) return "<h3>AjaxSearch error: resultsPage is a deprecated parameter. Read " . $readme . " file.</h3>";\nif (isset($AS_showForm)) return "<h3>AjaxSearch error: AS_showForm parameter has been renamed showInputForm. Read " . $readme . " file.</h3>";\nif (isset($AS_landing)) return "<h3>AjaxSearch error: AS_landing parameter has been renamed landingPage. Read " . $readme . " file.</h3>";\nif (isset($AS_showResults)) return "<h3>AjaxSearch error: AS_showResults parameter has been renamed showResults. Read " . $readme . " file.</h3>";\n\n// Load a custom configuration file if required\n// config_name - Other config installed in the configs folder or in any folder within the MODx base path via @FILE\n// Configuration files should be named in the form: <config_name>.config.php\n// Default: '''' - no custom config\n$cfg[''config''] = isset($config) ? $config : $dcfg[''config''];\nif ($cfg[''config'']) {\n    $config = $cfg[''config''];\n    $lconfig = (substr($config, 0, 6) != "@FILE:") ? AS_PATH . "configs/$config.config.php" : $modx->config[''base_path''] . trim(substr($config, 6, strlen($config)-6));\n    if (file_exists($lconfig)) include $lconfig;\n    else return "<h3>AjaxSearch error: " . $lconfig . " not found !<br />Check your config parameter or your config file name!</h3>";\n}\n\n// &debug = [ 0 | 1 | 2 | 3 ]\n// 1,2,3 : File mode - Output logged into a file named ajaxSearch_log.txt in ajaxSearch/debug/ directory.\n// this directory should be writable.\n// Default: 0 - no logs\n$cfg[''debug''] = isset($debug) ? $debug : (isset($__debug) ? $__debug : $dcfg[''debug'']);\n\n// &timeLimit = [ int | 60 ]\n// Max execution time in seconds for the AjaxSearch script\n// 0 - If set to zero, no time limit is imposed\n// Default: 60 - 1 minute.\n$cfg[''timeLimit''] = isset($timeLimit) ? $timeLimit : (isset($__timeLimit) ? $__timeLimit : $dcfg[''timeLimit'']);\n\n// &language [ language_name | manager_language ] (optional)\n// Default: $modx->config[''manager_language''] - manager language used\n$cfg[''language''] = isset($language) ? $language : (isset($__language) ? $__language : $dcfg[''language'']);\n\n// &ajaxSearch [1 | 0] (as passed in snippet variable ONLY)\n// Use this to display the search results using ajax You must include the Mootools library in your template\n// Default: 1 - ajax mode selected\n$cfg[''ajaxSearch''] = isset($ajaxSearch) ? $ajaxSearch : (isset($__ajaxSearch) ? $__ajaxSearch : $dcfg[''ajaxSearch'']);\n\n// &advSearch [ ''exactphrase'' | ''allwords'' | ''nowords'' | ''oneword'' ]\n// Advanced search:\n// - exactphrase : provides the documents which contain the exact phrase\n// - allwords : provides the documents which contain all the words\n// - nowords : provides the documents which do not contain the words\n// - oneword : provides the document which contain at least one word\n// Default: ''oneword''\n$cfg[''advSearch''] = isset($advSearch) ? $advSearch : (isset($__advSearch) ? $__advSearch : $dcfg[''advSearch'']);\n\n// &asId - Unique id for AjaxSearch instance\n// this allows to distinguish several Ajaxsearch instances on the same page\n// Any combination of characters a-z, underscores, and numbers 0-9\n// This is case sensitive. Default = empty string\n// With ajax mode, the first snippet call of the page shouldn''t use the asId parameter\n$cfg[''asId''] = isset($asId) ? $asId : (isset($__asId) ? $__asId : $dcfg[''asId'']);\n\n// &whereSearch\n// Define where should occur the search\n// a separated list of keywords describing the tables where to search\n// keywords allowed :\n// "content" for site_content, "tv" for site_tmplvar_contentvalues, "jot" for jot_content, "maxigallery" for maxigallery\n// you could add your own keywords. But the keyword should be a user function which describes the tables to use\n// all the text fields are searchable but you could specify the fields like this:\n// whereSearch=`content:pagetitle,introtext,content|tv:tv_value|maxigallery:gal_title`\n// Default: ''content|tv''\n$cfg[''whereSearch''] = isset($whereSearch) ? $whereSearch : (isset($__whereSearch) ? $__whereSearch : $dcfg[''whereSearch'']);\n\n// &sites : [comma separated list of sites]\n// sites allow to define sites where to do the search\n$cfg[''sites''] = isset($sites) ? $sites : (isset($__sites) ? $__sites : $dcfg[''sites'']);\n\n// &subSearch  [comma separated list of subsites]\n// subSearch allow to define sub-domains or subsites where to do the search\n$cfg[''subSearch''] = isset($subSearch) ? $subSearch : (isset($__subSearch) ? $__subSearch : $dcfg[''subSearch'']);\n\n// &category  [ tv_name ]\n// Any combination of characters a-z, underscores, and numbers 0-9\n// This is case sensitive. Default = empty string\n// Name of a TV. The category of a MODx document is provided by this TV content\n$cfg[''category''] = isset($category) ? $category : (isset($__category) ? $__category : $dcfg[''category'']);\n\n// &display [ ''mixed'' | ''unmixed'' ]\n// When results comes from differents sites, subsites or categories, you could choose to display the results mixed or unmixed.\n// Default: unmixed\n// Unmixed mode display the results grouped by site, subsite or category. Each group of results could be paginated.\n// Mixed mode mixe all the results coming from the differents area.\n// With unmixed mode, results are ordered by the field provided by the first field of the order parameter\n$cfg[''display''] = isset($display) ? $display : (isset($__display) ? $__display : $dcfg[''display'']);\n\n// &init  [ ''none'' | ''all'' ]\n// init defines if the search display all the results or none when the search term is an empty string\n// Default: none\n$cfg[''init''] = isset($init) ? $init : (isset($__init) ? $__init : $dcfg[''init'']);\n\n// &withTvs - Define which Tvs are used for the search in Tvs\n// a comma separated list of TV names\n// Default: '''' - all TVs are used (empty list)\n$cfg[''withTvs''] = isset($withTvs) ? $withTvs : (isset($__withTvs) ? $__withTvs : $dcfg[''withTvs'']);\n\n// &order - Define the sort order of results\n// Comma separated list of fields defined as searchable in the table definition\n// to suppress the sorting, use &order=``\n// Default: ''pub_date,pagetitle''\n$cfg[''order''] = isset($order) ? $order : (isset($__order) ? $__order : $dcfg[''order'']);\n\n// &rank - Define the rank of search results. Results are sorted by rank value\n// Comma separated list of fields with optionally user defined weight\n// Default: ''pagetitle:100,extract''\n// to suppress the rank sorting, use &rank=``;\n// &rank sort occurs after the &order sort\n$cfg[''rank''] = isset($rank) ? $rank : (isset($__rank) ? $__rank : $dcfg[''rank'']);\n\n// &maxWords [ 1 < int < 10 ]\n// Maximum number of words for searching\n// Default: 5\n$cfg[''maxWords''] = isset($maxWords) ? intval($maxWords) : (isset($__maxWords) ? intval($__maxWords) : $dcfg[''maxWords'']);\n\n// &minChars [  2 < int < 100 ]\n// Minimum number of characters to require for a word to be valid for searching.\n// length of each word with $advSearch = ''allwords'', ''oneword'' or ''nowords''\n// length of the search string with possible spaces with $advSearch = ''exactphrase''\n// Default: 3\n$cfg[''minChars''] = isset($minChars) ? intval($minChars) : (isset($__minChars) ? intval($__minChars) : $dcfg[''minChars'']);\n\n// &showInputForm [0 | 1]\n// If you would like to turn off the search form when showing results you can set this to false.(1=true, 0=false)\n// Default: 1\n$cfg[''showInputForm''] = isset($showInputForm) ? $showInputForm : (isset($__showInputForm) ? $__showInputForm : $dcfg[''showInputForm'']);\n\n// &showIntro [0 | 1]\n// If you would like to turn off the intro message beyond the input form you can set this to false.(1=true, 0=false)\n// Default: 1\n$cfg[''showIntro''] = isset($showIntro) ? $showIntro : (isset($__showIntro) ? $__showIntro : $dcfg[''showIntro'']);\n\n// &grabMax [ int ]\n// Set to the max number of records you would like on each page. Set to 0 if unlimited.\n// Default: 10\n$cfg[''grabMax''] = isset($grabMax) ? intval($grabMax) : (isset($__grabMax) ? intval($__grabMax) : $dcfg[''grabMax'']);\n\n// &extract [ n:searchable fields list | 1:content,description,introtext,tv_content]\n// show the search terms highlighted in a little extract\n// n : maximum number of extracts displayed\n// ordered searchable fields list : separated list of fields define as searchable in the table definition\n// Default: ''1:content,description,introtext,tv_value'' - One extract from content then description,introtext,tv_value\n$cfg[''extract''] = isset($extract) ? $extract : (isset($__extract) ? $__extract : $dcfg[''extract'']);\n\n// &extractLength [ 50 < int < 800]\n// Length of extract around the search words found - between 50 and 800 characters\n// Default: 200\n$cfg[''extractLength''] = isset($extractLength) ? intval($extractLength) : (isset($__extractLength) ? intval($__extractLength) : $dcfg[''extractLength'']);\n\n// &extractEllips [ string ]\n// Ellipside to mark the star and the end of  an extract when the sentence is cutting\n// Default: ''...''\n$cfg[''extractEllips''] = isset($extractEllips) ? $extractEllips : (isset($__extractEllips) ? $__extractEllips : $dcfg[''extractEllips'']);\n\n// &extractSeparator [ string ]\n// Any html tag to mark the separation between extracts\n// Default: ''<br />'' - but you could also choose for instance ''<hr />''\n$cfg[''extractSeparator''] = isset($extractSeparator) ? $extractSeparator : (isset($__extractSeparator) ? $__extractSeparator : $dcfg[''extractSeparator'']);\n\n// &formatDate [ string ]\n// The format of outputted dates. See http://www.php.net/manual/en/function.date.php\n// Default: ''d/m/y : H:i:s'' - e.g: 21/01/08 : 23:09:22\n$cfg[''formatDate''] = isset($formatDate) ? $formatDate : (isset($__formatDate) ? $__formatDate : $dcfg[''formatDate'']);\n\n// &highlightResult [1 | 0]\n// create links so that search terms will be highlighted when linked page clicked\n// Default: 1 - Results highlighted\n$cfg[''highlightResult''] = isset($highlightResult) ? $highlightResult : (isset($__highlightResult) ? $__highlightResult : $dcfg[''highlightResult'']);\n\n// &pagingType[ 0 | 1 | 2 ]\n// Determine the pagination type used - Default 1 : Previous - X-Y/Z - Next\n$cfg[''pagingType''] = isset($pagingType) ? $pagingType : (isset($__pagingType) ? $__pagingType : $dcfg[''pagingType'']);\n\n// &pageLinkSeparator [ string ]\n// What you want, if anything, between your page link numbers\n// Default: '' | ''\n$cfg[''pageLinkSeparator''] = isset($pageLinkSeparator) ? $pageLinkSeparator : (isset($__pageLinkSeparator) ? $__pageLinkSeparator : $dcfg[''pageLinkSeparator'']);\n\n// &showPagingAlways[1 | 0]\n// Determine whether or not to always show paging\n$cfg[''showPagingAlways''] = isset($showPagingAlways) ? $showPagingAlways : (isset($__showPagingAlways) ? $__showPagingAlways : $dcfg[''showPagingAlways'']);\n\n// &landingPage  [int] set the page to show the results page (non Ajax search)\n// Default: false\n$cfg[''landingPage''] = isset($landingPage) ? $landingPage : (isset($__landingPage) ? $__landingPage : $dcfg[''landingPage'']);\n\n// &showResults  [1 | 0]  establish whether to show the results or not\n// Default: 1\n$cfg[''showResults''] = isset($showResults) ? $showResults : (isset($__showResults) ? $__showResults : $dcfg[''showResults'']);\n\n// &parents [ [ in | not in ] : comma separated list of Ids | '''' ]\n// Ids of documents to retrieve their children to &depth depth  where to do the search in or not in\n// Default: '''' - empty list\n$cfg[''parents''] = isset($parents) ? $parents : (isset($__parents) ? $__parents : $dcfg[''parents'']);\n\n// &documents [ [ in | not in ] : comma separated list of Ids | '''' ]\n// Ids of documents where to do the search in or not in\n// Default: '''' - empty list\n$cfg[''documents''] = isset($documents) ? $documents : (isset($__documents) ? $__documents : $dcfg[''documents'']);\n\n// &depth [ 0 < int ] Number of levels deep to retrieve documents\n// Default: 10\n$cfg[''depth''] = isset($depth) ? intval($depth) : (isset($__depth) ? intval($__depth) : $dcfg[''depth'']);\n\n// &hideMenu [0 | 1| 2]  Search in hidden documents from menu.\n// 0 - search only in documents visible from menu\n// 1 - search only in documents hidden from menu\n// 2 - search in hidden or visible documents from menu\n// Default: 2\n$cfg[''hideMenu''] = isset($hideMenu) ? $hideMenu : (isset($__hideMenu) ? $__hideMenu : $dcfg[''hideMenu'']);\n\n// &hideLink [0 | 1 ]   Search in content of type reference (link)\n// 0 - search in content of type document AND reference\n// 1 - search only in content of type document\n// Default: 1\n$cfg[''hideLink''] = isset($hideLink) ? $hideLink : (isset($__hideLink) ? $__hideLink : $dcfg[''hideLink'']);\n\n// &filter - Basic filtering : remove unwanted documents that meets the criteria of the filter\n// See Ditto 2 Basic filtering and the ajaxSearch demo site for more information\n// Default: '''' - empty list\n$cfg[''filter''] = isset($filter) ? $filter : (isset($__filter) ? $__filter : $dcfg[''filter'']);\n\n// &output [0 | 1 ]Custom layout\n// Default: 0 - Results are listed just under the input form\n// 1 - custom layout. put [+as.inputForm+] and [+as.results+] where you want to define the layout\n$cfg[''output''] = isset($output) ? $output : (isset($__output) ? $__output : $dcfg[''output'']);\n\n// &tplInput - Chunk to style the ajaxSearch input form\n// Default: ''@FILE:'' . AS_SPATH . ''templates/input.tpl.html''\n$cfg[''tplInput''] = isset($tplInput) ? $tplInput : (isset($__tplInput) ? $__tplInput : $dcfg[''tplInput'']);\n\n// &tplResults - Chunk to style the non-ajax output results outer\n// Default: ''@FILE:'' . AS_SPATH . ''templates/results.tpl.html''\n$cfg[''tplResults''] = isset($tplResults) ? $tplResults : (isset($__tplResults) ? $__tplResults : $dcfg[''tplResults'']);\n\n// &tplGrpResult - Chunk to style the non-ajax output group result outer\n// Default: ''@FILE:'' . AS_SPATH . ''templates/grpResult.tpl.html''\n$cfg[''tplGrpResult''] = isset($tplGrpResult) ? $tplGrpResult : (isset($__tplGrpResult) ? $__tplGrpResult : $dcfg[''tplGrpResult'']);\n\n// &tplResult - Chunk to style each output result\n// Default: "@FILE:" . AS_SPATH . ''templates/result.tpl.html''\n$cfg[''tplResult''] = isset($tplResult) ? $tplResult : (isset($__tplResult) ? $__tplResult : $dcfg[''tplResult'']);\n\n// &tplComment - Chunk to style the comment form (Also used with the ajax mode)\n// Default: ''@FILE:'' . AS_SPATH . ''templates/comment.tpl.html''\n$cfg[''tplComment''] = isset($tplComment) ? $tplComment : (isset($__tplComment) ? $__tplComment : $dcfg[''tplComment'']);\n\n// &tplPaging0 - Chunk to style the paging links - type 0\n// Default: ''@FILE:'' . AS_SPATH . ''templates/paging0.tpl.html''\n$cfg[''tplPaging0''] = isset($tplPaging0) ? $tplPaging0 : (isset($__tplPaging0) ? $__tplPaging0 : $dcfg[''tplPaging0'']);\n\n// &tplPaging1 - Chunk to style the paging links - type 1\n// Default: ''@FILE:'' . AS_SPATH . ''templates/paging1.tpl.html''\n$cfg[''tplPaging1''] = isset($tplPaging1) ? $tplPaging1 : (isset($__tplPaging1) ? $__tplPaging1 : $dcfg[''tplPaging1'']);\n\n// &tplPaging2 - Chunk to style the paging links - type 2\n// Default: ''@FILE:'' . AS_SPATH . ''templates/paging2.tpl.html''\n$cfg[''tplPaging2''] = isset($tplPaging2) ? $tplPaging2 : (isset($__tplPaging2) ? $__tplPaging2 : $dcfg[''tplPaging2'']);\n\n// &stripInput - stripInput user function name\n// Default: ''defaultStripInput''\n$cfg[''stripInput''] = isset($stripInput) ? $stripInput : (isset($__stripInput) ? $__stripInput : $dcfg[''stripInput'']);\n\n// &stripOutput - stripOutput user function name\n// Default: ''defaultStripOutput''\n$cfg[''stripOutput''] = isset($stripOutput) ? $stripOutput : (isset($__stripOutput) ? $__stripOutput : $dcfg[''stripOutput'']);\n\n// &breadcrumbs\n// 0 : disallow the breadcrumbs link\n// Name of the breadcrumbs function : allow the breadcrumbs link\n// The function name could be followed by some parameter initialization\n// e.g: &breadcrumbs=`Breadcrumbs,showHomeCrumb:0,showCrumbsAtHome:1`\n// Default: '''' - empty string\n$cfg[''breadcrumbs''] = isset($breadcrumbs) ? $breadcrumbs : (isset($__breadcrumbs) ? $__breadcrumbs : $dcfg[''breadcrumbs'']);\n\n// &tvPhx - display and set placeHolders for TV (template variables)\n// 0 : disallow the feature\n// 1 : allow the display of all Modx TVs of the document found (default)\n// ''tb_alias:display_function_name[,[tb_alias:display_function_name]*]'' : set up placeholders for custom joined tables\n// Default: 1 - tvPhx allowed for TV only\n$cfg[''tvPhx''] = isset($tvPhx) ? $tvPhx : (isset($__tvPhx) ? $__tvPhx : $dcfg[''tvPhx'']);\n\n// &clearDefault - Clearing default text\n// Set this to 1 if you would like to include the clear default js function\n// add the class "cleardefault" to your input text form and set this parameter\n// Default: 0\n$cfg[''clearDefault''] = isset($clearDefault) ? $clearDefault : (isset($__clearDefault) ? $__clearDefault : $dcfg[''clearDefault'']);\n\n// &jsClearDefault - Location of the js library\n// Default: AS_SPATH . ''js/clearDefault.js''\n$cfg[''jsClearDefault''] = $dcfg[''jsClearDefault''];\n\n// &mbstring - php_mbstring extension available [0 | 1]\n// Default: 1 - extension available\n$cfg[''mbstring''] = isset($mbstring) ? $mbstring : (isset($__mbstring) ? $__mbstring : $dcfg[''mbstring'']);\n\n//  &asLog - ajaxSearch log [ level [: comment [: purge]]]\n//  level:\n//        0 : disallow the ajaxSearch log (Default)\n//        1 : failed search requests are logged\n//        2 : all ajaxSearch requests are logged\n//  comment:\n//        0 : user comment not allowed (Default)\n//        1 : user comment allowed\n//  purge: number of logs allowed before to do an automatic purge of the table\n//        Default: 200\n$cfg[''asLog''] = isset($asLog) ? $asLog : (isset($__asLog) ? $__asLog : $dcfg[''asLog'']);\n\n\n//------------------------------------------------------------------------------\n// Configuration - Simple Ajax mode\n//------------------------------------------------------------------------------\n\nif ($cfg[''ajaxSearch'']) {\n\n    // $liveSearch [1 | 0] (as passed in snippet variable ONLY)\n    // Set this to 1 if you would like to use the live search (i.e. results as you type)\n    // Default: 0 - livesearch mode inactivated\n    $cfg[''liveSearch''] = isset($liveSearch) ? $liveSearch : (isset($__liveSearch) ? $__liveSearch : $dcfg[''liveSearch'']);\n\n    // &ajaxMax [int] - The maximum number of results to show for the ajaxsearch\n    // Default: 6\n    $cfg[''ajaxMax''] = isset($ajaxMax) ? $ajaxMax : (isset($__ajaxMax) ? $__ajaxMax : $dcfg[''ajaxMax'']);\n\n    // &moreResultsPage [int]\n    // The document id of the page you want the more results link to point to\n    // Default: 0\n    $cfg[''moreResultsPage''] = isset($moreResultsPage) ? $moreResultsPage : (isset($__moreResultsPage) ? $__moreResultsPage : $dcfg[''moreResultsPage'']);\n\n    // &opacity - set the opacity of the div ajaxSearch_output\n    // Should be a float value: [ 0. < float <= 1. ]\n    // Default: 1.\n    $cfg[''opacity''] = isset($opacity) ? $opacity : (isset($__opacity) ? $__opacity : $dcfg[''opacity'']);\n\n    // &tplAjaxResults - Chunk to style the ajax output results outer\n    // Default: '''' - empty string\n    $cfg[''tplAjaxResults''] = isset($tplAjaxResults) ? $tplAjaxResults : (isset($__tplAjaxResults) ? $__tplAjaxResults : $dcfg[''tplAjaxResults'']);\n\n    // &tplAjaxGrpResult - Chunk to style each ajax output group result outer\n    // Default: '''' - empty string\n    $cfg[''tplAjaxGrpResult''] = isset($tplAjaxGrpResult) ? $tplAjaxGrpResult : (isset($__tplAjaxGrpResult) ? $__tplAjaxGrpResult : $dcfg[''tplAjaxGrpResult'']);\n\n    // &tplAjaxResult - Chunk to style each ajax output result\n    // Default: '''' - empty string\n    $cfg[''tplAjaxResult''] = isset($tplAjaxResult) ? $tplAjaxResult : (isset($__tplAjaxResult) ? $__tplAjaxResult : $dcfg[''tplAjaxResult'']);\n\n    // &jscript [''jquery''|''mootools2''|''mootools'']\n    // Set this to jquery if you would like use the jquery library\n    // set mootools2 to use the version 1.2 of mootools (limited to JS functions used by AS)\n    // Default: ''mootools'' - use the version 1.11 of mootools provided with MODx\n    $cfg[''jscript''] = isset($jscript) ? $jscript : (isset($__jscript) ? $__jscript : $dcfg[''jscript'']);\n\n    // &addJscript [1 | 0]\n    // Set this to 1 if you would like to include or not the mootool/jquery library in the header of your pages automatically\n    // Default: 1\n    $cfg[''addJscript''] = isset($addJscript) ? $addJscript : (isset($__addJscript) ? $__addJscript : $dcfg[''addJscript'']);\n\n    // &jsMooTools - Location of the mootools javascript library (current version of MODx)\n    // Default: ''manager/media/script/mootools/mootools.js''\n    $cfg[''jsMooTools''] = isset($jsMooTools) ? $jsMooTools : (isset($__jsMooTools) ? $__jsMooTools : $dcfg[''jsMooTools'']);\n\n    // &jsMooTools2 - Location of an alternative mootools javascript library\n    // Default: AS_SPATH . ''js/mootools1.2/mootools.js'' - contains only the required functions for AS\n    // to use an another library, use this parameter and change the ajaxSearch/js/ajaxSearch1/ajaxSearch-mootools2.js file\n    $cfg[''jsMooTools2''] = isset($jsMooTools2) ? $jsMooTools2 : (isset($__jsMooTools2) ? $__jsMooTools2 : $dcfg[''jsMooTools2'']);\n\n    // &jsQuery - Location of the jquery javascript library\n    // Default: AS_SPATH . ''js/jquery/jquery.js''\n    $cfg[''jsJquery''] = isset($jsJquery) ? $jsJquery : (isset($__jsJquery) ? $__jsJquery : $dcfg[''jsJquery'']);\n}\n\n// ========================================================== End of config\ninclude_once AS_PATH . "classes/ajaxSearch.class.inc.php";\nif (class_exists(''AjaxSearch'')) {\n    $as = new AjaxSearch();\n    $output = $as->run($tstart, $dcfg, $cfg);\n} else {\n    $output = "<h3>error: AjaxSearch class not found</h3>";\n}\n$elapsedTime = $modx->getMicroTime() - $tstart;\n$etime = sprintf("%.4fs",$elapsedTime);\n//$f=fopen(''test.txt'',''a+'');fwrite($f,"etime=".$etime."\\n\\n");\nreturn $output;', 0, '', ''),
(2, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 5, 0, '/*\n * @name UltimateParent\n * @version 2.0 beta (requires MODx 0.9.5+)\n * @author Jason Coward <modx@opengeek.com>\n * \n * @param &id The id of the document whose parent you want to find.\n * @param &top The top node for the search.\n * @param &topLevel The top level node for the search (root = level 1)\n * \n * @license Public Domain, use as you like.\n * \n * @example [[UltimateParent? &id=`45` &top=`6`]] \n * Will find the ultimate parent of document 45 if it is a child of document 6;\n * otherwise it will return 45.\n * \n * @example [[UltimateParent? &topLevel=`2`]]\n * Will find the ultimate parent of the current document at a depth of 2 levels\n * in the document hierarchy, with the root level being level 1.\n * \n * This snippet travels up the document tree from a specified document and\n * returns the "ultimate" parent.  Version 2.0 was rewritten to use the new\n * getParentIds function features available only in MODx 0.9.5 or later.\n * \n * Based on the original UltimateParent 1.x snippet by Susan Ottwell\n * <sottwell@sottwell.com>.  The topLevel parameter was introduced by staed and\n * adopted here.\n */\n$top= isset ($top) && intval($top) ? $top : 0;\n$id= isset ($id) && intval($id) ? intval($id) : $modx->documentIdentifier;\n$topLevel= isset ($topLevel) && intval($topLevel) ? intval($topLevel) : 0;\nif ($id && $id != $top) {\n    $pid= $id;\n    if (!$topLevel || count($modx->getParentIds($id)) >= $topLevel) {\n        while ($parentIds= $modx->getParentIds($id, 1)) {\n            $pid= array_pop($parentIds);\n            if ($pid == $top) {\n                break;\n            }\n            $id= $pid;\n            if ($topLevel && count($modx->getParentIds($id)) < $topLevel) {\n                break;\n            }\n        }\n    }\n}\nreturn $id;', 0, '', ''),
(3, 'Breadcrumbs', '<strong>1.0.3</strong> Configurable breadcrumb page-trail navigation', 0, 5, 0, '/*\n * This snippet shows the path through the various levels of site structure. It\n * is NOT necessarily the path the user took to arrive at a given page.\n */\n\n/* -----------------------------------------------------------------------------\n * CONFIGURATION\n * -----------------------------------------------------------------------------\n * This section contains brief explanations of the available parameters.\n */\n\n/* General setup\n * -----------------------------------------------------------------------------\n */\n\n/* $maxCrumbs [ integer ]\n * Max number of elemetns to have in a breadcrumb path. The default 100 is an\n * arbitrarily high number that will essentially include everything. If you were\n * to set it to 2, and you were 5 levels deep, it would appear like:\n * HOME > ... > Level 3 > Level 4 > CURRENT PAGE\n * It should be noted that the "home" link, and the current page do not count as\n * they are managed by their own configuration settings.\n */\n( isset($maxCrumbs) ) ? $maxCrumbs : $maxCrumbs = 100;\n\n/* $pathThruUnPub [ 1 | 0 ]\n * When your path includes an unpublished folder, setting this to 1 (true) will\n * show all documents in path EXCEPT the unpublished. When set to 0 (false), the\n * path will not go "through" that unpublished folder and will stop there.\n */\n( isset($pathThruUnPub) ) ? $pathThruUnPub : $pathThruUnPub = 1;\n\n/* $respectHidemenu [ 0 | 1 ]\n * Setting this to 1 (true) will respect the hidemenu setting of the document\n * and not include it in trail.\n */\n( isset($respectHidemenu) ) ? (int)$respectHidemenu : $respectHidemenu = 1;\n\n/* $showCurrentCrumb [ 1 | 0 ]\n * Include the current page at the end of the trail. On by default.\n */\n( isset($showCurrentCrumb) ) ? $showCurrentCrumb : $showCurrentCrumb = 1;\n\n/* $currentAsLink [ 1 | 0 ]\n * If the current page is included, this parameter will show it as a link (1) or\n * just plain text (0).\n */\n( $currentAsLink ) ? $currentAsLink : $currentAsLink = 0;\n\n/* $linkTextField [ string ]\n * Prioritized list of fields to use as link text. Options are: pagetitle,\n * longtitle, description, menutitle. The first of these fields that has a value\n * will be the title.\n */\n( isset($linkTextField) ) ? $linkTextField : $linkTextField = ''menutitle,pagetitle,longtitle'';\n\n/* $linkDescField [ string ]\n * Prioritized list of fields to use as link title text. Options are: pagetitle,\n * longtitle, description, menutitle. The first of these fields that has a value\n * will be the title.\n */\n( isset($linkDescField) ) ? $linkDescField : $linkDescField = ''description,longtitle,pagetitle,menutitle'';\n\n/* $showCrumbsAsLinks [ 1 | 0 ]\n * If for some reason you want breadcrumbs to be text and not links, set to 0\n * (false).\n */\n( isset($showCrumbsAsLinks) ) ? $showCrumbsAsLinks : $showCrumbsAsLinks = 1;\n\n/* $templateSet [ string ]\n * The set of templates you''d like to use. (Templates are defined below.) It\n * will default to defaultString which replicates the output of previous\n * versions.\n */\n( isset($templateSet) ) ? $templateSet : $templateSet = ''defaultString'';\n\n/* $crumbGap [ string ]\n * String to be shown to represent gap if there are more crumbs in trail than\n * can be shown. Note: if you would like to use an image, the entire image tag\n * must be provided. When making a snippet call, you cannot use "=", so use "||"\n * instead and it will be converted for you.\n */\n( isset($crumbGap) ) ? $crumbGap : $crumbGap = ''...'';\n\n/* $stylePrefix [ string ]\n * Breadcrumbs will add style classes to various parts of the trail. To avoid\n * class name conflicts, you can determine your own prefix. The following\n * classes will be attached:\n * crumbBox: Span that surrounds all crumb output\n * hideCrumb: Span that surrounds the "..." if there are more crumbs than will\n * be shown\n * currentCrumb: Span or A tag surrounding the current crumb\n * firstCrumb: Span that will be applied to first crumb, whether it is "home" or\n * not\n * lastCrumb: Span surrounding last crumb, whether it is the current page or\n * not\n * crumb: Class given to each A tag surrounding the intermediate crumbs (not\n * "home", "current", or "hide")\n * homeCrumb: Class given to the home crumb\n */\n( isset($stylePrefix) ) ? $stylePrefix : $stylePrefix = ''B_'';\n\n\n\n/* Home link parameters\n * -----------------------------------------------------------------------------\n * The home link is unique. It is a link that can be placed at the head of the\n * breadcrumb trail, even if it is not truly in the hierarchy.\n */\n\n/* $showHomeCrumb [ 1 | 0 ]\n * This toggles the "home" crumb to be added to the beginning of your trail.\n */\n( isset($showHomeCrumb) ) ? $showHomeCrumb : $showHomeCrumb = 1;\n\n/* $homeId [ integer ]\n * Usually the page designated as "site start" in MODx configuration is\n * considered the home page. But if you would like to use some other document,\n * you may explicitly define it.\n */\n( isset($homeId) ) ? (int)$homeId : $homeId = $modx->config[''site_start''];\n\n/* $homeCrumbTitle [ string ]\n * If you''d like to use something other than the menutitle (or pagetitle) for\n * the home link.\n */\n( isset($homeCrumbTitle) ) ? $homeCrumbTitle : $homeCrumbTitle = '''';\n\n/* $homeCrumbDescription [ string ]\n * If you''d like to use a custom description (link title) on the home link. If\n * left blank, the title will follow the title order set in $titleField.\n */\n( isset($homeCrumbDescription) ) ? $homeCrumbDescription : $homeCrumbDescription = '''';\n\n\n/* Custom behaviors\n * -----------------------------------------------------------------------------\n * The following parameters will alter the behavior of the Breadcrumbs based on\n * the page it is on.\n */\n\n/* $showCrumbsAtHome [ 1 | 0 ]\n * You can turn off Breadcrumbs all together on the home page by setting this to\n * 1 (true);\n */\n( isset($showCrumbsAtHome) ) ? $showCrumbsAtHome : $showCrumbsAtHome = 0;\n\n/* $hideOn [ string ]\n * Comma separated list of documents you don''t want Breadcrumbs on at all. If\n * you have a LOT of pages like this, you might try $hideUnder or use another\n * template. This parameter is best for those rare odd balls - otherwise it will\n * become a pain to manage.\n */\n( isset($hideOn) ) ? $hideOn : $hideOn = '''';\n\n/* $hideUnder [ string ]\n * Comma separated list of parent documents, whose CHILDREN you don''t want\n * Breadcrumbs to appear on at all. This enables you to hide Breadcrumbs on a\n * whole folders worth of documents by specifying the parent only. The PARENT\n * will not have Breadcrumbs hidden however. If you wanted to hide the parent\n * and the children, put the parent ID in hideUnder AND hideOn.\n */\n( isset($hideUnder) ) ? $hideUnder : $hideUnder = '''';\n\n/* $stopIds [ string ]\n * Comma separated list of document IDs that when reached, stops Breadcrumbs\n * from going any further. This is useful in situations like where you have\n * language branches, and you don''t want the Breadcrumbs going past the "home"\n * of the language you''re in.\n */\n( isset($stopIds) ) ? $stopIds : $stopIds = '''';\n\n/* $ignoreIds [ string ]\n * Comma separated list of document IDs to explicitly ignore.\n */\n( isset($ignoreIds) ) ? $ignoreids : $ignoreids = '''';\n\n/* $crumbSeparator [ string ]\n * The set of templates you''d like to use for crumbSeparator.\n */\n( isset($crumbSeparator) ) ? $crumbSeparator : $crumbSeparator = ''&raquo;'';\n\n/* Templates\n * -----------------------------------------------------------------------------\n * In an effort to keep the MODx chunks manager from getting mired down in lots\n * of templates, Breadcrumbs templates are included here. Two sets are provided\n * prefixed with defaultString, and defaultList. You can create as many more as\n * you like, each set with it''s own prefix\n */\n$templates = array(\n    ''defaultString'' => array(\n        ''crumb'' => ''[+crumb+]'',\n        ''separator'' => '' ''.$crumbSeparator.'' '',\n        ''crumbContainer'' => ''<span class="[+crumbBoxClass+]">[+crumbs+]</span>'',\n        ''lastCrumbWrapper'' => ''<span class="[+lastCrumbClass+]">[+lastCrumbSpanA+]</span>'',\n        ''firstCrumbWrapper'' => ''<span class="[+firstCrumbClass+]">[+firstCrumbSpanA+]</span>''\n    ),\n    ''defaultList'' => array(\n        ''crumb'' => ''<li>[+crumb+]</li>'',\n        ''separator'' => '''',\n        ''crumbContainer'' => ''<ul class="[+crumbBoxClass+]">[+crumbs+]</ul>'',\n        ''lastCrumbWrapper'' => ''<span class="[+lastCrumbClass+]">[+lastCrumbSpanA+]</span>'',\n        ''firstCrumbWrapper'' => ''<span class="[+firstCrumbClass+]">[+firstCrumbSpanA+]</span>''\n    ),\n);\n\n\n/* -----------------------------------------------------------------------------\n * END CONFIGURATION\n * -----------------------------------------------------------------------------\n */\n\n// Return blank if necessary: on home page\nif ( !$showCrumbsAtHome && $homeId == $modx->documentObject[''id''] )\n{\n    return '''';\n}\n// Return blank if necessary: specified pages\nif ( $hideOn || $hideUnder )\n{\n    // Create array of hide pages\n    $hideOn = str_replace('' '','''',$hideOn);\n    $hideOn = explode('','',$hideOn);\n\n    // Get more hide pages based on parents if needed\n    if ( $hideUnder )\n    {\n        $hiddenKids = array();\n        // Get child pages to hide\n        $hideKidsQuery = $modx->db->select(''id'',$modx->getFullTableName("site_content"),"parent IN ($hideUnder)");\n        while ( $hideKid = $modx->db->getRow($hideKidsQuery) )\n        {\n            $hiddenKids[] = $hideKid[''id''];\n        }\n        // Merge with hideOn pages\n        $hideOn = array_merge($hideOn,$hiddenKids);\n    }\n\n    if ( in_array($modx->documentObject[''id''],$hideOn) )\n    {\n        return '''';\n    }\n\n}\n\n\n// Initialize ------------------------------------------------------------------\n\n// Put certain parameters in arrays\n$stopIds = str_replace('' '','''',$stopIds);\n$stopIds = explode('','',$stopIds);\n$linkTextField = str_replace('' '','''',$linkTextField);\n$linkTextField = explode('','',$linkTextField);\n$linkDescField = str_replace('' '','''',$linkDescField);\n$linkDescField = explode('','',$linkDescField);\n$ignoreIds = str_replace('' '','''',$ignoreIds);\n$ignoreIds = explode('','',$ignoreIds);\n\n/* $crumbs\n * Crumb elements are: id, parent, pagetitle, longtitle, menutitle, description,\n * published, hidemenu\n */\n$crumbs = array();\n$parent = $modx->documentObject[''parent''];\n$output = '''';\n$maxCrumbs += ($showCurrentCrumb) ? 1 : 0;\n\n// Replace || in snippet parameters that accept them with =\n$crumbGap = str_replace(''||'',''='',$crumbGap);\n\n// Curent crumb ----------------------------------------------------------------\n\n// Decide if current page is to be a crumb\nif ( $showCurrentCrumb )\n{\n    $crumbs[] = array(\n        ''id'' => $modx->documentObject[''id''],\n        ''parent'' => $modx->documentObject[''parent''],\n        ''pagetitle'' => $modx->documentObject[''pagetitle''],\n        ''longtitle'' => $modx->documentObject[''longtitle''],\n        ''menutitle'' => $modx->documentObject[''menutitle''],\n        ''description'' => $modx->documentObject[''description'']);\n}\n\n// Intermediate crumbs ---------------------------------------------------------\n\n\n// Iterate through parents till we hit root or a reason to stop\n$loopSafety = 0;\nwhile ( $parent && $parent!=$modx->config[''site_start''] && $loopSafety < 1000 )\n{\n    // Get next crumb\n    $tempCrumb = $modx->getPageInfo($parent,0,"id,parent,pagetitle,longtitle,menutitle,description,published,hidemenu");\n\n    // Check for include conditions & add to crumbs\n    if (\n        $tempCrumb[''published''] &&\n        ( !$tempCrumb[''hidemenu''] || !$respectHidemenu ) &&\n        !in_array($tempCrumb[''id''],$ignoreIds)\n    )\n    {\n        // Add crumb\n        $crumbs[] = array(\n        ''id'' => $tempCrumb[''id''],\n        ''parent'' => $tempCrumb[''parent''],\n        ''pagetitle'' => $tempCrumb[''pagetitle''],\n        ''longtitle'' => $tempCrumb[''longtitle''],\n        ''menutitle'' => $tempCrumb[''menutitle''],\n        ''description'' => $tempCrumb[''description'']);\n    }\n\n    // Check stop conditions\n    if (\n        in_array($tempCrumb[''id''],$stopIds) ||  // Is one of the stop IDs\n        !$tempCrumb[''parent''] || // At root\n        ( !$tempCrumb[''published''] && !$pathThruUnPub ) // Unpublished\n    )\n    {\n        // Halt making crumbs\n        break;\n    }\n\n    // Reset parent\n    $parent = $tempCrumb[''parent''];\n\n    // Increment loop safety\n    $loopSafety++;\n}\n\n// Home crumb ------------------------------------------------------------------\n\nif ( $showHomeCrumb && $homeId != $modx->documentObject[''id''] && $homeCrumb = $modx->getPageInfo($homeId,0,"id,parent,pagetitle,longtitle,menutitle,description,published,hidemenu") )\n{\n    $crumbs[] = array(\n    ''id'' => $homeCrumb[''id''],\n    ''parent'' => $homeCrumb[''parent''],\n    ''pagetitle'' => $homeCrumb[''pagetitle''],\n    ''longtitle'' => $homeCrumb[''longtitle''],\n    ''menutitle'' => $homeCrumb[''menutitle''],\n    ''description'' => $homeCrumb[''description'']);\n}\n\n\n// Process each crumb ----------------------------------------------------------\n$pretemplateCrumbs = array();\n\nforeach ( $crumbs as $c )\n{\n\n    // Skip if we''ve exceeded our crumb limit but we''re waiting to get to home\n    if ( count($pretemplateCrumbs) > $maxCrumbs && $c[''id''] != $homeId )\n    {\n        continue;\n    }\n\n    $text = '''';\n    $title = '''';\n    $pretemplateCrumb = '''';\n\n    // Determine appropriate span/link text: home link specified\n    if ( $c[''id''] == $homeId && $homeCrumbTitle )\n    {\n        $text = $homeCrumbTitle;\n    }\n    else\n    // Determine appropriate span/link text: home link not specified\n    {\n        for ($i = 0; !$text && $i < count($linkTextField); $i++)\n        {\n            if ( $c[$linkTextField[$i]] )\n            {\n                $text = $c[$linkTextField[$i]];\n            }\n        }\n    }\n\n    // Determine link/span class(es)\n    if ( $c[''id''] == $homeId )\n    {\n        $crumbClass = $stylePrefix.''homeCrumb'';\n    }\n    else if ( $modx->documentObject[''id''] == $c[''id''] )\n    {\n        $crumbClass = $stylePrefix.''currentCrumb'';\n    }\n    else\n    {\n        $crumbClass = $stylePrefix.''crumb'';\n    }\n\n    // Make link\n    if (\n        ( $c[''id''] != $modx->documentObject[''id''] && $showCrumbsAsLinks ) ||\n        ( $c[''id''] == $modx->documentObject[''id''] && $currentAsLink )\n    )\n    {\n        // Determine appropriate title for link: home link specified\n        if ( $c[''id''] == $homeId && $homeCrumbDescription )\n        {\n            $title = htmlspecialchars($homeCrumbDescription);\n        }\n        else\n        // Determine appropriate title for link: home link not specified\n        {\n            for ($i = 0; !$title && $i < count($linkDescField); $i++)\n            {\n                if ( $c[$linkDescField[$i]] )\n                {\n                    $title = htmlspecialchars($c[$linkDescField[$i]]);\n                }\n            }\n        }\n\n\n        $pretemplateCrumb .= ''<a class="''.$crumbClass.''" href="''.($c[''id''] == $modx->config[''site_start''] ? $modx->config[''base_url''] : $modx->makeUrl($c[''id''])).''" title="''.$title.''">''.$text.''</a>'';\n    }\n    else\n    // Make a span instead of a link\n    {\n       $pretemplateCrumb .= ''<span class="''.$crumbClass.''">''.$text.''</span>'';\n    }\n\n    // Add crumb to pretemplate crumb array\n    $pretemplateCrumbs[] = $pretemplateCrumb;\n\n    // If we have hit the crumb limit\n    if ( count($pretemplateCrumbs) == $maxCrumbs )\n    {\n        if ( count($crumbs) > ($maxCrumbs + (($showHomeCrumb) ? 1 : 0)) )\n        {\n            // Add gap\n            $pretemplateCrumbs[] = ''<span class="''.$stylePrefix.''hideCrumb''.''">''.$crumbGap.''</span>'';\n        }\n\n        // Stop here if we''re not looking for the home crumb\n        if ( !$showHomeCrumb )\n        {\n            break;\n        }\n    }\n}\n\n// Put in correct order for output\n$pretemplateCrumbs = array_reverse($pretemplateCrumbs);\n\n// Wrap first/last spans\n$pretemplateCrumbs[0] = str_replace(\n    array(''[+firstCrumbClass+]'',''[+firstCrumbSpanA+]''),\n    array($stylePrefix.''firstCrumb'',$pretemplateCrumbs[0]),\n    $templates[$templateSet][''firstCrumbWrapper'']\n);\n$pretemplateCrumbs[(count($pretemplateCrumbs)-1)] = str_replace(\n    array(''[+lastCrumbClass+]'',''[+lastCrumbSpanA+]''),\n    array($stylePrefix.''lastCrumb'',$pretemplateCrumbs[(count($pretemplateCrumbs)-1)]),\n    $templates[$templateSet][''lastCrumbWrapper'']\n);\n\n// Insert crumbs into crumb template\n$processedCrumbs = array();\nforeach ( $pretemplateCrumbs as $pc )\n{\n    $processedCrumbs[] = str_replace(''[+crumb+]'',$pc,$templates[$templateSet][''crumb'']);\n}\n\n// Combine crumbs together into one string with separator\n$processedCrumbs = implode($templates[$templateSet][''separator''],$processedCrumbs);\n\n// Put crumbs into crumb container template\n$container = str_replace(\n    array(''[+crumbBoxClass+]'',''[+crumbs+]''),\n    array($stylePrefix.''crumbBox'',$processedCrumbs),\n    $templates[$templateSet][''crumbContainer'']\n    );\n\n// Return crumbs\nreturn $container;', 0, '', '');
INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(4, 'eForm', '<strong>1.4.4.7</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 6, 0, '# eForm 1.4.4.7 - Electronic Form Snippet\n# Original created by Raymond Irving 15-Dec-2004.\n# Version 1.3+ extended by Jelle Jager (TobyL) September 2006\n# -----------------------------------------------------\n# Captcha image support - thanks to Djamoer\n# Multi checkbox, radio, select support - thanks to Djamoer\n# Form Parser and extened validation - by Jelle Jager\n#\n# see eform/docs/eform.htm for history, usage and examples\n#\n\n# Set Snippet Paths\n$snipFolder = isset($snipFolder)?$snipFolder:''eform'';\n$snipPath = $modx->config["base_path"].''assets/snippets/''.$snipFolder.''/'';\n\n\n# check if inside manager\nif ($modx->isBackend()) {\nreturn ''''; # don''t go any further when inside manager\n}\n\n//tidying up some casing errors in parameters\nif(isset($eformOnValidate)) $eFormOnValidate = $eformOnValidate;\nif(isset($eformOnBeforeMailSent)) $eFormOnBeforeMailSent = $eformOnBeforeMailSent;\nif(isset($eformOnMailSent)) $eFormOnMailSent = $eformOnMailSent;\nif(isset($eformOnValidate)) $eFormOnValidate = $eformOnValidate;\nif(isset($eformOnBeforeFormMerge)) $eFormOnBeforeFormMerge = $eformOnBeforeFormMerge;\nif(isset($eformOnBeforeFormParse)) $eFormOnBeforeFormParse = $eformOnBeforeFormParse;\n//for sottwell :)\nif(isset($eFormCSS)) $cssStyle = $eFormCSS;\n\n# Snippet customize settings\n$params = array (\n   // Snippet Path\n   ''snipPath'' => $snipPath, //includes $snipFolder\n	 ''snipFolder'' => $snipFolder,\n\n// eForm Params\n   ''vericode'' => isset($vericode)? $vericode:"",\n   ''formid'' => isset($formid)? $formid:"",\n   ''from'' => isset($from)? $from:$modx->config[''emailsender''],\n   ''fromname'' => isset($fromname)? $fromname:$modx->config[''site_name''],\n   ''to'' => isset($to)? $to:$modx->config[''emailsender''],\n   ''cc'' => isset($cc)? $cc:"",\n   ''bcc'' => isset($bcc)? $bcc:"",\n   ''subject'' => isset($subject)? $subject:"",\n   ''ccsender'' => isset($ccsender)?$ccsender:0,\n   ''sendirect'' => isset($sendirect)? $sendirect:0,\n   ''mselector'' => isset($mailselector)? $mailselector:0,\n   ''mobile'' => isset($mobile)? $mobile:'''',\n   ''mobiletext'' => isset($mobiletext)? $mobiletext:'''',\n   ''autosender'' => isset($autosender)? $autosender:$from,\n   ''autotext'' => isset($automessage)? $automessage:"",\n   ''category'' => isset($category)? $category:0,\n   ''keywords'' => isset($keywords)? $keywords:"",\n   ''gid'' => isset($gotoid)? $gotoid:$modx->documentIdentifier,\n   ''noemail'' => isset($noemail)? ($noemail):false,\n   ''saveform'' => isset($saveform)? ($saveform? true:false):true,\n   ''tpl'' => isset($tpl)? $tpl:"",\n   ''report'' => isset($report)? $report:"",\n   ''allowhtml'' => isset($allowhtml)? $allowhtml:0,\n   //Added by JJ\n   ''replyto'' => isset($replyto)? $replyto:"",\n   ''language'' => isset($language)? $language:$modx->config[''manager_language''],\n   ''thankyou'' => isset($thankyou)? $thankyou:"",\n   ''isDebug'' => isset($debug)? $debug:0,\n   ''reportAbuse'' => isset($reportAbuse)? $reportAbuse:false,\n   ''disclaimer'' => isset($disclaimer)?$disclaimer:'''',\n   ''sendAsHtml'' => isset($sendAsHtml)?$sendAsHtml:false,\n   ''sendAsText'' => isset($sendAsText)?$sendAsText:false,\n   ''sessionVars'' => isset($sessionVars)?$sessionVars:false,\n   ''postOverides'' => isset($postOverides)?$postOverides:0,\n   ''eFormOnBeforeMailSent'' => isset($eFormOnBeforeMailSent)?$eFormOnBeforeMailSent:'''',\n   ''eFormOnMailSent'' => isset($eFormOnMailSent)?$eFormOnMailSent:'''',\n   ''eFormOnValidate'' => isset($eFormOnValidate)?$eFormOnValidate:'''',\n   ''eFormOnBeforeFormMerge'' => isset($eFormOnBeforeFormMerge)?$eFormOnBeforeFormMerge:'''',\n   ''eFormOnBeforeFormParse'' => isset($eFormOnBeforeFormParse)?$eFormOnBeforeFormParse:'''',\n   ''cssStyle'' => isset($cssStyle)?$cssStyle:'''',\n   ''jScript'' => isset($jScript)?$jScript:'''',\n   ''submitLimit'' => (isset($submitLimit) &&  is_numeric($submitLimit))?$submitLimit*60:0,\n   ''protectSubmit'' => isset($protectSubmit)?$protectSubmit:1,\n   ''requiredClass'' => isset($requiredClass)?$requiredClass:"required",\n   ''invalidClass'' => isset($invalidClass)?$invalidClass:"invalid",\n   ''runSnippet'' => ( isset($runSnippet) && !is_numeric($runSnippet) )?$runSnippet:'''',\n   ''autoSenderName'' => isset($autoSenderName)?$autoSenderName:'''',\n   ''version'' => ''1.4.4''\n);\n\n// pixelchutes PHx workaround\nforeach( $params as $key=>$val ) $params[ $key ] = str_replace( array(''(('',''))''), array(''[+'',''+]''), $val );\n\n# Start processing\n\ninclude_once ($snipPath."eform.inc.php");\n\n$output = eForm($modx,$params);\n\n# Return\nreturn $output;', 0, '', ''),
(5, 'Wayfinder', '<strong>2.0.1</strong> Completely template-driven and highly flexible menu builder', 0, 5, 0, '/*\n::::::::::::::::::::::::::::::::::::::::\n Snippet name: Wayfinder\n Short Desc: builds site navigation\n Version: 2.0\n Authors: \n	Kyle Jaebker (muddydogpaws.com)\n	Ryan Thrash (vertexworks.com)\n Date: February 27, 2006\n::::::::::::::::::::::::::::::::::::::::\nDescription:\n    Totally refactored from original DropMenu nav builder to make it easier to\n    create custom navigation by using chunks as output templates. By using templates,\n    many of the paramaters are no longer needed for flexible output including tables,\n    unordered- or ordered-lists (ULs or OLs), definition lists (DLs) or in any other\n    format you desire.\n::::::::::::::::::::::::::::::::::::::::\nExample Usage:\n    [[Wayfinder? &startId=`0`]]\n::::::::::::::::::::::::::::::::::::::::\n*/\n\n$wayfinder_base = $modx->config[''base_path'']."assets/snippets/wayfinder/";\n\n//Include a custom config file if specified\n$config = (isset($config)) ? "{$wayfinder_base}configs/{$config}.config.php" : "{$wayfinder_base}configs/default.config.php";\nif (file_exists($config)) {\n	include("$config");\n}\n\ninclude_once("{$wayfinder_base}wayfinder.inc.php");\n\nif (class_exists(''Wayfinder'')) {\n   $wf = new Wayfinder();\n} else {\n    return ''error: Wayfinder class not found'';\n}\n\n$wf->_config = array(\n	''id'' => isset($startId) ? $startId : $modx->documentIdentifier,\n	''level'' => isset($level) ? $level : 0,\n	''includeDocs'' => isset($includeDocs) ? $includeDocs : 0,\n	''excludeDocs'' => isset($excludeDocs) ? $excludeDocs : 0,\n	''ph'' => isset($ph) ? $ph : FALSE,\n	''debug'' => isset($debug) ? TRUE : FALSE,\n	''ignoreHidden'' => isset($ignoreHidden) ? $ignoreHidden : FALSE,\n	''hideSubMenus'' => isset($hideSubMenus) ? $hideSubMenus : FALSE,\n	''useWeblinkUrl'' => isset($useWeblinkUrl) ? $useWeblinkUrl : TRUE,\n	''fullLink'' => isset($fullLink) ? $fullLink : FALSE,\n	''nl'' => isset($removeNewLines) ? '''' : "\\n",\n	''sortOrder'' => isset($sortOrder) ? strtoupper($sortOrder) : ''ASC'',\n	''sortBy'' => isset($sortBy) ? $sortBy : ''menuindex'',\n	''limit'' => isset($limit) ? $limit : 0,\n	''cssTpl'' => isset($cssTpl) ? $cssTpl : FALSE,\n	''jsTpl'' => isset($jsTpl) ? $jsTpl : FALSE,\n	''rowIdPrefix'' => isset($rowIdPrefix) ? $rowIdPrefix : FALSE,\n	''textOfLinks'' => isset($textOfLinks) ? $textOfLinks : ''menutitle'',\n	''titleOfLinks'' => isset($titleOfLinks) ? $titleOfLinks : ''pagetitle'',\n	''displayStart'' => isset($displayStart) ? $displayStart : FALSE,\n);\n\n//get user class definitions\n$wf->_css = array(\n	''first'' => isset($firstClass) ? $firstClass : '''',\n	''last'' => isset($lastClass) ? $lastClass : ''last'',\n	''here'' => isset($hereClass) ? $hereClass : ''active'',\n	''parent'' => isset($parentClass) ? $parentClass : '''',\n	''row'' => isset($rowClass) ? $rowClass : '''',\n	''outer'' => isset($outerClass) ? $outerClass : '''',\n	''inner'' => isset($innerClass) ? $innerClass : '''',\n	''level'' => isset($levelClass) ? $levelClass: '''',\n	''self'' => isset($selfClass) ? $selfClass : '''',\n	''weblink'' => isset($webLinkClass) ? $webLinkClass : '''',\n);\n\n//get user templates\n$wf->_templates = array(\n	''outerTpl'' => isset($outerTpl) ? $outerTpl : '''',\n	''rowTpl'' => isset($rowTpl) ? $rowTpl : '''',\n	''parentRowTpl'' => isset($parentRowTpl) ? $parentRowTpl : '''',\n	''parentRowHereTpl'' => isset($parentRowHereTpl) ? $parentRowHereTpl : '''',\n	''hereTpl'' => isset($hereTpl) ? $hereTpl : '''',\n	''innerTpl'' => isset($innerTpl) ? $innerTpl : '''',\n	''innerRowTpl'' => isset($innerRowTpl) ? $innerRowTpl : '''',\n	''innerHereTpl'' => isset($innerHereTpl) ? $innerHereTpl : '''',\n	''activeParentRowTpl'' => isset($activeParentRowTpl) ? $activeParentRowTpl : '''',\n	''categoryFoldersTpl'' => isset($categoryFoldersTpl) ? $categoryFoldersTpl : '''',\n	''startItemTpl'' => isset($startItemTpl) ? $startItemTpl : '''',\n);\n\n//Process Wayfinder\n$output = $wf->run();\n\nif ($wf->_config[''debug'']) {\n	$output .= $wf->renderDebugOutput();\n}\n\n//Ouput Results\nif ($wf->_config[''ph'']) {\n    $modx->setPlaceholder($wf->_config[''ph''],$output);\n} else {\n    return $output;\n}', 0, '', ''),
(6, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 5, 0, '/**\n* if snippet  \n* Date: Jan 03, 2013\n*\n* [[if? &is=`[*id*]:is:4:or:[*parent*]:in:5,6,5,7,8,9` &then=`[[if? &is=`0||is||0` &then=`true` &else=`false` &separator=`||`]]` &else=`@TPL:else`]]\n* [[if? &is=`[*id*]:is:1:or:[*id*]:is:2:and:[*parent*]:is:5:or:[*parent*]:in:2,3,4` &then=`true` &else=`false`]]\n*\n* All expressions are logically (....:or:is:.... ) :and: (...:!empty:.....)\n* expression and divides the condition into 2 parts, which in the end compared to the true\n*\n* Sample №1\n* Output action is necessary only in the parent ID = 5 \n* [[if? &is=`[*parent*]:is:5` &then=`@TPL:chunk-name`]]\n*\n* Sample №2\n* Output action is necessary only in the parent ID = 5 or template IDs in (7,8,9)\n* [[if? &is=`[*parent*]:is:5:or:[*template*]:in:7,8,9` &then=`@TPL:chunk-name`]]\n*\n* Sample №3\n* Output action is necessary only in the parent ID = 5 and only the resource with the template ID = 7\n* [[if? &is=`[*parent*]:is:5:and:[*template*]:is:7` &then=`@TPL:chunk-name`]]\n*\n* Sample №4\n* Output action is necessary only in the parent ID = 5 and (only in the template ID = 7 or in other templates but with TV `new` = 1\n* [[if? &is=`[*parent*]:is:5:and:[*template*]:is:7:or:[*new*]:is:1` &then=`@TPL:chunk-name`]]\n*\n* Sample №5\n* Output share for the goods with a price in the range of > 300 <= 700\n* [[if? &is=`[*price*]:gt:300:and:[*price*]:lte:700` &then=`@TPL:chunk-name`]]\n*\n* Sample №6\n* Output in the multiplicity of records Ditto 3\n* [[if? &is=`[+ditto_iteration+]:%:3` &then=`true` &else=`false`]]\n*\n* Sample №7\n* Output in the multiplicity of records Ditto 3 but by multiplying the\n* [[if? &is=`[+ditto_iteration+]*2:%:3` &then=`true` &else=`false` &math=`on`]]\n*\n* Sample №8\n* Print the value of the mathematical expression\n* [[if? &is=`[+ditto_iteration+]*2` &math=`on`]]\n*\n* Operator:\n* (is,=) , (not,!=) , (>,gt) , (<,lt) , (>=,gte) , (lte,<=) , (isempty,empty) , (not_empty,!empty)\n* (null, is_null) , (in_array, inarray, in) , (not_in,!in)\n*\n* More samples\n* [[if? &is=`eval(''global $iteration;$iteration++;echo $iteration;'')` &math=`on`]]   // iteration in Ditto,Wayfinder and others\n* [[if? &is=`:is:` &then=`@eval: echo str_replace(''<br/>'','''',''[*pagetitle*]'');`]]    // ''our<br/>works'' -> ''our works'' \n* [[if? &is=`:is:` &then=`@eval: echo number_format(''[*price*]'', 2, '','', '' '');`]]    // ''1000000,89'' -> ''1 000 000,89''\n*\n*  RussAndRussky.org.ua\n**/\n\n$s=empty($separator)?'':'':$separator;\n$opers=explode($s,$is);\n$subject=$opers[0];\n$eq=true;\n$and=false;\nfor ($i=1;$i<count($opers);$i++){\n  	if ($opers[$i]==''or'') {$or=true;$part_eq=$eq;$eq=true;continue;}\n    if ($or) {$subject=$opers[$i];$or=false;continue;}\n  \n    if ($opers[$i]==''and'') {\n      $lp=1;\n      $and=true;\n      if (!empty($part_eq)){if ($part_eq||$eq){$left_part=true;}} else {$left_part=$eq?true:false;}\n      $eq=true;unset($part_eq);\n      continue;\n    }\n	if ($and) {$subject=$opers[$i];$and=false;continue;}\n	\n	$operator = $opers[$i];\n	$operand  = $opers[$i+1];\n  \n	if (isset($subject)) {\n		if (!empty($operator)) {\n      if ($math==''on'' && !empty($subject)) {eval(''$subject=''.$subject.'';'');}\n			$operator = strtolower($operator);\n      \n			switch ($operator) {\n   \n        case ''%'':\n        $output = ($subject %$operand==0) ? true: false;$i++;\n        break;\n       \n				case ''!='':\n				case ''not'':$output = ($subject != $operand) ? true: false;$i++;\n					break;\n				case ''<'':\n				case ''lt'':$output = ($subject < $operand) ? true : false;$i++;\n					break;\n				case ''>'':\n				case ''gt'':$output = ($subject > $operand) ? true : false;$i++;\n					break;\n				case ''<='':\n				case ''lte'':$output = ($subject <= $operand) ? true : false;$i++;\n					break;\n				case ''>='':\n				case ''gte'':$output = ($subject >= $operand) ? true : false;$i++;\n					break;\n				case ''isempty'':\n				case ''empty'':$output = empty($subject) ? true : false;\n					break;\n				case ''!empty'':\n				case ''notempty'':\n				case ''isnotempty'':$output = !empty($subject) && $subject != '''' ? true : false;\n					break;\n				case ''isnull'':\n				case ''null'':$output = $subject == null || strtolower($subject) == ''null'' ? true : false;\n					break;\n				case ''inarray'':\n				case ''in_array'':\n				case ''in'':\n					$operand = explode('','',$operand);\n					$output = in_array($subject,$operand) ? true : false;\n					$i++;\n					break;\n				 case ''not_in'':\n				 case ''!in'':\n				 case ''!inarray'':\n					$operand = explode('','',$operand);\n					$output = in_array($subject,$operand) ? false : true;\n					$i++;\n					break;\n			  \n				case ''=='':\n				case ''='':\n				case ''eq'':\n				case ''is'':\n				default:\n        $output = ((string)$subject == (string)$operand) ? true : false;\n        $i++;\n				break;\n			}     \n     \n			$eq=$output?$eq:false;\n   \n		}\n	}\n}\nif ($lp==1){\n  if ($left_part) {\n	if (!empty($part_eq)){\n    	if ($part_eq||$eq){$output=$then;}\n  	} else {\n    	$output=$eq?$then:$else;\n  	}\n  } \n  else \n  {\n    $output=$else;\n  }\n} else {\n	if (!empty($part_eq)){\n		if ($part_eq||$eq){\n			$output=$then;\n		}\n	} else {$output=$eq?$then:$else;}\n}\nif (strpos($output,''@TPL:'')!==FALSE){$output=''{{''.(str_replace(''@TPL:'','''',$output)).''}}'';}\n\nif (substr($output,0,6) == "@eval:") {\n  ob_start();\n	eval(substr($output,6));\n	$output = ob_get_contents();  \n	ob_end_clean(); \n}\nif (empty($then)&&empty($else)) {\n  if ($math==''on'') {eval(''$subject=''.$subject.'';'');}\n  return $subject;\n}\n\nreturn $output;', 0, '', ''),
(7, 'MemberCheck', '<strong>1.1</strong> Show chunks based on a logged in Web User''s group membership', 0, 2, 0, '#::::::::::::::::::::::::::::::::::::::::\n# Version: 1.0\n# Created By Ryan Thrash (vertexworks.com)\n# Sanitized By Jason Coward (opengeek.com)\n#\n# Date: November 29, 2005\n#\n# Changelog: \n# Nov 29, 05 -- initial release\n# Jul 13, 06 -- adjusted Singleton to work under PHP4, added placeholder code (by: garryn)\n#\n#::::::::::::::::::::::::::::::::::::::::\n# Description: 	\n#	Checks to see if users belong to a certain group and \n#	displays the specified chunk if they do. Performs several\n#	sanity checks and allows to be used multiple times on a page.\n#\n# Params:\n#	&groups [array] (REQUIRED)\n#		array of webuser group-names to check against\n#\n#	&chunk [string] (REQUIRED)\n#		name of the chunk to use if passes the check\n#\n#	&ph [string] (optional)\n#		name of the placeholder to set instead of directly retuning chunk\n#\n#	&debug [boolean] (optional | false) \n#		turn on debug mode for extra troubleshooting\n#\n# Example Usage:\n#\n#	[[MemberCheck? &groups=`siteadmin, registered users` &chunk=`privateSiteNav` &ph=`MemberMenu` &debug=`true`]]\n#\n#	This would place the ''members-only'' navigation store in the chunk ''privateSiteNav''\n#	into a placeholder (called ''MemberMenu''). It will only do this as long as the user \n#	is logged in as a webuser and is a member of the ''siteadmin'' or the ''registered users''\n#	groups. The optional debug parameter can be used to display informative error messages \n#	when configuring this snippet for your site. For example, if the developer had \n#	mistakenly typed ''siteowners'' for the first group, and none existed with debug mode on, \n#	it would have returned the error message: The group siteowners could not be found....\n#\n#::::::::::::::::::::::::::::::::::::::::\n\n# debug parameter\n$debug = isset ($debug) ? $debug : false;\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\nif (!isset ($groups)) {\n	return $debug ? ''<p>Error: No Group Specified</p>'' : '''';\n}\n\nif (!isset ($chunk)) {\n	return $debug ? ''<p>Error: No Chunk Specified</p>'' : '''';\n}\n\n# turn comma-delimited list of groups into an array\n$groups = explode('','', $groups);\n\nif (!class_exists(''MemberCheck'')) {\n	class MemberCheck {\n		var $allGroups = NULL;\n		var $debug;\n\n		function getInstance($debug) {\n			static $instance;\n			if (!isset ($instance)) {\n				$instance = new MemberCheck($debug);\n			}\n			return $instance;\n		}\n\n		function MemberCheck($debug = false) {\n			global $modx;\n\n			$this->debug = $debug;\n			if ($debug) {\n				$this->allGroups = array ();\n				$tableName = $modx->getFullTableName(''webgroup_names'');\n				$sql = "SELECT name FROM $tableName";\n				if ($rs = $modx->db->query($sql)) {\n					while ($row = $modx->db->getRow($rs)) {\n						array_push($this->allGroups, stripslashes($row[''name'']));\n					}\n				}\n			}\n		}\n\n		function isValidGroup($groupName) {\n			$isValid = !(array_search($groupName, $this->allGroups) === false);\n			return $isValid;\n		}\n\n		function getMemberChunk(& $groups, $chunk) {\n			global $modx;\n			$o = '''';\n			if (is_array($groups)) {\n				for ($i = 0; $i < count($groups); $i++) {\n					$groups[$i] = trim($groups[$i]);\n					if ($this->debug) {\n						if (!$this->isValidGroup($groups[$i])) {\n							return "<p>The group <strong>" . $groups[$i] . "</strong> could not be found...</p>";\n						}\n					}\n				}\n\n				$check = $modx->isMemberOfWebGroup($groups);\n\n				$chunkcheck = $modx->getChunk($chunk);\n\n				$o .= ($check && $chunkcheck) ? $chunkcheck : '''';\n				if (!$chunkcheck)\n					$o .= $this->debug ? "<p>The chunk <strong>$chunk</strong> not found...</p>" : '''';\n			} else {\n				$o .= "<p>No valid group names were specified!</p>";\n			}\n\n			return $o;\n		}\n	}\n}\n\n$memberCheck = MemberCheck :: getInstance($debug);\n\nif (!isset ($ph)) {\n	return $memberCheck->getMemberChunk($groups, $chunk);\n} else {\n	$modx->setPlaceholder($ph, $memberCheck->getMemberChunk($groups, $chunk));\n	return '''';\n}', 0, '', ''),
(8, 'WebChangePwd', '<strong>1.0</strong> Allows Web User to change their password from the front-end of the website', 0, 2, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->insideManager())? "../":"");\n$snipPath .= "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[''cmdwebchngpwd'']);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/webchangepwd.inc.php";\n\n# Return\nreturn $output;\n\n\n\n', 0, '', ''),
(9, 'WebLogin', '<strong>1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 2, 0, '# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? explode(",",$loginhomeid):array($modx->config[''login_home''],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:''Login'';\n$logoutText	= isset($logouttext)? $logouttext:''Logout'';\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$webLoginMode = isset($_REQUEST[''webloginmode''])? $_REQUEST[''webloginmode'']: '''';\n$isLogOut		= $webLoginMode==''lo'' ? 1:0;\n$isPWDActivate	= $webLoginMode==''actp'' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[''cmdweblogin'']) || isset($_POST[''cmdweblogin_x'']));\n$txtPwdRem 		= isset($_REQUEST[''txtpwdrem''])? $_REQUEST[''txtpwdrem'']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==''1'' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: '''';\n$cookieKey = substr(md5($site_id."Web-User"),0,15);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once ($modx->config[''base_path''] . "manager/includes/crypt.class.inc.php");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[''base_path''] . "manager/includes/log.class.inc.php";\n	include_once $snipPath."weblogin/weblogin.processor.inc.php";\n}\n\ninclude_once $snipPath."weblogin/weblogin.inc.php";\n\n# Return\nreturn $output;\n', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string;', ''),
(10, 'WebSignup', '<strong>1.1</strong> Basic Web User account creation/signup system', 0, 2, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n    return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:"";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[''use_captcha''] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? explode('','',$groups):array();\nfor($i=0;$i<count($groups);$i++) $groups[$i] = trim($groups[$i]);\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[''cmdwebsignup'']);\n\n$output = '''';\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/websignup.inc.php";\n\n# Return\nreturn $output;', 0, '&tpl=Template;string;', ''),
(11, 'Reflect', '<strong>2.1.0</strong> Generates date-based archives using Ditto', 0, 7, 0, '/*\n * Author: \n *      Mark Kaplan for MODx CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page''s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[''base_path''].$reflect_base : $modx->config[''base_path'']."assets/snippets/reflect/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODx base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base."configs/default.config.php");\nrequire($reflect_base."default.templates.php");\nif ($config != "default") {\n    require((substr($config, 0, 5) != "@FILE") ? $reflect_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id."_" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    "" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[''id''];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODx document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODx Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODx fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : "%d-%b-%y %H:%M";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    "%d-%b-%y %H:%M"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : "DESC";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "DESC"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : "ASC";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "ASC"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = "reflect_".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: "@CODE:".$defaultTemplates[''item''];\n    $dParams = array(\n        "id" => "$rID",\n        "save" => "3",  \n        "summarize" => "all",\n        "tpl" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode("|",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(":",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(''reflect_base'',''config'',''id'',''getDocuments'',''showItems'',''groupByYears'',''targetID'',''yearSortDir'',''monthSortDir'',''start'',''phx'',''tplContainer'',''tplYear'',''tplMonth'',''tplMonthInner'',''tplItem'',''save'');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != ''tpl'') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : "Ditto";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        "Ditto"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID."_ditto_object");\n    $resource = $modx->getPlaceholder($rID."_ditto_resource");\n} else {\n    $ditto = $modx->getPlaceholder($id."ditto_object");\n    $resource = $modx->getPlaceholder($id."ditto_resource");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : "The Ditto object is invalid. Please check it.";\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[''tpl''] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[''tpl''];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year''] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[''year''];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year_inner''] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[''year_inner''];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month''] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[''month''];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month_inner''] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[''month_inner''];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''item''] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[''item''];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField("date","display","custom");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists("reflect") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = '''';\n    $ph = array(''year''=>'''',''month''=>'''',''item''=>'''',''out''=>'''');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date["year"];\n        $month = $date["mon"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == "DESC") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == "ASC") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = '''';\n        $r_month = '''';\n        $r_month_2 = '''';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime("%B", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL("month=".$mon."&year=".$year."&day=false&start=0",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array("year"=>$year,"month"=>$month_text,"url"=>$month_url,"count"=>$month_count),$templates[''month'']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][''items''][] = $ditto->render($item, $templates[''item''], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(''wrapper'' => implode('''',$items[$year][$mon][''items''])),$templates[''month_inner'']);\n                $items[$year][$mon] = $ditto->template->replace(array(''wrapper'' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL("year=".$year."&month=false&day=false&start=0",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array("year"=>$year,"url"=>$year_url,"count"=>$year_count),$templates[''year'']);\n            $var = $ditto->template->replace(array(''wrapper''=>implode('''',$items[$year])),$templates[''year_inner'']);\n            $output .= $ditto->template->replace(array(''wrapper''=>$var),$r_year);\n        } else {\n            $output .= implode('''',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(''wrapper''=>$output),$templates[''tpl'']);\n    $modx->setPlaceholder($id.''reset'',$ditto->buildURL(''year=false&month=false&day=false'',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);', 0, '', ''),
(12, 'Personalize', '<strong>2.1</strong> Personalize snippet', 0, 2, 0, '#::::::::::::::::::::::::::::::::::::::::\n# Created By:Ryan Thrash (modx@vertexworks.com),\n#	and then powered up by kudo (kudo@kudolink.com)\n#\n# Date: Aug 03, 2006\n#\n# Changelog:\n# Dec 01, 05 -- initial release\n# Jun 19, 06 -- updated description\n# Jul 19, 06 -- hacked by kudo to output chunks\n# Aug 03, 06 -- added placeholder for username\n# Aug 27, 10 -- powered up all code\n#\n#::::::::::::::::::::::::::::::::::::::::\n# Description:\n#	Checks to see if webusers are logged in and displays yesChunk if the user\n#	is logged or noChunk if user is not logged. Insert only the chunk name as\n#	param, without {{}}. Can use a placeholder to output the username.\n#	TESTED: can be used more than once per page.\n#	TESTED: chunks can contain snippets.\n#\n#\n# Params:\n#	&yesChunk [string] (optional)\n#		Output for LOGGED users\n#\n#	&noChunk [string] (optional)\n#		Output for NOT logged users\n#\n#	&ph [string] (optional)\n#		Placeholder for placing the username\n#		ATTENTION!: place this ph only in yesChunk!\n#\n#	&context [string] (optional)\n#		web|mgr\n#\n#	&yesTV [string] (optional)\n#		Output for LOGGED users\n#\n#	&noTV [string] (optional)\n#		Output for NOT logged users\n#\n# Example Usage:\n#\n#	[[Personalize? &yesChunk=`Link` &noChunk=`Register` &ph=`name`]]\n#\n#	Having Chunks named {{Link}} and another {{Register}}, the first will be\n#	published to registered user, the second to non-registered users.\n#\n#::::::::::::::::::::::::::::::::::::::::\n\n# prepare params and variables\n\nif     ($this->isFrontend() && isset ($_SESSION[''webValidated''])) $current_context = ''web'';\nelseif ($this->isBackend()  && isset ($_SESSION[''mgrValidated''])) $current_context = ''mgr'';\n\n$output = '''';\n$yesChunk = (isset($yesChunk))? $yesChunk : '''';\n$noChunk  = (isset($noChunk)) ? $noChunk  : '''';\n$ph       = (isset($ph))      ? $ph       : ''username'';\n$context  = (isset($context)) ? $context     : $current_context;\n$yesTV    = (isset($yesTV))   ? $yesTV : '''';\n$noTV     = (isset($noTV))    ? $noTV  : '''';\n\n/*\n$referer = htmlspecialchars($_SERVER[''HTTP_REFERER''], ENT_QUOTES);\n$ua =      htmlspecialchars($_SERVER[''HTTP_USER_AGENT''], ENT_QUOTES);\n$ip =      htmlspecialchars($_SERVER[''REMOTE_ADDR''], ENT_QUOTES);\n$host =    htmlspecialchars($_SERVER[''REMOTE_HOST''], ENT_QUOTES);\n\n$ua_strtolower = strtolower($_SERVER[''HTTP_USER_AGENT'']);\nif    (strpos($ua_strtolower, ''firefox'') !== false)     $browser = ''firefox'';\nelseif(strpos($ua_strtolower, ''trident/4.0'') !== false) $browser = ''internet explorer 8'';\nelseif(strpos($ua_strtolower, ''msie'') !== false)        $browser = ''internet explorer'';\nelseif(strpos($ua_strtolower, ''chrome'') !== false)      $browser = ''chrome'';\nelseif(strpos($ua_strtolower, ''safari'') !== false)      $browser = ''safari'';\nelseif(strpos($ua_strtolower, ''opera'') !== false)       $browser = ''opera'';\nelse $browser = ''other'';\n\n$modx->setPlaceholder(''referer'', $referer);\n$modx->setPlaceholder(''ua'',      $ua);\n$modx->setPlaceholder(''browser'', $browser);\n$modx->setPlaceholder(''ip'',      $ip);\n$modx->setPlaceholder(''host'',    $host);\n*/\n\nswitch($context)\n{\n    case ''web'':\n        $short_name = $_SESSION[''webShortname''];\n        $full_name  = $_SESSION[''webFullname''];\n        $email      = $_SESSION[''webEmail''];\n        $last_login = $_SESSION[''webLastlogin''];\n        break;\n    case ''mgr'':\n    case ''manager'':\n        $short_name = $_SESSION[''mgrShortname''];\n        $full_name  = $_SESSION[''mgrFullname''];\n        $email      = $_SESSION[''mgrEmail''];\n        $last_login = $_SESSION[''mgrLastlogin''];\n        break;\n    default:\n        $short_name = '''';\n}\nif (!empty($context))\n{\n    if($yesTV !== '''')\n    {\n        $pre_output = $modx->documentObject[$yesTV];\n        if(is_array($pre_output))\n        {\n            $output = $pre_output[1];\n        }\n        else\n        {\n            $output = $pre_output;\n        }\n    }\n    elseif($yesChunk !== '''')\n    {\n        $output = $modx->getChunk($yesChunk);\n    }\n    else\n    {\n        $output = ''username : '' . $short_name;\n    }\n\n    if(empty($last_login)) $last_login_text = ''first login'';\n    else                   $last_login_text = $modx->toDateFormat($last_login);\n\n    $modx->setPlaceholder($ph,$short_name);\n    $modx->setPlaceholder(''short_name'',  $short_name);\n    $modx->setPlaceholder(''full_name'',   $full_name);\n    $modx->setPlaceholder(''email'',       $email);\n    $modx->setPlaceholder(''last_login'', $last_login_text);\n}\nelse\n{\n    if($noTV !== '''')\n    {\n        $pre_output = $modx->documentObject[$noTV];\n        if(is_array($pre_output))\n        {\n            $output = $pre_output[1];\n        }\n        else\n        {\n            $output = $pre_output;\n        }\n    }\n    elseif($noChunk!=='''')\n    {\n        $output = $modx->getChunk($noChunk);\n    }\n    else\n    {\n        $output = ''guest'';\n    }\n}\nreturn $output;', 0, '', ''),
(13, 'Jot', '<strong>1.1.4</strong> User comments with moderation and email subscription', 0, 7, 0, '/*####\n#\n# Author: Armand "bS" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modxcms.com/Jot-998.html\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[''base_path''] . ''assets/snippets/jot/'';\ninclude_once($jotPath.''jot.class.inc.php'');\n\n$Jot = new CJot;\n$Jot->VersionCheck("1.1.4");\n$Jot->Set("path",$jotPath);\n$Jot->Set("action", $action);\n$Jot->Set("postdelay", $postdelay);\n$Jot->Set("docid", $docid);\n$Jot->Set("tagid", $tagid);\n$Jot->Set("subscribe", $subscribe);\n$Jot->Set("moderated", $moderated);\n$Jot->Set("captcha", $captcha);\n$Jot->Set("badwords", $badwords);\n$Jot->Set("bw", $bw);\n$Jot->Set("sortby", $sortby);\n$Jot->Set("numdir", $numdir);\n$Jot->Set("customfields", $customfields);\n$Jot->Set("guestname", $guestname);\n$Jot->Set("canpost", $canpost);\n$Jot->Set("canview", $canview);\n$Jot->Set("canedit", $canedit);\n$Jot->Set("canmoderate", $canmoderate);\n$Jot->Set("trusted", $trusted);\n$Jot->Set("pagination", $pagination);\n$Jot->Set("placeholders", $placeholders);\n$Jot->Set("subjectSubscribe", $subjectSubscribe);\n$Jot->Set("subjectModerate", $subjectModerate);\n$Jot->Set("subjectAuthor", $subjectAuthor);\n$Jot->Set("notify", $notify);\n$Jot->Set("notifyAuthor", $notifyAuthor);\n$Jot->Set("validate", $validate);\n$Jot->Set("title", $title);\n$Jot->Set("authorid", $authorid);\n$Jot->Set("css", $css);\n$Jot->Set("cssFile", $cssFile);\n$Jot->Set("cssRowAlt", $cssRowAlt);\n$Jot->Set("cssRowMe", $cssRowMe);\n$Jot->Set("cssRowAuthor", $cssRowAuthor);\n$Jot->Set("tplForm", $tplForm);\n$Jot->Set("tplComments", $tplComments);\n$Jot->Set("tplModerate", $tplModerate);\n$Jot->Set("tplNav", $tplNav);\n$Jot->Set("tplNotify", $tplNotify);\n$Jot->Set("tplNotifyModerator", $tplNotifyModerator);\n$Jot->Set("tplNotifyAuthor", $tplNotifyAuthor);\n$Jot->Set("tplSubscribe", $tplSubscribe);\n$Jot->Set("debug", $debug);\n$Jot->Set("output", $output);\nreturn $Jot->Run();', 0, '', ''),
(14, 'FirstChildRedirect', '<strong>1.0</strong> Automatically redirects to the first child of a Container Resource', 0, 5, 0, '/*\n * @name FirstChildRedirect\n * @author Jason Coward <jason@opengeek.com>\n * @modified-by Ryan Thrash <ryan@vertexworks.com>\n * @license Public Domain\n * @version 1.0\n * \n * This snippet redirects to the first child document of a folder in which this\n * snippet is included within the content (e.g. [!FirstChildRedirect!]).  This\n * allows MODx folders to emulate the behavior of real folders since MODx\n * usually treats folders as actual documents with their own content.\n * \n * Modified to make Doc ID a required parameter... now defaults to the current \n * Page/Folder you call the snippet from.\n * \n * &docid=`12` \n * Use the docid parameter to have this snippet redirect to the\n * first child document of the specified document.\n */\n\n$docid = (isset($docid))? $docid: $modx->documentIdentifier;\n\n$children= $modx->getActiveChildren($docid, ''menuindex'', ''ASC'');\nif (!$children === false) {\n    $firstChild= $children[0];\n    $firstChildUrl= $modx->makeUrl($firstChild[''id'']);\n} else {\n    $firstChildUrl= $modx->makeUrl($modx->config[''site_start'']);\n}\nreturn $modx->sendRedirect($firstChildUrl,0,''REDIRECT_HEADER'',''HTTP/1.1 301 Moved Permanently'');\n', 0, '', '');
INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(15, 'ListIndexer', '<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists', 0, 5, 0, '// added in 1.0.1: hidePrivate (hide items from unauthorized users)\n//\n// Derived from ListIndex 0.6j by jaredc@honeydewdesign.com\n// Now supports Show In Menu\n//\n// This snippet was designed to be a VERY flexible way\n// of showing what has been recently added. You can use\n// this snippet to show news from one folder, or what has\n// been recently added site wide. You can even show what''s\n// new in a ''section'' (everything under a defined folder)!\n\n// Configuration Settings\n\n   // Set the following snippet defaults the way you would normally\n   // use this snippet, then use snippet variables in other situations\n   // to override the default behaviors.\n\n   // GENERAL OPTIONS\n\n   // $rootFolder [ NULL | string (comma separated page id''s) ]\n   // Decide which folder to pull recent documents from.\n   // If you want to specify a few folders, comma separate them.\n   // The default NULL will set current page as root. Using 0\n   // would search site wide. Can be set with snippet parameter\n   // $LIn_root like:\n   // [[ListIndexer?LIn_root=3,6,88]] \n   $rootFolder = NULL;\n\n   // $descendentDepth [ int ]\n   // How many levels below the root folder(s) do you want to\n   // include? Can be overridden in snippet call with LIn_depth:\n   // [[ListIndexer?LIn_depth=2]]\n   // Uncomment one of these common two or create your own:\n   // $descendentDepth = 1; // just children of root folder(s)\n   $descendentDepth = 0; // all decendents of root folder(s)\n\n   // $seeThruUnpub [ true | false ]\n   // When using descendents, do you want to consider files below\n   // an unpublished (hidden) folder? Usually no. But you decide.\n   // Snippet parameter: LIn_seeThru\n   // [[ListIndexer?LIn_seeThru=1]]\n   $seeThruUnpub = false;\n\n   // $seeShowInMenu [ true | false ]\n   // When using descendents, do you want to consider files flagged\n   // to be hidden from the menus? Usually no. But you decide.\n   // Snippet parameter: LIn_seeShowInMenu\n   // [[ListIndexer?LIn_seeShowInMenu=1]]\n   $seeShowInMenu = false;\n   \n   // $hidePrivate [ true | false ]\n   // Hide items from users that don''t have appropriate\n   // rights to view. Usually true. But you decide.\n   // Snippet parameter: LIn_hidePrivate\n   // [[ListIndexer?LIn_hidePrivate=0]]\n   $hidePrivate = true;\n\n   // $mode [ ''short'' | ''full'' ]\n   // Defines whether this list should be a full, paged\n   // list of all documents, or a short list of the most\n   // recent few (how many will be defined next). Can be\n   // overridden in snippet call with $LIn_mode:\n   // [[ListIndexer?LIn_mode=full]]\n   $mode = ''short'';\n   \n   // $sortBy [ ''alpha'' | ''date'' | ''menuindex'' ]\n   // The default date will sort by most recent items first, but\n   // by using the ''alpha'' option, and using full mode, you could\n   // use this to create an index, or directory.\n   // Settable with snippet call $LIn_sort:\n   // [[ListIndexer?LIn_sort=alpha]]\n   $sortBy = ''date'';\n   \n   // $sortDir [ ''ASC'' | ''DESC'' ]\n   // Sort direction ascending or descending. Is applied to whatever $sortBy\n   // field you have chosen above. If left blank, menuindex and alpha will sort\n   // ASC and date DESC.\n   // $LIn_dir in snippet call:\n   // [[ListIndexer?LIn_dir=ASC&LIn_sortBy=menuindex]]\n   $sortDir = '''';\n\n   // WHAT TO DISPLAY\n\n   // $defaultTitle [ string ]\n   // If you want a default title for your list\n   // you can declare it here. Or use an empty\n   // string to leave this off. This can be overridden\n   // in the snippet call with the variable $LIn_title:\n   // [[ListIndexer?LIn_title=Some new title]]\n   $defaultTitle = '''';\n\n   // $shortDesc [ true | false ]\n   // Show the description on the short list, or not. Snippet\n   // parameter $LIn_sDesc:\n   // [[ListIndexer?LIn_sDesc=0]]\n   $shortDesc = true;\n\n   // $fullDesc [ true | false ]\n   // Show the description on the full list, or not. Snippet\n   // parameter $LIn_fDesc:\n   // [[ListIndexer?LIn_fDesc=0]]\n   $fullDesc = true;\n\n   // $linkToIndex [ int ]\n   // If you have a page set up as an ''index'' for all the \n   // documents in this list, you can link to it by specifying \n   // its id- can also be set in snippet call with LIn_link:\n   // [[ListIndexer?LIn_link=8]]\n   // The default 0 will eliminate this link\n   $linkToIndex = 0;\n\n   // $indexText [ string ]\n   // If you want a link to an index (probably a page running this\n   // snippet in "full" mode), you can declare what you want that\n   // link to say here. Or in the snippet call with LIn_indexText:\n   // [[ListIndexer?LIn_indexText=Financial News Index]]\n   $indexText = ''Index'';\n\n   // $showCreationDate [ true | false ]\n   // Decide to include date of creation in output or not. From\n   // snippet call $LIn_showDate use 1 (true) or 0 (false)\n   // [[ListIndexer?LIn_showDate=1]]\n   $showCreationDate = true;\n\n   // $dateFormat [ string ]\n   // Used to define how date will be displayed (if using date)\n   // Y = 4 digit year     y = 2 digit year\n   // M = Jan - Dec        m = 01 - 12\n   // D = Sun - Sat        d = 01 -31\n   // Other standard PHP characters may be used\n   $dateFormat = ''Y.m.d'';\n\n   // $shortQty [ int ]\n   // Number of entries to list in the short list. Can be\n   // overridden in snippet call with $LIn_sQty:\n   //[[ListIndexer?LIn_sQty=3]]\n   $shortQty = 3;\n\n   // PAGING\n\n   // $fullQty [ int ]\n   // Number of entries PER PAGE to list in the full list\n   // Can be overridden in snippet call with $LIn_fQty:\n   // [[ListIndexer?LIn_fQty=20]]\n   // To show all set to 0 here or in snippet call\n   $fullQty = 10;\n   \n   // $pageSeparator [ string ]\n   // What you want your page number links to be separated by.\n   // You NEED to include spaces if you want them. They are NOT\n   // created automatically to facilitate styling ability.\n   // For instance, " | " will render links like:\n   // 1 | 2 | 3 | 4\n   $pageSeparator = " | ";\n   \n   // $pgPosition [ ''top'' | ''bottom'' | ''both'']\n   // Pick where you want your pagination links to appear.\n   $pgPosition = ''both'';\n\n   // PERFORMANCE\n\n   // $useFastUrls [ true | false ]\n   // IMPORTANT- using fast urls will reduce database queries\n   // and improve performance WHEN IN FULL MODE ONLY and \n   // should NOT be used when multiple instances of this snippet\n   // appear on the same page. With snippet call LIn_fast use 1\n   // (true) or 0 (false)\n   // [[ListIndexer?LIn_fast=0]]\n   $useFastUrls = false;\n\n   // $newLinesForLists [ true | false ]\n   // Depending on how you want to style your list, you may\n   // or may not want your <li>s on new lines. Generally, if you\n   // are displaying then inline (horizontal, you do not want new\n   // lines, but standard vertical block styling you do. This is\n   // for IE, real browsers don''t care.\n   $newLinesForLists = true;\n\n// Styles\n//\n// The following are the styles included in this snippet. It is up\n// to you to include these styles in your stylesheet to get them to\n// look the way you want.\n\n   // div.LIn_title {}          List title div\n   // ul.LIn_fullMode {}        UL class\n   // ul.LIn_shortMode {}       UL class\n   // span.LIn_date {}          Span surrounding pub/created date\n   // span.LIn_desc {}          Span surrounding description\n   // div.LIn_pagination        Div surrounding pagination links\n   // span.LIn_currentPage {}   Span surrounding current page of\n   //                           pagination (which wouldn''t be css-able\n   //                           by virtue of its <a> tag)\n\n\n// **********************************************************************\n// END CONFIG SETTINGS\n// THE REST SHOULD TAKE CARE OF ITSELF\n// **********************************************************************\n\n// Take care of IE list issue\n$ie = ($newLinesForLists)? "\\n" : '''' ;\n\n// Use snippet call defined variables if set\n$activeTitle = (isset($LIn_title))? $LIn_title : $defaultTitle ;\n$mode = (isset($LIn_mode))? $LIn_mode : $mode ;\n$descendentDepth = (isset($LIn_depth))? $LIn_depth : $descendentDepth ;\n$seeThruUnpub = (isset($LIn_seeThru))? $LIn_seeThru : $seeThruUnpub ;\n$seeShowInMenu = (isset($LIn_seeShowInMenu))? $LIn_seeShowInMenu : $seeShowInMenu ;\n$hidePrivate = (isset($LIn_hidePrivate))? $LIn_hidePrivate : $hidePrivate;\n$linkToIndex = (isset($LIn_link))? $LIn_link : $linkToIndex ;\n$rootFolder = (isset($LIn_root))? $LIn_root : $rootFolder ;\n$shortQty = (isset($LIn_sQty))? $LIn_sQty : $shortQty ;\n$fullQty = (isset($LIn_fQty))? $LIn_fQty : $fullQty ;\n$showCreationDate = (isset($LIn_showDate))? $LIn_showDate : $showCreationDate ;\n$indexText = (isset($LIn_indexText))? $LIn_indexText : $indexText ;\n$useFastUrls = (isset($LIn_fast))? $LIn_fast : $useFastUrls ;\n$sortBy = (isset($LIn_sort))? $LIn_sort : $sortBy;\n$shortDesc = (isset($LIn_sDesc))? $LIn_sDesc : $shortDesc ;\n$fullDesc = (isset($LIn_fDesc))? $LIn_fDesc : $fullDesc ;\n$sortDir = (isset($LIn_dir))? $LIn_dir : $sortDir ;\nif ($sortDir == '''') $sortDir = ($sortBy == ''date'')? ''DESC'' : ''ASC'' ;\n\n\n// Make useful variable shortcut for the content table\n//$tbl = $modx->dbConfig[''dbase''] . "." . $modx->dbConfig[''table_prefix''] . "site_content";\n$tblsc = $modx->getFullTableName("site_content");\n$tbldg = $modx->getFullTableName("document_groups");\n\n// Initialize output\n$output = '''';\n\n// ---------------------------------------------------\n// ---------------------------------------------------\n// Query db for parent folders, or not. First check to\n// see if a querystring cheat has been provided- this\n// should speed things up considerably when using this\n// in full mode. (a.k.a. fastUrls)\n// ---------------------------------------------------\n// ---------------------------------------------------\n$inFolder= isset($_GET[''LIn_f''])? $_GET[''LIn_f'']: 0;\nif ((!$inFolder && $useFastUrls) || !$useFastUrls ){\n  // Only run all the database queries if we don''t already\n  // know the folders AND fastUrls are desired.\n\n  // ---------------------------------------------------\n  // Seed list of viable parents\n  // ---------------------------------------------------\n\n  if ($rootFolder == NULL){\n    $rootFolder = $modx->documentIdentifier;\n  }\n  // Set root level parent array\n  $seedArray = explode('','',$rootFolder);\n  $parentsArray = array();\n  foreach($seedArray AS $seed){\n    $parentsArray[''level_0''][] = $seed;\n  }\n\n  // ---------------------------------------------------\n  // Make array of all allowed parents\n  // ---------------------------------------------------\n\n  // Process valid parents\n  $levelCounter = 1;\n\n  while (((count($parentsArray) < $descendentDepth) || ($descendentDepth == 0)) && ($levelCounter <= count($parentsArray)) && ($levelCounter < 10)){\n\n    // Find all decendant parents for this level\n    $pLevel = ''level_''.($levelCounter - 1);\n    $tempLevelArray = $parentsArray[$pLevel];\n\n    foreach($tempLevelArray AS $p){\n\n      // Get children who are parents (isfolder = 1)\n      $validParentSql = "";\n      $validParentSql .= "SELECT id FROM $tblsc sc WHERE ";\n      $validParentSql .= "isfolder = 1 AND parent = $p ";\n      $validParentSql .= "AND sc.deleted=0 ";\n      $validParentSql .= ($seeThruUnpub)? ";" : "AND sc.published = 1;";\n\n      // Run statement\n      $rsTempParents = $modx->dbQuery($validParentSql);\n      // Get number of results\n      $countTempParents = $modx->recordCount($rsTempParents);\n\n      // If there are results, put them in an array\n      $tempValidArray = false;\n      if ($countTempParents){\n        for ($i=0;$i<$countTempParents;$i++){\n          $tempId = $modx->fetchRow($rsTempParents);\n          $tempValidArray[] = $tempId[''id''];\n        } // end while\n      } // end if\n\n	  // populate next level of array \n	  if ($tempValidArray){\n	    foreach($tempValidArray AS $kid){\n	      $kidLevel = ''level_''.$levelCounter;\n	      $parentsArray[$kidLevel][] = $kid;\n	    } // end foreach\n\n	  } // end if\n    } // end foreach\n\n    // Do next level\n    $levelCounter++;\n\n  } // end while\n\n  // Finalize list of parents\n  $validParents = '''';\n  foreach ($parentsArray AS $level){\n    foreach ($level AS $validP){\n      $validParents .= $validP . '','';\n    }\n  }\n\n  // Remove trailing comma\n  $validParents = substr($validParents,0,strlen($validParents)-1);\n\n} else {\n  $validParents = $_GET[''LIn_f''];\n}\n\n// ---------------------------------------------------\n// Make appropriate SQL statement to pull recent items\n// ---------------------------------------------------\n\n// get document groups for current user\nif($docgrp = $modx->getUserDocGroups()) $docgrp = implode(",",$docgrp);\n\n$access = " (".($modx->isFrontend() ? "sc.privateweb=0":"1=''".$_SESSION[''mgrRole'']."'' OR sc.privatemgr=0").\n          (!$docgrp ? "":" OR dg.document_group IN ($docgrp)").") AND ";\n\n// Initialize\n$recentSql = "";\n$recentSql .= "SELECT sc.id, pagetitle, description";\n// Include pub_date or createdon date if date is desired\n$recentSql .= ($showCreationDate)? ", IF(pub_date > 0, pub_date, createdon) AS pubDate ": " " ;\n$recentSql .= "FROM $tblsc sc LEFT JOIN $tbldg dg on dg.document = sc.id ";\n$recentSql .= "WHERE ";\n$recentSql .= ($hidePrivate)? $access:"";\n// Look everywhere, or just under valid parents\n$recentSql .= (($rootFolder == 0) && $seeThruUnpub && ($descendentDepth == 0))? "" : "parent IN ($validParents) AND " ;\n// Published\n$recentSql .= "sc.published = 1 ";\n// Show In Menu\n$recentSql .= ($seeShowInMenu)? " " : " AND sc.hidemenu=0 " ;\n// Not deleted\n$recentSql .= "AND sc.deleted=0 ";\n// Choose sort method\nswitch ($sortBy){\n  case ''alpha'':\n    $recentSql .= "ORDER BY pagetitle ";\n    break;\n  case ''menuindex'':\n    $recentSql .= "ORDER BY menuindex ";\n    break;\n  default:\n    $recentSql .= "ORDER BY IF(pub_date>0, pub_date, createdon) ";\n    break;\n}\n// Provide a sort direction\n$recentSql .= $sortDir;\n\n// If this is a short list, just pull a limited number\n$recentSql .= ($mode == ''short'')? " LIMIT $shortQty;" : ";" ;\n\n// Run statement\n$rsRecent = $modx->dbQuery($recentSql);\n// Count records\n$recentLimit = $modx->recordCount($rsRecent);\n\n// ---------------------------------------------------\n// Generate pagination string if needed\n// ---------------------------------------------------\n$offsetParam = isset($_GET[''LIn_o''])? $_GET[''LIn_o'']: 0;\n$offset = ($offsetParam && ($mode == ''full''))? $offsetParam : 0 ;\n$pagination = '''';\n\n// Don''t bother unless there are enough records to justify it\nif ( ($mode == ''full'') && ($recentLimit > $fullQty) && ($fullQty) ){\n  $fullUrl = $_SERVER[''REQUEST_URI''];\n  $urlPieces = parse_url($fullUrl);\n  $urlPath = $urlPieces[''path''];\n  $otherQs = '''';\n\n  if ($urlPieces[''query'']){\n    foreach($_GET AS $qsKey=>$qsValue){\n	  if (($qsKey != ''LIn_o'') && ($qsKey != ''LIn_f'')){\n	    $otherQs .= ''&''.$qsKey.''=''.$qsValue;\n	  }\n	}\n  } \n  \n  $fastUrl = $urlPath.''?LIn_f=''.$validParents.$otherQs;\n\n  // Determine number of pages needed to show results\n  $totalPages = ceil($recentLimit/$fullQty);\n  \n  // Make links\n  for ($j = 0 ; $j < $totalPages; $j++){\n    // only include links to OTHER pages, not current page\n    if($offset == $j*$fullQty){\n	  $pagination .= ''<span class="LIn_currentPage">''.($j+1) .''</span>'';\n	} else {\n      $pagination .= ''<a href="''.$fastUrl.''&LIn_o=''.($j*$fullQty).''" title="''.($j+1).''">''.($j+1) .''</a>'';\n	}\n	if ($j < $totalPages-1){\n	  $pagination .= $pageSeparator;\n	}\n  }\n  \n  // Make final pagination link set in it''s own div\n  $pagination = ''<div class="LIn_pagination">''."\\n".$pagination."\\n</div>\\n";\n  \n}\n\n\n// ---------------------------------------------------\n// Create title if wanted\n// ---------------------------------------------------\n\nif ($activeTitle){\n  $output .= ''<div class="LIn_title">''.$activeTitle.''</div>''."\\n";\n}\n\n// ---------------------------------------------------\n// Create list of recent items\n// ---------------------------------------------------\n\n// Include pagination\n$output .= ($pgPosition == ''top'' || $pgPosition == ''both'')? $pagination : '''' ;\n\n$output .= ''<ul class="LIn_''.$mode.''Mode">'' . $ie;\n\n$recentCounter = $offset;\nif ($mode == ''short'') {\n  $recentCounterLimit = min($shortQty,$recentLimit);\n} else {\n  $recentCounterLimit = ($fullQty)? min(($fullQty+$offset),$recentLimit) : $recentLimit ;\n}\n\nwhile (($recentCounter < $recentCounterLimit) && $rsRecent && ($recentLimit > 0)){\n  mysql_data_seek($rsRecent,$recentCounter);\n  $recentRecord = $modx->fetchRow($rsRecent);\n  $output .= ''<li>'';\n  // Link to page\n  $output .= ''<a href="[~''.$recentRecord[''id''].''~]" title="''.strip_tags($recentRecord[''pagetitle'']).''">''.$recentRecord[''pagetitle''].''</a> '';\n  // Date if desired\n  if ($showCreationDate){\n    $output .= ''<span class="LIn_date">''.date($dateFormat,$recentRecord[''pubDate'']).''</span> '';\n  }\n  // Description if desired\n  if ((($mode == ''short'') && ($shortDesc)) || (($mode == ''full'') && ($fullDesc))){\n   $output .= ''<span class="LIn_desc">''.$recentRecord[''description''].''</span>'';\n  }\n  // wrap it up\n  $output .= ''</li>'' . $ie;\n  $recentCounter ++;\n}\n\n$output .= ''</ul>'' . $ie;\n\n$output .= ($pgPosition == ''bottom'' || $pgPosition == ''both'')? $pagination : '''' ;\n\n// ---------------------------------------------------\n// Link to index\n// ---------------------------------------------------\n\nif ($linkToIndex) {\n\n  $output .= ''<div class="LIn_index">'';\n  $output .= ''<a href="[~''.$linkToIndex.''~]" title="''.$indexText.''">''.$indexText.''</a>'';\n  $output .= ''</div>'';\n\n}\n\n// ---------------------------------------------------\n// Send to browser\n// ---------------------------------------------------\n\nreturn $output;', 0, '', ''),
(16, 'Ditto', '<strong>2.1.0</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 7, 0, '/* Description:\n *      Aggregates documents to create blogs, article/news\n *      collections, and more,with full support for templating.\n * \n * Author: \n *      Mark Kaplan for MODx CMF\n*/\n\n//---Core Settings---------------------------------------------------- //\n\n$ditto_version = "2.1.0";\n    // Ditto version being executed\n\n$ditto_base = isset($ditto_base) ? $modx->config[''base_path''].$ditto_base : $modx->config[''base_path'']."assets/snippets/ditto/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n$dittoID = (!isset($id)) ? "" : $id."_";\n$GLOBALS["dittoID"] = $dittoID;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any combination of characters a-z, underscores, and numbers 0-9\n    \n    Note:\n    This is case sensitive\n\n    Default:\n    "" - blank\n*/      \n$language = (isset($language))? $language : $modx->config[''manager_language''];\nif (!file_exists($ditto_base."lang/".$language.".inc.php")) {\n    $language ="english";\n}\n/*\n    Param: language\n\n    Purpose:\n    language for defaults, debug, and error messages\n\n    Options:\n    Any language name with a corresponding file in the &ditto_base/lang folder\n\n    Default:\n    "english"\n*/\n$format = (isset($format)) ? strtolower($format) : "html" ;\n/*\n    Param: format\n\n    Purpose:\n    Output format to use\n\n    Options:\n    - "html"\n    - "json"\n    - "xml"\n    - "atom"\n    - "rss"\n\n    Default:\n    "html"\n*/\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODx base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n$debug = isset($debug)? $debug : 0;\n/*\n    Param: debug\n\n    Purpose:\n    Output debugging information\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n    \n    Related:\n    - <debug>\n*/\n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/      \n$extenders = isset($extenders) ? explode(",",$extenders) : array();\n/*\n    Param: extenders\n\n    Purpose:\n    Load an extender which adds functionality to Ditto\n\n    Options:\n    Any extender in the extenders folder or in any folder within the MODx base path via @FILE\n\n    Default:\n    [NULL]\n\n    Related:\n    - <config>\n*/\n    // Variable: extenders\n    // Array that can be added to by configs or formats to load that extender\n    \n$placeholders = array();\n    // Variable: placeholders\n    // Initialize custom placeholders array for configs or extenders to add to\n\n$filters = array("custom"=>array(),"parsed"=>array());\n    // Variable: filters\n    // Holds both the custom filters array for configs or extenders to add to \n    // and the parsed filters array. To add to this array, use the following format\n    // (code)\n    // $filters["parsed"][] = array("name" => array("source"=>$source,"value"=>$value,"mode"=>$mode));\n    // $filters["custom"][] = array("source","callback_function");\n\n$orderBy = array(''parsed''=>array(),''custom''=>array(),''unparsed''=>$orderBy);\n    // Variable: orderBy\n    // An array that holds all criteria to sort the result set by. \n    // Note that using a custom sort will disable all other sorting.\n    // (code)\n    // $orderBy["parsed"][] = array("sortBy","sortDir");\n    // $orderBy["custom"][] = array("sortBy","callback_function");\n        \n//---Includes-------------------------------------------------------- //\n\n$files = array (\n    "base_language" => $ditto_base."lang/english.inc.php",\n    "language" => $ditto_base."lang/$language.inc.php",\n    "main_class" => $ditto_base."classes/ditto.class.inc.php",\n    "template_class" => $ditto_base."classes/template.class.inc.php",\n    "filter_class" => $ditto_base."classes/filter.class.inc.php",\n    "format" => $ditto_base."formats/$format.format.inc.php",\n    "config" => $ditto_base."configs/default.config.php",\n    "user_config" => (substr($config, 0, 5) != "@FILE") ? $ditto_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5))\n);\n\nif ($phx == 1) {\n    $files["prePHx_class"] = $ditto_base."classes/phx.pre.class.inc.php";\n}\nif (isset($randomize)) {\n    $files["randomize_class"] = $ditto_base."classes/random.class.inc.php";\n}\nif ($debug == 1) {\n    $files["modx_debug_class"] = $ditto_base."debug/modxDebugConsole.class.php";\n    $files["debug_class"] = $ditto_base."classes/debug.class.inc.php";\n    $files["debug_templates"] = $ditto_base."debug/debug.templates.php";\n}\n\n$files = array_unique($files);\nforeach ($files as $filename => $filevalue) {\n    if (file_exists($filevalue) && strpos($filename,"class")) {\n        include_once($filevalue);\n    } else if (file_exists($filevalue)) {\n        include($filevalue);\n    } else if ($filename == "language") {\n        $modx->logEvent(1, 3, "Language file does not exist Please check: " . $filevalue, "Ditto " . $ditto_version);\n        return "Language file does not exist Please check: " . $filevalue;\n    } else {\n        $modx->logEvent(1, 3, $filevalue . " " . $_lang[''file_does_not_exist''], "Ditto " . $ditto_version);\n        return $filevalue . " " . $_lang[''file_does_not_exist''];\n    }\n}\n\n//---Initiate Class-------------------------------------------------- //\nif (class_exists(''ditto'')) {\n    $ditto = new ditto($dittoID,$format,$_lang,$dbg_templates);\n        // create a new Ditto instance in the specified format and language with the requested debug level\n} else {\n    $modx->logEvent(1,3,$_lang[''invalid_class''],"Ditto ".$ditto_version);\n    return $_lang[''invalid_class''];\n}\n\n//---Initiate Extenders---------------------------------------------- //\nif (isset($tagData)) {\n    $extenders[] = "tagging";\n}\nif(count($extenders) > 0) {\n    $extenders = array_unique($extenders);\n    foreach ($extenders as $extender) {\n            if(substr($extender, 0, 5) != "@FILE") {\n                $extender_path = $ditto_base."extenders/".$extender.".extender.inc.php";                \n            } else {\n                $extender_path = $modx->config[''base_path''].trim(substr($extender, 5));\n            }\n            \n            if (file_exists($extender_path)){\n                include($extender_path);\n            } else {\n                $modx->logEvent(1, 3, $extender . " " . $_lang[''extender_does_not_exist''], "Ditto ".$ditto_version);\n                return $extender . " " . $_lang[''extender_does_not_exist''];\n            }       \n    }   \n}\n\n//---Parameters------------------------------------------------------- /*\nif (isset($startID)) {$parents = $startID;}\nif (isset($summarize)) {$display = $summarize;}\nif (isset($limit)) {$queryLimit = $limit;}\nif (isset($sortBy) || isset($sortDir) || is_null($orderBy[''unparsed''])) {\n    $sortDir = isset($sortDir) ? strtoupper($sortDir) : ''DESC'';\n    $sortBy = isset($sortBy) ? $sortBy : "createdon";\n    $orderBy[''parsed''][]=array($sortBy,$sortDir);\n}\n    // Allow backwards compatibility\n\n$idType = isset($documents) ? "documents" : "parents";\n    // Variable: idType\n    // type of IDs provided; can be either parents or documents\n\n$parents = isset($parents) ? $ditto->cleanIDs($parents) : $modx->documentIdentifier;\n\n/*\n    Param: parents\n\n    Purpose:\n    IDs of containers for Ditto to retrieve their children to &depth depth\n\n    Options:\n    Any valid MODx document marked as a container\n\n    Default:\n    Current MODx Document\n\n    Related:\n    - <documents>\n    - <depth>\n*/\n$documents = isset($documents) ? $ditto->cleanIDs($documents) : false;\n/*\n    Param: documents\n\n    Purpose:\n    IDs of documents for Ditto to retrieve\n\n    Options:\n    Any valid MODx document marked as a container\n\n    Default:\n    None\n\n    Related:\n    - <parents>\n*/\n\n$IDs = ($idType == "parents") ? $parents : $documents;\n    // Variable: IDs\n    // Internal variable which holds the set of IDs for Ditto to fetch\n\n$depth = isset($depth) ? $depth : 1;\n/*\n    Param: depth\n\n    Purpose:\n    Number of levels deep to retrieve documents\n\n    Options:\n    Any number greater than or equal to 1\n    0 - infinite depth\n\n    Default:\n    1\n\n    Related:\n    - <seeThruUnpub>\n*/\n$paginate = isset($paginate)? $paginate : 0;\n/*\n    Param: paginate\n\n    Purpose:\n    Paginate the results set into pages of &display length.\n    Use &total to limit the number of documents retreived.\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n    \n    Related:\n    - <paginateAlwaysShowLinks>\n    - <paginateSplitterCharacter>\n    - <display>\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Source of the [+date+] placeholder\n\n    Options:\n    # - Any UNIX timestamp from MODx fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat)? $dateFormat : $_lang["dateFormat"];\n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    [LANG]\n    \n    Related:\n    - <dateSource>\n*/\n$display = isset($display) ? $display : "all";\n/*\n    Param: display\n\n    Purpose:\n    Number of documents to display in the results\n\n    Options:\n    # - Any number\n    "all" - All documents found\n\n    Default:\n    "all"\n    \n    Related:\n    - <queryLimit>\n    - <total>\n*/\n$total = isset($total) ? $total : "all";\n/*\n    Param: total\n\n    Purpose:\n    Number of documents to retrieve\n    \n    Options:\n    # - Any number\n    "all" - All documents found\n\n    Default:\n    "all" - All documents found\n    \n    Related:\n    - <display>\n    - <queryLimit>\n*/\n$showPublishedOnly = isset($showPublishedOnly) ? $showPublishedOnly : 1;\n/*\n    Param: showPublishedOnly\n\n    Purpose:\n    Show only published documents\n\n    Options:\n    0 - show only unpublished documents\n    1 - show both published and unpublished documents\n    \n    Default:\n    1 - show both published and unpublished documents\n    \n    Related:\n    - <seeThruUnpub>\n    - <hideFolders>\n    - <showPublishedOnly>\n    - <where>\n*/\n$showInMenuOnly = isset($showInMenuOnly) ? $showInMenuOnly : 0;\n/*\n    Param: showInMenuOnly\n\n    Purpose:\n    Show only documents visible in the menu\n\n    Options:\n    0 - show all documents\n    1 - show only documents with the show in menu flag checked\n    \n    Default:\n    0 - show all documents\n    \n    Related:\n    - <seeThruUnpub>\n    - <hideFolders>\n    - <where>\n*/\n$hideFolders = isset($hideFolders)? $hideFolders : 0;\n/*\n    Param: hideFolders\n\n    Purpose:\n    Don''t show folders in the returned results\n\n    Options:\n    0 - keep folders\n    1 - remove folders\n    \n    Default:\n    0 - keep folders\n    \n    Related:\n    - <seeThruUnpub>\n    - <showInMenuOnly>\n    - <where>\n*/\n$hidePrivate = isset($hidePrivate)? $hidePrivate : 1;\n/*\n    Param: hidePrivate\n\n    Purpose:\n    Don''t show documents the guest or user does not have permission to see\n\n    Options:\n    0 - show private documents\n    1 - hide private documents\n    \n    Default:\n    1 - hide private documents\n    \n    Related:\n    - <seeThruUnpub>\n    - <showInMenuOnly>\n    - <where>\n*/\n$seeThruUnpub = (isset($seeThruUnpub))? $seeThruUnpub : 1 ;\n/*\n    Param: seeThruUnpub\n\n    Purpose:\n    See through unpublished folders to retrive their children\n    Used when depth is greater than 1\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n    \n    Related:\n    - <hideFolders>\n    - <showInMenuOnly>\n    - <where>\n*/\n$queryLimit = (isset($queryLimit))? $queryLimit : 0;\n/*\n    Param: queryLimit\n\n    Purpose:\n    Number of documents to retrieve from the database, same as MySQL LIMIT\n\n    Options:\n    # - Any number\n    0 - automatic\n\n    Default:\n    0 - automatic\n    \n    Related:\n    - <where>\n*/\n$where = (isset($where))? $where : "";\n/*\n    Param: where\n\n    Purpose:\n    Custom MySQL WHERE statement\n\n    Options:\n    A valid MySQL WHERE statement using only document object items (no TVs)\n\n    Default:\n    [NULL]\n    \n    Related:\n    - <queryLimit>\n*/\n$noResults = isset($noResults)? $ditto->getParam($noResults,"no_documents") : $_lang[''no_documents''];\n/*\n    Param: noResults\n\n    Purpose:\n    Text or chunk to display when there are no results\n\n    Options:\n    Any valid chunk name or text\n\n    Default:\n    [LANG]\n*/\n$removeChunk = isset($removeChunk) ? explode(",",$removeChunk) : false;\n/*\n    Param: removeChunk\n\n    Purpose:\n    Name of chunks to be stripped from content separated by commas\n    - Commonly used to remove comments\n\n    Options:\n    Any valid chunkname that appears in the output\n\n    Default:\n    [NULL]\n*/\n$hiddenFields = isset($hiddenFields) ? explode(",",$hiddenFields) : false;\n/*\n    Param: hiddenFields\n\n    Purpose:\n    Allow Ditto to retrieve fields its template parser cannot handle such as nested placeholders and [*fields*]\n\n    Options:\n    Any valid MODx fieldnames or TVs comma separated\n\n    Default:\n    [NULL]\n*/\n$offset = isset($start) ? $start : 0;\n$start = (isset($_GET[$dittoID.''start''])) ? intval($_GET[$dittoID.''start'']) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/\n$globalFilterDelimiter = isset($globalFilterDelimiter) ? $globalFilterDelimiter : "|";\n/*\n    Param: globalFilterDelimiter\n\n    Purpose:\n    Filter delimiter used to separate filters in the filter string\n    \n    Options:\n    Any character not used in the filters\n\n    Default:\n    "|"\n    \n    Related:\n    - <localFilterDelimiter>\n    - <filter>\n    - <parseFilters>\n*/\n    \n$localFilterDelimiter = isset($localFilterDelimiter) ? $localFilterDelimiter : ",";\n/*\n    Param: localFilterDelimiter\n\n    Purpose:\n    Delimiter used to separate individual parameters within each filter string\n    \n    Options:\n    Any character not used in the filter itself\n\n    Default:\n    ","\n    \n    Related:\n    - <globalFilterDelimiter>\n    - <filter>\n    - <parseFilters>\n*/\n$filters["custom"] = isset($cFilters) ? array_merge($filters["custom"],$cFilters) : $filters["custom"];\n$filters["parsed"] = isset($parsedFilters) ? array_merge($filters["parsed"],$parsedFilters) : $filters["parsed"];\n    // handle 2.0.0 compatibility\n$filter = (isset($filter) || ($filters["custom"] != false) || ($filters["parsed"] != false)) ? $ditto->parseFilters($filter,$filters["custom"],$filters["parsed"],$globalFilterDelimiter,$localFilterDelimiter) : false;\n/*\n    Param: filter\n\n    Purpose:\n    Removes items not meeting a critera. Thus, if pagetitle == joe then it will be removed.\n    Use in the format field,criteria,mode with the comma being the local delimiter\n\n    *Mode* *Meaning*\n    \n    1 - !=\n    2 - ==\n    3 - <\n    4 - >\n    5 - <=\n    6 - >=\n    7 - Text not in field value\n    8 - Text in field value\n    9 - case insenstive version of #7\n    10 - case insenstive version of #8\n    11 - checks leading character of the field\n    \n    @EVAL:\n        @EVAL in filters works the same as it does in MODx exect it can only be used \n        with basic filtering, not custom filtering (tagging, etc). Make sure that\n        you return the value you wish Ditto to filter by and that the code is valid PHP.\n\n    Default:\n    [NULL]\n    \n    Related:\n    - <localFilterDelimiter>\n    - <globalFilterDelimiter>\n    - <parseFilters>\n*/\n$keywords = (isset($keywords))? $keywords : 0;\n/*  \n    Param: keywords\n    \n    Purpose: \n    Enable fetching of associated keywords for each document\n    Can be used as [+keywords+] or as a tagData source\n    \n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n\n$randomize = (isset($randomize))? $randomize : 0;\n/*  \n    Param: randomize\n    \n    Purpose: \n    Randomize the order of the output\n    \n    Options:\n    0 - off\n    1 - on\n    Any MODx field or TV for weighted random\n    \n    Default:\n    0 - off\n*/\n$save = (isset($save))? $save : 0;\n/*\n    Param: save\n\n    Purpose:\n    Saves the ditto object and results set to placeholders\n    for use by other snippets\n\n    Options:\n    0 - off; returns output\n    1 - remaining; returns output\n    2 - all;\n    3 - all; returns ph only\n\n    Default:\n        0 - off; returns output\n*/\n$templates = array(\n    "default" => "@CODE".$_lang[''default_template''],\n    "base" => $tpl,\n    "alt" => $tplAlt,\n    "first" => $tplFirst,\n    "last" => $tplLast,\n    "current" => $tplCurrentDocument\n);\n/*\n    Param: tpl\n\n    Purpose:\n    User defined chunk to format the documents \n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE\n    - File via @FILE\n\n    Default:\n    [LANG]\n*/\n/*\n    Param: tplAlt\n\n    Purpose:\n    User defined chunk to format every other document\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE\n    - File via @FILE\n\n    Default:\n    &tpl\n*/\n/*\n    Param: tplFirst\n\n    Purpose:\n    User defined chunk to format the first document \n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE\n    - File via @FILE\n\n    Default:\n    &tpl\n*/\n/*\n    Param: tplLast\n\n    Purpose:\n    User defined chunk to format the last document \n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE\n    - File via @FILE\n\n    Default:\n    &tpl\n*/\n/*\n    Param: tplCurrentDocument\n\n    Purpose:\n    User defined chunk to format the current document\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE\n    - File via @FILE\n\n    Default:\n    &tpl\n*/\n$orderBy = $ditto->parseOrderBy($orderBy,$randomize);\n/*\n    Param: orderBy\n\n    Purpose:\n    Sort the result set\n\n    Options:\n    Any valid MySQL style orderBy statement\n\n    Default:\n    createdon DESC\n*/\n//-------------------------------------------------------------------- */\n$templates = $ditto->template->process($templates);\n    // parse the templates for TV''s and store them for later use\n\n$ditto->setDisplayFields($ditto->template->fields,$hiddenFields);\n    // parse hidden fields\n    \n$ditto->parseFields($placeholders,$seeThruUnpub,$dateSource,$randomize);\n    // parse the fields into the field array\n    \n$documentIDs = $ditto->determineIDs($IDs, $idType, $ditto->fields["backend"]["tv"], $orderBy, $depth, $showPublishedOnly, $seeThruUnpub, $hideFolders, $hidePrivate, $showInMenuOnly, $where, $keywords, $dateSource, $queryLimit, $display, $filter,$paginate, $randomize);\n    // retrieves a list of document IDs that meet the criteria and populates the $resources array with them\n$count = count($documentIDs);\n    // count the number of documents to be retrieved\n$count = $count-$offset;\n    // handle the offset\n\nif ($count > 0) {\n    // if documents are returned continue with execution\n    \n    $total = ($total == "all") ? $count : min($total,$count);\n        // set total equal to count if all documents are to be included\n    \n    $display = ($display == "all") ? min($count,$total) : min($display,$total);\n        // allow show to use all option\n\n    $stop = ($save != "1") ? min($total-$start,$display) : min($count,$total);\n        // set initial stop count\n\n    if($paginate == 1) {\n        $paginateAlwaysShowLinks = isset($paginateAlwaysShowLinks)? $paginateAlwaysShowLinks : 0;\n        /*\n            Param: paginateAlwaysShowLinks\n\n            Purpose:\n            Determine whether or not to always show previous next links\n\n            Options:\n            0 - off\n            1 - on\n\n            Default:\n            0 - off\n        \n            Related:\n            - <paginate>\n            - <paginateSplitterCharacter>\n        */\n        $paginateSplitterCharacter = isset($paginateSplitterCharacter)? $paginateSplitterCharacter : $_lang[''button_splitter''];\n        /*\n            Param: paginateSplitterCharacter\n\n            Purpose:\n            Splitter to use if always show is disabled\n\n            Options:\n            Any valid character\n\n            Default:\n            [LANG]\n        \n            Related:\n            - <paginate>\n            - <paginateSplitterCharacter>\n        */\n        $tplPaginatePrevious = isset($tplPaginatePrevious)? $ditto->template->fetch($tplPaginatePrevious) : "<a href=''[+url+]'' class=''ditto_previous_link''>[+lang:previous+]</a>";\n        /*\n            Param: tplPaginatePrevious\n\n            Purpose:\n            Template for the previous link\n\n            Options:\n            - Any valid chunk name\n            - Code via @CODE\n            - File via @FILE\n\n            Placeholders:\n            url - URL for the previous link\n            lang:previous - value of ''prev'' from the language file\n        \n            Related:\n            - <tplPaginateNext>\n            - <paginateSplitterCharacter>\n        */\n        $tplPaginateNext = isset($tplPaginateNext)? $ditto->template->fetch($tplPaginateNext) : "<a href=''[+url+]'' class=''ditto_next_link''>[+lang:next+]</a>";\n        /*\n            Param: tplPaginateNext\n\n            Purpose:\n            Template for the next link\n\n            Options:\n            - Any valid chunk name\n            - Code via @CODE\n            - File via @FILE\n\n            Placeholders:\n            url - URL for the next link\n            lang:next - value of ''next'' from the language file\n        \n            Related:\n            - <tplPaginatePrevious>\n            - <paginateSplitterCharacter>\n        */\n        $tplPaginateNextOff = isset($tplPaginateNextOff)? $ditto->template->fetch($tplPaginateNextOff) : "<span class=''ditto_next_off ditto_off''>[+lang:next+]</span>";\n        /*\n            Param: tplPaginateNextOff\n\n            Purpose:\n            Template for the inside of the next link\n\n            Options:\n            - Any valid chunk name\n            - Code via @CODE\n            - File via @FILE\n\n            Placeholders:\n            lang:next - value of ''next'' from the language file\n        \n            Related:\n            - <tplPaginatePrevious>\n            - <paginateSplitterCharacter>\n        */\n        $tplPaginatePreviousOff = isset($tplPaginatePreviousOff)? $ditto->template->fetch($tplPaginatePreviousOff) : "<span class=''ditto_previous_off ditto_off''>[+lang:previous+]</span>";\n        /*\n            Param: tplPaginatePreviousOff\n\n            Purpose:\n            Template for the previous link when it is off\n\n            Options:\n            - Any valid chunk name\n            - Code via @CODE\n            - File via @FILE\n\n            Placeholders:\n            lang:previous - value of ''prev'' from the language file\n    \n            Related:\n            - <tplPaginatePrevious>\n            - <paginateSplitterCharacter>\n        */\n        $tplPaginatePage = isset($tplPaginatePage)? $ditto->template->fetch($tplPaginatePage) : "<a class=''ditto_page'' href=''[+url+]''>[+page+]</a>";\n        /*\n            Param: tplPaginatePage\n\n            Purpose:\n            Template for the page link\n\n            Options:\n            - Any valid chunk name\n            - Code via @CODE\n            - File via @FILE\n\n            Placeholders:\n            url - url for the page\n            page - number of the page\n    \n            Related:\n            - <tplPaginatePrevious>\n            - <paginateSplitterCharacter>\n        */\n        $tplPaginateCurrentPage = isset($tplPaginateCurrentPage)? $ditto->template->fetch($tplPaginateCurrentPage) : "<span class=''ditto_currentpage''>[+page+]</span>";\n        /*\n            Param: tplPaginateCurrentPage\n\n            Purpose:\n            Template for the current page link\n\n            Options:\n            - Any valid chunk name\n            - Code via @CODE\n            - File via @FILE\n\n            Placeholders:\n            page - number of the page\n    \n            Related:\n            - <tplPaginatePrevious>\n            - <paginateSplitterCharacter>\n        */\n        \n        $ditto->paginate($start, $stop, $total, $display, $tplPaginateNext, $tplPaginatePrevious, $tplPaginateNextOff, $tplPaginatePreviousOff, $tplPaginatePage, $tplPaginateCurrentPage, $paginateAlwaysShowLinks, $paginateSplitterCharacter);\n            // generate the pagination placeholders\n    }\n\n    $dbFields = $ditto->fields["display"]["db"];\n        // get the database fields\n    $TVs = $ditto->fields["display"]["tv"];\n        // get the TVs\n    \n    switch($orderBy[''parsed''][0][1]) {\n        case "DESC":\n            $stop = ($ditto->prefetch === false) ? $stop + $start + $offset : $stop + $offset; \n            $start += $offset;\n        break;\n        case "ASC":\n            $start += $offset;\n            $stop += $start;\n        break;\n    }\n\n    if ($ditto->prefetch !== false) {\n        $documentIDs = array_slice($documentIDs,$start,$stop);\n            // set the document IDs equal to the trimmed array\n        $dbFields = array_diff($dbFields,$ditto->prefetch["fields"]["db"]);\n            // calculate the difference between the database fields and those already prefetched\n        $dbFields[] = "id";\n            // append id to the db fields array\n        $TVs = array_diff($TVs,$ditto->prefetch["fields"]["tv"]);\n            // calculate the difference between the tv fields and those already prefetched\n        $start = 0;\n        $stop = min($display,($queryLimit != 0) ? $queryLimit : $display,count($documentIDs));\n    } else {\n        $queryLimit = ($queryLimit == 0) ? "" : $queryLimit;\n    }\n    \n    $resource = $ditto->getDocuments($documentIDs, $dbFields, $TVs, $orderBy, $showPublishedOnly, 0, $hidePrivate, $where, $queryLimit, $keywords, $randomize, $dateSource);\n        // retrieves documents\n    $output = $header;\n        // initialize the output variable and send the header\n\n    if ($resource) {\n        if ($randomize != "0" && $randomize != "1") {\n            $resource = $ditto->weightedRandom($resource,$randomize,$stop);\n                // randomize the documents\n        }\n        \n        $resource = array_values($resource);\n\n        for ($x=$start;$x<$stop;$x++) {\n            $template = $ditto->template->determine($templates,$x,0,$stop,$resource[$x]["id"]);\n                // choose the template to use and set the code of that template to the template variable\n            $renderedOutput = $ditto->render($resource[$x], $template, $removeChunk, $dateSource, $dateFormat, $placeholders,$phx,abs($start-$x));\n                // render the output using the correct template, in the correct format and language\n            $modx->setPlaceholder($dittoID."item[".abs($start-$x)."]",$renderedOutput);\n            /*\n                Placeholder: item[x]\n\n                Content:\n                Individual items rendered output\n            */\n            $output .= $renderedOutput;\n                // send the rendered output to the buffer\n        }\n    } else {\n        $output .= $ditto->noResults($noResults,$paginate);\n            // if no documents are found return a no documents found string\n    }\n    $output .= $footer;\n        // send the footer\n\n    // ---------------------------------------------------\n    // Save Object\n    // ---------------------------------------------------\n\n    if($save) {\n        $modx->setPlaceholder($dittoID."ditto_object", $ditto);\n        $modx->setPlaceholder($dittoID."ditto_resource", ($save == "1") ? array_slice($resource,$display) : $resource);\n    }\n} else {\n    $output = $header.$ditto->noResults($noResults,$paginate).$footer;\n}\n// ---------------------------------------------------\n// Handle Debugging\n// ---------------------------------------------------\n\nif ($debug == 1) {\n    $ditto_params =& $modx->event_params;\n    if (!isset($_GET["ditto_".$dittoID."debug"])) {\n    $_SESSION["ditto_debug_$dittoID"] = $ditto->debug->render_popup($ditto, $ditto_base, $ditto_version, $ditto_params, $documentIDs, array("db"=>$dbFields,"tv"=>$TVs), $display, $templates, $orderBy, $start, $stop, $total,$filter,$resource);\n    }\n    if (isset($_GET["ditto_".$dittoID."debug"])) {\n        switch ($_GET["ditto_".$dittoID."debug"]) {\n            case "open" :\n                exit($_SESSION["ditto_debug_$dittoID"]);\n            break;\n            case "save" :\n                $ditto->debug->save($_SESSION["ditto_debug_$dittoID"],"ditto".strtolower($ditto_version)."_debug_doc".$modx->documentIdentifier.".html");\n            break;\n        }\n    } else {\n        $output = $ditto->debug->render_link($dittoID,$ditto_base).$output;\n    }\n}\n\nreturn ($save != 3) ? $output : "";', 0, '', '');
INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(17, 'EvoGallery', '<strong>1.1 Beta 1</strong> Generates sortable listing of galleries, with full templating control', 0, 7, 0, '/*---------------------------------------------------------------------------\n* EvoGallery Snippet - Generates sortable listing of\n* galleries, with full templating control\n*--------------------------------------------------------------------------*/\n//\n// System settings\n//\n\n$params[''display''] = isset($display) ? $display : ''images'';\n	// Have the snippet output either a list of galleries within the specified doc Id, a list of images within a gallery, or a single image based on a pic Id\n	// Possible values: galleries, images, single\n\n$params[''type''] = isset($type) ? $type : ''simple-list'';\n	// Output type, if specified, the snippet will automatically load the required javascript\n	// Current types: simple-list, single, jquery-cycle\n\n$params[''includeAssets''] = isset($includeAssets) ? intval($includeAssets) : 1;\n	// Register external scripts and CSS files required by the specified gallery type\n	// If set to 0, these will need to be included manually in the document <head>\n\n$params[''picId''] = isset($picId) ? $picId : $_REQUEST[''picId''];\n	// ID of specific pic to show when displaying by a single image\n\n$params[''docId''] = isset($docId) ? $docId : $modx->documentIdentifier;\n	// Document ID for which to display gallery (default: document from which snippet was called)\n        // Multiple document id''s can be specified by commas (no spaces), or * for all documents\n\n$params[''gallerySortBy''] = isset($gallerySortBy) ? $gallerySortBy : ''menuindex'';\n	// Galleries sort order (possible fields: id, pagetitle, longtitle, description, alias, pub_date, introtext,\n	// editedby, editedon, publishedon, publishedby, menutitle) or RAND()\n\n$params[''gallerySortDir''] = isset($gallerySortDir) ? $gallerySortDir : ''ASC'';\n	// Direction to sort the galleries ASC or DESC\n\n$params[''ignoreHidden''] = isset($ignoreHidden) ? $ignoreHidden : 0;\n	// Display documents marked as hidden in the gallery listing\n\n$params[''excludeDocs''] = isset($excludeDocs) ? $excludeDocs : 0;\n	// Prevent the specified documents from showing in the gallery listing\n        // Multiple document id''s can be specified by commas (no spaces)\n\n$params[''sortBy''] = isset($sortBy) ? $sortBy : ''sortorder'';\n	// Sort items by field (possible fields: id, content_id, filename, title, description, sortorder) or RAND()\n\n$params[''sortDir''] = isset($sortDir) ? $sortDir : ''ASC'';\n	// Direction to sort the items ASC or DESC\n\n$params[''limit''] = isset($limit) ? $limit : '''';\n	// Limit the number of items to display\n\n$params[''tags''] = isset($tags) ? $tags : '''';\n	// Comma delimited set of tags to filter results by\n\n$params[''tagMode''] = isset($tagMode) ? $tagMode : ''AND'';\n	// Search mode for tag: AND or OR\n\n$params[''tpl''] = isset($tpl) ? $tpl : '''';\n	// Chunk template for the outer gallery template (defaults to tpl.default.txt for selected type)\n	// Placeholders: items\n\n$params[''itemTpl''] = isset($itemTpl) ? $itemTpl : '''';\n	// Chunk template for each thumbnail/image in the gallery (defaults to tpl.item.default.txt for selected type)\n\n$params[''itemTplFirst''] = isset($itemTplFirst) ? $itemTplFirst : '''';\n	// Chunk template for last thumbnail/image in the gallery (defaults to tpl.item.first.txt for selected type)\n\n$params[''itemTplLast''] = isset($itemTplLast) ? $itemTplLast : '''';\n	// Chunk template for last thumbnail/image in the gallery (defaults to tpl.item.last.txt for selected type)\n\n$params[''itemTplAlt''] = isset($itemTplAlt) ? $itemTplAlt : '''';\n	// Chunk template for alternate thumbnail/image in the gallery (defaults to tpl.item.alt.txt for selected type)\n\n$params[''itemAltNum''] = isset($itemAltNum) ? $itemAltNum : ''2'';\n	// Modifier for the alternate thumbnail/image (defaults to every second item)\n\n$params[''galleriesUrl''] = isset($galleriesUrl) ? $galleriesUrl : $modx->config[''base_url''] . ''assets/galleries/'';\n	// URL to the galleries directory (should contain folders with the Id of the document, with a thumbs/ folder within each document''s gallery)\n\n$params[''galleriesPath''] = isset($galleriesPath) ? $galleriesPath : $modx->config[''base_path''] . ''assets/galleries/'';\n	// Path to the galleries directory\n\n$params[''snippetUrl''] = isset($snippetUrl) ? $snippetUrl : $modx->config[''base_url''] . ''assets/snippets/evogallery/'';\n	// URL to the snippet directory\n\n$params[''snippetPath''] = isset($snippetPath) ? $snippetPath : $modx->config[''base_path''] . ''assets/snippets/evogallery/'';\n	// Path to the snippet directory\n\n$params[''id''] = isset($id)?$id:'''';\n	// Unique ID for this EvoGallery instance and unique URL parameters\n\n$params[''paginate''] = isset($paginate)?$paginate:0;\n	// Paginate the results set into pages of &show length. \n\n$params[''paginateAlwaysShowLinks''] = isset($paginateAlwaysShowLinks)?$paginateAlwaysShowLinks:0;\n	// Determine whether or not to always show previous next links\n\n$params[''show''] = isset($show)?$show:''20'';\n	// Number of images to display in the results when pagination on\n\n$params[''paginateNextText''] = isset($paginateNextText)?$paginateNextText:''Next'';\n	// Text for next label\n\n$params[''paginatePreviousText''] = isset($paginateNextText)?$paginateNextText:''Previous'';\n	// Text for previous label\n\n$params[''paginateSplitterCharacter''] = isset($paginateSplitterCharacter)?$modx->getChunk($paginateSplitterCharacter):"|";\n	// Splitter to use if always show is disabled\n\n$params[''tplPaginatePrevious''] = isset($tplPaginatePrevious)?$modx->getChunk($tplPaginatePrevious):"<a href=''[+url+]'' class=''eg_previous_link''>[+PaginatePreviousText+]</a>";\n	// Template for the previous link\n\n$params[''tplPaginateNext''] = isset($tplPaginateNext)?$modx->getChunk($tplPaginateNext):"<a href=''[+url+]'' class=''eg_next_link''>[+PaginateNextText+]</a>";\n	// Template for the next link\n\n$params[''tplPaginateNextOff''] = isset($tplPaginateNextOff)?$modx->getChunk($tplPaginateNextOff):"<span class=''eg_next_off eg_off''>[+PaginateNextText+]</span>";\n	// Template for the inside of the next link\n\n$params[''tplPaginatePreviousOff''] = isset($tplPaginatePreviousOff)?$modx->getChunk($tplPaginatePreviousOff):"<span class=''eg_previous_off eg_off''>[+PaginatePreviousText+]</span>";\n	// Template for the inside of the previous link\n\n$params[''tplPaginatePage''] = isset($tplPaginatePage)?$modx->getChunk($tplPaginatePage):"<a class=''eg_page'' href=''[+url+]''>[+page+]</a>";\n	// Template for the page link\n\n$params[''tplPaginateCurrentPage''] = isset($tplPaginateCurrentPage)?$modx->getChunk($tplPaginateCurrentPage):"<span class=''eg_currentpage''>[+page+]</span>";\n	// Template for the current page link\n\n/*--------------------------------------------------------------------------*/\n\ninclude_once($params[''snippetPath''] . ''classes/gallery.class.inc.php'');\n\nif (!class_exists(''PHxParser''))\n	include_once($params[''snippetPath''] . ''classes/phx.parser.class.inc.php'');\n\nif (class_exists(''Gallery''))\n	$gal = new Gallery($params);\nelse\n	$modx->logEvent(1, 3, ''Error loading gallery snippet'');\n\nreturn $gal->execute();\n', 0, '', ''),
(18, 'phx:phpthumbof', 'PhpThumbOf', 0, 11, 0, '\r\nrequire $modx->config[''base_path''] . ''assets/snippets/phpthumbof/phpthumbof.snippet.php'';\r\n', 0, '', ' '),
(19, 'phx:docfield', 'get specified field from document (id)', 0, 11, 0, '\r\n$field = (strlen($options)>0) ? $options : ''pagetitle'';\r\n$docfield = $modx->getTemplateVarOutput(array($field), $output, 1);\r\nreturn $docfield[$field];\r\n', 0, '', ' '),
(20, 'phx:rusdate', 'Русская дата PHx', 0, 11, 0, '\r\n# Пример вызова\r\n# [+date:rusdate=`%#d %B %Y`+]\r\n$rus = array(\r\n    ''Января'' => ''January'',\r\n    ''Февраля''    => ''February'',\r\n    ''Марта''        => ''March'',\r\n    ''Апреля''    => ''April'',\r\n    ''Майя''        => ''May'',\r\n    ''Июня''        => ''June'',\r\n    ''Июля''        => ''July'',\r\n    ''Августа''    => ''August'',\r\n    ''Сентября''    => ''September'',\r\n    ''Октября''    => ''October'',\r\n    ''Ноября''    => ''November'',\r\n    ''Декабря''    => ''December'',\r\n    ''Янв''        => ''Jan'',\r\n    ''Фев''        => ''Feb'',\r\n    ''Март''        => ''Mar'',\r\n    ''Апр''        => ''Apr'',\r\n    ''Май''        => ''May'',\r\n    ''Июнь''        => ''Jun'',\r\n    ''Июль''        => ''Jul'',\r\n    ''Авг''        => ''Aug'',\r\n    ''Сен''        => ''Sep'',\r\n    ''Окт''        => ''Oct'',\r\n    ''Ноя''        => ''Nov'',\r\n    ''Дек''        => ''Dec''\r\n);\r\n\r\n$res = str_replace(array_values($rus),array_keys($rus),strftime($options,0+intval($output)));\r\nreturn $res;\r\n', 0, '', ' ');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `modx_site_templates`
--

INSERT INTO `modx_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`) VALUES
(3, 'Главная страница', 'Шаблон главной страницы', 0, 9, '', 0, '<!doctype html>\r\n<html lang="ru">\r\n<head>\r\n	{{header-meta}}\r\n        {{header-css}}\r\n        {{header-js}} \r\n</head>\r\n<body>\r\n	[*content*]	\r\n</body>\r\n</html>', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvars`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `modx_site_tmplvars`
--

INSERT INTO `modx_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
(4, 'image', 'image', 'Изображение', '', 0, 0, 0, '', 0, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_contentvalues`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_site_tmplvar_contentvalues`
--

INSERT INTO `modx_site_tmplvar_contentvalues` (`id`, `tmplvarid`, `contentid`, `value`) VALUES
(1, 4, 1, 'assets/images/logo.png');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `modx_site_tmplvar_templates`
--

INSERT INTO `modx_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(4, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_eventnames`
--

CREATE TABLE IF NOT EXISTS `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='System Event Names.' AUTO_INCREMENT=1001 ;

--
-- Дамп данных таблицы `modx_system_eventnames`
--

INSERT INTO `modx_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_settings`
--

CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  UNIQUE KEY `setting_name` (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'MODxCarbon'),
('settings_version', '1.0.10'),
('show_meta', '0'),
('server_offset_time', '0'),
('server_protocol', 'http'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'My MODX Site'),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('site_unavailable_message', 'The site is currently unavailable'),
('track_visitors', '0'),
('top_howmany', '10'),
('auto_template_logic', 'parent'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '0'),
('cache_default', '1'),
('search_default', '1'),
('friendly_urls', '1'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('captcha_words', 'MODX,Access,Better,BitCode,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Tattoo,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('emailsender', 'exsdis@gmail.com'),
('emailsubject', 'Your login details'),
('number_of_logs', '100'),
('number_of_messages', '30'),
('number_of_results', '20'),
('use_editor', '1'),
('use_browser', '1'),
('rb_base_dir', '/var/modx/assets/'),
('rb_base_url', 'assets/'),
('which_editor', 'TinyMCE'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('strip_image_paths', '1'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('upload_files', 'aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip'),
('upload_maxsize', '1048576'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('filemanager_path', '/var/modx/'),
('theme_refresher', ''),
('manager_layout', '4'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '60'),
('manager_direction', 'ltr'),
('tinymce_editor_theme', 'editor'),
('tinymce_custom_plugins', 'style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media'),
('tinymce_custom_buttons1', 'undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help'),
('tinymce_custom_buttons2', 'bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops'),
('tree_show_protected', '0'),
('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
('validate_referer', '1'),
('datepicker_offset', '-10'),
('xhtml_urls', '1'),
('allow_duplicate_alias', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '1'),
('remember_last_tab', '0'),
('enable_bindings', '1'),
('make_folders', '1'),
('site_id', '517f770377c96'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('error_reporting', '1'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words_default', 'MODx,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('reload_emailsubject', ''),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('tree_page_click', '27'),
('rb_webuser', '0'),
('clean_uploaded_filename', '1'),
('mce_editor_skin', 'default'),
('mce_template_docs', ''),
('mce_template_chunks', ''),
('mce_entermode', 'p'),
('mce_element_format', 'xhtml'),
('mce_schema', 'html4'),
('tinymce_custom_buttons3', ''),
('tinymce_custom_buttons4', ''),
('tinymce_css_selectors', 'left=justifyleft;right=justifyright'),
('sys_files_checksum', 'a:3:{s:19:"/var/modx/index.php";s:32:"5ef8c0cf619ecb2bdbf8d53e7a855eaa";s:27:"/var/modx/manager/index.php";s:32:"4ee58c3b241e3b1443c7e3a7452d6ebe";s:41:"/var/modx/manager/includes/config.inc.php";s:32:"b18649b73eef8bb0d78481f7a439d63c";}');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_user_attributes`
--

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Default admin account', 1, 'exsdis@gmail.com', '', '', 0, 0, 0, 12, 1368611986, 1368612012, 0, 'tl86gfm5s9bc8u00eg731m8ql0', 0, 0, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_messages`
--

CREATE TABLE IF NOT EXISTS `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_roles`
--

CREATE TABLE IF NOT EXISTS `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `modx_user_roles`
--

INSERT INTO `modx_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_groups`
--

CREATE TABLE IF NOT EXISTS `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_users`
--

CREATE TABLE IF NOT EXISTS `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
