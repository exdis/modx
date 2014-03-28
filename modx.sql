-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 08 2013 г., 12:27
-- Версия сервера: 5.5.32-0ubuntu0.13.04.1
-- Версия PHP: 5.4.9-4ubuntu2.2

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
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Дамп данных таблицы `modx_active_users`
--

INSERT INTO `modx_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'admin', 1381210015, NULL, '76', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_categories`
--

CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=13 ;

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
(11, 'PHx'),
(12, 'Js');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `modx_event_log`
--

INSERT INTO `modx_event_log` (`id`, `eventid`, `createdon`, `type`, `user`, `usertype`, `source`, `description`) VALUES
(1, 17, 1367309548, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>'),
(2, 0, 1367309548, 2, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы системы MODx. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(3, 17, 1367310863, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>'),
(4, 17, 1368604353, 2, 1, 0, 'fake settings_version', '<pre>''1.0.10''</pre>'),
(5, 0, 1368607672, 2, 1, 0, 'Не удалена папка с файлами, использовавшимися в пр', 'Папка /install содержит инсталляционные файлы системы MODx. Злоумышленники могут воспользоваться этими файлами для взлома/повреждения сайта, так что лучше удалить папку с сервера.'),
(6, 0, 1369370012, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td></td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0015 s (2 Requests)</td></tr><tr><td>PHP : </td><td>0.0110 s</td></tr><tr><td>Total : </td><td>0.0125 s</td></tr><tr><td>Memory : </td><td>0.871826171875 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n'),
(7, 0, 1369370013, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/css/styles.css</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td>http://modx/</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0066 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0151 s</td></tr><tr><td>Total : </td><td>0.0217 s</td></tr><tr><td>Memory : </td><td>0.87058639526367 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n'),
(8, 0, 1369370013, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/css/nivo-slider.css</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td>http://modx/</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0067 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0178 s</td></tr><tr><td>Total : </td><td>0.0245 s</td></tr><tr><td>Memory : </td><td>0.87053298950195 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n'),
(9, 0, 1369370013, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/css/lightbox.css</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td>http://modx/</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0049 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0262 s</td></tr><tr><td>Total : </td><td>0.0311 s</td></tr><tr><td>Memory : </td><td>0.87056350708008 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n'),
(10, 0, 1369370701, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/css/styles.css</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td>http://posudar.com/</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0038 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0113 s</td></tr><tr><td>Total : </td><td>0.0151 s</td></tr><tr><td>Memory : </td><td>0.87057876586914 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n'),
(11, 0, 1369370701, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/css/nivo-slider.css</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td>http://posudar.com/</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0025 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0161 s</td></tr><tr><td>Total : </td><td>0.0186 s</td></tr><tr><td>Memory : </td><td>0.87052536010742 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n'),
(12, 0, 1369370701, 3, 0, 0, 'Parser', '<h3 style="color:red">&laquo; MODX Parse Error &raquo;</h3>\n	                <table border="0" cellpadding="1" cellspacing="0">\n	                <tr><td colspan="2">MODX encountered the following error while attempting to parse the requested resource:</td></tr>\n	                <tr><td colspan="2"><b style="color:red;">&laquo; PHP Parse Error &raquo;</b></td></tr><tr><td colspan="2"><b>PHP error debug</b></td></tr><tr><td colspan="2"><div style="font-weight:bold;border:1px solid #ccc;padding:8px;color:#333;background-color:#ffffcd;">Error : Unknown: open(/tmp/sess_jvl08661gs4j2is01kf47i8hk3, O_RDWR) failed: Permission denied (13)</div></td></tr><tr><td valign="top">ErrorType[num] : </td><td>WARNING[2]</td></tr><tr><td>File : </td><td>Unknown</td></tr><tr><td>Line : </td><td>0</td></tr><tr><td colspan="2"><b>Basic info</b></td></tr><tr><td valign="top" style="white-space:nowrap;">REQUEST_URI : </td><td>/css/lightbox.css</td></tr><tr><td valign="top">Resource : </td><td>[1]<a href="http://modx/minimal-base.html" target="_blank">MODX CMS Install Success</a></td></tr><tr><td>Referer : </td><td>http://posudar.com/</td></tr><tr><td>User Agent : </td><td>Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31</td></tr><tr><td>IP : </td><td>127.0.0.1</td></tr><tr><td colspan="2"><b>Benchmarks</b></td></tr><tr><td>MySQL : </td><td>0.0033 s (6 Requests)</td></tr><tr><td>PHP : </td><td>0.0186 s</td></tr><tr><td>Total : </td><td>0.0218 s</td></tr><tr><td>Memory : </td><td>0.87055587768555 mb</td></tr></table>\n<br /><p><b>Backtrace</b></p>\n<table></table>\n');

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=558 ;

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
(528, 1370508663, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(529, 1379922488, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(530, 1379922491, 1, 'admin', 27, '1', '-', 'Editing resource'),
(531, 1379922491, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(532, 1379922519, 1, 'admin', 3, '1', 'MODX CMS Install Success', 'Viewing data for resource'),
(533, 1381209575, 1, 'admin', 58, '-', 'MODx', 'Logged in'),
(534, 1381209576, 1, 'admin', 17, '-', '-', 'Editing settings'),
(535, 1381209581, 1, 'admin', 76, '-', '-', 'Element management'),
(536, 1381209583, 1, 'admin', 78, '8', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(537, 1381209589, 1, 'admin', 27, '1', '-', 'Editing resource'),
(538, 1381209922, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(539, 1381209924, 1, 'admin', 27, '1', '-', 'Editing resource'),
(540, 1381209928, 1, 'admin', 106, '-', '-', 'Viewing Modules'),
(541, 1381209931, 1, 'admin', 31, '-', '-', 'Using file manager'),
(542, 1381209931, 1, 'admin', 76, '-', '-', 'Element management'),
(543, 1381209938, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(544, 1381209972, 1, 'admin', 76, '-', '-', 'Element management'),
(545, 1381209974, 1, 'admin', 78, '8', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(546, 1381209989, 1, 'admin', 79, '8', '-', 'Saving Chunk (HTML Snippet)'),
(547, 1381209989, 1, 'admin', 78, '8', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(548, 1381209994, 1, 'admin', 27, '1', '-', 'Editing resource'),
(549, 1381209994, 1, 'admin', 112, '2', 'EvoGallery', 'Execute module'),
(550, 1381209999, 1, 'admin', 76, '-', '-', 'Element management'),
(551, 1381210005, 1, 'admin', 78, '8', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(552, 1381210010, 1, 'admin', 79, '8', '-', 'Saving Chunk (HTML Snippet)'),
(553, 1381210010, 1, 'admin', 78, '8', 'mm_rules', 'Editing Chunk (HTML Snippet)'),
(554, 1381210011, 1, 'admin', 76, '-', '-', 'Element management'),
(555, 1381210013, 1, 'admin', 78, '1', 'mm_demo_rules', 'Editing Chunk (HTML Snippet)'),
(556, 1381210015, 1, 'admin', 80, '1', '-', 'Deleting Chunk (HTML Snippet)'),
(557, 1381210015, 1, 'admin', 76, '-', '-', 'Element management');

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
  `template` int(10) NOT NULL DEFAULT '0',
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
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'MODX CMS Install Success', 'Welcome to the MODX Content Management System', '', 'minimal-base', '', 1, 0, 0, 0, 0, '', '<h3>Install Successful!</h3>\r\n<p>You have successfully installed MODX.</p>\r\n<h3>Getting Help</h3>\r\n<p>The <a href="http://forums.modx.com/" target="_blank">MODX Community</a> provides a great starting point to learn all things MODX, or you can also <a href="http://modxcms.com/learn/it.html">see some great learning resources</a> (books, tutorials, blogs and screencasts).</p>\r\n<p>Welcome to MODX!</p>', 1, 3, 0, 1, 1, 1, 1130304721, 1, 1368607498, 0, 0, 0, 1130304721, 1, 'Base Install', 0, 0, 0, 0, 0, 0, 0, 1);

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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(3, 'header-css', 'Подключения CSS файлов ', 0, 8, 0, '<base href="[(site_url)]" />\r\n<link href="css/styles.css" rel="stylesheet" type="text/css" />\r\n<link href="css/lightbox.css" rel="stylesheet" type="text/css" />\r\n<link href="css/nivo-slider.css" rel="stylesheet" type="text/css" />\r\n<link rel="icon" href="images/favicon.ico" type="image/vnd.microsoft.icon" />', 0),
(4, 'header-js', 'Подключения JavaScript', 0, 8, 0, '<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>', 0),
(5, 'header-meta', 'header-meta', 0, 8, 0, '<title>{{title}}</title>\r\n<base href="[(site_url)]"  />\r\n<meta http-equiv="Content-type" content="text/html; charset=UTF-8" />\r\n<meta name="Keywords" content="[*meta-keywords*]" />\r\n<meta name="description" content="[*meta-description*]" />', 0),
(6, 'tilte', 'Заголовок страниц', 0, 10, 0, '[*longtitle:ne=``:then=`[*longtitle*]`:else=`[*pagetitle*]`*]', 0),
(7, 'title-h1', '', 0, 0, 0, '[*description:ne=``:then=`[*description*]`:else=`[*pagetitle*]`*]', 0),
(8, 'mm_rules', 'Default ManagerManager rules.', 0, 8, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\nif($modx->db->getValue("SELECT COUNT(id) FROM " . $modx->getFullTableName(''site_tmplvars'') . " WHERE name=''documentTags''")) {\r\n    mm_widget_tags(''documentTags'','' ''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\r\n}\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\n// For everyone\r\nmm_default(''pub_date'');\r\nmm_default(''hide_menu'',true);\r\n\r\nmm_renameField(''template'',''Тип ресурса'');\r\nmm_changeFieldHelp(''template'', ''Выберите тип ресурса, в зависимости от типа изменяется его отображение'');\r\n\r\nmm_renameField(''longtitle'',''Заголовок title'');\r\n\r\nmm_renameField(''description'',''Заголовок h1'');\r\nmm_changeFieldHelp(''description'', ''Выводит на странице заголовок h1'');\r\n\r\nmm_widget_showimagetvs(); // Always give a preview of Image TVs\r\n\r\n//mm_hideFields(''link_attributes'');\r\n//mm_hideFields(''description'');\r\n//mm_hideFields(''introtext'');\r\n//mm_hideFields(''template'');\r\n//mm_hideFields(''longtitle'');\r\n//mm_hideFields(''alias'');\r\n//mm_hideFields(''content'');\r\n//mm_hideFields(''menutitle'');\r\n\r\n// Перекидываем SEO\r\nmm_createTab(''SEO'', ''seo'', '''' );\r\nmm_moveFieldsToTab(''description,longtitle,meta-keywords,meta-description,seoOverride'', ''seo'', '''');\r\n\r\n// То, что нужно только админу\r\n//mm_widget_accessdenied(''36,69,26,30,34,43,44,50,63,75,81,84'',''<span>Доступ закрыт</span>Доступ к этому документу закрыт из соображений администратора.'',''!1'');\r\n\r\n//EvoGallery\r\nmm_widget_evogallery(2, ''Фотографии'', '''', ''3'');', 0);

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
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `modx_site_plugins`
--

INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'Quick Manager+', '<strong>1.5.5</strong> Enables QuickManager+ front end content editing support', 0, 3, 0, '// In manager\r\nif (isset($_SESSION[''mgrValidated''])) {\r\n\r\n    $show = TRUE;\r\n\r\n    if ($disabled  != '''') {\r\n        $arr = explode(",", $disabled );\r\n        if (in_array($modx->documentIdentifier, $arr)) {\r\n            $show = FALSE;\r\n        }\r\n    }\r\n\r\n    if ($show) {\r\n        // Replace [*#tv*] with QM+ edit TV button placeholders\r\n        if ($tvbuttons == ''true'') {\r\n            $e = $modx->Event;\r\n            if ($e->name == ''OnParseDocument'') {\r\n                 $output = &$modx->documentOutput;\r\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\r\n                 $modx->documentOutput = $output;\r\n             }\r\n         }\r\n        // In manager\r\n        if (isset($_SESSION[''mgrValidated''])) {\r\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\r\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\r\n        }\r\n    }\r\n}', 0, '&1=undefined;; &jqpath=Path to jQuery;text;assets/js/jquery-1.4.4.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ' '),
(2, 'Search Highlight', '<strong>1.5</strong> Used with AjaxSearch to show search terms highlighted on page linked from search results', 0, 4, 0, '/*\n  ------------------------------------------------------------------------\n  Plugin: Search_Highlight v1.5\n  ------------------------------------------------------------------------\n  Changes:\n  18/03/10 - Remove possibility of XSS attempts being passed in the URL\n           - look-behind assertion improved\n  29/03/09 - Removed urldecode calls;\n           - Added check for magic quotes - if set, remove slashes\n           - Highlights terms searched for when target is a HTML entity\n  18/07/08 - advSearch parameter and pcre modifier added\n  10/02/08 - Strip_tags added to avoid sql injection and XSS. Use of $_REQUEST\n  01/03/07 - Added fies/updates from forum from users mikkelwe/identity\n  (better highlight replacement, additional div around term/removal message)\n  ------------------------------------------------------------------------\n  Description: When a user clicks on the link from the AjaxSearch results\n    the target page will have the terms highlighted.\n  ------------------------------------------------------------------------\n  Created By:  Susan Ottwell (sottwell@sottwell.com)\n               Kyle Jaebker (kjaebker@muddydogpaws.com)\n\n  Refactored by Coroico (www.evo.wangba.fr) and TS\n  ------------------------------------------------------------------------\n  Based off the the code by Susan Ottwell (www.sottwell.com)\n    http://modxcms.com/forums/index.php/topic,1237.0.html\n  ------------------------------------------------------------------------\n  CSS:\n    The classes used for the highlighting are the same as the AjaxSearch\n  ------------------------------------------------------------------------\n  Notes:\n    To add a link to remove the highlighting and to show the searchterms\n    put the following on your page where you would like this to appear:\n\n      <!--search_terms-->\n\n    Example output for this:\n\n      Search Terms: the, template\n      Remove Highlighting\n\n    Set the following variables to change the text:\n\n      $termText - the text before the search terms\n      $removeText - the text for the remove link\n  ------------------------------------------------------------------------\n*/\nglobal $database_connection_charset;\n// Conversion code name between html page character encoding and Mysql character encoding\n// Some others conversions should be added if needed. Otherwise Page charset = Database charset\n$pageCharset = array(\n  ''utf8'' => ''UTF-8'',\n  ''latin1'' => ''ISO-8859-1'',\n  ''latin2'' => ''ISO-8859-2''\n);\n\nif (isset($_REQUEST[''searched'']) && isset($_REQUEST[''highlight''])) {\n\n  // Set these to customize the text for the highlighting key\n  // --------------------------------------------------------\n     $termText = ''<div class="searchTerms">Search Terms: '';\n     $removeText = ''Remove Highlighting'';\n  // --------------------------------------------------------\n\n  $highlightText = $termText;\n  $advsearch = ''oneword'';\n\n  $dbCharset = $database_connection_charset;\n  $pgCharset = array_key_exists($dbCharset,$pageCharset) ? $pageCharset[$dbCharset] : $dbCharset;\n\n  // magic quotes check\n  if (get_magic_quotes_gpc()){\n    $searched = strip_tags(stripslashes($_REQUEST[''searched'']));\n    $highlight = strip_tags(stripslashes($_REQUEST[''highlight'']));\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags(stripslashes($_REQUEST[''advsearch'']));\n  }\n  else {\n    $searched = strip_tags($_REQUEST[''searched'']);\n    $highlight = strip_tags($_REQUEST[''highlight'']);\n    if (isset($_REQUEST[''advsearch''])) $advsearch = strip_tags($_REQUEST[''advsearch'']);\n  }\n\n  if ($advsearch != ''nowords'') {\n\n    $searchArray = array();\n    if ($advsearch == ''exactphrase'') $searchArray[0] = $searched;\n    else $searchArray = explode('' '', $searched);\n\n    $searchArray = array_unique($searchArray);\n    $nbterms = count($searchArray);\n    $searchTerms = array();\n    for($i=0;$i<$nbterms;$i++){\n      // Consider all possible combinations\n      $word_ents = array();\n      $word_ents[] = $searchArray[$i];\n      $word_ents[] = htmlentities($searchArray[$i], ENT_NOQUOTES, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_COMPAT, $pgCharset);\n      $word_ents[] = htmlentities($searchArray[$i], ENT_QUOTES, $pgCharset);\n      // Avoid duplication\n      $word_ents = array_unique($word_ents);\n      foreach($word_ents as $word) $searchTerms[]= array(''term'' => $word, ''class'' => $i+1);\n    }\n\n    $output = $modx->documentOutput; // get the parsed document\n    $body = explode("<body", $output); // break out the head\n\n    $highlightClass = explode('' '',$highlight); // break out the highlight classes\n    /* remove possibility of XSS attempts being passed in URL */\n    foreach ($highlightClass as $key => $value) {\n       $highlightClass[$key] = preg_match(''/[^A-Za-z0-9_-]/ms'', $value) == 1 ? '''' : $value;\n    }\n\n    $pcreModifier = ($pgCharset == ''UTF-8'') ? ''iu'' : ''i'';\n    $lookBehind = ''/(?<!&|&[\\w#]|&[\\w#]\\w|&[\\w#]\\w\\w|&[\\w#]\\w\\w\\w|&[\\w#]\\w\\w\\w\\w|&[\\w#]\\w\\w\\w\\w\\w)'';  // avoid a match with a html entity\n    $lookAhead = ''(?=[^>]*<)/''; // avoid a match with a html tag\n\n    $nbterms = count($searchTerms);\n    for($i=0;$i<$nbterms;$i++){\n      $word = $searchTerms[$i][''term''];\n      $class = $highlightClass[0].'' ''.$highlightClass[$searchTerms[$i][''class'']];\n\n      $highlightText .= ($i > 0) ? '', '' : '''';\n      $highlightText .= ''<span class="''.$class.''">''.$word.''</span>'';\n\n      $pattern = $lookBehind . preg_quote($word, ''/'') . $lookAhead . $pcreModifier;\n      $replacement = ''<span class="'' . $class . ''">${0}</span>'';\n      $body[1] = preg_replace($pattern, $replacement, $body[1]);\n    }\n\n    $output = implode("<body", $body);\n\n    $removeUrl = $modx->makeUrl($modx->documentIdentifier);\n    $highlightText .= ''<br /><a href="''.$removeUrl.''" class="ajaxSearch_removeHighlight">''.$removeText.''</a></div>'';\n\n    $output = str_replace(''<!--search_terms-->'',$highlightText,$output);\n    $modx->documentOutput = $output;\n  }\n}', 0, '', 0, ''),
(3, 'TinyMCE Rich Text Editor', '<strong>3.5.8</strong> Javascript WYSIWYG Editor', 0, 3, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce/plugin.tinymce.php'';\n', 0, '&customparams=Custom Parameters;textarea;valid_elements : "*[*]", &mce_formats=Block Formats;text;p,h1,h2,h3,h4,h5,h6,div,blockquote,code,pre &entity_encoding=Entity Encoding;list;named,numeric,raw;named &entities=Entities;text; &mce_path_options=Path Options;list;Site config,Absolute path,Root relative,URL,No convert;Site config &mce_resizing=Advanced Resizing;list;true,false;true &disabledButtons=Disabled Buttons;text; &link_list=Link List;list;enabled,disabled;enabled &webtheme=Web Theme;list;simple,editor,creative,custom;simple &webPlugins=Web Plugins;text;style,advimage,advlink,searchreplace,contextmenu,paste,fullscreen,xhtmlxtras,media &webButtons1=Web Buttons 1;text;undo,redo,selectall,|,pastetext,pasteword,|,search,replace,|,hr,charmap,|,image,link,unlink,anchor,media,|,cleanup,removeformat,|,fullscreen,code,help &webButtons2=Web Buttons 2;text;bold,italic,underline,strikethrough,sub,sup,|,|,blockquote,bullist,numlist,outdent,indent,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,|,styleprops &webButtons3=Web Buttons 3;text; &webButtons4=Web Buttons 4;text; &webAlign=Web Toolbar Alignment;list;ltr,rtl;ltr &width=Width;text;95% &height=Height;text;500 ', 0, ' '),
(4, 'ManagerManager', '<strong>0.3.9</strong> Customize the MODx Manager to offer bespoke admin functions for end users.', 0, 3, 0, '// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php\n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end\n\n// ManagerManager requires jQuery 1.3+\n// The URL to the jQuery library. Choose from the configuration tab whether you want to use\n// a local copy (which defaults to the jQuery library distributed with ModX 1.0.1)\n// a remote copy (which defaults to the Google Code hosted version)\n// or specify a URL to a custom location.\n// Here we set some default values, because this is a convenient place to change them if we need to,\n// but you should configure your preference via the Configuration tab.\n$js_default_url_local = $modx->config[''site_url'']. ''/assets/js/jquery-1.4.4.min.js'';\n$js_default_url_remote = ''http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js'';\n\n// You don''t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\n$asset_path = $modx->config[''base_path''] . ''assets/plugins/managermanager/mm.inc.php'';\ninclude $asset_path;', 0, '&config_chunk=Configuration Chunk;text;mm_demo_rules; &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &which_jquery=jQuery source;list;local (assets/js),remote (google code),manual url (specify below);local (assets/js) &js_src_type=jQuery URL override;text;', 1, ''),
(5, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 3, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, ''),
(6, 'TransAlias', '<strong>1.0.2</strong> Human readible URL translation supporting multiple languages and overrides', 0, 3, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;legal characters &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string; ', 0, ' '),
(10, 'EvoGallery', '<strong>1.1 Beta 1</strong> Plugin for delete images on empty trash', 0, 3, 0, 'if (!isset($params[''modulePath''])) $params[''modulePath''] = $modx->config[''base_path''].''assets/modules/evogallery/'';\ninclude_once($params[''modulePath''] . "classes/management.class.inc.php");\nif (class_exists(''GalleryManagement''))\n	$manager = new GalleryManagement($params);\nelse\n	$modx->logEvent(1, 3, ''Error loading Portfolio Galleries management module'');\n$e =& $modx->event;\nswitch ($e->name ) {\n    case ''OnEmptyTrash'':\n		$manager->deleteImages(''contentid'',$ids);\n		break ;\n    default:\n        return ;\n}\n', 0, '', 0, '23636a8c613426979b9dea1ff0415abf'),
(9, 'EditArea', 'подсветка кода', 0, 3, 0, '$e = & $modx->Event;\r\nswitch ($e->name) { \r\n	case "OnRichTextEditorRegister":\r\n		$e->output("EditArea");\r\n		break;\r\n\r\n	case "OnRichTextEditorInit":\r\n		if($editor=="EditArea") {\r\n			$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/edit_area/edit_area_full.js"></script>'');\r\n			$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/ea_functions.js"></script>'');\r\n			foreach($elements as $element) {\r\n				$e->output(''<script type="text/javascript">initEditArea("''.$element.''", "''.$modx->config[''manager_language''].''", "html")</script>'');\r\n			}\r\n		}		\r\n		break;\r\n\r\n	case "OnChunkFormPrerender":\r\n		global $which_editor;\r\n		$which_editor = ''EditArea'';\r\n		break;\r\n\r\n	case "OnSnipFormRender":\r\n	case "OnPluginFormRender":	\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/edit_area/edit_area_full.js"></script>'');\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/ea_functions.js"></script>'');\r\n		$e->output(''<script type="text/javascript">initEditArea("post", "''.$modx->config[''manager_language''].''", "php")</script>'');\r\n		break;\r\n		\r\n	case "OnTempFormRender":\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/edit_area/edit_area_full.js"></script>'');\r\n		$e->output(''<script type="text/javascript" src="''.$modx->config[''base_url''].''assets/plugins/editarea/ea_functions.js"></script>'');\r\n		$e->output(''<script type="text/javascript">initEditArea("post", "''.$modx->config[''manager_language''].''", "html")</script>'');\r\n		break;\r\n	default :\r\n		return; // stop here - this is very important. \r\n		break; \r\n}', 0, '', 0, ' '),
(8, 'Always stay', 'всегда продолжить', 0, 8, 0, '$e = & $modx->Event;\r\nif ($e->name == "OnDocFormRender" ||\r\n    $e->name == "OnTempFormRender" ||\r\n    $e->name == "OnChunkFormRender" ||\r\n    $e->name == "OnSnipFormRender" ||\r\n    $e->name == "OnPluginFormRender"\r\n   ) {\r\n      $html = "\r\n          <script type=''text/javascript''>\r\n            if(!$(''stay'').value) $(''stay'').value=2;\r\n          </script>\r\n      ";\r\n      $e->output($html);\r\n}', 0, '', 0, ' '),
(11, 'PHx', 'Placeholders Extended', 0, 0, 0, '//<?php\r\n/**\r\n * phx \r\n * \r\n * (Placeholders Xtended) Adds the capability of output modifiers when using placeholders, template variables and settings tags\r\n *\r\n * @category    plugin\r\n * @version     2.1.4\r\n * @author		Armand "bS" Pondman (apondman@zerobarrier.nl)\r\n * @internal    @properties &phxdebug=Log events;int;0 &phxmaxpass=Max. Passes;int;50\r\n * @internal    @events OnParseDocument\r\n * @internal    @modx_category Manager and Admin\r\n */\r\n\r\ninclude_once $modx->config[''rb_base_dir''] . "plugins/phx/phx.parser.class.inc.php";\r\n\r\n$e = &$modx->Event;\r\n\r\n$PHx = new PHxParser($phxdebug,$phxmaxpass);\r\n\r\nswitch($e->name) {\r\n	case ''OnParseDocument'':\r\n		$PHx->OnParseDocument();\r\n		break;\r\n\r\n}', 0, '&phxdebug=Log events;int;0 &phxmaxpass=Max. Passes;int;50', 0, ' '),
(12, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 3, 0, '// In manager\nif (isset($_SESSION[''mgrValidated''])) {\n\n    $show = TRUE;\n\n    if ($disabled  != '''') {\n        $arr = explode(",", $disabled );\n        if (in_array($modx->documentIdentifier, $arr)) {\n            $show = FALSE;\n        }\n    }\n\n    if ($show) {\n        // Replace [*#tv*] with QM+ edit TV button placeholders\n        if ($tvbuttons == ''true'') {\n            $e = $modx->Event;\n            if ($e->name == ''OnParseDocument'') {\n                 $output = &$modx->documentOutput;\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\n                 $modx->documentOutput = $output;\n             }\n         }\n        // In manager\n        if (isset($_SESSION[''mgrValidated''])) {\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n        }\n    }\n}', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &1=undefined;; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 0, ''),
(13, 'ManagerManager', '<strong>0.3.11</strong> Customize the MODx Manager to offer bespoke admin functions for end users.', 0, 3, 0, '$js_default_url_local = $modx->config[''site_url'']. ''/assets/js/jquery.min.js'';\n$js_default_url_remote = ''http://ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js'';\n$asset_path = $modx->config[''base_path''] . ''assets/plugins/managermanager/mm.inc.php'';\ninclude($asset_path);\n', 0, '&config_chunk=Configuration Chunk;text;mm_rules; &remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &which_jquery=jQuery source;list;local (assets/js),remote (google code),manual url (specify below);local (assets/js) &js_src_type=jQuery URL override;text;', 0, ''),
(14, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 3, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
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
(3, 88, 0),
(3, 87, 0),
(3, 85, 0),
(4, 28, 0),
(4, 29, 0),
(4, 35, 1),
(4, 53, 0),
(5, 93, 0),
(5, 81, 0),
(5, 80, 0),
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
(11, 92, 1),
(12, 3, 0),
(12, 13, 0),
(12, 28, 0),
(12, 31, 0),
(12, 92, 0),
(13, 28, 0),
(13, 29, 0),
(13, 53, 0),
(14, 34, 0),
(14, 35, 0),
(14, 36, 0),
(14, 40, 0),
(14, 41, 0),
(14, 42, 0);

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
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'AjaxSearch', '<strong>1.9.3b</strong> Ajax and non-Ajax search that supports results highlighting', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/ajaxSearch/snippet.ajaxSearch.php'';', 0, '', ''),
(2, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(3, 'Breadcrumbs', '<strong>1.0.3</strong> Configurable breadcrumb page-trail navigation', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ''),
(4, 'eForm', '<strong>1.4.4.7</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 6, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(5, 'Wayfinder', '<strong>2.0.1</strong> Completely template-driven and highly flexible menu builder', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';', 0, '', ''),
(6, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(21, 'phpthumb', '<strong>1.1</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/phpthumb/snippet.phpthumb.php'';\r\n', 0, '', ''),
(7, 'MemberCheck', '<strong>1.1</strong> Show chunks based on a logged in Web User''s group membership', 0, 2, 0, 'return require MODX_BASE_PATH.''assets/snippets/membercheck/snippet.membercheck.php'';', 0, '', ''),
(8, 'WebChangePwd', '<strong>1.0</strong> Allows Web User to change their password from the front-end of the website', 0, 2, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&tpl			- (Optional)\n#		Chunk name or document id to use as a template\n#				  \n#	Note: Templats design:\n#			section 1: change pwd template\n#			section 2: notification template \n#\n# Examples:\n#\n#	[[WebChangePwd? &tpl=`ChangePwd`]] \n\n# Set Snippet Paths \n$snipPath  = (($modx->insideManager())? "../":"");\n$snipPath .= "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$isPostBack		= count($_POST) && isset($_POST[''cmdwebchngpwd'']);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/webchangepwd.inc.php";\n\n# Return\nreturn $output;\n\n\n\n', 0, '', ''),
(9, 'WebLogin', '<strong>1.1</strong> Allows webusers to login to protected pages in the website, supporting multiple user groups', 0, 2, 0, '# Created By Raymond Irving 2004\n#::::::::::::::::::::::::::::::::::::::::\n# Params:	\n#\n#	&loginhomeid 	- (Optional)\n#		redirects the user to first authorized page in the list.\n#		If no id was specified then the login home page id or \n#		the current document id will be used\n#\n#	&logouthomeid 	- (Optional)\n#		document id to load when user logs out	\n#\n#	&pwdreqid 	- (Optional)\n#		document id to load after the user has submited\n#		a request for a new password\n#\n#	&pwdactid 	- (Optional)\n#		document id to load when the after the user has activated\n#		their new password\n#\n#	&logintext		- (Optional) \n#		Text to be displayed inside login button (for built-in form)\n#\n#	&logouttext 	- (Optional)\n#		Text to be displayed inside logout link (for built-in form)\n#	\n#	&tpl			- (Optional)\n#		Chunk name or document id to as a template\n#				  \n#	Note: Templats design:\n#			section 1: login template\n#			section 2: logout template \n#			section 3: password reminder template \n#\n#			See weblogin.tpl for more information\n#\n# Examples:\n#\n#	[[WebLogin? &loginhomeid=`8` &logouthomeid=`1`]] \n#\n#	[[WebLogin? &loginhomeid=`8,18,7,5` &tpl=`Login`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n	return ''''; # don''t go any further when inside manager\n}\n\n# deprecated params - only for backward compatibility\nif(isset($loginid)) $loginhomeid=$loginid;\nif(isset($logoutid)) $logouthomeid = $logoutid;\nif(isset($template)) $tpl = $template;\n\n# Snippet customize settings\n$liHomeId	= isset($loginhomeid)? explode(",",$loginhomeid):array($modx->config[''login_home''],$modx->documentIdentifier);\n$loHomeId	= isset($logouthomeid)? $logouthomeid:$modx->documentIdentifier;\n$pwdReqId	= isset($pwdreqid)? $pwdreqid:0;\n$pwdActId	= isset($pwdactid)? $pwdactid:0;\n$loginText	= isset($logintext)? $logintext:''Login'';\n$logoutText	= isset($logouttext)? $logouttext:''Logout'';\n$tpl		= isset($tpl)? $tpl:"";\n\n# System settings\n$webLoginMode = isset($_REQUEST[''webloginmode''])? $_REQUEST[''webloginmode'']: '''';\n$isLogOut		= $webLoginMode==''lo'' ? 1:0;\n$isPWDActivate	= $webLoginMode==''actp'' ? 1:0;\n$isPostBack		= count($_POST) && (isset($_POST[''cmdweblogin'']) || isset($_POST[''cmdweblogin_x'']));\n$txtPwdRem 		= isset($_REQUEST[''txtpwdrem''])? $_REQUEST[''txtpwdrem'']: 0;\n$isPWDReminder	= $isPostBack && $txtPwdRem==''1'' ? 1:0;\n\n$site_id = isset($site_id)? $site_id: '''';\n$cookieKey = substr(md5($site_id."Web-User"),0,15);\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once ($modx->config[''site_manager_path''] . "includes/crypt.class.inc.php");\n\nif ($isPWDActivate || $isPWDReminder || $isLogOut || $isPostBack) {\n	# include the logger class\n	include_once $modx->config[''site_manager_path''] . "includes/log.class.inc.php";\n	include_once $snipPath."weblogin/weblogin.processor.inc.php";\n}\n\ninclude_once $snipPath."weblogin/weblogin.inc.php";\n\n# Return\nreturn $output;\n', 0, '&loginhomeid=Login Home Id;string; &logouthomeid=Logout Home Id;string; &logintext=Login Button Text;string; &logouttext=Logout Button Text;string; &tpl=Template;string; ', ''),
(10, 'WebSignup', '<strong>1.1</strong> Basic Web User account creation/signup system', 0, 2, 0, '# Created By Raymond Irving April, 2005\n#::::::::::::::::::::::::::::::::::::::::\n# Usage:     \n#    Allows a web user to signup for a new web account from the website\n#    This snippet provides a basic set of form fields for the signup form\n#    You can customize this snippet to create your own signup form\n#\n# Params:    \n#\n#    &tpl        - (Optional) Chunk name or document id to use as a template\n#    &groups     - Web users groups to be assigned to users\n#    &useCaptcha - (Optional) Determine to use (1) or not to use (0) captcha\n#                  on signup form - if not defined, will default to system\n#                  setting. GD is required for this feature. If GD is not \n#                  available, useCaptcha will automatically be set to false;\n#                  \n#    Note: Templats design:\n#        section 1: signup template\n#        section 2: notification template \n#\n# Examples:\n#\n#    [[WebSignup? &tpl=`SignupForm` &groups=`NewsReaders,WebUsers`]] \n\n# Set Snippet Paths \n$snipPath = $modx->config[''base_path''] . "assets/snippets/";\n\n# check if inside manager\nif ($m = $modx->insideManager()) {\n    return ''''; # don''t go any further when inside manager\n}\n\n\n# Snippet customize settings\n$tpl = isset($tpl)? $tpl:"";\n$useCaptcha = isset($useCaptcha)? $useCaptcha : $modx->config[''use_captcha''] ;\n// Override captcha if no GD\nif ($useCaptcha && !gd_info()) $useCaptcha = 0;\n\n# setup web groups\n$groups = isset($groups) ? explode('','',$groups):array();\nfor($i=0;$i<count($groups);$i++) $groups[$i] = trim($groups[$i]);\n\n# System settings\n$isPostBack        = count($_POST) && isset($_POST[''cmdwebsignup'']);\n\n$output = '''';\n\n# Start processing\ninclude_once $snipPath."weblogin/weblogin.common.inc.php";\ninclude_once $snipPath."weblogin/websignup.inc.php";\n\n# Return\nreturn $output;', 0, '&tpl=Template;string; ', ''),
(11, 'Reflect', '<strong>2.1.0</strong> Generates date-based archives using Ditto', 0, 7, 0, '/*\n * Author: \n *      Mark Kaplan for MODx CMF\n * \n * Note: \n *      If Reflect is not retrieving its own documents, make sure that the\n *          Ditto call feeding it has all of the fields in it that you plan on\n *       calling in your Reflect template. Furthermore, Reflect will ONLY\n *          show what is currently in the Ditto result set.\n *       Thus, if pagination is on it will ONLY show that page''s items.\n*/\n \n\n// ---------------------------------------------------\n//  Includes\n// ---------------------------------------------------\n\n$reflect_base = isset($reflect_base) ? $modx->config[''base_path''].$reflect_base : $modx->config[''base_path'']."assets/snippets/reflect/";\n/*\n    Param: ditto_base\n    \n    Purpose:\n    Location of Ditto files\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    [(base_path)]assets/snippets/ditto/\n*/\n\n$config = (isset($config)) ? $config : "default";\n/*\n    Param: config\n\n    Purpose:\n    Load a custom configuration\n\n    Options:\n    "default" - default blank config file\n    CONFIG_NAME - Other configs installed in the configs folder or in any folder within the MODx base path via @FILE\n\n    Default:\n    "default"\n    \n    Related:\n    - <extenders>\n*/\n\nrequire($reflect_base."configs/default.config.php");\nrequire($reflect_base."default.templates.php");\nif ($config != "default") {\n    require((substr($config, 0, 5) != "@FILE") ? $reflect_base."configs/$config.config.php" : $modx->config[''base_path''].trim(substr($config, 5)));\n}\n\n// ---------------------------------------------------\n//  Parameters\n// ---------------------------------------------------\n\n$id = isset($id) ? $id."_" : false;\n/*\n    Param: id\n\n    Purpose:\n    Unique ID for this Ditto instance for connection with other scripts (like Reflect) and unique URL parameters\n\n    Options:\n    Any valid folder location containing the Ditto source code with a trailing slash\n\n    Default:\n    "" - blank\n*/\n$getDocuments = isset($getDocuments) ? $getDocuments : 0;\n/*\n    Param: getDocuments\n\n    Purpose:\n    Force Reflect to get documents\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    0 - off\n*/\n$showItems = isset($showItems) ? $showItems : 1;\n/*\n    Param: showItems\n\n    Purpose:\n    Show individual items in the archive\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$groupByYears = isset($groupByYears)? $groupByYears : 1;\n/*\n    Param: groupByYears\n\n    Purpose:\n    Group the archive by years\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n$targetID = isset($targetID) ? $targetID : $modx->documentObject[''id''];\n/*\n    Param: targetID\n\n    Purpose:\n    ID for archive links to point to\n\n    Options:\n    Any MODx document with a Ditto call setup with extenders=`dateFilter`\n    \n    Default:\n    Current MODx Document\n*/\n$dateSource = isset($dateSource) ? $dateSource : "createdon";\n/*\n    Param: dateSource\n\n    Purpose:\n    Date source to display for archive items\n\n    Options:\n    # - Any UNIX timestamp from MODx fields or TVs such as createdon, pub_date, or editedon\n    \n    Default:\n    "createdon"\n    \n    Related:\n    - <dateFormat>\n*/\n$dateFormat = isset($dateFormat) ? $dateFormat : "%d-%b-%y %H:%M";  \n/*\n    Param: dateFormat\n\n    Purpose:\n    Format the [+date+] placeholder in human readable form\n\n    Options:\n    Any PHP valid strftime option\n\n    Default:\n    "%d-%b-%y %H:%M"\n    \n    Related:\n    - <dateSource>\n*/\n$yearSortDir = isset($yearSortDir) ? $yearSortDir : "DESC";\n/*\n    Param: yearSortDir\n\n    Purpose:\n    Direction to sort documents\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "DESC"\n    \n    Related:\n    - <monthSortDir>\n*/\n$monthSortDir = isset($monthSortDir) ? $monthSortDir : "ASC";\n/*\n    Param: monthSortDir\n\n    Purpose:\n    Direction to sort the months\n\n    Options:\n    ASC - ascending\n    DESC - descending\n\n    Default:\n    "ASC"\n    \n    Related:\n    - <yearSortDir>\n*/\n$start = isset($start)? intval($start) : 0;\n/*\n    Param: start\n\n    Purpose:\n    Number of documents to skip in the results\n    \n    Options:\n    Any number\n\n    Default:\n    0\n*/  \n$phx = (isset($phx))? $phx : 1;\n/*\n    Param: phx\n\n    Purpose:\n    Use PHx formatting\n\n    Options:\n    0 - off\n    1 - on\n    \n    Default:\n    1 - on\n*/\n\n// ---------------------------------------------------\n//  Initialize Ditto\n// ---------------------------------------------------\n$placeholder = ($id != false && $getDocuments == 0) ? true : false;\nif ($placeholder === false) {\n    $rID = "reflect_".rand(1,1000);\n    $itemTemplate = isset($tplItem) ? $tplItem: "@CODE:".$defaultTemplates[''item''];\n    $dParams = array(\n        "id" => "$rID",\n        "save" => "3",  \n        "summarize" => "all",\n        "tpl" => $itemTemplate,\n    );\n    \n    $source = $dittoSnippetName;\n    $params = $dittoSnippetParameters;\n        // TODO: Remove after 3.0\n        \n    if (isset($params)) {\n        $givenParams = explode("|",$params);\n        foreach ($givenParams as $parameter) {\n            $p = explode(":",$parameter);\n            $dParams[$p[0]] = $p[1];\n        }\n    }\n    /*\n        Param: params\n\n        Purpose:\n        Pass parameters to the Ditto instance used to retreive the documents\n\n        Options:\n        Any valid ditto parameters in the format name:value \n        with multiple parameters separated by a pipe (|)\n        \n        Note:\n        This parameter is only needed for config, start, and phx as you can\n        now simply use the parameter as if Reflect was Ditto\n\n        Default:\n        [NULL]\n    */\n    \n    $reflectParameters = array(''reflect_base'',''config'',''id'',''getDocuments'',''showItems'',''groupByYears'',''targetID'',''yearSortDir'',''monthSortDir'',''start'',''phx'',''tplContainer'',''tplYear'',''tplMonth'',''tplMonthInner'',''tplItem'',''save'');\n    $params =& $modx->event->params;\n    if(is_array($params)) {\n        foreach ($params as $param=>$value) {\n            if (!in_array($param,$reflectParameters) && substr($param,-3) != ''tpl'') {\n                $dParams[$param] = $value;\n            }\n        }\n    }\n\n    $source = isset($source) ? $source : "Ditto";\n    /*\n        Param: source\n\n        Purpose:\n        Name of the Ditto snippet to use\n\n        Options:\n        Any valid snippet name\n\n        Default:\n        "Ditto"\n    */\n    $snippetOutput = $modx->runSnippet($source,$dParams);\n    $ditto = $modx->getPlaceholder($rID."_ditto_object");\n    $resource = $modx->getPlaceholder($rID."_ditto_resource");\n} else {\n    $ditto = $modx->getPlaceholder($id."ditto_object");\n    $resource = $modx->getPlaceholder($id."ditto_resource");\n}\nif (!is_object($ditto) || !isset($ditto) || !isset($resource)) {\n    return !empty($snippetOutput) ? $snippetOutput : "The Ditto object is invalid. Please check it.";\n}\n\n// ---------------------------------------------------\n//  Templates\n// ---------------------------------------------------\n\n$templates[''tpl''] = isset($tplContainer) ? $ditto->template->fetch($tplContainer): $defaultTemplates[''tpl''];\n/*\n    Param: tplContainer\n\n    Purpose:\n    Container template for the archive\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year''] = isset($tplYear) ? $ditto->template->fetch($tplYear): $defaultTemplates[''year''];\n/*\n    Param: tplYear\n\n    Purpose:\n    Template for the year item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''year_inner''] = isset($tplYearInner) ? $ditto->template->fetch($tplYearInner): $defaultTemplates[''year_inner''];\n/*\n    Param: tplYearInner\n\n    Purpose:\n    Template for the year item (the ul to hold the year template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month''] = isset($tplMonth) ? $ditto->template->fetch($tplMonth): $defaultTemplates[''month''];\n/*\n    Param: tplMonth\n\n    Purpose:\n    Template for the month item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''month_inner''] = isset($tplMonthInner) ? $ditto->template->fetch($tplMonthInner): $defaultTemplates[''month_inner''];\n/*\n    Param: tplMonthInner\n\n    Purpose:\n    Template for the month item  (the ul to hold the month template)\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n$templates[''item''] = isset($tplItem) ? $ditto->template->fetch($tplItem): $defaultTemplates[''item''];\n/*\n    Param: tplItem\n\n    Purpose:\n    Template for the individual item\n\n    Options:\n    - Any valid chunk name\n    - Code via @CODE:\n    - File via @FILE:\n\n    Default:\n    See default.tempates.php\n*/\n\n$ditto->addField("date","display","custom");\n    // force add the date field if receiving data from a Ditto instance\n\n// ---------------------------------------------------\n//  Reflect\n// ---------------------------------------------------\n\nif (function_exists("reflect") === FALSE) {\nfunction reflect($templatesDocumentID, $showItems, $groupByYears, $resource, $templatesDateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir) {\n    global $modx;\n    $cal = array();\n    $output = '''';\n    $ph = array(''year''=>'''',''month''=>'''',''item''=>'''',''out''=>'''');\n    $build = array();\n    $stop = count($resource);\n\n    // loop and fetch all the results\n    for ($i = $start; $i < $stop; $i++) {\n        $date = getdate($resource[$i][$templatesDateSource]);\n        $year = $date["year"];\n        $month = $date["mon"];\n        $cal[$year][$month][] = $resource[$i];\n    }\n    if ($yearSortDir == "DESC") {\n        krsort($cal);\n    } else {\n        ksort($cal);\n    }\n    foreach ($cal as $year=>$months) {\n        if ($monthSortDir == "ASC") {\n            ksort($months);\n        } else {\n            krsort($months);\n        }\n        $build[$year] = $months;\n    }\n    \n    foreach ($build as $year=>$months) {\n        $r_year = '''';\n        $r_month = '''';\n        $r_month_2 = '''';\n        $year_count = 0;\n        $items = array();\n        \n        foreach ($months as $mon=>$month) {\n            $month_text = strftime("%B", mktime(10, 10, 10, $mon, 10, $year));\n            $month_url = $ditto->buildURL("month=".$mon."&year=".$year."&day=false&start=0",$templatesDocumentID,$id);\n            $month_count = count($month);\n            $year_count += $month_count;\n            $r_month = $ditto->template->replace(array("year"=>$year,"month"=>$month_text,"url"=>$month_url,"count"=>$month_count),$templates[''month'']);\n            if ($showItems) {\n                foreach ($month as $item) {\n                    $items[$year][$mon][''items''][] = $ditto->render($item, $templates[''item''], false, $templatesDateSource, $dateFormat, array(),$phx);\n                }\n                $r_month_2 = $ditto->template->replace(array(''wrapper'' => implode('''',$items[$year][$mon][''items''])),$templates[''month_inner'']);\n                $items[$year][$mon] = $ditto->template->replace(array(''wrapper'' => $r_month_2),$r_month);\n            } else {\n                $items[$year][$mon] = $r_month;\n            }\n        }\n        if ($groupByYears) {\n            $year_url = $ditto->buildURL("year=".$year."&month=false&day=false&start=0",$templatesDocumentID,$id);\n            $r_year =  $ditto->template->replace(array("year"=>$year,"url"=>$year_url,"count"=>$year_count),$templates[''year'']);\n            $var = $ditto->template->replace(array(''wrapper''=>implode('''',$items[$year])),$templates[''year_inner'']);\n            $output .= $ditto->template->replace(array(''wrapper''=>$var),$r_year);\n        } else {\n            $output .= implode('''',$items[$year]);\n        }\n    }\n\n    $output = $ditto->template->replace(array(''wrapper''=>$output),$templates[''tpl'']);\n    $modx->setPlaceholder($id.''reset'',$ditto->buildURL(''year=false&month=false&day=false'',$templatesDocumentID,$id));\n\nreturn $output;\n    \n}\n}\n\nreturn reflect($targetID, $showItems, $groupByYears, $resource, $dateSource, $dateFormat, $ditto, $templates,$id,$start,$yearSortDir,$monthSortDir);', 0, '', ''),
(12, 'Personalize', '<strong>2.1</strong> Personalize snippet', 0, 2, 0, 'return require MODX_BASE_PATH.''assets/snippets/personalize/snippet.personalize.php'';', 0, '', ''),
(13, 'Jot', '<strong>1.1.4</strong> User comments with moderation and email subscription', 0, 7, 0, '/*####\n#\n# Author: Armand "bS" Pondman (apondman@zerobarrier.nl)\n#\n# Latest Version: http://modxcms.com/Jot-998.html\n# Jot Demo Site: http://projects.zerobarrier.nl/modx/\n# Documentation: http://wiki.modxcms.com/index.php/Jot (wiki)\n#\n####*/\n\n$jotPath = $modx->config[''base_path''] . ''assets/snippets/jot/'';\ninclude_once($jotPath.''jot.class.inc.php'');\n\n$Jot = new CJot;\n$Jot->VersionCheck("1.1.4");\n$Jot->Set("path",$jotPath);\n$Jot->Set("action", $action);\n$Jot->Set("postdelay", $postdelay);\n$Jot->Set("docid", $docid);\n$Jot->Set("tagid", $tagid);\n$Jot->Set("subscribe", $subscribe);\n$Jot->Set("moderated", $moderated);\n$Jot->Set("captcha", $captcha);\n$Jot->Set("badwords", $badwords);\n$Jot->Set("bw", $bw);\n$Jot->Set("sortby", $sortby);\n$Jot->Set("numdir", $numdir);\n$Jot->Set("customfields", $customfields);\n$Jot->Set("guestname", $guestname);\n$Jot->Set("canpost", $canpost);\n$Jot->Set("canview", $canview);\n$Jot->Set("canedit", $canedit);\n$Jot->Set("canmoderate", $canmoderate);\n$Jot->Set("trusted", $trusted);\n$Jot->Set("pagination", $pagination);\n$Jot->Set("placeholders", $placeholders);\n$Jot->Set("subjectSubscribe", $subjectSubscribe);\n$Jot->Set("subjectModerate", $subjectModerate);\n$Jot->Set("subjectAuthor", $subjectAuthor);\n$Jot->Set("notify", $notify);\n$Jot->Set("notifyAuthor", $notifyAuthor);\n$Jot->Set("validate", $validate);\n$Jot->Set("title", $title);\n$Jot->Set("authorid", $authorid);\n$Jot->Set("css", $css);\n$Jot->Set("cssFile", $cssFile);\n$Jot->Set("cssRowAlt", $cssRowAlt);\n$Jot->Set("cssRowMe", $cssRowMe);\n$Jot->Set("cssRowAuthor", $cssRowAuthor);\n$Jot->Set("tplForm", $tplForm);\n$Jot->Set("tplComments", $tplComments);\n$Jot->Set("tplModerate", $tplModerate);\n$Jot->Set("tplNav", $tplNav);\n$Jot->Set("tplNotify", $tplNotify);\n$Jot->Set("tplNotifyModerator", $tplNotifyModerator);\n$Jot->Set("tplNotifyAuthor", $tplNotifyAuthor);\n$Jot->Set("tplSubscribe", $tplSubscribe);\n$Jot->Set("debug", $debug);\n$Jot->Set("output", $output);\nreturn $Jot->Run();', 0, '', ''),
(14, 'FirstChildRedirect', '<strong>1.0</strong> Automatically redirects to the first child of a Container Resource', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(15, 'ListIndexer', '<strong>1.0.1</strong> A flexible way to show the most recent Resources and other Resource lists', 0, 5, 0, 'return require MODX_BASE_PATH.''assets/snippets/listindexer/snippet.listindexer.php'';', 0, '', ''),
(16, 'Ditto', '<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
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
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
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
(1000, 'OnPageNotFound', 1, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_settings`
--

CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'MODxRE'),
('settings_version', ''),
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
('use_alias_path', '0'),
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
('site_id', '525395d5d77e9'),
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
('sys_files_checksum', 'a:4:{s:19:"/var/modx/index.php";s:32:"5ef8c0cf619ecb2bdbf8d53e7a855eaa";s:19:"/var/modx/.htaccess";s:32:"bf5176cce7e34062c0f93cdccf359e1b";s:27:"/var/modx/manager/index.php";s:32:"4ee58c3b241e3b1443c7e3a7452d6ebe";s:41:"/var/modx/manager/includes/config.inc.php";s:32:"b18649b73eef8bb0d78481f7a439d63c";}'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('seostrict', '0'),
('cache_type', '1'),
('maxImageWidth', '1600'),
('maxImageHeight', '1200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('docid_incrmnt_method', '0');

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
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
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

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Default admin account', 1, 'exsdis@gmail.com', '', '', 0, 1379922487, 0, 15, 1379922488, 1381209575, 0, 'iuiv429fjih4mvrnfbahs1v1b4', 0, 0, '', '', '', '', '', '', '', '');

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
  PRIMARY KEY (`user`,`setting_name`),
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
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
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
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
