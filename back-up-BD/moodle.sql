-- phpMyAdmin SQL Dump
-- version 3.3.7deb7
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 28-06-2013 a las 12:05:22
-- Versión del servidor: 5.1.66
-- Versión de PHP: 5.3.3-7+squeeze15

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `moodle`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assign`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext COLLATE utf8_unicode_ci,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assignfeedback_comments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assignfeedback_file`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assignment`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext COLLATE utf8_unicode_ci,
  `data2` longtext COLLATE utf8_unicode_ci,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assignment_submissions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assignsubmission_file`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext COLLATE utf8_unicode_ci,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assignsubmission_onlinetext`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`),
  KEY `mdl_assigrad_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assign_grades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subtype` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(28) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assign_plugin_config`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`),
  KEY `mdl_assisubm_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assign_submission`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of flags that can be set for a single user in a single ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assign_user_flags`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Map an assignment specific id number to a user' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_assign_user_mapping`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `operation` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'backup',
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_backup_controllers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_backup_courses`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_files_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_files_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `info` longtext COLLATE utf8_unicode_ci,
  `newcontextid` bigint(10) DEFAULT NULL,
  `newitemid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_backfiletemp_bacconcomf_ix` (`backupid`,`contextid`,`component`,`filearea`,`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store files along the backup process. Note this table isn' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_backup_files_template`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_ids_template`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_ids_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemname` varchar(160) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `newitemid` bigint(10) NOT NULL DEFAULT '0',
  `parentitemid` bigint(10) DEFAULT NULL,
  `info` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backidstemp_baciteite_uix` (`backupid`,`itemname`,`itemid`),
  KEY `mdl_backidstemp_bacitepar_ix` (`backupid`,`itemname`,`parentitemid`),
  KEY `mdl_backidstemp_bacitenew_ix` (`backupid`,`itemname`,`newitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all sort of ids along the backup process. Note this' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_backup_ids_template`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_backup_logs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `image` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuerurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `issuercontact` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messagesubject` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines badge' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines settings for connecting external backpack' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_backpack`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria for issuing badges' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_criteria`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines criteria that were met for an issued badge' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_criteria_met`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines parameters for badges criteria' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_criteria_param`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting for external badges display' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_external`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines issued badges' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_issued`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Track manual award criteria for badges' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_badge_manual_award`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='contains all installed blocks' AUTO_INCREMENT=40 ;

--
-- Volcar la base de datos para la tabla `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `version`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 2013050100, 0, 0, 1),
(2, 'admin_bookmarks', 2013050100, 0, 0, 1),
(3, 'badges', 2013050100, 0, 0, 1),
(4, 'blog_menu', 2013050100, 0, 0, 1),
(5, 'blog_recent', 2013050100, 0, 0, 1),
(6, 'blog_tags', 2013050100, 0, 0, 1),
(7, 'calendar_month', 2013050100, 0, 0, 1),
(8, 'calendar_upcoming', 2013050100, 0, 0, 1),
(9, 'comments', 2013050100, 0, 0, 1),
(10, 'community', 2013050100, 0, 0, 1),
(11, 'completionstatus', 2013050100, 0, 0, 1),
(12, 'course_list', 2013050100, 0, 0, 1),
(13, 'course_overview', 2013050100, 0, 0, 1),
(14, 'course_summary', 2013050100, 0, 0, 1),
(15, 'feedback', 2013050100, 0, 0, 0),
(16, 'glossary_random', 2013050100, 0, 0, 1),
(17, 'html', 2013050100, 0, 0, 1),
(18, 'login', 2013050100, 0, 0, 1),
(19, 'mentees', 2013050100, 0, 0, 1),
(20, 'messages', 2013050100, 0, 0, 1),
(21, 'mnet_hosts', 2013050100, 0, 0, 1),
(22, 'myprofile', 2013050100, 0, 0, 1),
(23, 'navigation', 2013050100, 0, 0, 1),
(24, 'news_items', 2013050100, 0, 0, 1),
(25, 'online_users', 2013050100, 0, 0, 1),
(26, 'participants', 2013050100, 0, 0, 1),
(27, 'private_files', 2013050100, 0, 0, 1),
(28, 'quiz_results', 2013050100, 0, 0, 1),
(29, 'recent_activity', 2013050100, 0, 0, 1),
(30, 'rss_client', 2013050100, 300, 0, 1),
(31, 'search_forums', 2013050100, 0, 0, 1),
(32, 'section_links', 2013050100, 0, 0, 1),
(33, 'selfcompletion', 2013050100, 0, 0, 1),
(34, 'settings', 2013050100, 0, 0, 1),
(35, 'site_main_menu', 2013050100, 0, 0, 1),
(36, 'social_activities', 2013050100, 0, 0, 1),
(37, 'tag_flickr', 2013050100, 0, 0, 1),
(38, 'tag_youtube', 2013050100, 0, 0, 1),
(39, 'tags', 2013050100, 0, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `coursedescription` longtext COLLATE utf8_unicode_ci,
  `courseurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `imageurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Community block' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_block_community`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultregion` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=14 ;

--
-- Volcar la base de datos para la tabla `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'search_forums', 15, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(11, 'news_items', 15, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(12, 'calendar_upcoming', 15, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(13, 'recent_activity', 15, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subpage` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_block_positions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext COLLATE utf8_unicode_ci NOT NULL,
  `preferredtitle` varchar(64) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_block_rss_client`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_blog_association`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filtertags` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_blog_external`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_book`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_book_chapters`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_cache_filters`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1372425806, '1', 1372433006),
(2, 'accesslib/dirtycontexts', '/1/3/15', 1372430157, '1', 1372437357),
(3, 'userpreferenceschanged', '3', 1372430286, '1', 1372437486),
(4, 'userpreferenceschanged', '4', 1372430016, '1', 1372437216);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `formattedtext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=72 ;

--
-- Volcar la base de datos para la tabla `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, 'bf6b65900eb4db77239350ea81b9ddd4', '<p>Cuando se habilitan reproductores en estas configuraciones, los archivos pueden incrustarse empleando el filtro multimedia (si está habilitado) o mediante un recurso de Archivo o URL con la opción de incrustar. Cuando no están habilitados, estos formatos no son incrustables y los usuarios pueden descargarlos manualmente o seguir las ligas hacia estos recursos.</p>\n\n<p>Cuando dos reproductores soportan el mismo formato, el habilitar ambos aumenta la compatibilidad entre diferentes dispositivos como teléfonos móviles. Es posible aumentar aún más la compatibilidad al proporcionar archivos múltiples en diferentes formatos para cada clip de audio  o video.</p>\n', 1372258984),
(2, 'e59970b37f2d73992015eb794f146803', '<p>Cuando se habilitan reproductores en estas configuraciones, los archivos pueden incrustarse empleando el filtro multimedia (si está habilitado) o mediante un recurso de Archivo o URL con la opción de incrustar. Cuando no están habilitados, estos formatos no son incrustables y los usuarios pueden descargarlos manualmente o seguir las ligas hacia estos recursos.</p>\n\n<p>Cuando dos reproductores soportan el mismo formato, el habilitar ambos aumenta la compatibilidad entre diferentes dispositivos como teléfonos móviles. Es posible aumentar aún más la compatibilidad al proporcionar archivos múltiples en diferentes formatos para cada clip de audio  o video.</p>\n', 1372430018),
(3, 'fc5c2f6f9f1841d19e4d4f0871a4aab9', '<p>Cuando se habilitan reproductores en estas configuraciones, los archivos pueden incrustarse empleando el filtro multimedia (si está habilitado) o mediante un recurso de Archivo o URL con la opción de incrustar. Cuando no están habilitados, estos formatos no son incrustables y los usuarios pueden descargarlos manualmente o seguir las ligas hacia estos recursos.</p>\n\n<p>Cuando dos reproductores soportan el mismo formato, el habilitar ambos aumenta la compatibilidad entre diferentes dispositivos como teléfonos móviles. Es posible aumentar aún más la compatibilidad al proporcionar archivos múltiples en diferentes formatos para cada clip de audio  o video.</p>\n', 1372430168),
(4, '6faa867bb6e1fb4d95f18a0beb0a750a', '<div class="text_to_html"><div class="clearfix"><div class="theme_screenshot"><h2>Formal White</h2><img src="formal_white/pix/screenshot.gif" alt="screenshot.gif" /><h3>Foro de discusión del tema:</h3><p><a href="http://moodle.org/mod/forum/view.php?id=46">http://moodle.org/mod/forum/view.php?id=46</a></p><h3>Créditos</h3><p><a href="http://docs.moodle.org/en/Theme_credits">http://docs.moodle.org/en/Theme_credits</a></p><h3>Documentación:</h3><p><a href="http://docs.moodle.org/en/Themes">http://docs.moodle.org/en/Themes</a></p><h3>Reporte un problema:</h3><p><a href="http://tracker.moodle.org">http://tracker.moodle.org</a></p></div><div class="theme_description"><h2>Acerca de</h2><p>Formal White es un tema de tres columnas, de ancho fluido exportado a Moodle 2.0 desde Moodle 1.X.</p><h2>Modificaciones</h2><p>Este tema está basado tanto en Base y Canvas, dos temas padre incluidos en el núcleo de Moodle. Si desea modificar este tema, se recomienda que primero lo duplique, después lo renombre antes de hacerle cambios. Esto evitará que su tema sea sobre-escrito en futuras actualizaciones de Moodle, y Usted conservará los archivos originales en caso de que haga un desbarajuste. Puede encontrar mayor información sobre modificar temas en <a href="http://docs.moodle.org/en/Theme">MoodleDocs</a>.</p><h2>Créditos</h2><p>Este tema fue programado y es mantenido por MediaTouch 2000. </p><h2>Licencia</h2><p>Este, y todos los temas incluidos con Moodle están licenciados bajo la Licencia Pública General <a href="http://www.gnu.org/licenses/gpl.html">GNU General Public License</a>. </p></div></div></div>', 1372340533),
(5, 'a3d53f45bdaf8dd5bada919e077c77ff', '<div class="text_to_html"><div class="clearfix"><div class="theme_screenshot"><h2>MyMobile</h2><img src="mymobile/pix/screenshot.png" alt="screenshot.png" /><h2>About</h2><p>MyMobile is a mobile theme for Moodle 2.x. More information on modifying themes can be found in the <a href="http://docs.moodle.org/en/Theme">MoodleDocs</a>.</p></div></div></div>', 1372341860),
(6, 'ece0df738c255701ca46fa49ce36d295', '<div class="text_to_html"> <div class="clearfix"><div class="theme_screenshot"><h2>Afterburner</h2><img src="afterburner/pix/screenshot.jpg" alt="screenshot.jpg" /><h3>Theme Discussion Forum:</h3><p><a href="http://moodle.org/mod/forum/view.php?id=46">http://moodle.org/mod/forum/view.php?id=46</a></p><h3>Theme Credits</h3><p><a href="http://docs.moodle.org/en/Theme_credits">http://docs.moodle.org/en/Theme_credits</a></p><h3>Theme Documentation:</h3><p><a href="http://docs.moodle.org/en/Themes">http://docs.moodle.org/en/Themes</a></p><h3>Report a bug:</h3><p><a href="http://tracker.moodle.org">http://tracker.moodle.org</a></p></div><div class="theme_description"><h2>About</h2><p>Afterburner is a three-column, fluid-width theme coded for Moodle 2.0. It makes use of custom menus that appear below the site title on every page. An added function, which allows users to login and logout, has now been integrated into the custom menu for this theme.</p><h2>Parents</h2><p>This theme is built on Base, a parent theme included in the Moodle core. If you wish to modify aspects of this theme, beyond the settings offered, we advise creating a new theme using this theme and Base theme as parent themes, so any updates to these parent themes, in the core, will find their way into your new theme.</p><h2>Credits</h2><p>This design was originally created for Moodle 1.9 by Patrick Malley of NewSchool Learning (www.newschoollearning.com)from an original design by Rocket Themes (www.rockettheme.com) before being ported to Moodle 2.0 by Mary Evans of NewSchool Learning (contact@newschoollearning.com).</p><h2>License</h2><p>This, and all other themes included in the Moodle core, are licensed under the <a href="http://www.gnu.org/licenses/gpl.html">GNU General Public License</a>.</p></div></div></div>', 1372341874),
(7, 'e180bf320ca5221903282a603c4b66a5', '<p>El módulo de actividad de base de datos permite a los participantes crear, mantener y buscar información en un repositorio de registros. La estructura de las entradas la define el profesor según una lista de campos. Los tipos de campo incluyen casilla de verificación, botones de radio, menú desplegable, área de texto, URL, imagen y archivo cargado.</p>\n\n<p>La presentación visual de la información al listar, ver o editar las entradas de la base de datos se controla mediante plantillas de base de datos. Las actividades de base de datos pueden ser compartidos entre los cursos como opción preestablecida de manera que un profesor también puede importar y exportar las entradas de base de datos.</p>\n\n<p>Si el filtro de base de datos "auto enlace" está activo, cualquier entrada de la base de datos podrá ser enlazada automáticamente desde donde las palabras o frases aparecen dentro en el curso.</p>\n\n<p>Un profesor puede permitir comentarios en las entradas. Las entradas también pueden se calificadas por profesores u otros estudiantes (evaluación por pares). Las calificaciones se agregarán para formar una calificación final que se registrará en el libro de calificaciones.</p>\n\n<p>Las actividades de base de datos tienen muchos usos, como por ejemplo</p>\n\n<ul><li>Una colección de enlaces de colaboración web, libros, reseñas de libros, referencias de revistas, etc</li>\n<li>Para la visualización de fotos, carteles, sitios web o poemas de los estudiantes, ya así poder ser comentados por otros estudiantes.</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345505),
(8, 'b2d0a12ca83e226bdc08ada792a5fedd', '<p>La actividad chat permite a los participantes tener una discusión en formato texto de manera sincrónica en tiempo real.</p>\n\n<p>El chat puede ser una actividad puntual  o puede repetirse a la misma hora cada día o cada semana. Las sesiones de chat se guardan y pueden hacerse públicas para que todos las vean o limitadas a los usuarios con permiso para ver los registros de sesiones del chat.</p>\n\n<p>Los chats son especialmente útiles cuando un grupo no tiene posibilidad de reunirse físicamente para poder conversar cara-a-cara, como</p>\n\n<ul><li>Reuniones programadas de estudiantes inscritos a cursos en línea, para permitirles compartir experiencias con otros compañeros del mismo curso pero de diferentes ciudades o países</li>\n<li>Un estudiante que temporalmente no puede asistir en persona, podría chatear con su profesor para ponerse al día del trabajo escolar</li>\n<li>Estudiantes que empiezan a trabajar se juntan para discutir sus experiencias entre ellos y con el maestro</li>\n<li>Niños pequeños en casa por las tardes, como una introducción controlada (monitoreada) al mundo de las redes sociales</li>\n<li>Una sesión de preguntas y respuestas con un orador invitado de una localidad diferente (a distancia)</li>\n<li>Sesiones para ayudar a los estudiantes a prepararse para exámenes, donde el maestro, o los estudiantes, hagan preguntas de ejemplo</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345505),
(9, '5f31fa37b1e7bbc9ea74894afc8c2d51', '<p>El módulo Consulta permite al profesor hacer una pregunta especificando las posibles respuestas posibles.</p>\n\n<p>Los resultados de la elección puede ser publicados después que los estudiantes hayan respondido, después de cierta fecha, o no publicarse. Los resultados pueden ser publicados, con los nombres de los estudiantes o de forma anónima.</p>\n\n<p>Una Consulta puede utilizarse</p>\n\n<ul><li><p>Para realizar una encuesta rápida que estimule a los alunmos a reflexionar sobre un tema</p></li>\n<li><p>Para comprobar rápidamente que los estudiantes han entendido algo concreto</p></li>\n<li><p>Para facilitar la toma de decisiones, por ejemplo permitiendo a los estudiantes votar algún aspecto relacionado con el curso.</p></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345505),
(10, '6ad93790309abc2e57779420290e747a', '<p>La actividad Cuestionario permite al profesor diseñar y plantear cuestionarios con preguntas tipo opción múltiple, verdadero/falso, coincidencia, respuesta corta y respuesta numérica</p>\n\n<p>El profesor puede permitir que el cuestionario se intente resolver varias veces, con las preguntas ordenadas o seleccionadas aleatoriamente del banco de preguntas. Se puede establecer un tiempo límite.</p>\n\n<p>Cada intento se califica automáticamente, con la excepción de las preguntas de tipo "ensayo", y el resultado se guarda en el libro de calificaciones.</p>\n\n<p>El profesor puede determinar si se muestran y cuándo se muestran al usuario los resultados, los comentarios de retroalimentación y las respuestas correctas.</p>\n\n<p>Los cuestionario pueden usarse para hacer</p>\n\n<ul><li>Exámenes del curso</li>\n<li>Mini Test para tareas de lectura o al final de un tema</li>\n<li>Exámenes de práctica con preguntas de exámenes anteriores</li>\n<li>Para ofrecer información inmediata sobre el rendimiento * Para auto-evaluación</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345505),
(11, '84db49be5b9084e6f1ba030637d361f7', '<p>El módulo de actividad <b>Encuestas predefinidas</b> proporciona una serie de instrumentos que se han mostrado útiles para evaluar y estimular el aprendizaje en entornos en línea. Un profesor puede usarlos para recopilar información entre sus alumnos que le ayude a conocer mejor su clase así como su propia forma de enseñar.</p>\n\n<p>Tenga en cuenta que estas encuestas tienen ya las preguntas previamente predefinidas. Los profesores que deseen crear sus propias encuestas debe utilizar el módulo de actividad <b>Encuesta</b></p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345505),
(12, '59b24380107b2b22966be3f7f7649a74', '<p>El módulo de actividad foro permite a los participantes tener discusiones asincrónicas, es decir discusiones que tienen lugar durante un período prolongado de tiempo.</p>\n\n<p>Hay varios tipos de foro para elegir, como el foro estándar donde cualquier persona puede iniciar una nueva discusión en cualquier momento, un foro en el que cada alumno puede iniciar una única discusión, o un foro de pregunta y respuesta en el que los estudiantes primero deben participar antes de poder ver los mensajes de otros estudiantes. El profesor puede permitir que se adjunten archivos a las aportaciones al foro. Las imágenes adjuntas se muestran en el mensaje en el foro.</p>\n\n<p>Los participantes pueden suscribirse a un foro para recibir notificaciones cuando hay nuevos mensajes en el foro. El profesor puede establecer el modo de suscripción,  opcional, forzado o auto, o prohibir completamente la suscripción. Si es necesario, los estudiantes pueden ser bloqueados a la hora de publicar más de un número determinado de mensajes en un determinado período de tiempo; esta medida puede evitar que determinadas personas dominen las discusiones.</p>\n\n<p>Los mensajes en el foro puede ser evaluado por profesores o estudiantes (evaluación por pares). Las clasificaciones pueden agregarse a una calificación final que se registra en el libro de calificaciones.</p>\n\n<p>Los foros tiene muchos usos, como por ejemplo</p>\n\n<ul><li>Un espacio social para que los estudiantes se conozcan</li>\n<li>Para los avisos del curso (usando un foro de noticias con suscripción forzada)</li>\n<li>Para discutir el contenido del curso o de materiales de lectura</li>\n<li>Para continuar en línea una cuestión planteada previamente en una sesión presencial</li>\n<li>Para discusiones solo entre profesores del curso (mediante un foro oculto)</li>\n<li>Un centro de ayuda donde los tutores y los estudiantes pueden dar consejos</li>\n<li>Un área de soporte uno-a-uno para comunicaciones entre alumno y profesor (usando un foro con grupos separados y con un estudiante por grupo)</li>\n<li>Para actividades complementarias, como una "lluvia de ideas" donde los estudiantes puedan reflexionar y proponer ideas</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(13, '0dc48ff13a08552937a8c1073b19f7f6', '<p>El módulo de actividad glosario permite a los participantes crear y mantener una lista de definiciones, de forma similar a un diccionario, o para recoger y organizar recursos o información.</p>\n\n<p>El profesor puede permitir que se adjunten archivos a las entradas del glosario. Las imágenes adjuntas se mostrarán en la entrada. Las entradas se pueden buscar y se puede navegar por ellas en orden alfabético o por categoría, fecha o autor. Las entradas pueden aprobarse por defecto o requerir la aprobación de un profesor antes de que sean visibles para los demás alumnos.</p>\n\n<p>Si se ha habilitado el filtro de vinculación automática del glosario, las entradas se enlazan automáticamente cuando las palabras o frases aparecen en el curso.</p>\n\n<p>El profesor puede permitir comentarios en las entradas. Las entradas también se pueden calificar por profesores o por los demás estudiantes (evaluación por pares). Las calificaciones pueden agregarse para formar una calificación final que se registra en el libro de calificaciones.</p>\n\n<p>Los glosarios tienen muchos usos, como</p>\n\n<ul><li>Un registro cooperativo de términos clave</li>\n<li>Un espacio para darse a conocer, donde los estudiantes nuevos añadan su nombre y sus datos personales</li>\n<li>Un recurso con "consejos prácticos" con las mejores prácticas en un tema concreto</li>\n<li>Un área para compartir vídeos, imágenes o archivos de sonido</li>\n<li>Un recurso con "asuntos que recordar"</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(14, '9235d7974f2d9d52e5b3f6f9848342bb', '<p>El módulo de actividad de herramienta externa les permiten a los estudiantes interactuar con recursos educativos y actividades alojadas en otros sitios de internet. Por ejemplo, una herramienta externa podría proporcionar acceso a un nuevo tipo de actividad o de materiales educativos de una editorial.</p>\n\n<p>Para crear una actividad de herramienta externa se requiere un provedor de herramienta que soporte  LTI (Learning Tools Interoperability = Interoperatividad de Herramientas de Aprendizaje). Un maestro puede crear una actividad de herramienta externa o hacer uso de una herramienta configurada por el administrador del sitio.</p>\n\n<p>Las herramientas externas difieren se los recursos URL en varias formas:</p>\n\n<ul><li><p>Las herramientas externas están conscientes del contexto, por ejemplo: tienen acceso a información acerca del usuario que invocó la herramienta, como por ejemplo sa institución, curso y nombre</p></li>\n<li><p>Las herramientas externas soportan leer, actualizar y borrar calificaciones asociadas con la instancia de la actividad</p></li>\n<li><p>Las configuraciones de la herramienta externa crean una relación de confianza entre su sitio Moodle y el provedor de la herramienta, permitiendo la comunicación segura entre ambos</p></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(15, '178f0acacb1c24c2f9dd5048ce9482a6', '<p>La actividad lección permite a un profesor presentar contenidos y/ o actividades prácticas de forma interesante y flexible. Un profesor puede utilizar la lección para crear un conjunto lineal de páginas de contenido o actividades educativas que ofrezcan al alumno varios itinerarios u opciones. En cualquier caso, los profesores pueden optar por incrementar la participación del alumno y asegurar la comprensión mediante la inclusión de diferentes tipos de pregunta, tales como la elección múltiple, respuesta corta y correspondencia. Dependiendo de la respuesta elegida por el estudiante y de cómo el profesor desarrolla la lección, los estudiantes pueden pasar a la página siguiente, volver a una página anterior o dirigirse a un itinerario totalmente diferente.</p>\n\n<p>Una lección puede ser calificada y la calificación registrada en el libro de calificaciones.</p>\n\n<p>Las lecciones pueden ser utilizados</p>\n\n<ul><li>Para el aprendizaje autodirigido de un nuevo tema</li>\n<li>Para ejercicios basados en escenarios o simulaciones y de  toma de decisiones</li>\n<li>Para realizar ejercicios de repaso diferenciadas, con distintos conjuntos de preguntas de repaso, dependiendo de las respuestas dadas a las preguntas anteriores</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(16, 'c193b355f1148e2bb8fc836a2c103976', '<p>Un paquete SCORM es un conjunto de archivos que se empaquetan conforme a una norma estándar para los objetos de aprendizaje. El módulo de actividad SCORM permite cargar y añadir a los cursos paquetes SCORM o AICC como archivos zip.</p>\n\n<p>El contenido se muestra normalmente en varias páginas, con navegación entre las páginas. Hay varias opciones para la visualización de los contenidos, con ventanas pop-up, en tablas de contenidos, con botones de navegación, etc Las actividades SCORM generalmente incluyen preguntas calificables, que se registra en el libro de calificaciones.</p>\n\n<p>Las actividades SCORM se puede usar</p>\n\n<ul><li>Para la presentación de contenidos multimedia y animaciones</li>\n<li>Como herramienta de evaluación</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(17, '0ceb7de4225828caa507abc4d98c42d0', '<p>El módulo de actividad taller permite la recopilación, revisión y evaluación por pares del trabajo de los estudiantes.</p>\n\n<p>Los estudiantes pueden enviar cualquier contenido digital (archivos), tales como documentos de procesador de texto o de hojas de cálculo y también pueden escribir el texto directamente en un campo empleando un editor de texto (dentro de Moodle).</p>\n\n<p>Los envíos son evaluados empleando un formato de evaluación de criterios múltiples definido por el profesor. El proceso de revisión por pares  y el formato para comprender cómo funciona la evaluación se pueden practicar por anticipado con envíos de ejemplo proporcionados por el maestro, junto con una evaluación de referencia. A los estudiantes se les dará la oportunidad de evaluar uno o más de los envíos de sus pares estudiantes. Los que envían y los que evalúan pueden permanecer anónimos si se requiere así.</p>\n\n<p>Los estudiantes tendrán dos calificaciones para la actividad de taller: una calificación por  enviarlo y otra por la evaluación de sus pares. Ambas calificaciones se guardan en el libro de calificaciones.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(18, '5d42238bbd0f214b465a36e05e66f7cd', '<p>El módulo de Tareas permite a un profesor evaluar el aprendizaje de los alumnos mediante la creación de una tarea a realizar que luego revisará, valorará y calificará.</p>\n\n<p>Los alumnos pueden presentar cualquier contenido digital (archivos), como documentos de texto, hojas de cálculo, imágenes, audio y vídeos entre otros.\nAlternativamente, o como complemento, la tarea puede requerir que los estudiantes escriban texto directamente en un campo utilizando el editor de texto. Una tarea también puede ser utilizada para recordar a los estudiantes tareas del "mundo real" que necesitan realizar y que no requieren la entrega de ningún tipo de contenido digital.</p>\n\n<p>Al revisar las tareas, los profesores pueden dejar comentarios de retroalimentación y subir archivos, tales como anotaciones a los envíos de los estudiantes,  documentos con observaciones o comentarios en audio. Las tareas  pueden ser clasificadas según una escala numérica o según una escala personalizada, o bien, mediante un método de calificación avanzada, como una rúbrica. Las calificaciones finales se registran en el libro de calificaciones.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(19, '4cec228edfe1f236e0261c32dff60708', '<p>El módulo de actividad wiki le permite a los participantes añadir y editar una colección de páginas web. Un wiki puede ser colaborativo, donde todos pueden editarlo, o puede ser individual, donde cada persona tiene su propio wiki que solamente ella podrá editar.</p>\n\n<p>Se conserva un histórico de las versiones previas de cada página del wiki, permitiendo consultar los cambios hechos por cada participante.</p>\n\n<p>Los wikis tienen muchos usos, como por ejemplo:</p>\n\n<ul><li>Para generar unos apuntes de clase colaborativamente entre todos</li>\n<li>Para  los profesores de una escuela que planean una estrategia o reunión de trabajo en equipo</li>\n<li>Para estudiantes que trabajarán en equipo en un libro en línea, creando contenidos de un tema elegido por sus tutores</li>\n<li>Para la narración colaborativa o creación de poesía grupal, donde cada participante escribe una línea o un verso</li>\n<li>Como un diario personal para apuntes para examen o resúmenes (wiki personal)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(20, '45621db9d16a6dbc9b2b8544ba4bd6e9', '<p>El módulo Archivo permite a los profesores proveer un Archivo como un recurso del curso. Cuando sea posible, el archivo se mostrará dentro del interface del curso; si no es el caso, se le preguntará a los estudiantes si quieren descargarlo. El recurso Archivo puede incluir archivos de soporte, por ejemplo, una página HTML puede tener incrustadas imágenes u objetos Flash.</p>\n\n<p>Observe que los estudiantes necesitan tener el software apropiado en sus odenadores personales para poder abrir los archivos.</p>\n\n<p>Un Archivo puede utilizarse para</p>\n\n<ul><li>Compartir presentaciones utilizadas en clase</li>\n<li>Incluire una mini-web como recurso del curso</li>\n<li>Proveer a los estudiantes de borradores de archivos para que los editen y los envíen en sus tareas</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(21, '8a9e30bf98f5d8a5fabae86ee91f4091', '<p>El recurso Carpeta permite al profesor mostrar un grupo de archivos relacionados dentro de una única carpeta. Se puede subir un archivo comprimido (zip) que se descomprimirá (unzip) posteriormente para mostrar su contenido, o bien, se puede crear una carpeta vacía y subir los archivos dentro de ella.</p>\n\n<p>Una carpeta se puede usar para:</p>\n\n<ul><li>Agrupar una serie de documentos sobre un tema, por ejemplo, un conjunto de exámenes de otros años en formato pdf, o una colección de archivos para crear un proyecto concreto por parte de los estudiantes.</li>\n<li>Crear un espacio de subida de archivos compartido entre los profesores del curso (se debería ocultar la carpeta a los alumnos para que lo vean solo los profesores)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(22, 'ad64f4247f84fe360cb38367657763d9', '<p>El módulo etiqueta permite insertar texto y elementos multimedia en las páginas del curso entre los enlaces a otros recursos y actividades. Las etiquetas son muy versátiles y pueden ayudar a mejorar la apariencia de un curso si se usan cuidadosamente.</p>\n\n<p>Las etiquetas pueden ser utilizadas</p>\n\n<ul><li>Para dividir una larga lista de actividades con un subtítulo o una imagen</li>\n<li>Para visualizar un archivo de sonido o vídeo incrustado directamente en la página del curso</li>\n<li>Para añadir una breve descripción de una sección del curso</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(23, 'eb45ab5ca84bbe4de621a8f00538fac4', '<p>El módulo libro permite crear material de estudio de múltiples páginas en formato libro, con capítulos y subcapítulos. El libro puede incluir contenido multimedia así como texto y es útil para mostrar grandes volúmenes de información repartido en secciones.</p>\n\n<p>Un libro puede usarse</p>\n\n<ul><li>Para mostrar material de lectura de los módulos individuales de estudio</li>\n<li>Como un manual para el personal del departamento</li>\n<li>Como un portafolio de trabajos de los estudiantes</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(24, '84c7bebee14198a10b74e085eceb73f6', '<p>El recurso Página permite a los profesores crear una página web mediante el editor de textos. Una Página puede mostrar texto, imágenes, sonido, vídeo, enlaces web y código incrustado (como por ejemplo los mapas de Google) entre otros.</p>\n\n<p>Entre las ventajas de utilizar el recurso Página en lugar del recurso de Archivo está que el recurso es más accesible (por ejemplo, para usuarios de dispositivos móviles) y de más fácil actualización.</p>\n\n<p>Una página puede ser utilizada para</p>\n\n<ul><li>Dar a conocer los términos y condiciones de un curso o el programa de la asignatura\n\n<ul><li>Para incrustar varios vídeos o archivos de sonido, junto con un texto explicativo</li>\n</ul></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(25, 'dafa21c9f201b84f1a74b6bcc39ee055', '<p>Un paquete de contenidos IMS permite mostrar dentro del curso paquetes de contenidos creados conforme a la especificación <b>IMS Content Packaging</b>.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(26, 'ffb24df1745523b497a772817294ca5c', '<p>El recurso URL permite que el profesor pueda proporcionar un enlace de Internet como un recurso del curso. Todo aquello que esté disponible en línea, como documentos o imágenes, puede ser vinculado; la URL no tiene por qué ser la página principal de un sitio web. La dirección URL de una página web en particular puede ser copiada y pegada por el profesor, o bien, este puede utilizar el selector de archivo y seleccionar una URL desde un repositorio, como Flickr, YouTube o Wikimedia (dependiendo de qué repositorios están habilitados para el sitio).</p>\n\n<p>Hay una serie de opciones de visualización de la URL, como incrustada o abierta en una nueva ventana, y opciones avanzadas,  como parsear información a la URL, como el nombre de un estudiante.</p>\n\n<p>Tenga en cuenta que las URLs también pueden ser añadidas en otros recursos o actividades a través del editor de texto.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372258717/docs" />Más ayuda</a></div>\n', 1372345506),
(27, '88c57044ce492fe088d8f1dcfebc62aa', '<p>Cuando se habilitan reproductores en estas configuraciones, los archivos pueden incrustarse empleando el filtro multimedia (si está habilitado) o mediante un recurso de Archivo o URL con la opción de incrustar. Cuando no están habilitados, estos formatos no son incrustables y los usuarios pueden descargarlos manualmente o seguir las ligas hacia estos recursos.</p>\n\n<p>Cuando dos reproductores soportan el mismo formato, el habilitar ambos aumenta la compatibilidad entre diferentes dispositivos como teléfonos móviles. Es posible aumentar aún más la compatibilidad al proporcionar archivos múltiples en diferentes formatos para cada clip de audio  o video.</p>\n', 1372430097),
(28, '4bead31c85fcfa8c0fa0a3a6a002f15e', '<p>Este ajuste determina la categoría en la que aparecerá el curso en la lista de cursos.</p>\n', 1372343889),
(29, 'f05622911999aadc8f9efc0b5a35305f', '<p>Cuando se habilitan reproductores en estas configuraciones, los archivos pueden incrustarse empleando el filtro multimedia (si está habilitado) o mediante un recurso de Archivo o URL con la opción de incrustar. Cuando no están habilitados, estos formatos no son incrustables y los usuarios pueden descargarlos manualmente o seguir las ligas hacia estos recursos.</p>\n\n<p>Cuando dos reproductores soportan el mismo formato, el habilitar ambos aumenta la compatibilidad entre diferentes dispositivos como teléfonos móviles. Es posible aumentar aún más la compatibilidad al proporcionar archivos múltiples en diferentes formatos para cada clip de audio  o video.</p>\n', 1372430122),
(30, 'af66b907e852dd7b4a69100b136cd965', '<div class="no-overflow"><p>En este curso aprenderemos a cargar un curso en la plataforma para que los alumnos puedan accederlo.</p></div>', 1372430259),
(31, '39b93491299370c56d8d4eb69f00b54a', '<p>El módulo de actividad de base de datos permite a los participantes crear, mantener y buscar información en un repositorio de registros. La estructura de las entradas la define el profesor según una lista de campos. Los tipos de campo incluyen casilla de verificación, botones de radio, menú desplegable, área de texto, URL, imagen y archivo cargado.</p>\n\n<p>La presentación visual de la información al listar, ver o editar las entradas de la base de datos se controla mediante plantillas de base de datos. Las actividades de base de datos pueden ser compartidos entre los cursos como opción preestablecida de manera que un profesor también puede importar y exportar las entradas de base de datos.</p>\n\n<p>Si el filtro de base de datos "auto enlace" está activo, cualquier entrada de la base de datos podrá ser enlazada automáticamente desde donde las palabras o frases aparecen dentro en el curso.</p>\n\n<p>Un profesor puede permitir comentarios en las entradas. Las entradas también pueden se calificadas por profesores u otros estudiantes (evaluación por pares). Las calificaciones se agregarán para formar una calificación final que se registrará en el libro de calificaciones.</p>\n\n<p>Las actividades de base de datos tienen muchos usos, como por ejemplo</p>\n\n<ul><li>Una colección de enlaces de colaboración web, libros, reseñas de libros, referencias de revistas, etc</li>\n<li>Para la visualización de fotos, carteles, sitios web o poemas de los estudiantes, ya así poder ser comentados por otros estudiantes.</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(32, '6ee36bf603c431ff0161350bf983e1c4', '<p>La actividad chat permite a los participantes tener una discusión en formato texto de manera sincrónica en tiempo real.</p>\n\n<p>El chat puede ser una actividad puntual  o puede repetirse a la misma hora cada día o cada semana. Las sesiones de chat se guardan y pueden hacerse públicas para que todos las vean o limitadas a los usuarios con permiso para ver los registros de sesiones del chat.</p>\n\n<p>Los chats son especialmente útiles cuando un grupo no tiene posibilidad de reunirse físicamente para poder conversar cara-a-cara, como</p>\n\n<ul><li>Reuniones programadas de estudiantes inscritos a cursos en línea, para permitirles compartir experiencias con otros compañeros del mismo curso pero de diferentes ciudades o países</li>\n<li>Un estudiante que temporalmente no puede asistir en persona, podría chatear con su profesor para ponerse al día del trabajo escolar</li>\n<li>Estudiantes que empiezan a trabajar se juntan para discutir sus experiencias entre ellos y con el maestro</li>\n<li>Niños pequeños en casa por las tardes, como una introducción controlada (monitoreada) al mundo de las redes sociales</li>\n<li>Una sesión de preguntas y respuestas con un orador invitado de una localidad diferente (a distancia)</li>\n<li>Sesiones para ayudar a los estudiantes a prepararse para exámenes, donde el maestro, o los estudiantes, hagan preguntas de ejemplo</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(33, 'f790df2b8c2d8736e09bfe99774edd61', '<p>El módulo Consulta permite al profesor hacer una pregunta especificando las posibles respuestas posibles.</p>\n\n<p>Los resultados de la elección puede ser publicados después que los estudiantes hayan respondido, después de cierta fecha, o no publicarse. Los resultados pueden ser publicados, con los nombres de los estudiantes o de forma anónima.</p>\n\n<p>Una Consulta puede utilizarse</p>\n\n<ul><li><p>Para realizar una encuesta rápida que estimule a los alunmos a reflexionar sobre un tema</p></li>\n<li><p>Para comprobar rápidamente que los estudiantes han entendido algo concreto</p></li>\n<li><p>Para facilitar la toma de decisiones, por ejemplo permitiendo a los estudiantes votar algún aspecto relacionado con el curso.</p></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(34, '7311888bcb767c477a19bf43c0a560dc', '<p>La actividad Cuestionario permite al profesor diseñar y plantear cuestionarios con preguntas tipo opción múltiple, verdadero/falso, coincidencia, respuesta corta y respuesta numérica</p>\n\n<p>El profesor puede permitir que el cuestionario se intente resolver varias veces, con las preguntas ordenadas o seleccionadas aleatoriamente del banco de preguntas. Se puede establecer un tiempo límite.</p>\n\n<p>Cada intento se califica automáticamente, con la excepción de las preguntas de tipo "ensayo", y el resultado se guarda en el libro de calificaciones.</p>\n\n<p>El profesor puede determinar si se muestran y cuándo se muestran al usuario los resultados, los comentarios de retroalimentación y las respuestas correctas.</p>\n\n<p>Los cuestionario pueden usarse para hacer</p>\n\n<ul><li>Exámenes del curso</li>\n<li>Mini Test para tareas de lectura o al final de un tema</li>\n<li>Exámenes de práctica con preguntas de exámenes anteriores</li>\n<li>Para ofrecer información inmediata sobre el rendimiento * Para auto-evaluación</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(35, '9fd20f66ec3f67c00eb475668b1bc4ed', '<p>El módulo de actividad <b>Encuestas predefinidas</b> proporciona una serie de instrumentos que se han mostrado útiles para evaluar y estimular el aprendizaje en entornos en línea. Un profesor puede usarlos para recopilar información entre sus alumnos que le ayude a conocer mejor su clase así como su propia forma de enseñar.</p>\n\n<p>Tenga en cuenta que estas encuestas tienen ya las preguntas previamente predefinidas. Los profesores que deseen crear sus propias encuestas debe utilizar el módulo de actividad <b>Encuesta</b></p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(36, 'c53ea8a85b8376a9252e0a50485844c1', '<p>El módulo de actividad foro permite a los participantes tener discusiones asincrónicas, es decir discusiones que tienen lugar durante un período prolongado de tiempo.</p>\n\n<p>Hay varios tipos de foro para elegir, como el foro estándar donde cualquier persona puede iniciar una nueva discusión en cualquier momento, un foro en el que cada alumno puede iniciar una única discusión, o un foro de pregunta y respuesta en el que los estudiantes primero deben participar antes de poder ver los mensajes de otros estudiantes. El profesor puede permitir que se adjunten archivos a las aportaciones al foro. Las imágenes adjuntas se muestran en el mensaje en el foro.</p>\n\n<p>Los participantes pueden suscribirse a un foro para recibir notificaciones cuando hay nuevos mensajes en el foro. El profesor puede establecer el modo de suscripción,  opcional, forzado o auto, o prohibir completamente la suscripción. Si es necesario, los estudiantes pueden ser bloqueados a la hora de publicar más de un número determinado de mensajes en un determinado período de tiempo; esta medida puede evitar que determinadas personas dominen las discusiones.</p>\n\n<p>Los mensajes en el foro puede ser evaluado por profesores o estudiantes (evaluación por pares). Las clasificaciones pueden agregarse a una calificación final que se registra en el libro de calificaciones.</p>\n\n<p>Los foros tiene muchos usos, como por ejemplo</p>\n\n<ul><li>Un espacio social para que los estudiantes se conozcan</li>\n<li>Para los avisos del curso (usando un foro de noticias con suscripción forzada)</li>\n<li>Para discutir el contenido del curso o de materiales de lectura</li>\n<li>Para continuar en línea una cuestión planteada previamente en una sesión presencial</li>\n<li>Para discusiones solo entre profesores del curso (mediante un foro oculto)</li>\n<li>Un centro de ayuda donde los tutores y los estudiantes pueden dar consejos</li>\n<li>Un área de soporte uno-a-uno para comunicaciones entre alumno y profesor (usando un foro con grupos separados y con un estudiante por grupo)</li>\n<li>Para actividades complementarias, como una "lluvia de ideas" donde los estudiantes puedan reflexionar y proponer ideas</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(37, '82e8680e78a9b50db1e8c3426db09e38', '<p>El módulo de actividad glosario permite a los participantes crear y mantener una lista de definiciones, de forma similar a un diccionario, o para recoger y organizar recursos o información.</p>\n\n<p>El profesor puede permitir que se adjunten archivos a las entradas del glosario. Las imágenes adjuntas se mostrarán en la entrada. Las entradas se pueden buscar y se puede navegar por ellas en orden alfabético o por categoría, fecha o autor. Las entradas pueden aprobarse por defecto o requerir la aprobación de un profesor antes de que sean visibles para los demás alumnos.</p>\n\n<p>Si se ha habilitado el filtro de vinculación automática del glosario, las entradas se enlazan automáticamente cuando las palabras o frases aparecen en el curso.</p>\n\n<p>El profesor puede permitir comentarios en las entradas. Las entradas también se pueden calificar por profesores o por los demás estudiantes (evaluación por pares). Las calificaciones pueden agregarse para formar una calificación final que se registra en el libro de calificaciones.</p>\n\n<p>Los glosarios tienen muchos usos, como</p>\n\n<ul><li>Un registro cooperativo de términos clave</li>\n<li>Un espacio para darse a conocer, donde los estudiantes nuevos añadan su nombre y sus datos personales</li>\n<li>Un recurso con "consejos prácticos" con las mejores prácticas en un tema concreto</li>\n<li>Un área para compartir vídeos, imágenes o archivos de sonido</li>\n<li>Un recurso con "asuntos que recordar"</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(38, '9cfac60dff5809b4c31f58c5bf10a2b7', '<p>El módulo de actividad de herramienta externa les permiten a los estudiantes interactuar con recursos educativos y actividades alojadas en otros sitios de internet. Por ejemplo, una herramienta externa podría proporcionar acceso a un nuevo tipo de actividad o de materiales educativos de una editorial.</p>\n\n<p>Para crear una actividad de herramienta externa se requiere un provedor de herramienta que soporte  LTI (Learning Tools Interoperability = Interoperatividad de Herramientas de Aprendizaje). Un maestro puede crear una actividad de herramienta externa o hacer uso de una herramienta configurada por el administrador del sitio.</p>\n\n<p>Las herramientas externas difieren se los recursos URL en varias formas:</p>\n\n<ul><li><p>Las herramientas externas están conscientes del contexto, por ejemplo: tienen acceso a información acerca del usuario que invocó la herramienta, como por ejemplo sa institución, curso y nombre</p></li>\n<li><p>Las herramientas externas soportan leer, actualizar y borrar calificaciones asociadas con la instancia de la actividad</p></li>\n<li><p>Las configuraciones de la herramienta externa crean una relación de confianza entre su sitio Moodle y el provedor de la herramienta, permitiendo la comunicación segura entre ambos</p></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(39, '0776ceb663987e95ead6c5d439054b16', '<p>La actividad lección permite a un profesor presentar contenidos y/ o actividades prácticas de forma interesante y flexible. Un profesor puede utilizar la lección para crear un conjunto lineal de páginas de contenido o actividades educativas que ofrezcan al alumno varios itinerarios u opciones. En cualquier caso, los profesores pueden optar por incrementar la participación del alumno y asegurar la comprensión mediante la inclusión de diferentes tipos de pregunta, tales como la elección múltiple, respuesta corta y correspondencia. Dependiendo de la respuesta elegida por el estudiante y de cómo el profesor desarrolla la lección, los estudiantes pueden pasar a la página siguiente, volver a una página anterior o dirigirse a un itinerario totalmente diferente.</p>\n\n<p>Una lección puede ser calificada y la calificación registrada en el libro de calificaciones.</p>\n\n<p>Las lecciones pueden ser utilizados</p>\n\n<ul><li>Para el aprendizaje autodirigido de un nuevo tema</li>\n<li>Para ejercicios basados en escenarios o simulaciones y de  toma de decisiones</li>\n<li>Para realizar ejercicios de repaso diferenciadas, con distintos conjuntos de preguntas de repaso, dependiendo de las respuestas dadas a las preguntas anteriores</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124);
INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(40, '54dffede7e6f51968dfd89ac8f56e5f6', '<p>Un paquete SCORM es un conjunto de archivos que se empaquetan conforme a una norma estándar para los objetos de aprendizaje. El módulo de actividad SCORM permite cargar y añadir a los cursos paquetes SCORM o AICC como archivos zip.</p>\n\n<p>El contenido se muestra normalmente en varias páginas, con navegación entre las páginas. Hay varias opciones para la visualización de los contenidos, con ventanas pop-up, en tablas de contenidos, con botones de navegación, etc Las actividades SCORM generalmente incluyen preguntas calificables, que se registra en el libro de calificaciones.</p>\n\n<p>Las actividades SCORM se puede usar</p>\n\n<ul><li>Para la presentación de contenidos multimedia y animaciones</li>\n<li>Como herramienta de evaluación</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(41, 'd212b64d43fcedefbd44f5e50fe2f6a9', '<p>El módulo de actividad taller permite la recopilación, revisión y evaluación por pares del trabajo de los estudiantes.</p>\n\n<p>Los estudiantes pueden enviar cualquier contenido digital (archivos), tales como documentos de procesador de texto o de hojas de cálculo y también pueden escribir el texto directamente en un campo empleando un editor de texto (dentro de Moodle).</p>\n\n<p>Los envíos son evaluados empleando un formato de evaluación de criterios múltiples definido por el profesor. El proceso de revisión por pares  y el formato para comprender cómo funciona la evaluación se pueden practicar por anticipado con envíos de ejemplo proporcionados por el maestro, junto con una evaluación de referencia. A los estudiantes se les dará la oportunidad de evaluar uno o más de los envíos de sus pares estudiantes. Los que envían y los que evalúan pueden permanecer anónimos si se requiere así.</p>\n\n<p>Los estudiantes tendrán dos calificaciones para la actividad de taller: una calificación por  enviarlo y otra por la evaluación de sus pares. Ambas calificaciones se guardan en el libro de calificaciones.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(42, '1fe1753e147c93bb63b6b06082a17a21', '<p>El módulo de Tareas permite a un profesor evaluar el aprendizaje de los alumnos mediante la creación de una tarea a realizar que luego revisará, valorará y calificará.</p>\n\n<p>Los alumnos pueden presentar cualquier contenido digital (archivos), como documentos de texto, hojas de cálculo, imágenes, audio y vídeos entre otros.\nAlternativamente, o como complemento, la tarea puede requerir que los estudiantes escriban texto directamente en un campo utilizando el editor de texto. Una tarea también puede ser utilizada para recordar a los estudiantes tareas del "mundo real" que necesitan realizar y que no requieren la entrega de ningún tipo de contenido digital.</p>\n\n<p>Al revisar las tareas, los profesores pueden dejar comentarios de retroalimentación y subir archivos, tales como anotaciones a los envíos de los estudiantes,  documentos con observaciones o comentarios en audio. Las tareas  pueden ser clasificadas según una escala numérica o según una escala personalizada, o bien, mediante un método de calificación avanzada, como una rúbrica. Las calificaciones finales se registran en el libro de calificaciones.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(43, '47c2cbff62da311cac25fd427b220b4a', '<p>El módulo de actividad wiki le permite a los participantes añadir y editar una colección de páginas web. Un wiki puede ser colaborativo, donde todos pueden editarlo, o puede ser individual, donde cada persona tiene su propio wiki que solamente ella podrá editar.</p>\n\n<p>Se conserva un histórico de las versiones previas de cada página del wiki, permitiendo consultar los cambios hechos por cada participante.</p>\n\n<p>Los wikis tienen muchos usos, como por ejemplo:</p>\n\n<ul><li>Para generar unos apuntes de clase colaborativamente entre todos</li>\n<li>Para  los profesores de una escuela que planean una estrategia o reunión de trabajo en equipo</li>\n<li>Para estudiantes que trabajarán en equipo en un libro en línea, creando contenidos de un tema elegido por sus tutores</li>\n<li>Para la narración colaborativa o creación de poesía grupal, donde cada participante escribe una línea o un verso</li>\n<li>Como un diario personal para apuntes para examen o resúmenes (wiki personal)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(44, 'a1ef55d46ac255dd9ade5446867df2ee', '<p>El módulo Archivo permite a los profesores proveer un Archivo como un recurso del curso. Cuando sea posible, el archivo se mostrará dentro del interface del curso; si no es el caso, se le preguntará a los estudiantes si quieren descargarlo. El recurso Archivo puede incluir archivos de soporte, por ejemplo, una página HTML puede tener incrustadas imágenes u objetos Flash.</p>\n\n<p>Observe que los estudiantes necesitan tener el software apropiado en sus odenadores personales para poder abrir los archivos.</p>\n\n<p>Un Archivo puede utilizarse para</p>\n\n<ul><li>Compartir presentaciones utilizadas en clase</li>\n<li>Incluire una mini-web como recurso del curso</li>\n<li>Proveer a los estudiantes de borradores de archivos para que los editen y los envíen en sus tareas</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(45, 'fb774d578212fe24b2dd55e911cf163d', '<p>El recurso Carpeta permite al profesor mostrar un grupo de archivos relacionados dentro de una única carpeta. Se puede subir un archivo comprimido (zip) que se descomprimirá (unzip) posteriormente para mostrar su contenido, o bien, se puede crear una carpeta vacía y subir los archivos dentro de ella.</p>\n\n<p>Una carpeta se puede usar para:</p>\n\n<ul><li>Agrupar una serie de documentos sobre un tema, por ejemplo, un conjunto de exámenes de otros años en formato pdf, o una colección de archivos para crear un proyecto concreto por parte de los estudiantes.</li>\n<li>Crear un espacio de subida de archivos compartido entre los profesores del curso (se debería ocultar la carpeta a los alumnos para que lo vean solo los profesores)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(46, '34a4a3346acedb08458b2ef02e5b4199', '<p>El módulo etiqueta permite insertar texto y elementos multimedia en las páginas del curso entre los enlaces a otros recursos y actividades. Las etiquetas son muy versátiles y pueden ayudar a mejorar la apariencia de un curso si se usan cuidadosamente.</p>\n\n<p>Las etiquetas pueden ser utilizadas</p>\n\n<ul><li>Para dividir una larga lista de actividades con un subtítulo o una imagen</li>\n<li>Para visualizar un archivo de sonido o vídeo incrustado directamente en la página del curso</li>\n<li>Para añadir una breve descripción de una sección del curso</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(47, '1b71f736497c94d9a3eaac98b2fcc2cc', '<p>El módulo libro permite crear material de estudio de múltiples páginas en formato libro, con capítulos y subcapítulos. El libro puede incluir contenido multimedia así como texto y es útil para mostrar grandes volúmenes de información repartido en secciones.</p>\n\n<p>Un libro puede usarse</p>\n\n<ul><li>Para mostrar material de lectura de los módulos individuales de estudio</li>\n<li>Como un manual para el personal del departamento</li>\n<li>Como un portafolio de trabajos de los estudiantes</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(48, '2178edc4cfe0f8264a4feefbb25b6262', '<p>El recurso Página permite a los profesores crear una página web mediante el editor de textos. Una Página puede mostrar texto, imágenes, sonido, vídeo, enlaces web y código incrustado (como por ejemplo los mapas de Google) entre otros.</p>\n\n<p>Entre las ventajas de utilizar el recurso Página en lugar del recurso de Archivo está que el recurso es más accesible (por ejemplo, para usuarios de dispositivos móviles) y de más fácil actualización.</p>\n\n<p>Una página puede ser utilizada para</p>\n\n<ul><li>Dar a conocer los términos y condiciones de un curso o el programa de la asignatura\n\n<ul><li>Para incrustar varios vídeos o archivos de sonido, junto con un texto explicativo</li>\n</ul></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(49, 'feb9a9be8dae1a07044302c2c5e39a9b', '<p>Un paquete de contenidos IMS permite mostrar dentro del curso paquetes de contenidos creados conforme a la especificación <b>IMS Content Packaging</b>.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(50, 'a1746e2fcd860e5936bc9ebd69091691', '<p>El recurso URL permite que el profesor pueda proporcionar un enlace de Internet como un recurso del curso. Todo aquello que esté disponible en línea, como documentos o imágenes, puede ser vinculado; la URL no tiene por qué ser la página principal de un sitio web. La dirección URL de una página web en particular puede ser copiada y pegada por el profesor, o bien, este puede utilizar el selector de archivo y seleccionar una URL desde un repositorio, como Flickr, YouTube o Wikimedia (dependiendo de qué repositorios están habilitados para el sitio).</p>\n\n<p>Hay una serie de opciones de visualización de la URL, como incrustada o abierta en una nueva ventana, y opciones avanzadas,  como parsear información a la URL, como el nombre de un estudiante.</p>\n\n<p>Tenga en cuenta que las URLs también pueden ser añadidas en otros recursos o actividades a través del editor de texto.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430124),
(51, '53857403278ea740cf3cab37d26e56a4', '<p>Cuando se habilitan reproductores en estas configuraciones, los archivos pueden incrustarse empleando el filtro multimedia (si está habilitado) o mediante un recurso de Archivo o URL con la opción de incrustar. Cuando no están habilitados, estos formatos no son incrustables y los usuarios pueden descargarlos manualmente o seguir las ligas hacia estos recursos.</p>\n\n<p>Cuando dos reproductores soportan el mismo formato, el habilitar ambos aumenta la compatibilidad entre diferentes dispositivos como teléfonos móviles. Es posible aumentar aún más la compatibilidad al proporcionar archivos múltiples en diferentes formatos para cada clip de audio  o video.</p>\n', 1372425860),
(52, '4043454a25b726a86519acb77bcb9482', '<p>El módulo de actividad de base de datos permite a los participantes crear, mantener y buscar información en un repositorio de registros. La estructura de las entradas la define el profesor según una lista de campos. Los tipos de campo incluyen casilla de verificación, botones de radio, menú desplegable, área de texto, URL, imagen y archivo cargado.</p>\n\n<p>La presentación visual de la información al listar, ver o editar las entradas de la base de datos se controla mediante plantillas de base de datos. Las actividades de base de datos pueden ser compartidos entre los cursos como opción preestablecida de manera que un profesor también puede importar y exportar las entradas de base de datos.</p>\n\n<p>Si el filtro de base de datos "auto enlace" está activo, cualquier entrada de la base de datos podrá ser enlazada automáticamente desde donde las palabras o frases aparecen dentro en el curso.</p>\n\n<p>Un profesor puede permitir comentarios en las entradas. Las entradas también pueden se calificadas por profesores u otros estudiantes (evaluación por pares). Las calificaciones se agregarán para formar una calificación final que se registrará en el libro de calificaciones.</p>\n\n<p>Las actividades de base de datos tienen muchos usos, como por ejemplo</p>\n\n<ul><li>Una colección de enlaces de colaboración web, libros, reseñas de libros, referencias de revistas, etc</li>\n<li>Para la visualización de fotos, carteles, sitios web o poemas de los estudiantes, ya así poder ser comentados por otros estudiantes.</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/data/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(53, '1c0ba0018138e6f99b70377f346f76b9', '<p>La actividad chat permite a los participantes tener una discusión en formato texto de manera sincrónica en tiempo real.</p>\n\n<p>El chat puede ser una actividad puntual  o puede repetirse a la misma hora cada día o cada semana. Las sesiones de chat se guardan y pueden hacerse públicas para que todos las vean o limitadas a los usuarios con permiso para ver los registros de sesiones del chat.</p>\n\n<p>Los chats son especialmente útiles cuando un grupo no tiene posibilidad de reunirse físicamente para poder conversar cara-a-cara, como</p>\n\n<ul><li>Reuniones programadas de estudiantes inscritos a cursos en línea, para permitirles compartir experiencias con otros compañeros del mismo curso pero de diferentes ciudades o países</li>\n<li>Un estudiante que temporalmente no puede asistir en persona, podría chatear con su profesor para ponerse al día del trabajo escolar</li>\n<li>Estudiantes que empiezan a trabajar se juntan para discutir sus experiencias entre ellos y con el maestro</li>\n<li>Niños pequeños en casa por las tardes, como una introducción controlada (monitoreada) al mundo de las redes sociales</li>\n<li>Una sesión de preguntas y respuestas con un orador invitado de una localidad diferente (a distancia)</li>\n<li>Sesiones para ayudar a los estudiantes a prepararse para exámenes, donde el maestro, o los estudiantes, hagan preguntas de ejemplo</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/chat/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(54, '2bd7c404646a11f5dc218999e45ec51b', '<p>El módulo Consulta permite al profesor hacer una pregunta especificando las posibles respuestas posibles.</p>\n\n<p>Los resultados de la elección puede ser publicados después que los estudiantes hayan respondido, después de cierta fecha, o no publicarse. Los resultados pueden ser publicados, con los nombres de los estudiantes o de forma anónima.</p>\n\n<p>Una Consulta puede utilizarse</p>\n\n<ul><li><p>Para realizar una encuesta rápida que estimule a los alunmos a reflexionar sobre un tema</p></li>\n<li><p>Para comprobar rápidamente que los estudiantes han entendido algo concreto</p></li>\n<li><p>Para facilitar la toma de decisiones, por ejemplo permitiendo a los estudiantes votar algún aspecto relacionado con el curso.</p></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/choice/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(55, 'f45850a0d0c57fc04a9b75a1b4ebca96', '<p>La actividad Cuestionario permite al profesor diseñar y plantear cuestionarios con preguntas tipo opción múltiple, verdadero/falso, coincidencia, respuesta corta y respuesta numérica</p>\n\n<p>El profesor puede permitir que el cuestionario se intente resolver varias veces, con las preguntas ordenadas o seleccionadas aleatoriamente del banco de preguntas. Se puede establecer un tiempo límite.</p>\n\n<p>Cada intento se califica automáticamente, con la excepción de las preguntas de tipo "ensayo", y el resultado se guarda en el libro de calificaciones.</p>\n\n<p>El profesor puede determinar si se muestran y cuándo se muestran al usuario los resultados, los comentarios de retroalimentación y las respuestas correctas.</p>\n\n<p>Los cuestionario pueden usarse para hacer</p>\n\n<ul><li>Exámenes del curso</li>\n<li>Mini Test para tareas de lectura o al final de un tema</li>\n<li>Exámenes de práctica con preguntas de exámenes anteriores</li>\n<li>Para ofrecer información inmediata sobre el rendimiento * Para auto-evaluación</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/quiz/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(56, '0f94d27e593b3615ca3223728f1183dc', '<p>El módulo de actividad <b>Encuestas predefinidas</b> proporciona una serie de instrumentos que se han mostrado útiles para evaluar y estimular el aprendizaje en entornos en línea. Un profesor puede usarlos para recopilar información entre sus alumnos que le ayude a conocer mejor su clase así como su propia forma de enseñar.</p>\n\n<p>Tenga en cuenta que estas encuestas tienen ya las preguntas previamente predefinidas. Los profesores que deseen crear sus propias encuestas debe utilizar el módulo de actividad <b>Encuesta</b></p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/survey/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(57, '187e8201759a9de1c3ab4110a6e9e896', '<p>El módulo de actividad foro permite a los participantes tener discusiones asincrónicas, es decir discusiones que tienen lugar durante un período prolongado de tiempo.</p>\n\n<p>Hay varios tipos de foro para elegir, como el foro estándar donde cualquier persona puede iniciar una nueva discusión en cualquier momento, un foro en el que cada alumno puede iniciar una única discusión, o un foro de pregunta y respuesta en el que los estudiantes primero deben participar antes de poder ver los mensajes de otros estudiantes. El profesor puede permitir que se adjunten archivos a las aportaciones al foro. Las imágenes adjuntas se muestran en el mensaje en el foro.</p>\n\n<p>Los participantes pueden suscribirse a un foro para recibir notificaciones cuando hay nuevos mensajes en el foro. El profesor puede establecer el modo de suscripción,  opcional, forzado o auto, o prohibir completamente la suscripción. Si es necesario, los estudiantes pueden ser bloqueados a la hora de publicar más de un número determinado de mensajes en un determinado período de tiempo; esta medida puede evitar que determinadas personas dominen las discusiones.</p>\n\n<p>Los mensajes en el foro puede ser evaluado por profesores o estudiantes (evaluación por pares). Las clasificaciones pueden agregarse a una calificación final que se registra en el libro de calificaciones.</p>\n\n<p>Los foros tiene muchos usos, como por ejemplo</p>\n\n<ul><li>Un espacio social para que los estudiantes se conozcan</li>\n<li>Para los avisos del curso (usando un foro de noticias con suscripción forzada)</li>\n<li>Para discutir el contenido del curso o de materiales de lectura</li>\n<li>Para continuar en línea una cuestión planteada previamente en una sesión presencial</li>\n<li>Para discusiones solo entre profesores del curso (mediante un foro oculto)</li>\n<li>Un centro de ayuda donde los tutores y los estudiantes pueden dar consejos</li>\n<li>Un área de soporte uno-a-uno para comunicaciones entre alumno y profesor (usando un foro con grupos separados y con un estudiante por grupo)</li>\n<li>Para actividades complementarias, como una "lluvia de ideas" donde los estudiantes puedan reflexionar y proponer ideas</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/forum/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(58, 'a6be83b32ec04156f615e4475ec79509', '<p>El módulo de actividad glosario permite a los participantes crear y mantener una lista de definiciones, de forma similar a un diccionario, o para recoger y organizar recursos o información.</p>\n\n<p>El profesor puede permitir que se adjunten archivos a las entradas del glosario. Las imágenes adjuntas se mostrarán en la entrada. Las entradas se pueden buscar y se puede navegar por ellas en orden alfabético o por categoría, fecha o autor. Las entradas pueden aprobarse por defecto o requerir la aprobación de un profesor antes de que sean visibles para los demás alumnos.</p>\n\n<p>Si se ha habilitado el filtro de vinculación automática del glosario, las entradas se enlazan automáticamente cuando las palabras o frases aparecen en el curso.</p>\n\n<p>El profesor puede permitir comentarios en las entradas. Las entradas también se pueden calificar por profesores o por los demás estudiantes (evaluación por pares). Las calificaciones pueden agregarse para formar una calificación final que se registra en el libro de calificaciones.</p>\n\n<p>Los glosarios tienen muchos usos, como</p>\n\n<ul><li>Un registro cooperativo de términos clave</li>\n<li>Un espacio para darse a conocer, donde los estudiantes nuevos añadan su nombre y sus datos personales</li>\n<li>Un recurso con "consejos prácticos" con las mejores prácticas en un tema concreto</li>\n<li>Un área para compartir vídeos, imágenes o archivos de sonido</li>\n<li>Un recurso con "asuntos que recordar"</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/glossary/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(59, '18e9fb6dda8d8030dc0153d119a11a6a', '<p>El módulo de actividad de herramienta externa les permiten a los estudiantes interactuar con recursos educativos y actividades alojadas en otros sitios de internet. Por ejemplo, una herramienta externa podría proporcionar acceso a un nuevo tipo de actividad o de materiales educativos de una editorial.</p>\n\n<p>Para crear una actividad de herramienta externa se requiere un provedor de herramienta que soporte  LTI (Learning Tools Interoperability = Interoperatividad de Herramientas de Aprendizaje). Un maestro puede crear una actividad de herramienta externa o hacer uso de una herramienta configurada por el administrador del sitio.</p>\n\n<p>Las herramientas externas difieren se los recursos URL en varias formas:</p>\n\n<ul><li><p>Las herramientas externas están conscientes del contexto, por ejemplo: tienen acceso a información acerca del usuario que invocó la herramienta, como por ejemplo sa institución, curso y nombre</p></li>\n<li><p>Las herramientas externas soportan leer, actualizar y borrar calificaciones asociadas con la instancia de la actividad</p></li>\n<li><p>Las configuraciones de la herramienta externa crean una relación de confianza entre su sitio Moodle y el provedor de la herramienta, permitiendo la comunicación segura entre ambos</p></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/lti/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(60, '85bf0a41913cfc46b7d21ebda6d71022', '<p>La actividad lección permite a un profesor presentar contenidos y/ o actividades prácticas de forma interesante y flexible. Un profesor puede utilizar la lección para crear un conjunto lineal de páginas de contenido o actividades educativas que ofrezcan al alumno varios itinerarios u opciones. En cualquier caso, los profesores pueden optar por incrementar la participación del alumno y asegurar la comprensión mediante la inclusión de diferentes tipos de pregunta, tales como la elección múltiple, respuesta corta y correspondencia. Dependiendo de la respuesta elegida por el estudiante y de cómo el profesor desarrolla la lección, los estudiantes pueden pasar a la página siguiente, volver a una página anterior o dirigirse a un itinerario totalmente diferente.</p>\n\n<p>Una lección puede ser calificada y la calificación registrada en el libro de calificaciones.</p>\n\n<p>Las lecciones pueden ser utilizados</p>\n\n<ul><li>Para el aprendizaje autodirigido de un nuevo tema</li>\n<li>Para ejercicios basados en escenarios o simulaciones y de  toma de decisiones</li>\n<li>Para realizar ejercicios de repaso diferenciadas, con distintos conjuntos de preguntas de repaso, dependiendo de las respuestas dadas a las preguntas anteriores</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/lesson/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(61, '333aadc2dd77f85d69df3d400120f051', '<p>Un paquete SCORM es un conjunto de archivos que se empaquetan conforme a una norma estándar para los objetos de aprendizaje. El módulo de actividad SCORM permite cargar y añadir a los cursos paquetes SCORM o AICC como archivos zip.</p>\n\n<p>El contenido se muestra normalmente en varias páginas, con navegación entre las páginas. Hay varias opciones para la visualización de los contenidos, con ventanas pop-up, en tablas de contenidos, con botones de navegación, etc Las actividades SCORM generalmente incluyen preguntas calificables, que se registra en el libro de calificaciones.</p>\n\n<p>Las actividades SCORM se puede usar</p>\n\n<ul><li>Para la presentación de contenidos multimedia y animaciones</li>\n<li>Como herramienta de evaluación</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/scorm/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(62, '88393818423577d03649eb5442933a4e', '<p>El módulo de actividad taller permite la recopilación, revisión y evaluación por pares del trabajo de los estudiantes.</p>\n\n<p>Los estudiantes pueden enviar cualquier contenido digital (archivos), tales como documentos de procesador de texto o de hojas de cálculo y también pueden escribir el texto directamente en un campo empleando un editor de texto (dentro de Moodle).</p>\n\n<p>Los envíos son evaluados empleando un formato de evaluación de criterios múltiples definido por el profesor. El proceso de revisión por pares  y el formato para comprender cómo funciona la evaluación se pueden practicar por anticipado con envíos de ejemplo proporcionados por el maestro, junto con una evaluación de referencia. A los estudiantes se les dará la oportunidad de evaluar uno o más de los envíos de sus pares estudiantes. Los que envían y los que evalúan pueden permanecer anónimos si se requiere así.</p>\n\n<p>Los estudiantes tendrán dos calificaciones para la actividad de taller: una calificación por  enviarlo y otra por la evaluación de sus pares. Ambas calificaciones se guardan en el libro de calificaciones.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/workshop/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(63, '3e63b07ad148c2e0931892dd3b40e93b', '<p>El módulo de Tareas permite a un profesor evaluar el aprendizaje de los alumnos mediante la creación de una tarea a realizar que luego revisará, valorará y calificará.</p>\n\n<p>Los alumnos pueden presentar cualquier contenido digital (archivos), como documentos de texto, hojas de cálculo, imágenes, audio y vídeos entre otros.\nAlternativamente, o como complemento, la tarea puede requerir que los estudiantes escriban texto directamente en un campo utilizando el editor de texto. Una tarea también puede ser utilizada para recordar a los estudiantes tareas del "mundo real" que necesitan realizar y que no requieren la entrega de ningún tipo de contenido digital.</p>\n\n<p>Al revisar las tareas, los profesores pueden dejar comentarios de retroalimentación y subir archivos, tales como anotaciones a los envíos de los estudiantes,  documentos con observaciones o comentarios en audio. Las tareas  pueden ser clasificadas según una escala numérica o según una escala personalizada, o bien, mediante un método de calificación avanzada, como una rúbrica. Las calificaciones finales se registran en el libro de calificaciones.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/assignment/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(64, '85f1505cbd4b06257e6dd91ac29ab74a', '<p>El módulo de actividad wiki le permite a los participantes añadir y editar una colección de páginas web. Un wiki puede ser colaborativo, donde todos pueden editarlo, o puede ser individual, donde cada persona tiene su propio wiki que solamente ella podrá editar.</p>\n\n<p>Se conserva un histórico de las versiones previas de cada página del wiki, permitiendo consultar los cambios hechos por cada participante.</p>\n\n<p>Los wikis tienen muchos usos, como por ejemplo:</p>\n\n<ul><li>Para generar unos apuntes de clase colaborativamente entre todos</li>\n<li>Para  los profesores de una escuela que planean una estrategia o reunión de trabajo en equipo</li>\n<li>Para estudiantes que trabajarán en equipo en un libro en línea, creando contenidos de un tema elegido por sus tutores</li>\n<li>Para la narración colaborativa o creación de poesía grupal, donde cada participante escribe una línea o un verso</li>\n<li>Como un diario personal para apuntes para examen o resúmenes (wiki personal)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/wiki/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(65, '8e238f1ae9a17948f34d12c789488072', '<p>El módulo Archivo permite a los profesores proveer un Archivo como un recurso del curso. Cuando sea posible, el archivo se mostrará dentro del interface del curso; si no es el caso, se le preguntará a los estudiantes si quieren descargarlo. El recurso Archivo puede incluir archivos de soporte, por ejemplo, una página HTML puede tener incrustadas imágenes u objetos Flash.</p>\n\n<p>Observe que los estudiantes necesitan tener el software apropiado en sus odenadores personales para poder abrir los archivos.</p>\n\n<p>Un Archivo puede utilizarse para</p>\n\n<ul><li>Compartir presentaciones utilizadas en clase</li>\n<li>Incluire una mini-web como recurso del curso</li>\n<li>Proveer a los estudiantes de borradores de archivos para que los editen y los envíen en sus tareas</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/resource/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(66, '59932e790d9eb58f38ec9416be32d60d', '<p>El recurso Carpeta permite al profesor mostrar un grupo de archivos relacionados dentro de una única carpeta. Se puede subir un archivo comprimido (zip) que se descomprimirá (unzip) posteriormente para mostrar su contenido, o bien, se puede crear una carpeta vacía y subir los archivos dentro de ella.</p>\n\n<p>Una carpeta se puede usar para:</p>\n\n<ul><li>Agrupar una serie de documentos sobre un tema, por ejemplo, un conjunto de exámenes de otros años en formato pdf, o una colección de archivos para crear un proyecto concreto por parte de los estudiantes.</li>\n<li>Crear un espacio de subida de archivos compartido entre los profesores del curso (se debería ocultar la carpeta a los alumnos para que lo vean solo los profesores)</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/folder/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(67, '87d98fe472604455b90abc20755df060', '<p>El módulo etiqueta permite insertar texto y elementos multimedia en las páginas del curso entre los enlaces a otros recursos y actividades. Las etiquetas son muy versátiles y pueden ayudar a mejorar la apariencia de un curso si se usan cuidadosamente.</p>\n\n<p>Las etiquetas pueden ser utilizadas</p>\n\n<ul><li>Para dividir una larga lista de actividades con un subtítulo o una imagen</li>\n<li>Para visualizar un archivo de sonido o vídeo incrustado directamente en la página del curso</li>\n<li>Para añadir una breve descripción de una sección del curso</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/label/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(68, '3aff945a380d5b912cfdb8425881a463', '<p>El módulo libro permite crear material de estudio de múltiples páginas en formato libro, con capítulos y subcapítulos. El libro puede incluir contenido multimedia así como texto y es útil para mostrar grandes volúmenes de información repartido en secciones.</p>\n\n<p>Un libro puede usarse</p>\n\n<ul><li>Para mostrar material de lectura de los módulos individuales de estudio</li>\n<li>Como un manual para el personal del departamento</li>\n<li>Como un portafolio de trabajos de los estudiantes</li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/book/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(69, '61108e4d2ecb80d432eb16641f929466', '<p>El recurso Página permite a los profesores crear una página web mediante el editor de textos. Una Página puede mostrar texto, imágenes, sonido, vídeo, enlaces web y código incrustado (como por ejemplo los mapas de Google) entre otros.</p>\n\n<p>Entre las ventajas de utilizar el recurso Página en lugar del recurso de Archivo está que el recurso es más accesible (por ejemplo, para usuarios de dispositivos móviles) y de más fácil actualización.</p>\n\n<p>Una página puede ser utilizada para</p>\n\n<ul><li>Dar a conocer los términos y condiciones de un curso o el programa de la asignatura\n\n<ul><li>Para incrustar varios vídeos o archivos de sonido, junto con un texto explicativo</li>\n</ul></li>\n</ul><div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/page/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(70, '07063efeb7d3b5a2758f995a9608454c', '<p>Un paquete de contenidos IMS permite mostrar dentro del curso paquetes de contenidos creados conforme a la especificación <b>IMS Content Packaging</b>.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/imscp/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168),
(71, 'bcb1de1552daf83416103c0d31849fbe', '<p>El recurso URL permite que el profesor pueda proporcionar un enlace de Internet como un recurso del curso. Todo aquello que esté disponible en línea, como documentos o imágenes, puede ser vinculado; la URL no tiene por qué ser la página principal de un sitio web. La dirección URL de una página web en particular puede ser copiada y pegada por el profesor, o bien, este puede utilizar el selector de archivo y seleccionar una URL desde un repositorio, como Flickr, YouTube o Wikimedia (dependiendo de qué repositorios están habilitados para el sitio).</p>\n\n<p>Hay una serie de opciones de visualización de la URL, como incrustada o abierta en una nueva ventana, y opciones avanzadas,  como parsear información a la URL, como el nombre de un estudiante.</p>\n\n<p>Tenga en cuenta que las URLs también pueden ser añadidas en otros recursos o actividades a través del editor de texto.</p>\n\n<div class="helpdoclink"><a href="http://docs.moodle.org/25/es_ar/mod/url/view" class="helplinkpopup"><img class="iconhelp icon-pre" alt="Más ayuda" title="Más ayuda" src="http://localhost/moodle/theme/image.php/afterburner/core/1372424014/docs" />Más ayuda</a></div>\n', 1372430168);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `captype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines all capabilities' AUTO_INCREMENT=499 ;

--
-- Volcar la base de datos para la tabla `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(45, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(46, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(47, 'moodle/role:review', 'read', 50, 'moodle', 8),
(48, 'moodle/role:override', 'write', 50, 'moodle', 28),
(49, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(50, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(51, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(52, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(53, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(54, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(56, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(57, 'moodle/course:create', 'write', 40, 'moodle', 4),
(58, 'moodle/course:request', 'write', 10, 'moodle', 0),
(59, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(60, 'moodle/course:update', 'write', 50, 'moodle', 4),
(61, 'moodle/course:view', 'read', 50, 'moodle', 0),
(62, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(63, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(64, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(65, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(66, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(67, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(68, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(69, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(70, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(71, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(73, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(74, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(78, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(79, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(80, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(81, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(82, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(83, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(84, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(85, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(86, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(87, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(88, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(89, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(90, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(91, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(92, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(93, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(94, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(95, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(96, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(97, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(98, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(99, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(100, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(101, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(102, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(103, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(104, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(105, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(106, 'moodle/question:add', 'write', 50, 'moodle', 20),
(107, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(108, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(109, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(110, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(111, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(112, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(113, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(114, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(115, 'moodle/question:config', 'write', 10, 'moodle', 2),
(116, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(117, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(118, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(119, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(120, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(121, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(122, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(123, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(124, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(125, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(126, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(127, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(128, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(129, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(130, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(131, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(132, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(133, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(134, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(135, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(136, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(137, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(138, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(139, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(140, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(141, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(142, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(143, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(144, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(145, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(146, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(147, 'moodle/block:view', 'read', 80, 'moodle', 0),
(148, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(149, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(150, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(151, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(152, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(153, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(154, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(155, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(156, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(157, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(158, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(159, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(160, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(161, 'moodle/community:add', 'write', 10, 'moodle', 0),
(162, 'moodle/community:download', 'write', 10, 'moodle', 0),
(163, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(164, 'moodle/badges:viewbadges', 'read', 10, 'moodle', 0),
(165, 'moodle/badges:manageownbadges', 'write', 10, 'moodle', 0),
(166, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(167, 'moodle/badges:earnbadge', 'write', 10, 'moodle', 0),
(168, 'moodle/badges:createbadge', 'write', 10, 'moodle', 18),
(169, 'moodle/badges:deletebadge', 'write', 10, 'moodle', 34),
(170, 'moodle/badges:configuredetails', 'write', 10, 'moodle', 2),
(171, 'moodle/badges:configurecriteria', 'write', 10, 'moodle', 2),
(172, 'moodle/badges:configuremessages', 'write', 10, 'moodle', 2),
(173, 'moodle/badges:awardbadge', 'write', 10, 'moodle', 16),
(174, 'moodle/badges:viewawarded', 'read', 10, 'moodle', 8),
(175, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(176, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(177, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(178, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(179, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(180, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(181, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(182, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(183, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(184, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(185, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(186, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(187, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(188, 'mod/book:read', 'read', 70, 'mod_book', 0),
(189, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(190, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(191, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(192, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(193, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(194, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(195, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(196, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(197, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(198, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(199, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(200, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(201, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(202, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(203, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(204, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(205, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(206, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(207, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(208, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(209, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(210, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(211, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(212, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(213, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(214, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(215, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(216, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(217, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(218, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(219, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(220, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(221, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(222, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(223, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(224, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(225, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(226, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(227, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(228, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(229, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(230, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(231, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(232, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(233, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(234, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(235, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(236, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(237, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(238, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(239, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(240, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(241, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(242, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(243, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(244, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(245, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(246, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(247, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(248, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(249, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(250, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(251, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(252, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(253, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(254, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(255, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(256, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(257, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(258, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(259, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(260, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(261, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(262, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(263, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(264, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(265, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(266, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(267, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(268, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(269, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(270, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(271, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(272, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(273, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(274, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(275, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(276, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(277, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(278, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(279, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(280, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(281, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(282, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(283, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(284, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(285, 'mod/lti:grade', 'write', 70, 'mod_lti', 4),
(286, 'mod/lti:manage', 'write', 70, 'mod_lti', 4),
(287, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(288, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(289, 'mod/page:view', 'read', 70, 'mod_page', 0),
(290, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(291, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(292, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(293, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(294, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(295, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(296, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(297, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(298, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(299, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(300, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(301, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(302, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(303, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(304, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(305, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(306, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(307, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(308, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(309, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(310, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(311, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(312, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(313, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(314, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(315, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(316, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(317, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(318, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(319, 'mod/url:view', 'read', 70, 'mod_url', 0),
(320, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(321, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(322, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(323, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(324, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(325, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(326, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(327, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(328, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(329, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(330, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(331, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(332, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(333, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(334, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(335, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(336, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(337, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(338, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(339, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(340, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(341, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(342, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(343, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(344, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(345, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(346, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(347, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(348, 'enrol/authorize:config', 'write', 50, 'enrol_authorize', 0),
(349, 'enrol/authorize:manage', 'write', 50, 'enrol_authorize', 0),
(350, 'enrol/authorize:unenrol', 'write', 50, 'enrol_authorize', 0),
(351, 'enrol/authorize:unenrolself', 'write', 50, 'enrol_authorize', 0),
(352, 'enrol/authorize:managepayments', 'write', 10, 'enrol_authorize', 8),
(353, 'enrol/authorize:uploadcsv', 'write', 10, 'enrol_authorize', 4),
(354, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(355, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(356, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(357, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(358, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(359, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(360, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(361, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(362, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(363, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(364, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(365, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(366, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(367, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(368, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(369, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(370, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(371, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(372, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(373, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(374, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(375, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(376, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(377, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(378, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(379, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(380, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(381, 'block/badges:addinstance', 'read', 10, 'block_badges', 8),
(382, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(383, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(384, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(385, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(386, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(387, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(388, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(389, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(390, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(391, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(392, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(393, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(394, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(395, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(396, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(397, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(398, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(399, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(400, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(401, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(402, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(403, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(404, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(405, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(406, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(407, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(408, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(409, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(410, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(411, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(412, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(413, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(414, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(415, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(416, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(417, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(418, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(419, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(420, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(421, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(422, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(423, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(424, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(425, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(426, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(427, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(428, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(429, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(430, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(431, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(432, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(433, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(434, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(435, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(436, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(437, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(438, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(439, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(440, 'report/completion:view', 'read', 50, 'report_completion', 8),
(441, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(442, 'report/log:view', 'read', 50, 'report_log', 8),
(443, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(444, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(445, 'report/outline:view', 'read', 50, 'report_outline', 8),
(446, 'report/participation:view', 'read', 50, 'report_participation', 8),
(447, 'report/performance:view', 'read', 10, 'report_performance', 2),
(448, 'report/progress:view', 'read', 50, 'report_progress', 8),
(449, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(450, 'report/security:view', 'read', 10, 'report_security', 2),
(451, 'report/stats:view', 'read', 50, 'report_stats', 8),
(452, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(453, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(454, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(455, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(456, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(457, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(458, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(459, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(460, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(461, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(462, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(463, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(464, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(465, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(466, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(467, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(468, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(469, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(470, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(471, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(472, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(473, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(474, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(475, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(476, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(477, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(478, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(479, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(480, 'repository/local:view', 'read', 70, 'repository_local', 0),
(481, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(482, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(483, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(484, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(485, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(486, 'repository/url:view', 'read', 70, 'repository_url', 0),
(487, 'repository/user:view', 'read', 70, 'repository_user', 0),
(488, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(489, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(490, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(491, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(492, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(493, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(494, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(495, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(496, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(497, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(498, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_chat`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_chat_messages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores current session' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_chat_messages_current`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_chat_users`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_choice`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_choice_answers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext COLLATE utf8_unicode_ci,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='available options to choice' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_choice_options`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_cohort`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_cohort_members`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_comments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle configuration variables' AUTO_INCREMENT=424 ;

--
-- Volcar la base de datos para la tabla `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'email'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'afterburner'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'AtHGfxI5W8KxEncqD5YIDU4AL4tauqr8localhost'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1372424014'),
(21, 'jsrev', '1372258717'),
(22, 'gdversion', '2'),
(23, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(24, 'version', '2013051400'),
(25, 'enableoutcomes', '0'),
(26, 'usecomments', '1'),
(27, 'usetags', '1'),
(28, 'enablenotes', '1'),
(29, 'enableportfolios', '0'),
(30, 'enablewebservices', '0'),
(31, 'messaging', '1'),
(32, 'messaginghidereadnotifications', '0'),
(33, 'messagingdeletereadnotificationsdelay', '604800'),
(34, 'messagingallowemailoverride', '0'),
(35, 'enablestats', '0'),
(36, 'enablerssfeeds', '0'),
(37, 'enableblogs', '1'),
(38, 'enablecompletion', '0'),
(39, 'enableavailability', '0'),
(40, 'enableplagiarism', '0'),
(41, 'enablebadges', '1'),
(42, 'autologinguests', '0'),
(43, 'hiddenuserfields', ''),
(44, 'showuseridentity', 'email'),
(45, 'maxusersperpage', '100'),
(46, 'enablegravatar', '0'),
(47, 'gravatardefaulturl', 'mm'),
(48, 'enablecourserequests', '0'),
(49, 'defaultrequestcategory', '1'),
(50, 'requestcategoryselection', '0'),
(51, 'courserequestnotify', ''),
(52, 'grade_profilereport', 'user'),
(53, 'grade_aggregationposition', '1'),
(54, 'grade_includescalesinaggregation', '1'),
(55, 'grade_hiddenasdate', '0'),
(56, 'gradepublishing', '0'),
(57, 'grade_export_displaytype', '1'),
(58, 'grade_export_decimalpoints', '2'),
(59, 'grade_navmethod', '0'),
(60, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(61, 'grade_export_customprofilefields', ''),
(62, 'recovergradesdefault', '0'),
(63, 'gradeexport', ''),
(64, 'unlimitedgrades', '0'),
(65, 'grade_hideforcedsettings', '1'),
(66, 'grade_aggregation', '11'),
(67, 'grade_aggregation_flag', '0'),
(68, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(69, 'grade_aggregateonlygraded', '1'),
(70, 'grade_aggregateonlygraded_flag', '2'),
(71, 'grade_aggregateoutcomes', '0'),
(72, 'grade_aggregateoutcomes_flag', '2'),
(73, 'grade_aggregatesubcats', '0'),
(74, 'grade_aggregatesubcats_flag', '2'),
(75, 'grade_keephigh', '0'),
(76, 'grade_keephigh_flag', '3'),
(77, 'grade_droplow', '0'),
(78, 'grade_droplow_flag', '2'),
(79, 'grade_displaytype', '1'),
(80, 'grade_decimalpoints', '2'),
(81, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(82, 'grade_report_studentsperpage', '100'),
(83, 'grade_report_showonlyactiveenrol', '1'),
(84, 'grade_report_quickgrading', '1'),
(85, 'grade_report_showquickfeedback', '0'),
(86, 'grade_report_fixedstudents', '0'),
(87, 'grade_report_meanselection', '1'),
(88, 'grade_report_enableajax', '0'),
(89, 'grade_report_showcalculations', '0'),
(90, 'grade_report_showeyecons', '0'),
(91, 'grade_report_showaverages', '1'),
(92, 'grade_report_showlocks', '0'),
(93, 'grade_report_showranges', '0'),
(94, 'grade_report_showanalysisicon', '1'),
(95, 'grade_report_showuserimage', '1'),
(96, 'grade_report_showactivityicons', '1'),
(97, 'grade_report_shownumberofgrades', '0'),
(98, 'grade_report_averagesdisplaytype', 'inherit'),
(99, 'grade_report_rangesdisplaytype', 'inherit'),
(100, 'grade_report_averagesdecimalpoints', 'inherit'),
(101, 'grade_report_rangesdecimalpoints', 'inherit'),
(102, 'grade_report_overview_showrank', '0'),
(103, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(104, 'grade_report_user_showrank', '0'),
(105, 'grade_report_user_showpercentage', '1'),
(106, 'grade_report_user_showgrade', '1'),
(107, 'grade_report_user_showfeedback', '1'),
(108, 'grade_report_user_showrange', '1'),
(109, 'grade_report_user_showweight', '0'),
(110, 'grade_report_user_showaverage', '0'),
(111, 'grade_report_user_showlettergrade', '0'),
(112, 'grade_report_user_rangedecimals', '0'),
(113, 'grade_report_user_showhiddenitems', '1'),
(114, 'grade_report_user_showtotalsifcontainhidden', '0'),
(115, 'badges_defaultissuername', ''),
(116, 'badges_defaultissuercontact', ''),
(117, 'badges_badgesalt', 'badges1372258355'),
(118, 'badges_allowexternalbackpack', '1'),
(119, 'badges_allowcoursebadges', '1'),
(120, 'timezone', '99'),
(121, 'forcetimezone', '99'),
(122, 'country', '0'),
(123, 'defaultcity', ''),
(124, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat'),
(125, 'googlemapkey3', ''),
(126, 'allcountrycodes', ''),
(127, 'autolang', '0'),
(128, 'lang', 'es_ar'),
(129, 'langmenu', '1'),
(130, 'langlist', ''),
(131, 'langrev', '1372342282'),
(132, 'langcache', '1'),
(133, 'langstringcache', '1'),
(134, 'locale', ''),
(135, 'latinexcelexport', '0'),
(136, 'block_course_list_adminview', 'all'),
(137, 'block_course_list_hideallcourseslink', '0'),
(138, 'block_html_allowcssclasses', '0'),
(139, 'block_online_users_timetosee', '5'),
(140, 'block_rss_client_num_entries', '5'),
(141, 'block_rss_client_timeout', '30'),
(142, 'block_tags_showcoursetags', '0'),
(144, 'authpreventaccountcreation', '0'),
(145, 'loginpageautofocus', '0'),
(146, 'guestloginbutton', '1'),
(147, 'alternateloginurl', ''),
(148, 'forgottenpasswordurl', ''),
(149, 'auth_instructions', ''),
(150, 'allowemailaddresses', ''),
(151, 'denyemailaddresses', ''),
(152, 'verifychangedemail', '1'),
(153, 'recaptchapublickey', ''),
(154, 'recaptchaprivatekey', ''),
(155, 'sitedefaultlicense', 'allrightsreserved'),
(156, 'cachetext', '60'),
(157, 'filteruploadedfiles', '0'),
(158, 'filtermatchoneperpage', '0'),
(159, 'filtermatchonepertext', '0'),
(160, 'filter_censor_badwords', ''),
(161, 'filter_multilang_force_old', '0'),
(162, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(163, 'filter_tex_latexbackground', '#FFFFFF'),
(164, 'filter_tex_density', '120'),
(165, 'filter_tex_pathlatex', '/usr/bin/latex'),
(166, 'filter_tex_pathdvips', '/usr/bin/dvips'),
(167, 'filter_tex_pathconvert', '/usr/bin/convert'),
(168, 'filter_tex_convertformat', 'gif'),
(169, 'portfolio_moderate_filesize_threshold', '1048576'),
(170, 'portfolio_high_filesize_threshold', '5242880'),
(171, 'portfolio_moderate_db_threshold', '20'),
(172, 'portfolio_high_db_threshold', '50'),
(173, 'repositorycacheexpire', '120'),
(174, 'repositoryallowexternallinks', '1'),
(175, 'legacyfilesinnewcourses', '0'),
(176, 'mobilecssurl', ''),
(177, 'enablewsdocumentation', '0'),
(178, 'allowbeforeblock', '0'),
(179, 'allowedip', ''),
(180, 'blockedip', ''),
(181, 'protectusernames', '1'),
(182, 'forcelogin', '0'),
(183, 'forceloginforprofiles', '1'),
(184, 'forceloginforprofileimage', '0'),
(185, 'opentogoogle', '0'),
(186, 'maxbytes', '0'),
(187, 'userquota', '104857600'),
(188, 'allowobjectembed', '0'),
(189, 'enabletrusttext', '0'),
(190, 'maxeditingtime', '1800'),
(191, 'fullnamedisplay', 'language'),
(192, 'extendedusernamechars', '0'),
(193, 'sitepolicy', ''),
(194, 'sitepolicyguest', ''),
(195, 'keeptagnamecase', '1'),
(196, 'profilesforenrolledusersonly', '1'),
(197, 'cronclionly', '0'),
(198, 'cronremotepassword', ''),
(199, 'lockoutthreshold', '0'),
(200, 'lockoutwindow', '1800'),
(201, 'lockoutduration', '1800'),
(202, 'passwordpolicy', '1'),
(203, 'minpasswordlength', '8'),
(204, 'minpassworddigits', '1'),
(205, 'minpasswordlower', '1'),
(206, 'minpasswordupper', '1'),
(207, 'minpasswordnonalphanum', '1'),
(208, 'maxconsecutiveidentchars', '0'),
(209, 'groupenrolmentkeypolicy', '1'),
(210, 'disableuserimages', '0'),
(211, 'emailchangeconfirmation', '1'),
(212, 'rememberusername', '2'),
(213, 'strictformsrequired', '0'),
(214, 'loginhttps', '0'),
(215, 'cookiesecure', '0'),
(216, 'cookiehttponly', '0'),
(217, 'allowframembedding', '0'),
(218, 'loginpasswordautocomplete', '0'),
(219, 'displayloginfailures', ''),
(220, 'notifyloginfailures', ''),
(221, 'notifyloginthreshold', '10'),
(222, 'runclamonupload', '0'),
(223, 'pathtoclam', ''),
(224, 'quarantinedir', ''),
(225, 'clamfailureonupload', 'donothing'),
(226, 'themelist', ''),
(227, 'themedesignermode', '0'),
(228, 'allowuserthemes', '0'),
(229, 'allowcoursethemes', '0'),
(230, 'allowcategorythemes', '0'),
(231, 'allowthemechangeonurl', '0'),
(232, 'allowuserblockhiding', '1'),
(233, 'allowblockstodock', '1'),
(234, 'custommenuitems', ''),
(235, 'enabledevicedetection', '1'),
(236, 'devicedetectregex', '[]'),
(237, 'calendar_adminseesall', '0'),
(238, 'calendar_site_timeformat', '0'),
(239, 'calendar_startwday', '0'),
(240, 'calendar_weekend', '65'),
(241, 'calendar_lookahead', '21'),
(242, 'calendar_maxevents', '10'),
(243, 'enablecalendarexport', '1'),
(244, 'calendar_customexport', '1'),
(245, 'calendar_exportlookahead', '365'),
(246, 'calendar_exportlookback', '5'),
(247, 'calendar_exportsalt', 'tal5BUCxiN1894TPwVIFBXETe0emgFeWNqfxdDezPSEVtBgM7lAZlps5loc1'),
(248, 'calendar_showicalsource', '1'),
(249, 'useblogassociations', '1'),
(250, 'bloglevel', '4'),
(251, 'useexternalblogs', '1'),
(252, 'externalblogcrontime', '86400'),
(253, 'maxexternalblogsperuser', '1'),
(254, 'blogusecomments', '1'),
(255, 'blogshowcommentscount', '1'),
(256, 'defaulthomepage', '0'),
(257, 'allowguestmymoodle', '1'),
(258, 'navshowfullcoursenames', '0'),
(259, 'navshowcategories', '1'),
(260, 'navshowmycoursecategories', '0'),
(261, 'navshowallcourses', '0'),
(262, 'navsortmycoursessort', 'sortorder'),
(263, 'navcourselimit', '20'),
(264, 'usesitenameforsitepages', '0'),
(265, 'linkadmincategories', '0'),
(266, 'navshowfrontpagemods', '1'),
(267, 'navadduserpostslinks', '1'),
(268, 'formatstringstriptags', '1'),
(269, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(270, 'core_media_enable_youtube', '1'),
(271, 'core_media_enable_vimeo', '0'),
(272, 'core_media_enable_mp3', '1'),
(273, 'core_media_enable_flv', '1'),
(274, 'core_media_enable_swf', '1'),
(275, 'core_media_enable_html5audio', '1'),
(276, 'core_media_enable_html5video', '1'),
(277, 'core_media_enable_qt', '1'),
(278, 'core_media_enable_wmp', '1'),
(279, 'core_media_enable_rm', '1'),
(280, 'docroot', 'http://docs.moodle.org'),
(281, 'doctonewwindow', '0'),
(282, 'courselistshortnames', '0'),
(283, 'coursesperpage', '20'),
(284, 'courseswithsummarieslimit', '10'),
(285, 'courseoverviewfileslimit', '1'),
(286, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(287, 'enableajax', '1'),
(288, 'useexternalyui', '0'),
(289, 'yuicomboloading', '1'),
(290, 'cachejs', '1'),
(291, 'modchooserdefault', '1'),
(292, 'additionalhtmlhead', ''),
(293, 'additionalhtmltopofbody', ''),
(294, 'additionalhtmlfooter', ''),
(295, 'pathtodu', ''),
(296, 'aspellpath', ''),
(297, 'pathtodot', ''),
(298, 'supportpage', ''),
(299, 'dbsessions', '1'),
(300, 'sessioncookie', ''),
(301, 'sessioncookiepath', ''),
(302, 'sessioncookiedomain', ''),
(303, 'statsfirstrun', 'none'),
(304, 'statsmaxruntime', '0'),
(305, 'statsruntimedays', '31'),
(306, 'statsruntimestarthour', '0'),
(307, 'statsruntimestartminute', '0'),
(308, 'statsuserthreshold', '0'),
(309, 'slasharguments', '1'),
(310, 'getremoteaddrconf', '0'),
(311, 'proxyhost', ''),
(312, 'proxyport', '0'),
(313, 'proxytype', 'HTTP'),
(314, 'proxyuser', ''),
(315, 'proxypassword', ''),
(316, 'proxybypass', 'localhost, 127.0.0.1'),
(317, 'maintenance_enabled', '0'),
(318, 'maintenance_message', ''),
(319, 'deleteunconfirmed', '168'),
(320, 'deleteincompleteusers', '0'),
(321, 'logguests', '1'),
(322, 'loglifetime', '0'),
(323, 'disablegradehistory', '0'),
(324, 'gradehistorylifetime', '0'),
(325, 'extramemorylimit', '512M'),
(326, 'curlcache', '120'),
(327, 'curltimeoutkbitrate', '56'),
(328, 'updateautocheck', '1'),
(329, 'updateautodeploy', '0'),
(330, 'updateminmaturity', '200'),
(331, 'updatenotifybuilds', '0'),
(332, 'enablesafebrowserintegration', '0'),
(333, 'enablegroupmembersonly', '0'),
(334, 'dndallowtextandlinks', '0'),
(335, 'enablecssoptimiser', '0'),
(336, 'debug', '0'),
(337, 'debugdisplay', '0'),
(338, 'debugsmtp', '0'),
(339, 'perfdebug', '7'),
(340, 'debugstringids', '0'),
(341, 'debugvalidators', '0'),
(342, 'debugpageinfo', '0'),
(343, 'release', '2.5 (Build: 20130514)'),
(344, 'branch', '25'),
(346, 'notloggedinroleid', '6'),
(347, 'guestroleid', '6'),
(348, 'defaultuserroleid', '7'),
(349, 'creatornewroleid', '3'),
(350, 'restorernewroleid', '3'),
(351, 'gradebookroles', '5'),
(352, 'assignment_maxbytes', '1048576'),
(353, 'assignment_itemstocount', '1'),
(354, 'assignment_showrecentsubmissions', '1'),
(355, 'chat_method', 'ajax'),
(356, 'chat_refresh_userlist', '10'),
(357, 'chat_old_ping', '35'),
(358, 'chat_refresh_room', '5'),
(359, 'chat_normal_updatemode', 'jsupdate'),
(360, 'chat_serverhost', 'localhost'),
(361, 'chat_serverip', '127.0.0.1'),
(362, 'chat_serverport', '9111'),
(363, 'chat_servermax', '100'),
(364, 'data_enablerssfeeds', '0'),
(365, 'feedback_allowfullanonymous', '0'),
(366, 'forum_displaymode', '3'),
(367, 'forum_replytouser', '1'),
(368, 'forum_shortpost', '300'),
(369, 'forum_longpost', '600'),
(370, 'forum_manydiscussions', '100'),
(371, 'forum_maxbytes', '512000'),
(372, 'forum_maxattachments', '9'),
(373, 'forum_trackreadposts', '1'),
(374, 'forum_oldpostdays', '14'),
(375, 'forum_usermarksread', '0'),
(376, 'forum_cleanreadtime', '2'),
(377, 'digestmailtime', '17'),
(378, 'forum_enablerssfeeds', '0'),
(379, 'forum_enabletimedposts', '0'),
(380, 'glossary_entbypage', '10'),
(381, 'glossary_dupentries', '0'),
(382, 'glossary_allowcomments', '0'),
(383, 'glossary_linkbydefault', '1'),
(384, 'glossary_defaultapproval', '1'),
(385, 'glossary_enablerssfeeds', '0'),
(386, 'glossary_linkentries', '0'),
(387, 'glossary_casesensitive', '0'),
(388, 'glossary_fullmatch', '0'),
(389, 'lesson_slideshowwidth', '640'),
(390, 'lesson_slideshowheight', '480'),
(391, 'lesson_slideshowbgcolor', '#FFFFFF'),
(392, 'lesson_mediawidth', '640'),
(393, 'lesson_mediaheight', '480'),
(394, 'lesson_mediaclose', '0'),
(395, 'lesson_maxhighscores', '10'),
(396, 'lesson_maxanswers', '4'),
(397, 'lesson_defaultnextpage', '0'),
(398, 'smtphosts', ''),
(399, 'smtpsecure', ''),
(400, 'smtpuser', ''),
(401, 'smtppass', ''),
(402, 'smtpmaxbulk', '1'),
(403, 'noreplyaddress', 'noreply@localhost'),
(404, 'sitemailcharset', '0'),
(405, 'allowusermailcharset', '0'),
(406, 'mailnewline', 'LF'),
(407, 'jabberhost', ''),
(408, 'jabberserver', ''),
(409, 'jabberusername', ''),
(410, 'jabberpassword', ''),
(411, 'jabberport', '5222'),
(412, 'profileroles', '5,4,3'),
(413, 'coursecontact', '3'),
(414, 'frontpage', '6'),
(415, 'frontpageloggedin', '6'),
(416, 'maxcategorydepth', '2'),
(417, 'frontpagecourselimit', '200'),
(418, 'commentsperpage', '15'),
(419, 'defaultfrontpageroleid', '8'),
(420, 'supportname', 'Administrador Principal'),
(421, 'supportemail', 'lau.ibarra@gmail.com'),
(422, 'registerauth', ''),
(423, 'thememobile', 'mymobile');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  `oldvalue` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=845 ;

--
-- Volcar la base de datos para la tabla `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1372258389, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1372258389, NULL, 'usecomments', '1', NULL),
(3, 0, 1372258389, NULL, 'usetags', '1', NULL),
(4, 0, 1372258389, NULL, 'enablenotes', '1', NULL),
(5, 0, 1372258389, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1372258389, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1372258389, NULL, 'messaging', '1', NULL),
(8, 0, 1372258389, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1372258389, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1372258389, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1372258389, NULL, 'enablestats', '0', NULL),
(12, 0, 1372258389, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1372258389, NULL, 'enableblogs', '1', NULL),
(14, 0, 1372258389, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1372258389, NULL, 'enableavailability', '0', NULL),
(16, 0, 1372258389, NULL, 'enableplagiarism', '0', NULL),
(17, 0, 1372258389, NULL, 'enablebadges', '1', NULL),
(18, 0, 1372258389, NULL, 'autologinguests', '0', NULL),
(19, 0, 1372258389, NULL, 'hiddenuserfields', '', NULL),
(20, 0, 1372258389, NULL, 'showuseridentity', 'email', NULL),
(21, 0, 1372258389, NULL, 'maxusersperpage', '100', NULL),
(22, 0, 1372258389, NULL, 'enablegravatar', '0', NULL),
(23, 0, 1372258389, NULL, 'gravatardefaulturl', 'mm', NULL),
(24, 0, 1372258389, 'moodlecourse', 'visible', '1', NULL),
(25, 0, 1372258390, 'moodlecourse', 'format', 'weeks', NULL),
(26, 0, 1372258390, 'moodlecourse', 'maxsections', '52', NULL),
(27, 0, 1372258390, 'moodlecourse', 'numsections', '10', NULL),
(28, 0, 1372258390, 'moodlecourse', 'hiddensections', '0', NULL),
(29, 0, 1372258390, 'moodlecourse', 'coursedisplay', '0', NULL),
(30, 0, 1372258390, 'moodlecourse', 'lang', '', NULL),
(31, 0, 1372258390, 'moodlecourse', 'newsitems', '5', NULL),
(32, 0, 1372258390, 'moodlecourse', 'showgrades', '1', NULL),
(33, 0, 1372258390, 'moodlecourse', 'showreports', '0', NULL),
(34, 0, 1372258390, 'moodlecourse', 'maxbytes', '0', NULL),
(35, 0, 1372258390, 'moodlecourse', 'enablecompletion', '0', NULL),
(36, 0, 1372258390, 'moodlecourse', 'groupmode', '0', NULL),
(37, 0, 1372258390, 'moodlecourse', 'groupmodeforce', '0', NULL),
(38, 0, 1372258390, NULL, 'enablecourserequests', '0', NULL),
(39, 0, 1372258390, NULL, 'defaultrequestcategory', '1', NULL),
(40, 0, 1372258390, NULL, 'requestcategoryselection', '0', NULL),
(41, 0, 1372258390, NULL, 'courserequestnotify', '', NULL),
(42, 0, 1372258390, 'backup', 'loglifetime', '30', NULL),
(43, 0, 1372258390, 'backup', 'backup_general_users', '1', NULL),
(44, 0, 1372258390, 'backup', 'backup_general_users_locked', '0', NULL),
(45, 0, 1372258390, 'backup', 'backup_general_anonymize', '0', NULL),
(46, 0, 1372258390, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(47, 0, 1372258390, 'backup', 'backup_general_role_assignments', '1', NULL),
(48, 0, 1372258390, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(49, 0, 1372258390, 'backup', 'backup_general_activities', '1', NULL),
(50, 0, 1372258390, 'backup', 'backup_general_activities_locked', '0', NULL),
(51, 0, 1372258390, 'backup', 'backup_general_blocks', '1', NULL),
(52, 0, 1372258390, 'backup', 'backup_general_blocks_locked', '0', NULL),
(53, 0, 1372258390, 'backup', 'backup_general_filters', '1', NULL),
(54, 0, 1372258390, 'backup', 'backup_general_filters_locked', '0', NULL),
(55, 0, 1372258390, 'backup', 'backup_general_comments', '1', NULL),
(56, 0, 1372258390, 'backup', 'backup_general_comments_locked', '0', NULL),
(57, 0, 1372258390, 'backup', 'backup_general_userscompletion', '1', NULL),
(58, 0, 1372258390, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(59, 0, 1372258390, 'backup', 'backup_general_logs', '0', NULL),
(60, 0, 1372258390, 'backup', 'backup_general_logs_locked', '0', NULL),
(61, 0, 1372258390, 'backup', 'backup_general_histories', '0', NULL),
(62, 0, 1372258390, 'backup', 'backup_general_histories_locked', '0', NULL),
(63, 0, 1372258390, 'backup', 'import_general_maxresults', '10', NULL),
(64, 0, 1372258390, 'backup', 'backup_auto_active', '0', NULL),
(65, 0, 1372258391, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(66, 0, 1372258391, 'backup', 'backup_auto_hour', '0', NULL),
(67, 0, 1372258391, 'backup', 'backup_auto_minute', '0', NULL),
(68, 0, 1372258391, 'backup', 'backup_auto_storage', '0', NULL),
(69, 0, 1372258391, 'backup', 'backup_auto_destination', '', NULL),
(70, 0, 1372258391, 'backup', 'backup_auto_keep', '1', NULL),
(71, 0, 1372258391, 'backup', 'backup_shortname', '0', NULL),
(72, 0, 1372258391, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(73, 0, 1372258391, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(74, 0, 1372258391, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(75, 0, 1372258391, 'backup', 'backup_auto_users', '1', NULL),
(76, 0, 1372258391, 'backup', 'backup_auto_role_assignments', '1', NULL),
(77, 0, 1372258391, 'backup', 'backup_auto_activities', '1', NULL),
(78, 0, 1372258391, 'backup', 'backup_auto_blocks', '1', NULL),
(79, 0, 1372258391, 'backup', 'backup_auto_filters', '1', NULL),
(80, 0, 1372258391, 'backup', 'backup_auto_comments', '1', NULL),
(81, 0, 1372258391, 'backup', 'backup_auto_userscompletion', '1', NULL),
(82, 0, 1372258391, 'backup', 'backup_auto_logs', '0', NULL),
(83, 0, 1372258391, 'backup', 'backup_auto_histories', '0', NULL),
(84, 0, 1372258391, NULL, 'grade_profilereport', 'user', NULL),
(85, 0, 1372258391, NULL, 'grade_aggregationposition', '1', NULL),
(86, 0, 1372258391, NULL, 'grade_includescalesinaggregation', '1', NULL),
(87, 0, 1372258391, NULL, 'grade_hiddenasdate', '0', NULL),
(88, 0, 1372258391, NULL, 'gradepublishing', '0', NULL),
(89, 0, 1372258391, NULL, 'grade_export_displaytype', '1', NULL),
(90, 0, 1372258391, NULL, 'grade_export_decimalpoints', '2', NULL),
(91, 0, 1372258391, NULL, 'grade_navmethod', '0', NULL),
(92, 0, 1372258391, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(93, 0, 1372258392, NULL, 'grade_export_customprofilefields', '', NULL),
(94, 0, 1372258392, NULL, 'recovergradesdefault', '0', NULL),
(95, 0, 1372258392, NULL, 'gradeexport', '', NULL),
(96, 0, 1372258392, NULL, 'unlimitedgrades', '0', NULL),
(97, 0, 1372258392, NULL, 'grade_hideforcedsettings', '1', NULL),
(98, 0, 1372258392, NULL, 'grade_aggregation', '11', NULL),
(99, 0, 1372258392, NULL, 'grade_aggregation_flag', '0', NULL),
(100, 0, 1372258392, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(101, 0, 1372258392, NULL, 'grade_aggregateonlygraded', '1', NULL),
(102, 0, 1372258392, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(103, 0, 1372258392, NULL, 'grade_aggregateoutcomes', '0', NULL),
(104, 0, 1372258392, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(105, 0, 1372258392, NULL, 'grade_aggregatesubcats', '0', NULL),
(106, 0, 1372258392, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(107, 0, 1372258392, NULL, 'grade_keephigh', '0', NULL),
(108, 0, 1372258392, NULL, 'grade_keephigh_flag', '3', NULL),
(109, 0, 1372258392, NULL, 'grade_droplow', '0', NULL),
(110, 0, 1372258392, NULL, 'grade_droplow_flag', '2', NULL),
(111, 0, 1372258392, NULL, 'grade_displaytype', '1', NULL),
(112, 0, 1372258392, NULL, 'grade_decimalpoints', '2', NULL),
(113, 0, 1372258392, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(114, 0, 1372258392, NULL, 'grade_report_studentsperpage', '100', NULL),
(115, 0, 1372258392, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(116, 0, 1372258392, NULL, 'grade_report_quickgrading', '1', NULL),
(117, 0, 1372258392, NULL, 'grade_report_showquickfeedback', '0', NULL),
(118, 0, 1372258392, NULL, 'grade_report_fixedstudents', '0', NULL),
(119, 0, 1372258392, NULL, 'grade_report_meanselection', '1', NULL),
(120, 0, 1372258392, NULL, 'grade_report_enableajax', '0', NULL),
(121, 0, 1372258392, NULL, 'grade_report_showcalculations', '0', NULL),
(122, 0, 1372258392, NULL, 'grade_report_showeyecons', '0', NULL),
(123, 0, 1372258392, NULL, 'grade_report_showaverages', '1', NULL),
(124, 0, 1372258392, NULL, 'grade_report_showlocks', '0', NULL),
(125, 0, 1372258392, NULL, 'grade_report_showranges', '0', NULL),
(126, 0, 1372258392, NULL, 'grade_report_showanalysisicon', '1', NULL),
(127, 0, 1372258392, NULL, 'grade_report_showuserimage', '1', NULL),
(128, 0, 1372258392, NULL, 'grade_report_showactivityicons', '1', NULL),
(129, 0, 1372258392, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(130, 0, 1372258392, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(131, 0, 1372258392, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(132, 0, 1372258392, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(133, 0, 1372258392, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(134, 0, 1372258392, NULL, 'grade_report_overview_showrank', '0', NULL),
(135, 0, 1372258392, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(136, 0, 1372258392, NULL, 'grade_report_user_showrank', '0', NULL),
(137, 0, 1372258392, NULL, 'grade_report_user_showpercentage', '1', NULL),
(138, 0, 1372258392, NULL, 'grade_report_user_showgrade', '1', NULL),
(139, 0, 1372258392, NULL, 'grade_report_user_showfeedback', '1', NULL),
(140, 0, 1372258393, NULL, 'grade_report_user_showrange', '1', NULL),
(141, 0, 1372258393, NULL, 'grade_report_user_showweight', '0', NULL),
(142, 0, 1372258393, NULL, 'grade_report_user_showaverage', '0', NULL),
(143, 0, 1372258393, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(144, 0, 1372258393, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(145, 0, 1372258393, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(146, 0, 1372258393, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(147, 0, 1372258393, NULL, 'badges_defaultissuername', '', NULL),
(148, 0, 1372258393, NULL, 'badges_defaultissuercontact', '', NULL),
(149, 0, 1372258393, NULL, 'badges_badgesalt', 'badges1372258355', NULL),
(150, 0, 1372258393, NULL, 'badges_allowexternalbackpack', '1', NULL),
(151, 0, 1372258393, NULL, 'badges_allowcoursebadges', '1', NULL),
(152, 0, 1372258393, NULL, 'timezone', '99', NULL),
(153, 0, 1372258393, NULL, 'forcetimezone', '99', NULL),
(154, 0, 1372258393, NULL, 'country', '0', NULL),
(155, 0, 1372258393, NULL, 'defaultcity', '', NULL),
(156, 0, 1372258393, NULL, 'geoipfile', '/var/moodledata/geoip/GeoLiteCity.dat', NULL),
(157, 0, 1372258393, NULL, 'googlemapkey3', '', NULL),
(158, 0, 1372258393, NULL, 'allcountrycodes', '', NULL),
(159, 0, 1372258393, NULL, 'autolang', '1', NULL),
(160, 0, 1372258393, NULL, 'lang', 'es_ar', NULL),
(161, 0, 1372258393, NULL, 'langmenu', '1', NULL),
(162, 0, 1372258393, NULL, 'langlist', '', NULL),
(163, 0, 1372258393, NULL, 'langcache', '1', NULL),
(164, 0, 1372258393, NULL, 'langstringcache', '1', NULL),
(165, 0, 1372258393, NULL, 'locale', '', NULL),
(166, 0, 1372258393, NULL, 'latinexcelexport', '0', NULL),
(167, 0, 1372258393, NULL, 'block_course_list_adminview', 'all', NULL),
(168, 0, 1372258393, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(169, 0, 1372258393, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(170, 0, 1372258393, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(171, 0, 1372258393, 'block_course_overview', 'showchildren', '0', NULL),
(172, 0, 1372258393, 'block_course_overview', 'showwelcomearea', '0', NULL),
(173, 0, 1372258393, NULL, 'block_html_allowcssclasses', '0', NULL),
(174, 0, 1372258393, NULL, 'block_online_users_timetosee', '5', NULL),
(175, 0, 1372258393, NULL, 'block_rss_client_num_entries', '5', NULL),
(176, 0, 1372258393, NULL, 'block_rss_client_timeout', '30', NULL),
(177, 0, 1372258394, 'block_section_links', 'numsections1', '22', NULL),
(178, 0, 1372258394, 'block_section_links', 'incby1', '2', NULL),
(179, 0, 1372258394, 'block_section_links', 'numsections2', '40', NULL),
(180, 0, 1372258394, 'block_section_links', 'incby2', '5', NULL),
(181, 0, 1372258394, NULL, 'block_tags_showcoursetags', '0', NULL),
(182, 0, 1372258394, NULL, 'registerauth', '', NULL),
(183, 0, 1372258394, NULL, 'authpreventaccountcreation', '0', NULL),
(184, 0, 1372258394, NULL, 'loginpageautofocus', '0', NULL),
(185, 0, 1372258394, NULL, 'guestloginbutton', '1', NULL),
(186, 0, 1372258394, NULL, 'alternateloginurl', '', NULL),
(187, 0, 1372258394, NULL, 'forgottenpasswordurl', '', NULL),
(188, 0, 1372258394, NULL, 'auth_instructions', '', NULL),
(189, 0, 1372258394, NULL, 'allowemailaddresses', '', NULL),
(190, 0, 1372258394, NULL, 'denyemailaddresses', '', NULL),
(191, 0, 1372258394, NULL, 'verifychangedemail', '1', NULL),
(192, 0, 1372258394, NULL, 'recaptchapublickey', '', NULL),
(193, 0, 1372258394, NULL, 'recaptchaprivatekey', '', NULL),
(194, 0, 1372258394, 'enrol_database', 'dbtype', '', NULL),
(195, 0, 1372258394, 'enrol_database', 'dbhost', 'localhost', NULL),
(196, 0, 1372258394, 'enrol_database', 'dbuser', '', NULL),
(197, 0, 1372258394, 'enrol_database', 'dbpass', '', NULL),
(198, 0, 1372258394, 'enrol_database', 'dbname', '', NULL),
(199, 0, 1372258394, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(200, 0, 1372258394, 'enrol_database', 'dbsetupsql', '', NULL),
(201, 0, 1372258394, 'enrol_database', 'dbsybasequoting', '0', NULL),
(202, 0, 1372258394, 'enrol_database', 'debugdb', '0', NULL),
(203, 0, 1372258394, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(204, 0, 1372258394, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(205, 0, 1372258394, 'enrol_database', 'localrolefield', 'shortname', NULL),
(206, 0, 1372258394, 'enrol_database', 'localcategoryfield', 'id', NULL),
(207, 0, 1372258394, 'enrol_database', 'remoteenroltable', '', NULL),
(208, 0, 1372258394, 'enrol_database', 'remotecoursefield', '', NULL),
(209, 0, 1372258394, 'enrol_database', 'remoteuserfield', '', NULL),
(210, 0, 1372258394, 'enrol_database', 'remoterolefield', '', NULL),
(211, 0, 1372258394, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(212, 0, 1372258394, 'enrol_database', 'unenrolaction', '0', NULL),
(213, 0, 1372258394, 'enrol_database', 'newcoursetable', '', NULL),
(214, 0, 1372258394, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(215, 0, 1372258394, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(216, 0, 1372258395, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(217, 0, 1372258395, 'enrol_database', 'newcoursecategory', '', NULL),
(218, 0, 1372258395, 'enrol_database', 'templatecourse', '', NULL),
(219, 0, 1372258395, 'enrol_flatfile', 'location', '', NULL),
(220, 0, 1372258395, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(221, 0, 1372258395, 'enrol_flatfile', 'mailstudents', '0', NULL),
(222, 0, 1372258395, 'enrol_flatfile', 'mailteachers', '0', NULL),
(223, 0, 1372258395, 'enrol_flatfile', 'mailadmins', '0', NULL),
(224, 0, 1372258395, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(225, 0, 1372258395, 'enrol_flatfile', 'expiredaction', '3', NULL),
(226, 0, 1372258395, 'enrol_guest', 'requirepassword', '0', NULL),
(227, 0, 1372258395, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(228, 0, 1372258395, 'enrol_guest', 'showhint', '0', NULL),
(229, 0, 1372258395, 'enrol_guest', 'defaultenrol', '1', NULL),
(230, 0, 1372258395, 'enrol_guest', 'status', '1', NULL),
(231, 0, 1372258395, 'enrol_guest', 'status_adv', '0', NULL),
(232, 0, 1372258395, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(233, 0, 1372258395, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(234, 0, 1372258395, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(235, 0, 1372258395, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(236, 0, 1372258395, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(237, 0, 1372258395, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(238, 0, 1372258395, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(239, 0, 1372258395, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(240, 0, 1372258395, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(241, 0, 1372258395, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(242, 0, 1372258395, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(243, 0, 1372258395, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(244, 0, 1372258395, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(245, 0, 1372258395, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(246, 0, 1372258395, 'enrol_ldap', 'host_url', '', NULL),
(247, 0, 1372258395, 'enrol_ldap', 'start_tls', '0', NULL),
(248, 0, 1372258395, 'enrol_ldap', 'ldap_version', '3', NULL),
(249, 0, 1372258395, 'enrol_ldap', 'ldapencoding', 'utf-8', NULL),
(250, 0, 1372258395, 'enrol_ldap', 'pagesize', '250', NULL),
(251, 0, 1372258395, 'enrol_ldap', 'bind_dn', '', NULL),
(252, 0, 1372258395, 'enrol_ldap', 'bind_pw', '', NULL),
(253, 0, 1372258395, 'enrol_ldap', 'course_search_sub', '0', NULL),
(254, 0, 1372258395, 'enrol_ldap', 'memberattribute_isdn', '0', NULL),
(255, 0, 1372258395, 'enrol_ldap', 'user_contexts', '', NULL),
(256, 0, 1372258395, 'enrol_ldap', 'user_search_sub', '0', NULL),
(257, 0, 1372258395, 'enrol_ldap', 'user_type', 'default', NULL),
(258, 0, 1372258395, 'enrol_ldap', 'opt_deref', '0', NULL),
(259, 0, 1372258395, 'enrol_ldap', 'idnumber_attribute', '', NULL),
(260, 0, 1372258395, 'enrol_ldap', 'objectclass', '', NULL),
(261, 0, 1372258395, 'enrol_ldap', 'course_idnumber', '', NULL),
(262, 0, 1372258395, 'enrol_ldap', 'course_shortname', '', NULL),
(263, 0, 1372258395, 'enrol_ldap', 'course_fullname', '', NULL),
(264, 0, 1372258395, 'enrol_ldap', 'course_summary', '', NULL),
(265, 0, 1372258395, 'enrol_ldap', 'ignorehiddencourses', '0', NULL),
(266, 0, 1372258395, 'enrol_ldap', 'unenrolaction', '0', NULL),
(267, 0, 1372258395, 'enrol_ldap', 'autocreate', '0', NULL),
(268, 0, 1372258395, 'enrol_ldap', 'template', '', NULL),
(269, 0, 1372258395, 'enrol_ldap', 'nested_groups', '0', NULL),
(270, 0, 1372258395, 'enrol_ldap', 'group_memberofattribute', '', NULL),
(271, 0, 1372258395, 'enrol_manual', 'expiredaction', '1', NULL),
(272, 0, 1372258395, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(273, 0, 1372258395, 'enrol_manual', 'defaultenrol', '1', NULL),
(274, 0, 1372258395, 'enrol_manual', 'status', '0', NULL),
(275, 0, 1372258395, 'enrol_manual', 'enrolperiod', '0', NULL),
(276, 0, 1372258395, 'enrol_manual', 'expirynotify', '0', NULL),
(277, 0, 1372258395, 'enrol_manual', 'expirythreshold', '86400', NULL),
(278, 0, 1372258395, 'enrol_paypal', 'paypalbusiness', '', NULL),
(279, 0, 1372258395, 'enrol_paypal', 'mailstudents', '0', NULL),
(280, 0, 1372258395, 'enrol_paypal', 'mailteachers', '0', NULL),
(281, 0, 1372258395, 'enrol_paypal', 'mailadmins', '0', NULL),
(282, 0, 1372258395, 'enrol_paypal', 'expiredaction', '3', NULL),
(283, 0, 1372258396, 'enrol_paypal', 'status', '1', NULL),
(284, 0, 1372258396, 'enrol_paypal', 'cost', '0', NULL),
(285, 0, 1372258396, 'enrol_paypal', 'currency', 'USD', NULL),
(286, 0, 1372258396, 'enrol_paypal', 'enrolperiod', '0', NULL),
(287, 0, 1372258396, 'enrol_self', 'requirepassword', '0', NULL),
(288, 0, 1372258396, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(289, 0, 1372258396, 'enrol_self', 'showhint', '0', NULL),
(290, 0, 1372258396, 'enrol_self', 'expiredaction', '1', NULL),
(291, 0, 1372258396, 'enrol_self', 'expirynotifyhour', '6', NULL),
(292, 0, 1372258396, 'enrol_self', 'defaultenrol', '1', NULL),
(293, 0, 1372258396, 'enrol_self', 'status', '1', NULL),
(294, 0, 1372258396, 'enrol_self', 'newenrols', '1', NULL),
(295, 0, 1372258396, 'enrol_self', 'groupkey', '0', NULL),
(296, 0, 1372258396, 'enrol_self', 'enrolperiod', '0', NULL),
(297, 0, 1372258396, 'enrol_self', 'expirynotify', '0', NULL),
(298, 0, 1372258396, 'enrol_self', 'expirythreshold', '86400', NULL),
(299, 0, 1372258396, 'enrol_self', 'longtimenosee', '0', NULL),
(300, 0, 1372258396, 'enrol_self', 'maxenrolled', '0', NULL),
(301, 0, 1372258396, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(302, 0, 1372258396, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code', NULL),
(303, 0, 1372258396, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(304, 0, 1372258396, 'editor_tinymce', 'customconfig', '', NULL),
(305, 0, 1372258396, 'tinymce_dragmath', 'requiretex', '1', NULL),
(306, 0, 1372258396, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(307, 0, 1372258396, 'tinymce_spellchecker', 'spellengine', 'GoogleSpell', NULL),
(308, 0, 1372258396, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(309, 0, 1372258396, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(310, 0, 1372258396, NULL, 'cachetext', '60', NULL),
(311, 0, 1372258396, NULL, 'filteruploadedfiles', '0', NULL),
(312, 0, 1372258396, NULL, 'filtermatchoneperpage', '0', NULL),
(313, 0, 1372258396, NULL, 'filtermatchonepertext', '0', NULL),
(314, 0, 1372258396, NULL, 'filter_censor_badwords', '', NULL),
(315, 0, 1372258396, NULL, 'filter_multilang_force_old', '0', NULL),
(316, 0, 1372258396, 'filter_urltolink', 'formats', '0', NULL),
(317, 0, 1372258396, 'filter_urltolink', 'embedimages', '1', NULL),
(318, 0, 1372258396, 'filter_emoticon', 'formats', '1,4,0', NULL),
(319, 0, 1372258396, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(320, 0, 1372258396, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(321, 0, 1372258396, NULL, 'filter_tex_density', '120', NULL),
(322, 0, 1372258396, NULL, 'filter_tex_pathlatex', '/usr/bin/latex', NULL),
(323, 0, 1372258396, NULL, 'filter_tex_pathdvips', '/usr/bin/dvips', NULL),
(324, 0, 1372258396, NULL, 'filter_tex_pathconvert', '/usr/bin/convert', NULL),
(325, 0, 1372258396, NULL, 'filter_tex_convertformat', 'gif', NULL),
(326, 0, 1372258396, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(327, 0, 1372258396, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(328, 0, 1372258396, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(329, 0, 1372258396, NULL, 'portfolio_high_db_threshold', '50', NULL),
(330, 0, 1372258396, NULL, 'repositorycacheexpire', '120', NULL),
(331, 0, 1372258396, NULL, 'repositoryallowexternallinks', '1', NULL),
(332, 0, 1372258396, NULL, 'legacyfilesinnewcourses', '0', NULL),
(333, 0, 1372258396, NULL, 'mobilecssurl', '', NULL),
(334, 0, 1372258396, NULL, 'enablewsdocumentation', '0', NULL),
(335, 0, 1372258397, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(336, 0, 1372258397, 'question_preview', 'correctness', '1', NULL),
(337, 0, 1372258397, 'question_preview', 'marks', '1', NULL),
(338, 0, 1372258397, 'question_preview', 'markdp', '2', NULL),
(339, 0, 1372258397, 'question_preview', 'feedback', '1', NULL),
(340, 0, 1372258397, 'question_preview', 'generalfeedback', '1', NULL),
(341, 0, 1372258397, 'question_preview', 'rightanswer', '1', NULL),
(342, 0, 1372258397, 'question_preview', 'history', '0', NULL),
(343, 0, 1372258397, 'cachestore_memcache', 'testservers', '', NULL),
(344, 0, 1372258397, 'cachestore_memcached', 'testservers', '', NULL),
(345, 0, 1372258397, 'cachestore_mongodb', 'testserver', '', NULL),
(346, 0, 1372258397, NULL, 'allowbeforeblock', '0', NULL),
(347, 0, 1372258397, NULL, 'allowedip', '', NULL),
(348, 0, 1372258397, NULL, 'blockedip', '', NULL),
(349, 0, 1372258397, NULL, 'protectusernames', '1', NULL),
(350, 0, 1372258397, NULL, 'forcelogin', '0', NULL),
(351, 0, 1372258397, NULL, 'forceloginforprofiles', '1', NULL),
(352, 0, 1372258397, NULL, 'forceloginforprofileimage', '0', NULL),
(353, 0, 1372258397, NULL, 'opentogoogle', '0', NULL),
(354, 0, 1372258397, NULL, 'maxbytes', '0', NULL),
(355, 0, 1372258397, NULL, 'userquota', '104857600', NULL),
(356, 0, 1372258397, NULL, 'allowobjectembed', '0', NULL),
(357, 0, 1372258397, NULL, 'enabletrusttext', '0', NULL),
(358, 0, 1372258397, NULL, 'maxeditingtime', '1800', NULL),
(359, 0, 1372258397, NULL, 'fullnamedisplay', 'language', NULL),
(360, 0, 1372258397, NULL, 'extendedusernamechars', '0', NULL),
(361, 0, 1372258397, NULL, 'sitepolicy', '', NULL),
(362, 0, 1372258397, NULL, 'sitepolicyguest', '', NULL),
(363, 0, 1372258397, NULL, 'keeptagnamecase', '1', NULL),
(364, 0, 1372258397, NULL, 'profilesforenrolledusersonly', '1', NULL),
(365, 0, 1372258397, NULL, 'cronclionly', '0', NULL),
(366, 0, 1372258397, NULL, 'cronremotepassword', '', NULL),
(367, 0, 1372258397, NULL, 'lockoutthreshold', '0', NULL),
(368, 0, 1372258397, NULL, 'lockoutwindow', '1800', NULL),
(369, 0, 1372258398, NULL, 'lockoutduration', '1800', NULL),
(370, 0, 1372258398, NULL, 'passwordpolicy', '1', NULL),
(371, 0, 1372258398, NULL, 'minpasswordlength', '8', NULL),
(372, 0, 1372258398, NULL, 'minpassworddigits', '1', NULL),
(373, 0, 1372258398, NULL, 'minpasswordlower', '1', NULL),
(374, 0, 1372258398, NULL, 'minpasswordupper', '1', NULL),
(375, 0, 1372258398, NULL, 'minpasswordnonalphanum', '1', NULL),
(376, 0, 1372258398, NULL, 'maxconsecutiveidentchars', '0', NULL),
(377, 0, 1372258398, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(378, 0, 1372258398, NULL, 'disableuserimages', '0', NULL),
(379, 0, 1372258398, NULL, 'emailchangeconfirmation', '1', NULL),
(380, 0, 1372258398, NULL, 'rememberusername', '2', NULL),
(381, 0, 1372258398, NULL, 'strictformsrequired', '0', NULL),
(382, 0, 1372258398, NULL, 'loginhttps', '0', NULL),
(383, 0, 1372258398, NULL, 'cookiesecure', '0', NULL),
(384, 0, 1372258398, NULL, 'cookiehttponly', '0', NULL),
(385, 0, 1372258398, NULL, 'allowframembedding', '0', NULL),
(386, 0, 1372258398, NULL, 'loginpasswordautocomplete', '0', NULL),
(387, 0, 1372258398, NULL, 'displayloginfailures', '', NULL),
(388, 0, 1372258398, NULL, 'notifyloginfailures', '', NULL),
(389, 0, 1372258398, NULL, 'notifyloginthreshold', '10', NULL),
(390, 0, 1372258398, NULL, 'runclamonupload', '0', NULL),
(391, 0, 1372258398, NULL, 'pathtoclam', '', NULL),
(392, 0, 1372258398, NULL, 'quarantinedir', '', NULL),
(393, 0, 1372258398, NULL, 'clamfailureonupload', 'donothing', NULL),
(394, 0, 1372258398, NULL, 'themelist', '', NULL),
(395, 0, 1372258399, NULL, 'themedesignermode', '0', NULL),
(396, 0, 1372258399, NULL, 'allowuserthemes', '0', NULL),
(397, 0, 1372258399, NULL, 'allowcoursethemes', '0', NULL),
(398, 0, 1372258399, NULL, 'allowcategorythemes', '0', NULL),
(399, 0, 1372258399, NULL, 'allowthemechangeonurl', '0', NULL),
(400, 0, 1372258399, NULL, 'allowuserblockhiding', '1', NULL),
(401, 0, 1372258399, NULL, 'allowblockstodock', '1', NULL),
(402, 0, 1372258399, NULL, 'custommenuitems', '', NULL),
(403, 0, 1372258399, NULL, 'enabledevicedetection', '1', NULL),
(404, 0, 1372258399, NULL, 'devicedetectregex', '[]', NULL),
(405, 0, 1372258399, 'theme_afterburner', 'logo', '', NULL),
(406, 0, 1372258399, 'theme_afterburner', 'footnote', '', NULL),
(407, 0, 1372258399, 'theme_afterburner', 'customcss', '', NULL),
(408, 0, 1372258399, 'theme_anomaly', 'tagline', '', NULL),
(409, 0, 1372258399, 'theme_anomaly', 'customcss', '', NULL),
(410, 0, 1372258399, 'theme_arialist', 'logo', '', NULL),
(411, 0, 1372258399, 'theme_arialist', 'tagline', '', NULL),
(412, 0, 1372258399, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(413, 0, 1372258399, 'theme_arialist', 'regionwidth', '250', NULL),
(414, 0, 1372258399, 'theme_arialist', 'customcss', '', NULL),
(415, 0, 1372258399, 'theme_brick', 'logo', '', NULL),
(416, 0, 1372258399, 'theme_brick', 'linkcolor', '#06365b', NULL),
(417, 0, 1372258399, 'theme_brick', 'linkhover', '#5487ad', NULL),
(418, 0, 1372258399, 'theme_brick', 'maincolor', '#8e2800', NULL),
(419, 0, 1372258399, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(420, 0, 1372258399, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(421, 0, 1372258399, 'theme_clean', 'invert', '0', NULL),
(422, 0, 1372258399, 'theme_clean', 'logo', '', NULL),
(423, 0, 1372258399, 'theme_clean', 'customcss', '', NULL),
(424, 0, 1372258399, 'theme_clean', 'footnote', '', NULL),
(425, 0, 1372258399, 'theme_formal_white', 'fontsizereference', '13', NULL),
(426, 0, 1372258399, 'theme_formal_white', 'noframe', '0', NULL),
(427, 0, 1372258399, 'theme_formal_white', 'framemargin', '15', NULL),
(428, 0, 1372258399, 'theme_formal_white', 'headercontent', '1', NULL),
(429, 0, 1372258399, 'theme_formal_white', 'customlogourl', '', NULL),
(430, 0, 1372258399, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(431, 0, 1372258399, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(432, 0, 1372258399, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(433, 0, 1372258399, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(434, 0, 1372258399, 'theme_formal_white', 'blockpadding', '8', NULL),
(435, 0, 1372258399, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(436, 0, 1372258399, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(437, 0, 1372258399, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(438, 0, 1372258399, 'theme_formal_white', 'footnote', '', NULL),
(439, 0, 1372258399, 'theme_formal_white', 'customcss', '', NULL),
(440, 0, 1372258399, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(441, 0, 1372258399, 'theme_fusion', 'tagline', '', NULL),
(442, 0, 1372258399, 'theme_fusion', 'footertext', '', NULL),
(443, 0, 1372258399, 'theme_fusion', 'customcss', '', NULL),
(444, 0, 1372258400, 'theme_magazine', 'background', '', NULL),
(445, 0, 1372258400, 'theme_magazine', 'logo', '', NULL),
(446, 0, 1372258400, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(447, 0, 1372258400, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(448, 0, 1372258400, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(449, 0, 1372258400, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(450, 0, 1372258400, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(451, 0, 1372258400, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(452, 0, 1372258400, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(453, 0, 1372258400, 'theme_mymobile', 'colourswatch', 'light', NULL),
(454, 0, 1372258400, 'theme_mymobile', 'showmobileintro', '', NULL),
(455, 0, 1372258400, 'theme_mymobile', 'showsitetopic', 'topicshow', NULL),
(456, 0, 1372258400, 'theme_mymobile', 'showfullsizeimages', 'ithumb', NULL),
(457, 0, 1372258400, 'theme_mymobile', 'usetableview', 'tabshow', NULL),
(458, 0, 1372258400, 'theme_mymobile', 'customcss', '', NULL),
(459, 0, 1372258400, 'theme_nimble', 'tagline', '', NULL),
(460, 0, 1372258400, 'theme_nimble', 'footerline', '', NULL),
(461, 0, 1372258400, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(462, 0, 1372258400, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(463, 0, 1372258400, 'theme_nimble', 'linkhover', '#222222', NULL),
(464, 0, 1372258400, 'theme_nonzero', 'regionprewidth', '200', NULL),
(465, 0, 1372258400, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(466, 0, 1372258400, 'theme_nonzero', 'customcss', '', NULL),
(467, 0, 1372258400, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(468, 0, 1372258400, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(469, 0, 1372258400, 'theme_overlay', 'footertext', '', NULL),
(470, 0, 1372258400, 'theme_overlay', 'customcss', '', NULL),
(471, 0, 1372258400, 'theme_sky_high', 'logo', '', NULL),
(472, 0, 1372258400, 'theme_sky_high', 'regionwidth', '240', NULL),
(473, 0, 1372258400, 'theme_sky_high', 'footnote', '', NULL),
(474, 0, 1372258400, 'theme_sky_high', 'customcss', '', NULL),
(475, 0, 1372258400, 'theme_splash', 'logo', '', NULL),
(476, 0, 1372258400, 'theme_splash', 'tagline', 'Centro de aprendizaje virtual', NULL),
(477, 0, 1372258400, 'theme_splash', 'hide_tagline', '0', NULL),
(478, 0, 1372258400, 'theme_splash', 'footnote', '', NULL),
(479, 0, 1372258400, 'theme_splash', 'customcss', '', NULL),
(480, 0, 1372258400, NULL, 'calendar_adminseesall', '0', NULL),
(481, 0, 1372258400, NULL, 'calendar_site_timeformat', '0', NULL),
(482, 0, 1372258400, NULL, 'calendar_startwday', '0', NULL),
(483, 0, 1372258400, NULL, 'calendar_weekend', '65', NULL),
(484, 0, 1372258400, NULL, 'calendar_lookahead', '21', NULL),
(485, 0, 1372258400, NULL, 'calendar_maxevents', '10', NULL),
(486, 0, 1372258400, NULL, 'enablecalendarexport', '1', NULL),
(487, 0, 1372258400, NULL, 'calendar_customexport', '1', NULL),
(488, 0, 1372258400, NULL, 'calendar_exportlookahead', '365', NULL),
(489, 0, 1372258400, NULL, 'calendar_exportlookback', '5', NULL),
(490, 0, 1372258400, NULL, 'calendar_exportsalt', 'tal5BUCxiN1894TPwVIFBXETe0emgFeWNqfxdDezPSEVtBgM7lAZlps5loc1', NULL),
(491, 0, 1372258400, NULL, 'calendar_showicalsource', '1', NULL),
(492, 0, 1372258400, NULL, 'useblogassociations', '1', NULL),
(493, 0, 1372258400, NULL, 'bloglevel', '4', NULL),
(494, 0, 1372258401, NULL, 'useexternalblogs', '1', NULL),
(495, 0, 1372258401, NULL, 'externalblogcrontime', '86400', NULL),
(496, 0, 1372258401, NULL, 'maxexternalblogsperuser', '1', NULL),
(497, 0, 1372258401, NULL, 'blogusecomments', '1', NULL),
(498, 0, 1372258401, NULL, 'blogshowcommentscount', '1', NULL),
(499, 0, 1372258401, NULL, 'defaulthomepage', '0', NULL),
(500, 0, 1372258401, NULL, 'allowguestmymoodle', '1', NULL),
(501, 0, 1372258401, NULL, 'navshowfullcoursenames', '0', NULL),
(502, 0, 1372258401, NULL, 'navshowcategories', '1', NULL),
(503, 0, 1372258401, NULL, 'navshowmycoursecategories', '0', NULL),
(504, 0, 1372258401, NULL, 'navshowallcourses', '0', NULL),
(505, 0, 1372258401, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(506, 0, 1372258401, NULL, 'navcourselimit', '20', NULL),
(507, 0, 1372258401, NULL, 'usesitenameforsitepages', '0', NULL),
(508, 0, 1372258401, NULL, 'linkadmincategories', '0', NULL),
(509, 0, 1372258401, NULL, 'navshowfrontpagemods', '1', NULL),
(510, 0, 1372258401, NULL, 'navadduserpostslinks', '1', NULL),
(511, 0, 1372258401, NULL, 'formatstringstriptags', '1', NULL),
(512, 0, 1372258401, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(513, 0, 1372258401, NULL, 'core_media_enable_youtube', '1', NULL),
(514, 0, 1372258401, NULL, 'core_media_enable_vimeo', '0', NULL),
(515, 0, 1372258401, NULL, 'core_media_enable_mp3', '1', NULL),
(516, 0, 1372258401, NULL, 'core_media_enable_flv', '1', NULL),
(517, 0, 1372258401, NULL, 'core_media_enable_swf', '1', NULL),
(518, 0, 1372258401, NULL, 'core_media_enable_html5audio', '1', NULL),
(519, 0, 1372258401, NULL, 'core_media_enable_html5video', '1', NULL),
(520, 0, 1372258401, NULL, 'core_media_enable_qt', '1', NULL),
(521, 0, 1372258401, NULL, 'core_media_enable_wmp', '1', NULL),
(522, 0, 1372258401, NULL, 'core_media_enable_rm', '1', NULL),
(523, 0, 1372258401, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(524, 0, 1372258401, NULL, 'doctonewwindow', '0', NULL),
(525, 0, 1372258401, NULL, 'courselistshortnames', '0', NULL),
(526, 0, 1372258401, NULL, 'coursesperpage', '20', NULL),
(527, 0, 1372258401, NULL, 'courseswithsummarieslimit', '10', NULL),
(528, 0, 1372258401, NULL, 'courseoverviewfileslimit', '1', NULL),
(529, 0, 1372258401, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(530, 0, 1372258401, NULL, 'enableajax', '1', NULL),
(531, 0, 1372258401, NULL, 'useexternalyui', '0', NULL),
(532, 0, 1372258401, NULL, 'yuicomboloading', '1', NULL),
(533, 0, 1372258401, NULL, 'cachejs', '1', NULL),
(534, 0, 1372258402, NULL, 'modchooserdefault', '1', NULL),
(535, 0, 1372258402, NULL, 'additionalhtmlhead', '', NULL),
(536, 0, 1372258402, NULL, 'additionalhtmltopofbody', '', NULL),
(537, 0, 1372258402, NULL, 'additionalhtmlfooter', '', NULL),
(538, 0, 1372258402, NULL, 'pathtodu', '', NULL),
(539, 0, 1372258402, NULL, 'aspellpath', '', NULL),
(540, 0, 1372258402, NULL, 'pathtodot', '', NULL),
(541, 0, 1372258402, NULL, 'supportpage', '', NULL),
(542, 0, 1372258402, NULL, 'dbsessions', '1', NULL),
(543, 0, 1372258402, NULL, 'sessioncookie', '', NULL),
(544, 0, 1372258402, NULL, 'sessioncookiepath', '', NULL),
(545, 0, 1372258402, NULL, 'sessioncookiedomain', '', NULL),
(546, 0, 1372258402, NULL, 'statsfirstrun', 'none', NULL),
(547, 0, 1372258402, NULL, 'statsmaxruntime', '0', NULL),
(548, 0, 1372258402, NULL, 'statsruntimedays', '31', NULL),
(549, 0, 1372258402, NULL, 'statsruntimestarthour', '0', NULL),
(550, 0, 1372258402, NULL, 'statsruntimestartminute', '0', NULL),
(551, 0, 1372258402, NULL, 'statsuserthreshold', '0', NULL),
(552, 0, 1372258402, NULL, 'slasharguments', '1', NULL),
(553, 0, 1372258402, NULL, 'getremoteaddrconf', '0', NULL),
(554, 0, 1372258402, NULL, 'proxyhost', '', NULL),
(555, 0, 1372258402, NULL, 'proxyport', '0', NULL),
(556, 0, 1372258402, NULL, 'proxytype', 'HTTP', NULL),
(557, 0, 1372258402, NULL, 'proxyuser', '', NULL),
(558, 0, 1372258402, NULL, 'proxypassword', '', NULL),
(559, 0, 1372258402, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(560, 0, 1372258402, NULL, 'maintenance_enabled', '0', NULL),
(561, 0, 1372258402, NULL, 'maintenance_message', '', NULL),
(562, 0, 1372258402, NULL, 'deleteunconfirmed', '168', NULL),
(563, 0, 1372258402, NULL, 'deleteincompleteusers', '0', NULL),
(564, 0, 1372258402, NULL, 'logguests', '1', NULL),
(565, 0, 1372258402, NULL, 'loglifetime', '0', NULL),
(566, 0, 1372258402, NULL, 'disablegradehistory', '0', NULL),
(567, 0, 1372258402, NULL, 'gradehistorylifetime', '0', NULL),
(568, 0, 1372258402, NULL, 'extramemorylimit', '512M', NULL),
(569, 0, 1372258402, NULL, 'curlcache', '120', NULL),
(570, 0, 1372258402, NULL, 'curltimeoutkbitrate', '56', NULL),
(571, 0, 1372258402, NULL, 'updateautocheck', '1', NULL),
(572, 0, 1372258402, NULL, 'updateautodeploy', '0', NULL),
(573, 0, 1372258402, NULL, 'updateminmaturity', '200', NULL),
(574, 0, 1372258402, NULL, 'updatenotifybuilds', '0', NULL),
(575, 0, 1372258402, NULL, 'enablesafebrowserintegration', '0', NULL),
(576, 0, 1372258402, NULL, 'enablegroupmembersonly', '0', NULL),
(577, 0, 1372258402, NULL, 'dndallowtextandlinks', '0', NULL),
(578, 0, 1372258402, NULL, 'enablecssoptimiser', '0', NULL),
(579, 0, 1372258403, NULL, 'debug', '0', NULL),
(580, 0, 1372258403, NULL, 'debugdisplay', '0', NULL),
(581, 0, 1372258403, NULL, 'debugsmtp', '0', NULL),
(582, 0, 1372258403, NULL, 'perfdebug', '7', NULL),
(583, 0, 1372258403, NULL, 'debugstringids', '0', NULL),
(584, 0, 1372258403, NULL, 'debugvalidators', '0', NULL),
(585, 0, 1372258403, NULL, 'debugpageinfo', '0', NULL),
(586, 2, 1372259016, NULL, 'notloggedinroleid', '6', NULL),
(587, 2, 1372259016, NULL, 'guestroleid', '6', NULL),
(588, 2, 1372259016, NULL, 'defaultuserroleid', '7', NULL),
(589, 2, 1372259016, NULL, 'creatornewroleid', '3', NULL),
(590, 2, 1372259016, NULL, 'restorernewroleid', '3', NULL),
(591, 2, 1372259016, NULL, 'gradebookroles', '5', NULL),
(592, 2, 1372259016, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(593, 2, 1372259016, 'assign', 'showrecentsubmissions', '0', NULL),
(594, 2, 1372259016, 'assign', 'submissionreceipts', '1', NULL),
(595, 2, 1372259016, 'assign', 'submissionstatement', 'Confirmo que este trabajo es de elaboración propia, excepto aquellas partes en las que haya reconocido la autoría de la obra o parte de ella a otras personas.', NULL),
(596, 2, 1372259016, 'assign', 'requiresubmissionstatement', '0', NULL),
(597, 2, 1372259016, NULL, 'assignment_maxbytes', '1048576', NULL),
(598, 2, 1372259016, NULL, 'assignment_itemstocount', '1', NULL),
(599, 2, 1372259016, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(600, 2, 1372259016, 'book', 'requiremodintro', '1', NULL),
(601, 2, 1372259016, 'book', 'numberingoptions', '0,1,2,3', NULL),
(602, 2, 1372259016, 'book', 'numbering', '1', NULL),
(603, 2, 1372259016, NULL, 'chat_method', 'ajax', NULL),
(604, 2, 1372259016, NULL, 'chat_refresh_userlist', '10', NULL),
(605, 2, 1372259016, NULL, 'chat_old_ping', '35', NULL),
(606, 2, 1372259016, NULL, 'chat_refresh_room', '5', NULL),
(607, 2, 1372259016, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(608, 2, 1372259016, NULL, 'chat_serverhost', 'localhost', NULL),
(609, 2, 1372259016, NULL, 'chat_serverip', '127.0.0.1', NULL),
(610, 2, 1372259017, NULL, 'chat_serverport', '9111', NULL),
(611, 2, 1372259017, NULL, 'chat_servermax', '100', NULL),
(612, 2, 1372259017, NULL, 'data_enablerssfeeds', '0', NULL),
(613, 2, 1372259017, NULL, 'feedback_allowfullanonymous', '0', NULL),
(614, 2, 1372259017, 'folder', 'requiremodintro', '1', NULL),
(615, 2, 1372259017, 'folder', 'showexpanded', '1', NULL),
(616, 2, 1372259017, NULL, 'forum_displaymode', '3', NULL),
(617, 2, 1372259017, NULL, 'forum_replytouser', '1', NULL),
(618, 2, 1372259017, NULL, 'forum_shortpost', '300', NULL),
(619, 2, 1372259017, NULL, 'forum_longpost', '600', NULL),
(620, 2, 1372259017, NULL, 'forum_manydiscussions', '100', NULL),
(621, 2, 1372259017, NULL, 'forum_maxbytes', '512000', NULL),
(622, 2, 1372259017, NULL, 'forum_maxattachments', '9', NULL),
(623, 2, 1372259017, NULL, 'forum_trackreadposts', '1', NULL),
(624, 2, 1372259017, NULL, 'forum_oldpostdays', '14', NULL),
(625, 2, 1372259017, NULL, 'forum_usermarksread', '0', NULL),
(626, 2, 1372259017, NULL, 'forum_cleanreadtime', '2', NULL),
(627, 2, 1372259017, NULL, 'digestmailtime', '17', NULL),
(628, 2, 1372259017, NULL, 'forum_enablerssfeeds', '0', NULL),
(629, 2, 1372259017, NULL, 'forum_enabletimedposts', '0', NULL),
(630, 2, 1372259017, NULL, 'glossary_entbypage', '10', NULL),
(631, 2, 1372259017, NULL, 'glossary_dupentries', '0', NULL),
(632, 2, 1372259017, NULL, 'glossary_allowcomments', '0', NULL),
(633, 2, 1372259017, NULL, 'glossary_linkbydefault', '1', NULL),
(634, 2, 1372259017, NULL, 'glossary_defaultapproval', '1', NULL),
(635, 2, 1372259017, NULL, 'glossary_enablerssfeeds', '0', NULL),
(636, 2, 1372259017, NULL, 'glossary_linkentries', '0', NULL),
(637, 2, 1372259017, NULL, 'glossary_casesensitive', '0', NULL),
(638, 2, 1372259017, NULL, 'glossary_fullmatch', '0', NULL),
(639, 2, 1372259017, 'imscp', 'requiremodintro', '1', NULL),
(640, 2, 1372259017, 'imscp', 'keepold', '1', NULL),
(641, 2, 1372259017, 'imscp', 'keepold_adv', '0', NULL),
(642, 2, 1372259017, 'label', 'dndmedia', '1', NULL),
(643, 2, 1372259017, 'label', 'dndresizewidth', '400', NULL),
(644, 2, 1372259017, 'label', 'dndresizeheight', '400', NULL),
(645, 2, 1372259017, NULL, 'lesson_slideshowwidth', '640', NULL),
(646, 2, 1372259017, NULL, 'lesson_slideshowheight', '480', NULL),
(647, 2, 1372259017, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(648, 2, 1372259018, NULL, 'lesson_mediawidth', '640', NULL),
(649, 2, 1372259018, NULL, 'lesson_mediaheight', '480', NULL),
(650, 2, 1372259018, NULL, 'lesson_mediaclose', '0', NULL),
(651, 2, 1372259018, NULL, 'lesson_maxhighscores', '10', NULL),
(652, 2, 1372259018, NULL, 'lesson_maxanswers', '4', NULL),
(653, 2, 1372259018, NULL, 'lesson_defaultnextpage', '0', NULL),
(654, 2, 1372259018, 'page', 'requiremodintro', '1', NULL),
(655, 2, 1372259018, 'page', 'displayoptions', '5', NULL),
(656, 2, 1372259018, 'page', 'printheading', '1', NULL),
(657, 2, 1372259018, 'page', 'printintro', '0', NULL),
(658, 2, 1372259018, 'page', 'display', '5', NULL),
(659, 2, 1372259018, 'page', 'popupwidth', '620', NULL),
(660, 2, 1372259018, 'page', 'popupheight', '450', NULL),
(661, 2, 1372259018, 'quiz', 'timelimit', '0', NULL),
(662, 2, 1372259018, 'quiz', 'timelimit_adv', '0', NULL),
(663, 2, 1372259018, 'quiz', 'overduehandling', 'autoabandon', NULL),
(664, 2, 1372259018, 'quiz', 'overduehandling_adv', '0', NULL),
(665, 2, 1372259018, 'quiz', 'graceperiod', '86400', NULL),
(666, 2, 1372259018, 'quiz', 'graceperiod_adv', '0', NULL),
(667, 2, 1372259018, 'quiz', 'graceperiodmin', '60', NULL),
(668, 2, 1372259018, 'quiz', 'attempts', '0', NULL),
(669, 2, 1372259018, 'quiz', 'attempts_adv', '0', NULL),
(670, 2, 1372259018, 'quiz', 'grademethod', '1', NULL),
(671, 2, 1372259018, 'quiz', 'grademethod_adv', '0', NULL),
(672, 2, 1372259018, 'quiz', 'maximumgrade', '10', NULL),
(673, 2, 1372259018, 'quiz', 'shufflequestions', '0', NULL),
(674, 2, 1372259018, 'quiz', 'shufflequestions_adv', '0', NULL),
(675, 2, 1372259018, 'quiz', 'questionsperpage', '1', NULL),
(676, 2, 1372259018, 'quiz', 'questionsperpage_adv', '0', NULL),
(677, 2, 1372259018, 'quiz', 'navmethod', 'free', NULL),
(678, 2, 1372259018, 'quiz', 'navmethod_adv', '1', NULL),
(679, 2, 1372259018, 'quiz', 'shuffleanswers', '1', NULL),
(680, 2, 1372259018, 'quiz', 'shuffleanswers_adv', '0', NULL),
(681, 2, 1372259019, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(682, 2, 1372259019, 'quiz', 'attemptonlast', '0', NULL),
(683, 2, 1372259019, 'quiz', 'attemptonlast_adv', '1', NULL),
(684, 2, 1372259019, 'quiz', 'reviewattempt', '69904', NULL),
(685, 2, 1372259019, 'quiz', 'reviewcorrectness', '69904', NULL),
(686, 2, 1372259019, 'quiz', 'reviewmarks', '69904', NULL),
(687, 2, 1372259019, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(688, 2, 1372259019, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(689, 2, 1372259019, 'quiz', 'reviewrightanswer', '69904', NULL),
(690, 2, 1372259019, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(691, 2, 1372259019, 'quiz', 'showuserpicture', '0', NULL),
(692, 2, 1372259019, 'quiz', 'showuserpicture_adv', '0', NULL),
(693, 2, 1372259019, 'quiz', 'decimalpoints', '2', NULL),
(694, 2, 1372259019, 'quiz', 'decimalpoints_adv', '0', NULL),
(695, 2, 1372259019, 'quiz', 'questiondecimalpoints', '-1', NULL),
(696, 2, 1372259019, 'quiz', 'questiondecimalpoints_adv', '1', NULL),
(697, 2, 1372259019, 'quiz', 'showblocks', '0', NULL),
(698, 2, 1372259019, 'quiz', 'showblocks_adv', '1', NULL),
(699, 2, 1372259019, 'quiz', 'password', '', NULL),
(700, 2, 1372259019, 'quiz', 'password_adv', '1', NULL),
(701, 2, 1372259019, 'quiz', 'subnet', '', NULL),
(702, 2, 1372259019, 'quiz', 'subnet_adv', '1', NULL),
(703, 2, 1372259019, 'quiz', 'delay1', '0', NULL),
(704, 2, 1372259019, 'quiz', 'delay1_adv', '1', NULL),
(705, 2, 1372259019, 'quiz', 'delay2', '0', NULL),
(706, 2, 1372259019, 'quiz', 'delay2_adv', '1', NULL),
(707, 2, 1372259019, 'quiz', 'browsersecurity', '-', NULL),
(708, 2, 1372259019, 'quiz', 'browsersecurity_adv', '1', NULL),
(709, 2, 1372259019, 'quiz', 'autosaveperiod', '0', NULL),
(710, 2, 1372259019, 'resource', 'framesize', '130', NULL),
(711, 2, 1372259019, 'resource', 'requiremodintro', '1', NULL),
(712, 2, 1372259019, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(713, 2, 1372259019, 'resource', 'printheading', '0', NULL),
(714, 2, 1372259019, 'resource', 'printintro', '1', NULL),
(715, 2, 1372259019, 'resource', 'display', '0', NULL),
(716, 2, 1372259019, 'resource', 'showsize', '0', NULL),
(717, 2, 1372259019, 'resource', 'showtype', '0', NULL),
(718, 2, 1372259019, 'resource', 'popupwidth', '620', NULL),
(719, 2, 1372259019, 'resource', 'popupheight', '450', NULL),
(720, 2, 1372259019, 'resource', 'filterfiles', '0', NULL),
(721, 2, 1372259019, 'scorm', 'displaycoursestructure', '0', NULL),
(722, 2, 1372259019, 'scorm', 'displaycoursestructure_adv', '0', NULL),
(723, 2, 1372259019, 'scorm', 'popup', '0', NULL),
(724, 2, 1372259019, 'scorm', 'popup_adv', '0', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(725, 2, 1372259019, 'scorm', 'framewidth', '100', NULL),
(726, 2, 1372259019, 'scorm', 'framewidth_adv', '1', NULL),
(727, 2, 1372259019, 'scorm', 'frameheight', '500', NULL),
(728, 2, 1372259019, 'scorm', 'frameheight_adv', '1', NULL),
(729, 2, 1372259019, 'scorm', 'winoptgrp_adv', '1', NULL),
(730, 2, 1372259019, 'scorm', 'resizable', '0', NULL),
(731, 2, 1372259019, 'scorm', 'scrollbars', '0', NULL),
(732, 2, 1372259019, 'scorm', 'directories', '0', NULL),
(733, 2, 1372259019, 'scorm', 'location', '0', NULL),
(734, 2, 1372259019, 'scorm', 'menubar', '0', NULL),
(735, 2, 1372259019, 'scorm', 'toolbar', '0', NULL),
(736, 2, 1372259019, 'scorm', 'status', '0', NULL),
(737, 2, 1372259019, 'scorm', 'skipview', '0', NULL),
(738, 2, 1372259019, 'scorm', 'skipview_adv', '1', NULL),
(739, 2, 1372259019, 'scorm', 'hidebrowse', '0', NULL),
(740, 2, 1372259020, 'scorm', 'hidebrowse_adv', '1', NULL),
(741, 2, 1372259020, 'scorm', 'hidetoc', '0', NULL),
(742, 2, 1372259020, 'scorm', 'hidetoc_adv', '1', NULL),
(743, 2, 1372259020, 'scorm', 'hidenav', '0', NULL),
(744, 2, 1372259020, 'scorm', 'hidenav_adv', '0', NULL),
(745, 2, 1372259020, 'scorm', 'displayattemptstatus', '1', NULL),
(746, 2, 1372259020, 'scorm', 'displayattemptstatus_adv', '0', NULL),
(747, 2, 1372259020, 'scorm', 'grademethod', '1', NULL),
(748, 2, 1372259020, 'scorm', 'maxgrade', '100', NULL),
(749, 2, 1372259020, 'scorm', 'maxattempt', '0', NULL),
(750, 2, 1372259020, 'scorm', 'whatgrade', '0', NULL),
(751, 2, 1372259020, 'scorm', 'forcecompleted', '0', NULL),
(752, 2, 1372259020, 'scorm', 'forcenewattempt', '0', NULL),
(753, 2, 1372259020, 'scorm', 'lastattemptlock', '0', NULL),
(754, 2, 1372259020, 'scorm', 'auto', '0', NULL),
(755, 2, 1372259020, 'scorm', 'updatefreq', '0', NULL),
(756, 2, 1372259020, 'scorm', 'allowtypeexternal', '0', NULL),
(757, 2, 1372259020, 'scorm', 'allowtypelocalsync', '0', NULL),
(758, 2, 1372259020, 'scorm', 'allowtypeimsrepository', '0', NULL),
(759, 2, 1372259020, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(760, 2, 1372259020, 'scorm', 'allowaicchacp', '0', NULL),
(761, 2, 1372259020, 'scorm', 'aicchacptimeout', '30', NULL),
(762, 2, 1372259020, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(763, 2, 1372259020, 'scorm', 'forcejavascript', '1', NULL),
(764, 2, 1372259020, 'scorm', 'allowapidebug', '0', NULL),
(765, 2, 1372259020, 'scorm', 'apidebugmask', '.*', NULL),
(766, 2, 1372259020, 'url', 'framesize', '130', NULL),
(767, 2, 1372259020, 'url', 'requiremodintro', '1', NULL),
(768, 2, 1372259020, 'url', 'secretphrase', '', NULL),
(769, 2, 1372259020, 'url', 'rolesinparams', '0', NULL),
(770, 2, 1372259020, 'url', 'displayoptions', '0,1,5,6', NULL),
(771, 2, 1372259020, 'url', 'printheading', '0', NULL),
(772, 2, 1372259020, 'url', 'printintro', '1', NULL),
(773, 2, 1372259020, 'url', 'display', '0', NULL),
(774, 2, 1372259020, 'url', 'popupwidth', '620', NULL),
(775, 2, 1372259020, 'url', 'popupheight', '450', NULL),
(776, 2, 1372259020, 'workshop', 'grade', '80', NULL),
(777, 2, 1372259020, 'workshop', 'gradinggrade', '20', NULL),
(778, 2, 1372259020, 'workshop', 'gradedecimals', '0', NULL),
(779, 2, 1372259020, 'workshop', 'maxbytes', '0', NULL),
(780, 2, 1372259020, 'workshop', 'strategy', 'accumulative', NULL),
(781, 2, 1372259020, 'workshop', 'examplesmode', '0', NULL),
(782, 2, 1372259020, 'workshopallocation_random', 'numofreviews', '5', NULL),
(783, 2, 1372259020, 'workshopform_numerrors', 'grade0', 'No', NULL),
(784, 2, 1372259020, 'workshopform_numerrors', 'grade1', 'Sí', NULL),
(785, 2, 1372259020, 'workshopeval_best', 'comparison', '5', NULL),
(786, 2, 1372259020, 'assignsubmission_file', 'default', '1', NULL),
(787, 2, 1372259020, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(788, 2, 1372259020, 'assignsubmission_comments', 'default', '0', NULL),
(789, 2, 1372259020, 'assignsubmission_onlinetext', 'default', '0', NULL),
(790, 2, 1372259020, 'assignfeedback_file', 'default', '0', NULL),
(791, 2, 1372259020, 'assignfeedback_comments', 'default', '1', NULL),
(792, 2, 1372259020, 'assignfeedback_offline', 'default', '0', NULL),
(793, 2, 1372259020, NULL, 'smtphosts', '', NULL),
(794, 2, 1372259020, NULL, 'smtpsecure', '', NULL),
(795, 2, 1372259020, NULL, 'smtpuser', '', NULL),
(796, 2, 1372259020, NULL, 'smtppass', '', NULL),
(797, 2, 1372259020, NULL, 'smtpmaxbulk', '1', NULL),
(798, 2, 1372259020, NULL, 'noreplyaddress', 'noreply@localhost', NULL),
(799, 2, 1372259020, NULL, 'sitemailcharset', '0', NULL),
(800, 2, 1372259021, NULL, 'allowusermailcharset', '0', NULL),
(801, 2, 1372259021, NULL, 'mailnewline', 'LF', NULL),
(802, 2, 1372259021, NULL, 'jabberhost', '', NULL),
(803, 2, 1372259021, NULL, 'jabberserver', '', NULL),
(804, 2, 1372259021, NULL, 'jabberusername', '', NULL),
(805, 2, 1372259021, NULL, 'jabberpassword', '', NULL),
(806, 2, 1372259021, NULL, 'jabberport', '5222', NULL),
(807, 2, 1372259021, 'enrol_cohort', 'roleid', '5', NULL),
(808, 2, 1372259021, 'enrol_cohort', 'unenrolaction', '0', NULL),
(809, 2, 1372259021, 'enrol_database', 'defaultrole', '5', NULL),
(810, 2, 1372259021, 'enrol_database', 'defaultcategory', '1', NULL),
(811, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(812, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(813, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(814, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(815, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(816, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(817, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(818, 2, 1372259021, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(819, 2, 1372259021, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(820, 2, 1372259021, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(821, 2, 1372259021, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(822, 2, 1372259021, 'enrol_ldap', 'category', '1', NULL),
(823, 2, 1372259021, 'enrol_manual', 'roleid', '5', NULL),
(824, 2, 1372259021, 'enrol_meta', 'nosyncroleids', '', NULL),
(825, 2, 1372259021, 'enrol_meta', 'syncall', '1', NULL),
(826, 2, 1372259021, 'enrol_meta', 'unenrolaction', '3', NULL),
(827, 2, 1372259021, 'enrol_mnet', 'roleid', '5', NULL),
(828, 2, 1372259021, 'enrol_mnet', 'roleid_adv', '1', NULL),
(829, 2, 1372259021, 'enrol_paypal', 'roleid', '5', NULL),
(830, 2, 1372259021, 'enrol_self', 'roleid', '5', NULL),
(831, 2, 1372259021, NULL, 'profileroles', '5,4,3', NULL),
(832, 2, 1372259021, NULL, 'coursecontact', '3', NULL),
(833, 2, 1372259021, NULL, 'frontpage', '6', NULL),
(834, 2, 1372259021, NULL, 'frontpageloggedin', '6', NULL),
(835, 2, 1372259021, NULL, 'maxcategorydepth', '2', NULL),
(836, 2, 1372259021, NULL, 'frontpagecourselimit', '200', NULL),
(837, 2, 1372259021, NULL, 'commentsperpage', '15', NULL),
(838, 2, 1372259021, NULL, 'defaultfrontpageroleid', '8', NULL),
(839, 2, 1372259021, NULL, 'supportname', 'Administrador Principal', NULL),
(840, 2, 1372259021, NULL, 'supportemail', 'lau.ibarra@gmail.com', NULL),
(841, 2, 1372259112, NULL, 'registerauth', '', NULL),
(842, 2, 1372342281, NULL, 'autolang', '0', '1'),
(843, 2, 1372422689, 'theme_afterburner', 'logo', '/logo etisig.jpg', ''),
(844, 2, 1372424014, 'theme_afterburner', 'logo', '/logo.jpg', '/logo etisig.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'core',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=911 ;

--
-- Volcar la base de datos para la tabla `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'visible', '1'),
(2, 'moodlecourse', 'format', 'weeks'),
(3, 'moodlecourse', 'maxsections', '52'),
(4, 'moodlecourse', 'numsections', '10'),
(5, 'moodlecourse', 'hiddensections', '0'),
(6, 'moodlecourse', 'coursedisplay', '0'),
(7, 'moodlecourse', 'lang', ''),
(8, 'moodlecourse', 'newsitems', '5'),
(9, 'moodlecourse', 'showgrades', '1'),
(10, 'moodlecourse', 'showreports', '0'),
(11, 'moodlecourse', 'maxbytes', '0'),
(12, 'moodlecourse', 'enablecompletion', '0'),
(13, 'moodlecourse', 'groupmode', '0'),
(14, 'moodlecourse', 'groupmodeforce', '0'),
(15, 'backup', 'loglifetime', '30'),
(16, 'backup', 'backup_general_users', '1'),
(17, 'backup', 'backup_general_users_locked', '0'),
(18, 'backup', 'backup_general_anonymize', '0'),
(19, 'backup', 'backup_general_anonymize_locked', '0'),
(20, 'backup', 'backup_general_role_assignments', '1'),
(21, 'backup', 'backup_general_role_assignments_locked', '0'),
(22, 'backup', 'backup_general_activities', '1'),
(23, 'backup', 'backup_general_activities_locked', '0'),
(24, 'backup', 'backup_general_blocks', '1'),
(25, 'backup', 'backup_general_blocks_locked', '0'),
(26, 'backup', 'backup_general_filters', '1'),
(27, 'backup', 'backup_general_filters_locked', '0'),
(28, 'backup', 'backup_general_comments', '1'),
(29, 'backup', 'backup_general_comments_locked', '0'),
(30, 'backup', 'backup_general_userscompletion', '1'),
(31, 'backup', 'backup_general_userscompletion_locked', '0'),
(32, 'backup', 'backup_general_logs', '0'),
(33, 'backup', 'backup_general_logs_locked', '0'),
(34, 'backup', 'backup_general_histories', '0'),
(35, 'backup', 'backup_general_histories_locked', '0'),
(36, 'backup', 'import_general_maxresults', '10'),
(37, 'backup', 'backup_auto_active', '0'),
(38, 'backup', 'backup_auto_weekdays', '0000000'),
(39, 'backup', 'backup_auto_hour', '0'),
(40, 'backup', 'backup_auto_minute', '0'),
(41, 'backup', 'backup_auto_storage', '0'),
(42, 'backup', 'backup_auto_destination', ''),
(43, 'backup', 'backup_auto_keep', '1'),
(44, 'backup', 'backup_shortname', '0'),
(45, 'backup', 'backup_auto_skip_hidden', '1'),
(46, 'backup', 'backup_auto_skip_modif_days', '30'),
(47, 'backup', 'backup_auto_skip_modif_prev', '0'),
(48, 'backup', 'backup_auto_users', '1'),
(49, 'backup', 'backup_auto_role_assignments', '1'),
(50, 'backup', 'backup_auto_activities', '1'),
(51, 'backup', 'backup_auto_blocks', '1'),
(52, 'backup', 'backup_auto_filters', '1'),
(53, 'backup', 'backup_auto_comments', '1'),
(54, 'backup', 'backup_auto_userscompletion', '1'),
(55, 'backup', 'backup_auto_logs', '0'),
(56, 'backup', 'backup_auto_histories', '0'),
(57, 'block_course_overview', 'defaultmaxcourses', '10'),
(58, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(59, 'block_course_overview', 'showchildren', '0'),
(60, 'block_course_overview', 'showwelcomearea', '0'),
(61, 'block_section_links', 'numsections1', '22'),
(62, 'block_section_links', 'incby1', '2'),
(63, 'block_section_links', 'numsections2', '40'),
(64, 'block_section_links', 'incby2', '5'),
(65, 'enrol_database', 'dbtype', ''),
(66, 'enrol_database', 'dbhost', 'localhost'),
(67, 'enrol_database', 'dbuser', ''),
(68, 'enrol_database', 'dbpass', ''),
(69, 'enrol_database', 'dbname', ''),
(70, 'enrol_database', 'dbencoding', 'utf-8'),
(71, 'enrol_database', 'dbsetupsql', ''),
(72, 'enrol_database', 'dbsybasequoting', '0'),
(73, 'enrol_database', 'debugdb', '0'),
(74, 'enrol_database', 'localcoursefield', 'idnumber'),
(75, 'enrol_database', 'localuserfield', 'idnumber'),
(76, 'enrol_database', 'localrolefield', 'shortname'),
(77, 'enrol_database', 'localcategoryfield', 'id'),
(78, 'enrol_database', 'remoteenroltable', ''),
(79, 'enrol_database', 'remotecoursefield', ''),
(80, 'enrol_database', 'remoteuserfield', ''),
(81, 'enrol_database', 'remoterolefield', ''),
(82, 'enrol_database', 'ignorehiddencourses', '0'),
(83, 'enrol_database', 'unenrolaction', '0'),
(84, 'enrol_database', 'newcoursetable', ''),
(85, 'enrol_database', 'newcoursefullname', 'fullname'),
(86, 'enrol_database', 'newcourseshortname', 'shortname'),
(87, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(88, 'enrol_database', 'newcoursecategory', ''),
(89, 'enrol_database', 'templatecourse', ''),
(90, 'enrol_flatfile', 'location', ''),
(91, 'enrol_flatfile', 'encoding', 'UTF-8'),
(92, 'enrol_flatfile', 'mailstudents', '0'),
(93, 'enrol_flatfile', 'mailteachers', '0'),
(94, 'enrol_flatfile', 'mailadmins', '0'),
(95, 'enrol_flatfile', 'unenrolaction', '3'),
(96, 'enrol_flatfile', 'expiredaction', '3'),
(97, 'enrol_guest', 'requirepassword', '0'),
(98, 'enrol_guest', 'usepasswordpolicy', '0'),
(99, 'enrol_guest', 'showhint', '0'),
(100, 'enrol_guest', 'defaultenrol', '1'),
(101, 'enrol_guest', 'status', '1'),
(102, 'enrol_guest', 'status_adv', '0'),
(103, 'enrol_imsenterprise', 'imsfilelocation', ''),
(104, 'enrol_imsenterprise', 'logtolocation', ''),
(105, 'enrol_imsenterprise', 'mailadmins', '0'),
(106, 'enrol_imsenterprise', 'createnewusers', '0'),
(107, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(108, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(109, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(110, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(111, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(112, 'enrol_imsenterprise', 'createnewcourses', '0'),
(113, 'enrol_imsenterprise', 'createnewcategories', '0'),
(114, 'enrol_imsenterprise', 'imsunenrol', '0'),
(115, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(116, 'enrol_imsenterprise', 'imscapitafix', '0'),
(117, 'enrol_ldap', 'host_url', ''),
(118, 'enrol_ldap', 'start_tls', '0'),
(119, 'enrol_ldap', 'ldap_version', '3'),
(120, 'enrol_ldap', 'ldapencoding', 'utf-8'),
(121, 'enrol_ldap', 'pagesize', '250'),
(122, 'enrol_ldap', 'bind_dn', ''),
(123, 'enrol_ldap', 'bind_pw', ''),
(124, 'enrol_ldap', 'course_search_sub', '0'),
(125, 'enrol_ldap', 'memberattribute_isdn', '0'),
(126, 'enrol_ldap', 'user_contexts', ''),
(127, 'enrol_ldap', 'user_search_sub', '0'),
(128, 'enrol_ldap', 'user_type', 'default'),
(129, 'enrol_ldap', 'opt_deref', '0'),
(130, 'enrol_ldap', 'idnumber_attribute', ''),
(131, 'enrol_ldap', 'objectclass', '(objectClass=*)'),
(132, 'enrol_ldap', 'course_idnumber', ''),
(133, 'enrol_ldap', 'course_shortname', ''),
(134, 'enrol_ldap', 'course_fullname', ''),
(135, 'enrol_ldap', 'course_summary', ''),
(136, 'enrol_ldap', 'ignorehiddencourses', '0'),
(137, 'enrol_ldap', 'unenrolaction', '0'),
(138, 'enrol_ldap', 'autocreate', '0'),
(139, 'enrol_ldap', 'template', ''),
(140, 'enrol_ldap', 'nested_groups', '0'),
(141, 'enrol_ldap', 'group_memberofattribute', ''),
(142, 'enrol_manual', 'expiredaction', '1'),
(143, 'enrol_manual', 'expirynotifyhour', '6'),
(144, 'enrol_manual', 'defaultenrol', '1'),
(145, 'enrol_manual', 'status', '0'),
(146, 'enrol_manual', 'enrolperiod', '0'),
(147, 'enrol_manual', 'expirynotify', '0'),
(148, 'enrol_manual', 'expirythreshold', '86400'),
(149, 'enrol_paypal', 'paypalbusiness', ''),
(150, 'enrol_paypal', 'mailstudents', '0'),
(151, 'enrol_paypal', 'mailteachers', '0'),
(152, 'enrol_paypal', 'mailadmins', '0'),
(153, 'enrol_paypal', 'expiredaction', '3'),
(154, 'enrol_paypal', 'status', '1'),
(155, 'enrol_paypal', 'cost', '0'),
(156, 'enrol_paypal', 'currency', 'USD'),
(157, 'enrol_paypal', 'enrolperiod', '0'),
(158, 'enrol_self', 'requirepassword', '0'),
(159, 'enrol_self', 'usepasswordpolicy', '0'),
(160, 'enrol_self', 'showhint', '0'),
(161, 'enrol_self', 'expiredaction', '1'),
(162, 'enrol_self', 'expirynotifyhour', '6'),
(163, 'enrol_self', 'defaultenrol', '1'),
(164, 'enrol_self', 'status', '1'),
(165, 'enrol_self', 'newenrols', '1'),
(166, 'enrol_self', 'groupkey', '0'),
(167, 'enrol_self', 'enrolperiod', '0'),
(168, 'enrol_self', 'expirynotify', '0'),
(169, 'enrol_self', 'expirythreshold', '86400'),
(170, 'enrol_self', 'longtimenosee', '0'),
(171, 'enrol_self', 'maxenrolled', '0'),
(172, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(173, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\n\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\n\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code'),
(174, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(175, 'editor_tinymce', 'customconfig', ''),
(176, 'tinymce_dragmath', 'requiretex', '1'),
(177, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(178, 'tinymce_spellchecker', 'spellengine', 'GoogleSpell'),
(179, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(180, 'filter_urltolink', 'formats', '0'),
(181, 'filter_urltolink', 'embedimages', '1'),
(182, 'filter_emoticon', 'formats', '1,4,0'),
(183, 'question_preview', 'behaviour', 'deferredfeedback'),
(184, 'question_preview', 'correctness', '1'),
(185, 'question_preview', 'marks', '1'),
(186, 'question_preview', 'markdp', '2'),
(187, 'question_preview', 'feedback', '1'),
(188, 'question_preview', 'generalfeedback', '1'),
(189, 'question_preview', 'rightanswer', '1'),
(190, 'question_preview', 'history', '0'),
(191, 'cachestore_memcache', 'testservers', ''),
(192, 'cachestore_memcached', 'testservers', ''),
(193, 'cachestore_mongodb', 'testserver', ''),
(194, 'theme_afterburner', 'logo', '/logo.jpg'),
(195, 'theme_afterburner', 'footnote', ''),
(196, 'theme_afterburner', 'customcss', ''),
(197, 'theme_anomaly', 'tagline', ''),
(198, 'theme_anomaly', 'customcss', ''),
(199, 'theme_arialist', 'logo', ''),
(200, 'theme_arialist', 'tagline', ''),
(201, 'theme_arialist', 'linkcolor', '#f25f0f'),
(202, 'theme_arialist', 'regionwidth', '250'),
(203, 'theme_arialist', 'customcss', ''),
(204, 'theme_brick', 'logo', ''),
(205, 'theme_brick', 'linkcolor', '#06365b'),
(206, 'theme_brick', 'linkhover', '#5487ad'),
(207, 'theme_brick', 'maincolor', '#8e2800'),
(208, 'theme_brick', 'maincolorlink', '#fff0a5'),
(209, 'theme_brick', 'headingcolor', '#5c3500'),
(210, 'theme_clean', 'invert', '0'),
(211, 'theme_clean', 'logo', ''),
(212, 'theme_clean', 'customcss', ''),
(213, 'theme_clean', 'footnote', ''),
(214, 'theme_formal_white', 'fontsizereference', '13'),
(215, 'theme_formal_white', 'noframe', '0'),
(216, 'theme_formal_white', 'framemargin', '15'),
(217, 'theme_formal_white', 'headercontent', '1'),
(218, 'theme_formal_white', 'customlogourl', ''),
(219, 'theme_formal_white', 'frontpagelogourl', ''),
(220, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(221, 'theme_formal_white', 'creditstomoodleorg', '2'),
(222, 'theme_formal_white', 'blockcolumnwidth', '200'),
(223, 'theme_formal_white', 'blockpadding', '8'),
(224, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(225, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(226, 'theme_formal_white', 'rblockcolumnbgc', ''),
(227, 'theme_formal_white', 'footnote', ''),
(228, 'theme_formal_white', 'customcss', ''),
(229, 'theme_fusion', 'linkcolor', '#2d83d5'),
(230, 'theme_fusion', 'tagline', ''),
(231, 'theme_fusion', 'footertext', ''),
(232, 'theme_fusion', 'customcss', ''),
(233, 'theme_magazine', 'background', ''),
(234, 'theme_magazine', 'logo', ''),
(235, 'theme_magazine', 'linkcolor', '#32529a'),
(236, 'theme_magazine', 'linkhover', '#4e2300'),
(237, 'theme_magazine', 'maincolor', '#002f2f'),
(238, 'theme_magazine', 'maincoloraccent', '#092323'),
(239, 'theme_magazine', 'headingcolor', '#4e0000'),
(240, 'theme_magazine', 'blockcolor', '#002f2f'),
(241, 'theme_magazine', 'forumback', '#e6e2af'),
(242, 'theme_mymobile', 'colourswatch', 'light'),
(243, 'theme_mymobile', 'showmobileintro', ''),
(244, 'theme_mymobile', 'showsitetopic', 'topicshow'),
(245, 'theme_mymobile', 'showfullsizeimages', 'ithumb'),
(246, 'theme_mymobile', 'usetableview', 'tabshow'),
(247, 'theme_mymobile', 'customcss', ''),
(248, 'theme_nimble', 'tagline', ''),
(249, 'theme_nimble', 'footerline', ''),
(250, 'theme_nimble', 'backgroundcolor', '#454545'),
(251, 'theme_nimble', 'linkcolor', '#2a65b1'),
(252, 'theme_nimble', 'linkhover', '#222222'),
(253, 'theme_nonzero', 'regionprewidth', '200'),
(254, 'theme_nonzero', 'regionpostwidth', '200'),
(255, 'theme_nonzero', 'customcss', ''),
(256, 'theme_overlay', 'linkcolor', '#428ab5'),
(257, 'theme_overlay', 'headercolor', '#2a4c7b'),
(258, 'theme_overlay', 'footertext', ''),
(259, 'theme_overlay', 'customcss', ''),
(260, 'theme_sky_high', 'logo', ''),
(261, 'theme_sky_high', 'regionwidth', '240'),
(262, 'theme_sky_high', 'footnote', ''),
(263, 'theme_sky_high', 'customcss', ''),
(264, 'theme_splash', 'logo', ''),
(265, 'theme_splash', 'tagline', 'Centro de aprendizaje virtual'),
(266, 'theme_splash', 'hide_tagline', '0'),
(267, 'theme_splash', 'footnote', ''),
(268, 'theme_splash', 'customcss', ''),
(269, 'qtype_calculated', 'version', '2013050100'),
(270, 'qtype_calculatedmulti', 'version', '2013050100'),
(271, 'qtype_calculatedsimple', 'version', '2013050100'),
(272, 'qtype_description', 'version', '2013050100'),
(273, 'qtype_essay', 'version', '2013050100'),
(274, 'qtype_match', 'version', '2013050100'),
(275, 'qtype_missingtype', 'version', '2013050100'),
(276, 'qtype_multianswer', 'version', '2013050100'),
(277, 'qtype_multichoice', 'version', '2013050100'),
(278, 'qtype_numerical', 'version', '2013050100'),
(279, 'qtype_random', 'version', '2013050100'),
(280, 'qtype_randomsamatch', 'version', '2013050100'),
(281, 'qtype_shortanswer', 'version', '2013050100'),
(282, 'qtype_truefalse', 'version', '2013050100'),
(291, 'auth_cas', 'version', '2013050100'),
(293, 'auth_db', 'version', '2013050100'),
(295, 'auth_email', 'version', '2013050100'),
(296, 'auth_fc', 'version', '2013050100'),
(298, 'auth_imap', 'version', '2013050100'),
(300, 'auth_ldap', 'version', '2013050100'),
(302, 'auth_manual', 'version', '2013050100'),
(303, 'auth_mnet', 'version', '2013050100'),
(305, 'auth_nntp', 'version', '2013050100'),
(307, 'auth_nologin', 'version', '2013050100'),
(308, 'auth_none', 'version', '2013050100'),
(309, 'auth_pam', 'version', '2013050100'),
(311, 'auth_pop3', 'version', '2013050100'),
(313, 'auth_radius', 'version', '2013050100'),
(315, 'auth_shibboleth', 'version', '2013050100'),
(317, 'auth_webservice', 'version', '2013050100'),
(318, 'enrol_authorize', 'version', '2013050100'),
(319, 'enrol_category', 'version', '2013050100'),
(321, 'enrol_cohort', 'version', '2013050100'),
(322, 'enrol_database', 'version', '2013050100'),
(324, 'enrol_flatfile', 'version', '2013050100'),
(326, 'enrol_flatfile', 'map_1', 'manager'),
(327, 'enrol_flatfile', 'map_2', 'coursecreator'),
(328, 'enrol_flatfile', 'map_3', 'editingteacher'),
(329, 'enrol_flatfile', 'map_4', 'teacher'),
(330, 'enrol_flatfile', 'map_5', 'student'),
(331, 'enrol_flatfile', 'map_6', 'guest'),
(332, 'enrol_flatfile', 'map_7', 'user'),
(333, 'enrol_flatfile', 'map_8', 'frontpage'),
(334, 'enrol_guest', 'version', '2013050100'),
(335, 'enrol_imsenterprise', 'version', '2013050100'),
(337, 'enrol_ldap', 'version', '2013050100'),
(339, 'enrol_manual', 'version', '2013050100'),
(341, 'enrol_meta', 'version', '2013050100'),
(343, 'enrol_mnet', 'version', '2013050100'),
(344, 'enrol_paypal', 'version', '2013050100'),
(345, 'enrol_self', 'version', '2013050100'),
(347, 'message_email', 'version', '2013050100'),
(349, 'message', 'email_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(350, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedin', 'email'),
(351, 'message', 'message_provider_enrol_authorize_authorize_enrolment_loggedoff', 'email'),
(352, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(353, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(354, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(355, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(356, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(357, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(358, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(359, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(360, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(361, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(362, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(363, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(364, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(365, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(366, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(367, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(368, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(369, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(370, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(371, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(372, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(373, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(374, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(375, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(376, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(377, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(378, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(379, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(380, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(381, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(382, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(383, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(384, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(385, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(386, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(387, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(388, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(389, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(390, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(391, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(392, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(393, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(394, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(395, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(396, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(397, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(398, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(399, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(400, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(401, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(402, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(403, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(404, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(405, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(406, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(407, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(408, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(409, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(410, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(411, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(412, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(413, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(414, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(415, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(416, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(417, 'message_jabber', 'version', '2013050100'),
(419, 'message', 'jabber_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(420, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(421, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(422, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(423, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(424, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(425, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(426, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(427, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(428, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(429, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(430, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(431, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(432, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(433, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(434, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(435, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(436, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(437, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(438, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(439, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(440, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(441, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(442, 'message_popup', 'version', '2013050100'),
(444, 'message', 'popup_provider_enrol_authorize_authorize_enrolment_permitted', 'permitted'),
(445, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(446, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(447, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(448, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(449, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(450, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(451, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(452, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(453, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(454, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(455, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(456, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(457, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(458, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(459, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(460, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(461, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(462, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(463, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(464, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(465, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(466, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(467, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(469, 'filter_activitynames', 'version', '2013050100'),
(471, 'filter_algebra', 'version', '2013050100'),
(472, 'filter_censor', 'version', '2013050100'),
(473, 'filter_data', 'version', '2013050100'),
(475, 'filter_emailprotect', 'version', '2013050100'),
(476, 'filter_emoticon', 'version', '2013050100'),
(477, 'filter_glossary', 'version', '2013050100'),
(479, 'filter_mediaplugin', 'version', '2013050100'),
(481, 'filter_multilang', 'version', '2013050100'),
(482, 'filter_tex', 'version', '2013050100'),
(484, 'filter_tidy', 'version', '2013050100'),
(485, 'filter_urltolink', 'version', '2013050100'),
(486, 'editor_textarea', 'version', '2013050100'),
(487, 'editor_tinymce', 'version', '2013050100'),
(488, 'format_scorm', 'version', '2013050100'),
(489, 'format_social', 'version', '2013050100'),
(490, 'format_topics', 'version', '2013050100'),
(491, 'format_weeks', 'version', '2013050100'),
(492, 'profilefield_checkbox', 'version', '2013050100'),
(493, 'profilefield_datetime', 'version', '2013050100'),
(494, 'profilefield_menu', 'version', '2013050100'),
(495, 'profilefield_text', 'version', '2013050100'),
(496, 'profilefield_textarea', 'version', '2013050100'),
(497, 'report_backups', 'version', '2013050100'),
(498, 'report_completion', 'version', '2013050100'),
(500, 'report_configlog', 'version', '2013050100'),
(501, 'report_courseoverview', 'version', '2013050100'),
(502, 'report_log', 'version', '2013050100'),
(504, 'report_loglive', 'version', '2013050100'),
(505, 'report_outline', 'version', '2013050100'),
(507, 'report_participation', 'version', '2013050100'),
(509, 'report_performance', 'version', '2013050100'),
(510, 'report_progress', 'version', '2013050100'),
(512, 'report_questioninstances', 'version', '2013050100'),
(513, 'report_security', 'version', '2013050100'),
(514, 'report_stats', 'version', '2013050100'),
(516, 'gradeexport_ods', 'version', '2013050100'),
(517, 'gradeexport_txt', 'version', '2013050100'),
(518, 'gradeexport_xls', 'version', '2013050100'),
(519, 'gradeexport_xml', 'version', '2013050100'),
(520, 'gradeimport_csv', 'version', '2013050100'),
(521, 'gradeimport_xml', 'version', '2013050100'),
(522, 'gradereport_grader', 'version', '2013050100'),
(523, 'gradereport_outcomes', 'version', '2013050100'),
(524, 'gradereport_overview', 'version', '2013050100'),
(525, 'gradereport_user', 'version', '2013050100'),
(526, 'gradingform_guide', 'version', '2013050100'),
(527, 'gradingform_rubric', 'version', '2013050100'),
(528, 'mnetservice_enrol', 'version', '2013050100'),
(529, 'webservice_amf', 'version', '2013050100'),
(530, 'webservice_rest', 'version', '2013050100'),
(531, 'webservice_soap', 'version', '2013050100'),
(532, 'webservice_xmlrpc', 'version', '2013050100'),
(533, 'repository_alfresco', 'version', '2013050100'),
(534, 'repository_boxnet', 'version', '2013050100'),
(535, 'repository_coursefiles', 'version', '2013050100'),
(536, 'repository_dropbox', 'version', '2013050100'),
(537, 'repository_equella', 'version', '2013050100'),
(538, 'repository_filesystem', 'version', '2013050100'),
(539, 'repository_flickr', 'version', '2013050100'),
(540, 'repository_flickr_public', 'version', '2013050100'),
(541, 'repository_googledocs', 'version', '2013050100'),
(542, 'repository_local', 'version', '2013050100'),
(544, 'local', 'enablecourseinstances', '0'),
(545, 'local', 'enableuserinstances', '0'),
(546, 'repository_merlot', 'version', '2013050100'),
(547, 'repository_picasa', 'version', '2013050100'),
(548, 'repository_recent', 'version', '2013050100'),
(550, 'recent', 'enablecourseinstances', '0'),
(551, 'recent', 'enableuserinstances', '0'),
(552, 'repository_s3', 'version', '2013050100'),
(553, 'repository_upload', 'version', '2013050100'),
(555, 'upload', 'enablecourseinstances', '0'),
(556, 'upload', 'enableuserinstances', '0'),
(557, 'repository_url', 'version', '2013050100'),
(559, 'url', 'enablecourseinstances', '0'),
(560, 'url', 'enableuserinstances', '0'),
(561, 'repository_user', 'version', '2013050100'),
(563, 'user', 'enablecourseinstances', '0'),
(564, 'user', 'enableuserinstances', '0'),
(565, 'repository_webdav', 'version', '2013050100'),
(566, 'repository_wikimedia', 'version', '2013050100'),
(568, 'wikimedia', 'enablecourseinstances', '0'),
(569, 'wikimedia', 'enableuserinstances', '0'),
(570, 'repository_youtube', 'version', '2013050100'),
(572, 'youtube', 'enablecourseinstances', '0'),
(573, 'youtube', 'enableuserinstances', '0'),
(574, 'portfolio_boxnet', 'version', '2013050100'),
(575, 'portfolio_download', 'version', '2013050100'),
(576, 'portfolio_flickr', 'version', '2013050100'),
(577, 'portfolio_googledocs', 'version', '2013050100'),
(578, 'portfolio_mahara', 'version', '2013050100'),
(579, 'portfolio_picasa', 'version', '2013050100'),
(580, 'qbehaviour_adaptive', 'version', '2013050100'),
(581, 'qbehaviour_adaptivenopenalty', 'version', '2013050100'),
(582, 'qbehaviour_deferredcbm', 'version', '2013050100'),
(583, 'qbehaviour_deferredfeedback', 'version', '2013050100'),
(584, 'qbehaviour_immediatecbm', 'version', '2013050100'),
(585, 'qbehaviour_immediatefeedback', 'version', '2013050100'),
(586, 'qbehaviour_informationitem', 'version', '2013050100'),
(587, 'qbehaviour_interactive', 'version', '2013050100'),
(588, 'qbehaviour_interactivecountback', 'version', '2013050100'),
(589, 'qbehaviour_manualgraded', 'version', '2013050800'),
(591, 'question', 'disabledbehaviours', 'manualgraded'),
(592, 'qbehaviour_missing', 'version', '2013050100'),
(593, 'qformat_aiken', 'version', '2013050100'),
(594, 'qformat_blackboard_six', 'version', '2013050100'),
(595, 'qformat_examview', 'version', '2013050100'),
(596, 'qformat_gift', 'version', '2013050100'),
(597, 'qformat_learnwise', 'version', '2013050100'),
(598, 'qformat_missingword', 'version', '2013050100'),
(599, 'qformat_multianswer', 'version', '2013050100'),
(600, 'qformat_webct', 'version', '2013050100'),
(601, 'qformat_xhtml', 'version', '2013050100'),
(602, 'qformat_xml', 'version', '2013050100'),
(603, 'tool_assignmentupgrade', 'version', '2013050100'),
(604, 'tool_behat', 'version', '2013050100'),
(605, 'tool_capability', 'version', '2013050100'),
(606, 'tool_customlang', 'version', '2013050100'),
(608, 'tool_dbtransfer', 'version', '2013050100'),
(609, 'tool_generator', 'version', '2013050100'),
(610, 'tool_health', 'version', '2013050100'),
(611, 'tool_innodb', 'version', '2013050100'),
(612, 'tool_installaddon', 'version', '2013050100'),
(613, 'tool_langimport', 'version', '2013050100'),
(614, 'tool_multilangupgrade', 'version', '2013050100'),
(615, 'tool_phpunit', 'version', '2013050100'),
(616, 'tool_profiling', 'version', '2013050100'),
(617, 'tool_qeupgradehelper', 'version', '2013050100'),
(619, 'tool_replace', 'version', '2013050100'),
(620, 'tool_spamcleaner', 'version', '2013050100'),
(621, 'tool_timezoneimport', 'version', '2013050100'),
(622, 'tool_unsuproles', 'version', '2013050100'),
(624, 'tool_uploaduser', 'version', '2013050100'),
(625, 'tool_xmldb', 'version', '2013050100'),
(626, 'cachestore_file', 'version', '2013050100'),
(627, 'cachestore_memcache', 'version', '2013050700'),
(628, 'cachestore_memcached', 'version', '2013050100'),
(629, 'cachestore_mongodb', 'version', '2013050100'),
(630, 'cachestore_session', 'version', '2013050100'),
(631, 'cachestore_static', 'version', '2013050100'),
(632, 'theme_afterburner', 'version', '2013050100'),
(633, 'theme_anomaly', 'version', '2013050100'),
(634, 'theme_arialist', 'version', '2013050100'),
(635, 'theme_base', 'version', '2013050100'),
(636, 'theme_binarius', 'version', '2013050100'),
(637, 'theme_bootstrapbase', 'version', '2013050100'),
(638, 'theme_boxxie', 'version', '2013050100'),
(639, 'theme_brick', 'version', '2013050100'),
(640, 'theme_canvas', 'version', '2013050100'),
(641, 'theme_clean', 'version', '2013050100'),
(642, 'theme_formal_white', 'version', '2013050100'),
(644, 'theme_formfactor', 'version', '2013050100'),
(645, 'theme_fusion', 'version', '2013050100'),
(646, 'theme_leatherbound', 'version', '2013050100'),
(647, 'theme_magazine', 'version', '2013050100'),
(648, 'theme_mymobile', 'version', '2013050100'),
(649, 'theme_nimble', 'version', '2013050100'),
(650, 'theme_nonzero', 'version', '2013050100'),
(651, 'theme_overlay', 'version', '2013050100'),
(652, 'theme_serenity', 'version', '2013050100'),
(653, 'theme_sky_high', 'version', '2013050100'),
(654, 'theme_splash', 'version', '2013050100'),
(655, 'theme_standard', 'version', '2013050100'),
(656, 'theme_standardold', 'version', '2013050100'),
(657, 'assignsubmission_comments', 'version', '2013050100'),
(659, 'assignsubmission_file', 'sortorder', '1'),
(660, 'assignsubmission_comments', 'sortorder', '2'),
(661, 'assignsubmission_onlinetext', 'sortorder', '0'),
(662, 'assignsubmission_file', 'version', '2013050100'),
(663, 'assignsubmission_onlinetext', 'version', '2013050100'),
(665, 'assignfeedback_comments', 'version', '2013050100'),
(667, 'assignfeedback_comments', 'sortorder', '0'),
(668, 'assignfeedback_file', 'sortorder', '2'),
(669, 'assignfeedback_offline', 'sortorder', '1'),
(670, 'assignfeedback_file', 'version', '2013050100'),
(672, 'assignfeedback_offline', 'version', '2013050100'),
(673, 'assignment_offline', 'version', '2013050100'),
(674, 'assignment_online', 'version', '2013050100'),
(675, 'assignment_upload', 'version', '2013050100'),
(676, 'assignment_uploadsingle', 'version', '2013050100'),
(677, 'booktool_exportimscp', 'version', '2013050100'),
(678, 'booktool_importhtml', 'version', '2013050100'),
(679, 'booktool_print', 'version', '2013050100'),
(680, 'datafield_checkbox', 'version', '2013050100'),
(681, 'datafield_date', 'version', '2013050100'),
(682, 'datafield_file', 'version', '2013050100'),
(683, 'datafield_latlong', 'version', '2013050100'),
(684, 'datafield_menu', 'version', '2013050100'),
(685, 'datafield_multimenu', 'version', '2013050100'),
(686, 'datafield_number', 'version', '2013050100'),
(687, 'datafield_picture', 'version', '2013050100'),
(688, 'datafield_radiobutton', 'version', '2013050100'),
(689, 'datafield_text', 'version', '2013050100'),
(690, 'datafield_textarea', 'version', '2013050100'),
(691, 'datafield_url', 'version', '2013050100'),
(692, 'datapreset_imagegallery', 'version', '2013050100'),
(693, 'quiz_grading', 'version', '2013050100'),
(695, 'quiz_overview', 'version', '2013050100'),
(697, 'quiz_responses', 'version', '2013050100'),
(699, 'quiz_statistics', 'version', '2013050100'),
(701, 'quizaccess_delaybetweenattempts', 'version', '2013050100'),
(702, 'quizaccess_ipaddress', 'version', '2013050100'),
(703, 'quizaccess_numattempts', 'version', '2013050100'),
(704, 'quizaccess_openclosedate', 'version', '2013050100'),
(705, 'quizaccess_password', 'version', '2013050100'),
(706, 'quizaccess_safebrowser', 'version', '2013050100'),
(707, 'quizaccess_securewindow', 'version', '2013050100'),
(708, 'quizaccess_timelimit', 'version', '2013050100'),
(709, 'scormreport_basic', 'version', '2013050100'),
(710, 'scormreport_graphs', 'version', '2013050100'),
(711, 'scormreport_interactions', 'version', '2013050100'),
(712, 'workshopform_accumulative', 'version', '2013050100'),
(714, 'workshopform_comments', 'version', '2013050100'),
(716, 'workshopform_numerrors', 'version', '2013050100'),
(718, 'workshopform_rubric', 'version', '2013050100'),
(720, 'workshopallocation_manual', 'version', '2013050100'),
(721, 'workshopallocation_random', 'version', '2013050100'),
(722, 'workshopallocation_scheduled', 'version', '2013050100'),
(723, 'workshopeval_best', 'version', '2013050100'),
(724, 'tinymce_ctrlhelp', 'version', '2013050100'),
(725, 'tinymce_dragmath', 'version', '2013050100'),
(726, 'tinymce_moodleemoticon', 'version', '2013050100'),
(727, 'tinymce_moodleimage', 'version', '2013050100'),
(728, 'tinymce_moodlemedia', 'version', '2013050100'),
(729, 'tinymce_moodlenolink', 'version', '2013050100'),
(730, 'tinymce_spellchecker', 'version', '2013050100'),
(732, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(733, 'assign', 'showrecentsubmissions', '0'),
(734, 'assign', 'submissionreceipts', '1'),
(735, 'assign', 'submissionstatement', 'Confirmo que este trabajo es de elaboración propia, excepto aquellas partes en las que haya reconocido la autoría de la obra o parte de ella a otras personas.'),
(736, 'assign', 'requiresubmissionstatement', '0'),
(737, 'book', 'requiremodintro', '1'),
(738, 'book', 'numberingoptions', '0,1,2,3'),
(739, 'book', 'numbering', '1'),
(740, 'folder', 'requiremodintro', '1'),
(741, 'folder', 'showexpanded', '1'),
(742, 'imscp', 'requiremodintro', '1'),
(743, 'imscp', 'keepold', '1'),
(744, 'imscp', 'keepold_adv', '0'),
(745, 'label', 'dndmedia', '1'),
(746, 'label', 'dndresizewidth', '400'),
(747, 'label', 'dndresizeheight', '400'),
(748, 'page', 'requiremodintro', '1'),
(749, 'page', 'displayoptions', '5'),
(750, 'page', 'printheading', '1'),
(751, 'page', 'printintro', '0'),
(752, 'page', 'display', '5'),
(753, 'page', 'popupwidth', '620'),
(754, 'page', 'popupheight', '450'),
(755, 'quiz', 'timelimit', '0'),
(756, 'quiz', 'timelimit_adv', '0'),
(757, 'quiz', 'overduehandling', 'autoabandon'),
(758, 'quiz', 'overduehandling_adv', '0'),
(759, 'quiz', 'graceperiod', '86400'),
(760, 'quiz', 'graceperiod_adv', '0'),
(761, 'quiz', 'graceperiodmin', '60'),
(762, 'quiz', 'attempts', '0'),
(763, 'quiz', 'attempts_adv', '0'),
(764, 'quiz', 'grademethod', '1'),
(765, 'quiz', 'grademethod_adv', '0'),
(766, 'quiz', 'maximumgrade', '10'),
(767, 'quiz', 'shufflequestions', '0'),
(768, 'quiz', 'shufflequestions_adv', '0'),
(769, 'quiz', 'questionsperpage', '1'),
(770, 'quiz', 'questionsperpage_adv', '0'),
(771, 'quiz', 'navmethod', 'free'),
(772, 'quiz', 'navmethod_adv', '1'),
(773, 'quiz', 'shuffleanswers', '1'),
(774, 'quiz', 'shuffleanswers_adv', '0'),
(775, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(776, 'quiz', 'attemptonlast', '0'),
(777, 'quiz', 'attemptonlast_adv', '1'),
(778, 'quiz', 'reviewattempt', '69904'),
(779, 'quiz', 'reviewcorrectness', '69904'),
(780, 'quiz', 'reviewmarks', '69904'),
(781, 'quiz', 'reviewspecificfeedback', '69904'),
(782, 'quiz', 'reviewgeneralfeedback', '69904'),
(783, 'quiz', 'reviewrightanswer', '69904'),
(784, 'quiz', 'reviewoverallfeedback', '4368'),
(785, 'quiz', 'showuserpicture', '0'),
(786, 'quiz', 'showuserpicture_adv', '0'),
(787, 'quiz', 'decimalpoints', '2'),
(788, 'quiz', 'decimalpoints_adv', '0'),
(789, 'quiz', 'questiondecimalpoints', '-1'),
(790, 'quiz', 'questiondecimalpoints_adv', '1'),
(791, 'quiz', 'showblocks', '0'),
(792, 'quiz', 'showblocks_adv', '1'),
(793, 'quiz', 'password', ''),
(794, 'quiz', 'password_adv', '1'),
(795, 'quiz', 'subnet', ''),
(796, 'quiz', 'subnet_adv', '1'),
(797, 'quiz', 'delay1', '0'),
(798, 'quiz', 'delay1_adv', '1'),
(799, 'quiz', 'delay2', '0'),
(800, 'quiz', 'delay2_adv', '1'),
(801, 'quiz', 'browsersecurity', '-'),
(802, 'quiz', 'browsersecurity_adv', '1'),
(803, 'quiz', 'autosaveperiod', '0'),
(804, 'resource', 'framesize', '130'),
(805, 'resource', 'requiremodintro', '1'),
(806, 'resource', 'displayoptions', '0,1,4,5,6'),
(807, 'resource', 'printheading', '0'),
(808, 'resource', 'printintro', '1'),
(809, 'resource', 'display', '0'),
(810, 'resource', 'showsize', '0'),
(811, 'resource', 'showtype', '0'),
(812, 'resource', 'popupwidth', '620'),
(813, 'resource', 'popupheight', '450'),
(814, 'resource', 'filterfiles', '0'),
(815, 'scorm', 'displaycoursestructure', '0'),
(816, 'scorm', 'displaycoursestructure_adv', '0'),
(817, 'scorm', 'popup', '0'),
(818, 'scorm', 'popup_adv', '0'),
(819, 'scorm', 'framewidth', '100'),
(820, 'scorm', 'framewidth_adv', '1'),
(821, 'scorm', 'frameheight', '500'),
(822, 'scorm', 'frameheight_adv', '1'),
(823, 'scorm', 'winoptgrp_adv', '1'),
(824, 'scorm', 'resizable', '0'),
(825, 'scorm', 'scrollbars', '0'),
(826, 'scorm', 'directories', '0'),
(827, 'scorm', 'location', '0'),
(828, 'scorm', 'menubar', '0'),
(829, 'scorm', 'toolbar', '0'),
(830, 'scorm', 'status', '0'),
(831, 'scorm', 'skipview', '0'),
(832, 'scorm', 'skipview_adv', '1'),
(833, 'scorm', 'hidebrowse', '0'),
(834, 'scorm', 'hidebrowse_adv', '1'),
(835, 'scorm', 'hidetoc', '0'),
(836, 'scorm', 'hidetoc_adv', '1'),
(837, 'scorm', 'hidenav', '0'),
(838, 'scorm', 'hidenav_adv', '0'),
(839, 'scorm', 'displayattemptstatus', '1'),
(840, 'scorm', 'displayattemptstatus_adv', '0'),
(841, 'scorm', 'grademethod', '1'),
(842, 'scorm', 'maxgrade', '100'),
(843, 'scorm', 'maxattempt', '0'),
(844, 'scorm', 'whatgrade', '0'),
(845, 'scorm', 'forcecompleted', '0'),
(846, 'scorm', 'forcenewattempt', '0'),
(847, 'scorm', 'lastattemptlock', '0'),
(848, 'scorm', 'auto', '0'),
(849, 'scorm', 'updatefreq', '0'),
(850, 'scorm', 'allowtypeexternal', '0'),
(851, 'scorm', 'allowtypelocalsync', '0'),
(852, 'scorm', 'allowtypeimsrepository', '0'),
(853, 'scorm', 'allowtypeexternalaicc', '0'),
(854, 'scorm', 'allowaicchacp', '0'),
(855, 'scorm', 'aicchacptimeout', '30'),
(856, 'scorm', 'aicchacpkeepsessiondata', '1'),
(857, 'scorm', 'forcejavascript', '1'),
(858, 'scorm', 'allowapidebug', '0'),
(859, 'scorm', 'apidebugmask', '.*'),
(860, 'url', 'framesize', '130'),
(861, 'url', 'requiremodintro', '1'),
(862, 'url', 'secretphrase', ''),
(863, 'url', 'rolesinparams', '0'),
(864, 'url', 'displayoptions', '0,1,5,6'),
(865, 'url', 'printheading', '0'),
(866, 'url', 'printintro', '1'),
(867, 'url', 'display', '0'),
(868, 'url', 'popupwidth', '620'),
(869, 'url', 'popupheight', '450'),
(870, 'workshop', 'grade', '80'),
(871, 'workshop', 'gradinggrade', '20'),
(872, 'workshop', 'gradedecimals', '0'),
(873, 'workshop', 'maxbytes', '0'),
(874, 'workshop', 'strategy', 'accumulative'),
(875, 'workshop', 'examplesmode', '0'),
(876, 'workshopallocation_random', 'numofreviews', '5'),
(877, 'workshopform_numerrors', 'grade0', 'No'),
(878, 'workshopform_numerrors', 'grade1', 'Sí'),
(879, 'workshopeval_best', 'comparison', '5'),
(880, 'assignsubmission_file', 'default', '1'),
(881, 'assignsubmission_file', 'maxbytes', '1048576'),
(882, 'assignsubmission_comments', 'default', '0'),
(883, 'assignsubmission_onlinetext', 'default', '0'),
(884, 'assignfeedback_file', 'default', '0'),
(885, 'assignfeedback_comments', 'default', '1'),
(886, 'assignfeedback_offline', 'default', '0'),
(887, 'enrol_cohort', 'roleid', '5'),
(888, 'enrol_cohort', 'unenrolaction', '0'),
(889, 'enrol_database', 'defaultrole', '5'),
(890, 'enrol_database', 'defaultcategory', '1'),
(891, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(892, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(893, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(894, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(895, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(896, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(897, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(898, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(899, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(900, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(901, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(902, 'enrol_ldap', 'category', '1'),
(903, 'enrol_manual', 'roleid', '5'),
(904, 'enrol_meta', 'nosyncroleids', ''),
(905, 'enrol_meta', 'syncall', '1'),
(906, 'enrol_meta', 'unenrolaction', '3'),
(907, 'enrol_mnet', 'roleid', '5'),
(908, 'enrol_mnet', 'roleid_adv', '1'),
(909, 'enrol_paypal', 'roleid', '5'),
(910, 'enrol_self', 'roleid', '5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='one of these must be set' AUTO_INCREMENT=23 ;

--
-- Volcar la base de datos para la tabla `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 50, 2, '/1/3/15', 3),
(16, 80, 10, '/1/3/15/16', 4),
(17, 80, 11, '/1/3/15/17', 4),
(18, 80, 12, '/1/3/15/18', 4),
(19, 80, 13, '/1/3/15/19', 4),
(20, 70, 1, '/1/3/15/20', 4),
(21, 30, 3, '/1/21', 2),
(22, 30, 4, '/1/22', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by build_context_path() in upgrade and cron to keep con';

--
-- Volcar la base de datos para la tabla `mdl_context_temp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `sectioncache` longtext COLLATE utf8_unicode_ci,
  `modinfo` longtext COLLATE utf8_unicode_ci,
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Central course table' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `sectioncache`, `modinfo`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`) VALUES
(1, 0, 1, 'Portal Educativo de Etisig Chaco', 'Etisig', '', '', 0, 'site', 1, 'a:2:{i:0;O:8:"stdClass":2:{s:2:"id";s:1:"1";s:4:"name";N;}i:1;O:8:"stdClass":2:{s:2:"id";s:1:"2";s:4:"name";N;}}', 'a:0:{}', 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', 1372258355, 1372259112, 0, 0, 0),
(2, 1, 10001, 'Agregando un curso', 'Agregar curso', '', '<p>En este curso aprenderemos a cargar un curso en la plataforma para que los alumnos puedan accederlo.</p>', 1, 'weeks', 1, 'a:6:{i:0;O:8:"stdClass":2:{s:2:"id";s:1:"3";s:4:"name";N;}i:1;O:8:"stdClass":2:{s:2:"id";s:1:"4";s:4:"name";N;}i:2;O:8:"stdClass":2:{s:2:"id";s:1:"5";s:4:"name";N;}i:3;O:8:"stdClass":2:{s:2:"id";s:1:"6";s:4:"name";N;}i:4;O:8:"stdClass":2:{s:2:"id";s:1:"7";s:4:"name";N;}i:5;O:8:"stdClass":2:{s:2:"id";s:1:"8";s:4:"name";N;}}', 'a:1:{i:1;O:8:"stdClass":10:{s:2:"id";s:1:"1";s:2:"cm";s:1:"1";s:3:"mod";s:5:"forum";s:7:"section";s:1:"0";s:9:"sectionid";s:1:"3";s:6:"module";s:1:"9";s:5:"added";s:10:"1372348178";s:7:"visible";s:1:"1";s:10:"visibleold";s:1:"1";s:4:"name";s:9:"Novedades";}}', 5, 1372647600, 0, 0, 0, 0, 1, 1, 0, 0, 0, 'es_ar', '', 1372344226, 1372426897, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course categories' AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Uso de Moodle', NULL, '', 0, 0, 10000, 1, 1, 1, 1372344005, 1, '/1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion records' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_completions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_completion_aggr_methd`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_completion_criteria`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_completion_crit_compl`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores format-specific options for the course or course sect' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'numsections', '1'),
(2, 2, 'weeks', 0, 'numsections', '5'),
(3, 2, 'weeks', 0, 'hiddensections', '0'),
(4, 2, 'weeks', 0, 'coursedisplay', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(1, 2, 9, 1, 3, NULL, 1372348178, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_modules_availability`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_modules_avail_fields`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_modules_completion`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_published`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext COLLATE utf8_unicode_ci NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='course requests' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_request`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `summary` longtext COLLATE utf8_unicode_ci,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to define the sections for each course' AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availablefrom`, `availableuntil`, `showavailability`, `groupingid`) VALUES
(1, 1, 0, NULL, '', 1, '', 1, 0, 0, 0, 0),
(2, 1, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(3, 2, 0, NULL, '', 1, '1', 1, 0, 0, 0, 0),
(4, 2, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(5, 2, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(6, 2, 3, NULL, '', 1, '', 1, 0, 0, 0, 0),
(7, 2, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(8, 2, 5, NULL, '', 1, '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Completion or grade conditions that affect if a section is c' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_sections_availability`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_course_sections_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user field conditions that affect whether an activity' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_course_sections_avail_fields`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplate` longtext COLLATE utf8_unicode_ci,
  `listtemplateheader` longtext COLLATE utf8_unicode_ci,
  `listtemplatefooter` longtext COLLATE utf8_unicode_ci,
  `addtemplate` longtext COLLATE utf8_unicode_ci,
  `rsstemplate` longtext COLLATE utf8_unicode_ci,
  `rsstitletemplate` longtext COLLATE utf8_unicode_ci,
  `csstemplate` longtext COLLATE utf8_unicode_ci,
  `jstemplate` longtext COLLATE utf8_unicode_ci,
  `asearchtemplate` longtext COLLATE utf8_unicode_ci,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all database activities' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `content1` longtext COLLATE utf8_unicode_ci,
  `content2` longtext COLLATE utf8_unicode_ci,
  `content3` longtext COLLATE utf8_unicode_ci,
  `content4` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_data_content`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  `param6` longtext COLLATE utf8_unicode_ci,
  `param7` longtext COLLATE utf8_unicode_ci,
  `param8` longtext COLLATE utf8_unicode_ci,
  `param9` longtext COLLATE utf8_unicode_ci,
  `param10` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every field available' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_data_fields`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='every record introduced' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_data_records`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cost` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customchar3` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext COLLATE utf8_unicode_ci,
  `customtext2` longtext COLLATE utf8_unicode_ci,
  `customtext3` longtext COLLATE utf8_unicode_ci,
  `customtext4` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1372344228, 1372344228),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1372344228, 1372426898),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1372344228, 1372344228);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_authorize`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `paymentmethod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'cc',
  `refundinfo` smallint(4) NOT NULL DEFAULT '0',
  `ccname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `transid` bigint(20) NOT NULL DEFAULT '0',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `currency` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauth_cou_ix` (`courseid`),
  KEY `mdl_enroauth_use_ix` (`userid`),
  KEY `mdl_enroauth_sta_ix` (`status`),
  KEY `mdl_enroauth_tra_ix` (`transid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about authorize.net transactions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_enrol_authorize`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_authorize_refunds`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_authorize_refunds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `orderid` bigint(10) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `transid` bigint(20) DEFAULT '0',
  `settletime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroauthrefu_tra_ix` (`transid`),
  KEY `mdl_enroauthrefu_ord_ix` (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Authorize.net refunds' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_enrol_authorize_refunds`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_enrol_flatfile`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `receiver_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tax` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_name2` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pending_reason` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reason_code` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `payment_type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_enrol_paypal`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For everything with a time associated to it' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_event`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `handlerfunction` longtext COLLATE utf8_unicode_ci,
  `schedule` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=26 ;

--
-- Volcar la base de datos para la tabla `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfolio.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0),
(2, 'course_completed', 'moodle', '/lib/badgeslib.php', 's:42:"badges_award_handle_course_criteria_review";', 'instant', 0, 1),
(3, 'activity_completion_changed', 'moodle', '/lib/badgeslib.php', 's:44:"badges_award_handle_activity_criteria_review";', 'instant', 0, 1),
(4, 'user_updated', 'moodle', '/lib/badgeslib.php', 's:43:"badges_award_handle_profile_criteria_review";', 'instant', 0, 1),
(5, 'user_logout', 'mod_chat', '/mod/chat/lib.php', 's:16:"chat_user_logout";', 'instant', 0, 1),
(6, 'role_assigned', 'mod_forum', '/mod/forum/lib.php', 's:24:"forum_user_role_assigned";', 'instant', 0, 1),
(7, 'user_unenrolled', 'mod_forum', '/mod/forum/lib.php', 's:21:"forum_user_unenrolled";', 'instant', 0, 1),
(8, 'quiz_attempt_submitted', 'mod_quiz', '/mod/quiz/locallib.php', 's:30:"quiz_attempt_submitted_handler";', 'cron', 0, 1),
(9, 'quiz_attempt_overdue', 'mod_quiz', '/mod/quiz/locallib.php', 's:28:"quiz_attempt_overdue_handler";', 'cron', 0, 1),
(10, 'groups_member_added', 'mod_quiz', '/mod/quiz/locallib.php', 's:32:"quiz_groups_member_added_handler";', 'instant', 0, 1),
(11, 'groups_member_removed', 'mod_quiz', '/mod/quiz/locallib.php', 's:34:"quiz_groups_member_removed_handler";', 'instant', 0, 1),
(12, 'groups_members_removed', 'mod_quiz', '/mod/quiz/locallib.php', 's:35:"quiz_groups_members_removed_handler";', 'instant', 0, 1),
(13, 'groups_group_deleted', 'mod_quiz', '/mod/quiz/locallib.php', 's:33:"quiz_groups_group_deleted_handler";', 'instant', 0, 1),
(14, 'role_assigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(15, 'role_unassigned', 'enrol_category', '/enrol/category/locallib.php', 'a:2:{i:0;s:22:"enrol_category_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(16, 'cohort_member_added', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:12:"member_added";}', 'instant', 0, 1),
(17, 'cohort_member_removed', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:14:"member_removed";}', 'instant', 0, 1),
(18, 'cohort_deleted', 'enrol_cohort', '/enrol/cohort/locallib.php', 'a:2:{i:0;s:20:"enrol_cohort_handler";i:1;s:7:"deleted";}', 'instant', 0, 1),
(19, 'role_assigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"role_assigned";}', 'instant', 0, 1),
(20, 'role_unassigned', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"role_unassigned";}', 'instant', 0, 1),
(21, 'user_enrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:13:"user_enrolled";}', 'instant', 0, 1),
(22, 'user_unenrolled', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:15:"user_unenrolled";}', 'instant', 0, 1),
(23, 'user_enrol_modified', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:19:"user_enrol_modified";}', 'instant', 0, 1),
(24, 'course_deleted', 'enrol_meta', '/enrol/meta/locallib.php', 'a:2:{i:0;s:18:"enrol_meta_handler";i:1;s:14:"course_deleted";}', 'instant', 0, 1),
(25, 'workshop_viewed', 'workshopallocation_scheduled', '/mod/workshop/allocation/scheduled/lib.php', 's:44:"workshopallocation_scheduled_workshop_viewed";', 'instant', 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext COLLATE utf8_unicode_ci NOT NULL,
  `stackdump` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_events_queue`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_events_queue_handlers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks subscriptions to remote calendars.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_event_subscriptions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `methodname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classpath` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capabilities` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='list of all external functions' AUTO_INCREMENT=98 ;

--
-- Volcar la base de datos para la tabla `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(2, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(3, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(4, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(5, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(6, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(7, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(8, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(16, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(17, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(18, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(19, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(20, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(21, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(22, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(23, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(24, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(25, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(26, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(27, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(28, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(29, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(30, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(31, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(32, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(33, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(34, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(35, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(36, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(37, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(38, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(39, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(40, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(41, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(42, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(43, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(44, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(45, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(46, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(47, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(48, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(49, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(50, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(51, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(52, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(53, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(54, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(55, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(56, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(57, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(58, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(59, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(60, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(61, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(62, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(63, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(64, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(65, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(66, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(67, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(68, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(69, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(70, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(71, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(72, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(73, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(74, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(75, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(76, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(77, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(78, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(79, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(80, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(81, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(82, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(83, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(84, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(85, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(86, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(87, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(88, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(89, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(90, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(91, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(92, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(93, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(94, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(95, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(96, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(97, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1372258365, NULL, 'moodle_mobile_app', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lists functions available in each service group' AUTO_INCREMENT=11 ;

--
-- Volcar la base de datos para la tabla `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_external_services_users`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(10) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_external_tokens`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `page_after_submit` longtext COLLATE utf8_unicode_ci NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_completed`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_completedtmp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `presentation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `typ` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback_items' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_item`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_sitecourse_map`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_template`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_tracking`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_value`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_feedback_valuetmp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filearea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext COLLATE utf8_unicode_ci,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  `referencelastsync` bigint(10) DEFAULT NULL,
  `referencelifetime` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=20 ;

--
-- Volcar la base de datos para la tabla `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`, `referencelastsync`, `referencelifetime`) VALUES
(1, 'c8cea9c5ef1236983fb4383fc75c61c1f9495757', '171ce7398cf93c336ddb7f4973ba5709f23ff21f', 5, 'user', 'draft', 759156902, '/', 'logo etisig.jpg', 2, 6080, 'image/jpeg', 0, 'logo.jpg', 'Administrador Principal', 'allrightsreserved', 1372422672, 1372422672, 0, NULL, NULL, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'b687309747297572e1f1c61458701ae4fe298248', 5, 'user', 'draft', 759156902, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1372422672, 1372422672, 0, NULL, NULL, NULL),
(3, '8995053a6fc5218d54edf9f53f722a5c4068d9f7', 'f41999751ac1297e2522314e52913acb1860c73c', 1, 'core', 'preview', 0, '/thumb/', 'c8cea9c5ef1236983fb4383fc75c61c1f9495757', NULL, 7267, 'image/png', 0, NULL, NULL, NULL, 1372422675, 1372422675, 0, NULL, NULL, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '74c104d54c05b5f8c633a36da516d37e6c5279e4', 1, 'core', 'preview', 0, '/thumb/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1372422675, 1372422675, 0, NULL, NULL, NULL),
(5, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '884555719c50529b9df662a38619d04b5b11e25c', 1, 'core', 'preview', 0, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1372422675, 1372422675, 0, NULL, NULL, NULL),
(7, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'bf1093b1c12caf72e1730f43009b8ea30ce888b3', 1, 'theme_afterburner', 'logo', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1372422689, 1372423406, 0, NULL, NULL, NULL),
(8, 'c8cea9c5ef1236983fb4383fc75c61c1f9495757', 'a0c2b08dd04d33fe4bbd47416121bac9be643930', 5, 'user', 'draft', 192936769, '/', 'logo etisig.jpg', 2, 6080, 'image/jpeg', 0, 'O:8:"stdClass":2:{s:6:"source";s:8:"logo.jpg";s:8:"original";s:228:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjE3OiJ0aGVtZV9hZnRlcmJ1cm5lciI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNToibG9nbyBldGlzaWcuanBnIjt9";}', 'Administrador Principal', 'allrightsreserved', 1372422672, 1372422672, 0, NULL, NULL, NULL),
(9, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'add30bfff4778dd9a1f7c982da6367379ef0369e', 5, 'user', 'draft', 192936769, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1372423394, 1372423394, 0, NULL, NULL, NULL),
(10, 'c8cea9c5ef1236983fb4383fc75c61c1f9495757', '5c873d1674ad5d8ee735f5344bc669063db933b2', 5, 'user', 'draft', 784189374, '/', 'logo etisig.jpg', 2, 6080, 'image/jpeg', 0, 'O:8:"stdClass":2:{s:6:"source";s:8:"logo.jpg";s:8:"original";s:228:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjE3OiJ0aGVtZV9hZnRlcmJ1cm5lciI7czo2OiJpdGVtaWQiO2k6MDtzOjg6ImZpbGVhcmVhIjtzOjQ6ImxvZ28iO3M6ODoiZmlsZXBhdGgiO3M6MToiLyI7czo4OiJmaWxlbmFtZSI7czoxNToibG9nbyBldGlzaWcuanBnIjt9";}', 'Administrador Principal', 'allrightsreserved', 1372422672, 1372422672, 0, NULL, NULL, NULL),
(11, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '2d7535dd387915d2992976c9f37713a0fa960b09', 5, 'user', 'draft', 784189374, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1372423401, 1372423401, 0, NULL, NULL, NULL),
(13, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '7921f6addf356cc6a4f789e369e4c5f18198c26d', 5, 'user', 'draft', 741332929, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1372423406, 1372423406, 0, NULL, NULL, NULL),
(14, 'c8cea9c5ef1236983fb4383fc75c61c1f9495757', '6517b6ea722545a4c1614b9f6b09f69dffa60b30', 5, 'user', 'draft', 741332929, '/', 'logo.jpg', 2, 6080, 'image/jpeg', 0, 'logo.jpg', 'Administrador Principal', 'allrightsreserved', 1372423943, 1372423943, 0, NULL, NULL, NULL),
(15, '03f1add911f8e2f8ac86ffd398f75386cdac4cd4', '8727180c3949a6eba80186b0d144428d9ea217a6', 5, 'user', 'draft', 585281622, '/', 'Archivos.zip', 2, 5966, 'application/zip', 0, NULL, NULL, NULL, 1372423954, 1372423954, 0, NULL, NULL, NULL),
(16, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd0c49a9fcba1b9fb23ccaff2f4b6141bd97794df', 5, 'user', 'draft', 585281622, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1372423954, 1372423954, 0, NULL, NULL, NULL),
(17, '03f1add911f8e2f8ac86ffd398f75386cdac4cd4', '521e0edfe7a1f83d89f2296eff52b0211303b126', 5, 'user', 'draft', 370298116, '/', 'Archivos.zip', 2, 5966, 'application/zip', 0, NULL, NULL, NULL, 1372423962, 1372423962, 0, NULL, NULL, NULL),
(18, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '0c9b5f39d20a73413e3c12906a2eaf24464e05de', 5, 'user', 'draft', 370298116, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1372423962, 1372423962, 0, NULL, NULL, NULL),
(19, 'c8cea9c5ef1236983fb4383fc75c61c1f9495757', '2500f07afb9fd9ce5144a23d83ace9cf8279fbc7', 1, 'theme_afterburner', 'logo', 0, '/', 'logo.jpg', 2, 6080, 'image/jpeg', 0, 'logo.jpg', 'Administrador Principal', 'allrightsreserved', 1372423943, 1372423943, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `lifetime` bigint(10) DEFAULT NULL,
  `reference` longtext COLLATE utf8_unicode_ci,
  `referencehash` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store files references' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_files_reference`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 1),
(2, 'mediaplugin', 1, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_filter_config`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_folder`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'general',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=2 ;

--
-- Volcar la base de datos para la tabla `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 2, 'news', 'Novedades', 'Novedades y anuncios', 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1372348178, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Forums are composed of discussions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_forum_discussions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='All posts are stored in this table' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_forum_posts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_forum_queue`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_forum_read`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_forum_subscriptions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_forum_track_prefs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossaries' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_glossary`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='entries alias' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_glossary_alias`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_glossary_categories`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `definition` longtext COLLATE utf8_unicode_ci NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_glossary_entries`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_glossary_entries_categories`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `popupformatname` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `defaulthook` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortkey` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_categories`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_categories' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_categories_history`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_grades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext COLLATE utf8_unicode_ci,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_grades_history`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_import_newitem`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext COLLATE utf8_unicode_ci,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_import_values`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_items`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `itemtype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemmodule` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext COLLATE utf8_unicode_ci,
  `idnumber` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `calculation` longtext COLLATE utf8_unicode_ci,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History of grade_items' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_items_history`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_letters`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_outcomes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_outcomes_courses`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fullname` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_outcomes_history`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grade_settings`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_gradingform_guide_comments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext COLLATE utf8_unicode_ci,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_gradingform_guide_criteria`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_gradingform_guide_fillings`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_gradingform_rubric_criteria`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext COLLATE utf8_unicode_ci,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_gradingform_rubric_fillings`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_gradingform_rubric_levels`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `areaname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `activemethod` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grading_areas`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grading_definitions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_grading_instances`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_groupings`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_groupings_groups`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record represents a group.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_groups`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Link a user to a group.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_groups_members`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_imscp`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines labels' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_label`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext COLLATE utf8_unicode_ci,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_answers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext COLLATE utf8_unicode_ci,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_attempts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_branch`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_grades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_high_scores`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contents` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_pages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lesson_timer`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fullname` longtext COLLATE utf8_unicode_ci,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=58 ;

--
-- Volcar la base de datos para la tabla `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1372258980, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1372259128, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1372340316, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(4, 1372340321, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(5, 1372341901, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(6, 1372341935, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1372342041, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'root'),
(8, 1372342051, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(9, 1372342056, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(10, 1372342108, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(11, 1372342110, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(12, 1372343240, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(13, 1372343550, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(14, 1372343859, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(15, 1372344006, 2, '127.0.0.1', 1, 'category', 0, 'update', 'editcategory.php?id=1', '1'),
(16, 1372344228, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'Agregando un curso (ID 2)'),
(17, 1372344333, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(18, 1372344339, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(19, 1372345504, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(20, 1372348168, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(21, 1372348170, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(22, 1372421049, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(23, 1372421061, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(24, 1372421438, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(25, 1372422726, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(26, 1372423169, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(27, 1372423172, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(28, 1372423326, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(29, 1372424953, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(30, 1372424976, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(31, 1372424980, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(32, 1372424987, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(33, 1372424989, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(34, 1372425566, 2, '127.0.0.1', 1, 'user', 0, 'add', 'view.php?id=3&course=1', ''),
(35, 1372426648, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(36, 1372426731, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(37, 1372426898, 2, '127.0.0.1', 2, 'course', 0, 'update', 'edit.php?id=2', '2'),
(38, 1372426899, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(39, 1372426920, 2, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(40, 1372426935, 2, '127.0.0.1', 2, 'user', 0, 'view', 'view.php?id=2&course=2', '2'),
(41, 1372426938, 2, '127.0.0.1', 2, 'user', 0, 'view', 'view.php?id=2&course=2', '2'),
(42, 1372426955, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(43, 1372426967, 2, '127.0.0.1', 2, 'user', 0, 'view', 'view.php?id=2&course=2', '2'),
(44, 1372427258, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(45, 1372428001, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(46, 1372428054, 2, '127.0.0.1', 1, 'admin', 0, 'tool capability', 'tool/capability/index.php?capability=', ''),
(47, 1372429210, 2, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(48, 1372429364, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(49, 1372429676, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(50, 1372430016, 2, '127.0.0.1', 1, 'user', 0, 'add', 'view.php?id=4&course=1', ''),
(51, 1372430122, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(52, 1372430157, 2, '127.0.0.1', 2, 'course', 0, 'enrol', '../enrol/users.php?id=2', '2'),
(53, 1372430167, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(54, 1372430256, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(55, 1372430286, 3, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '3'),
(56, 1372430289, 3, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(57, 1372431066, 3, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mtable` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `field` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=184 ;

--
-- Volcar la base de datos para la tabla `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'hide', 'course', 'fullname', 'moodle'),
(6, 'course', 'show', 'course', 'fullname', 'moodle'),
(7, 'course', 'move', 'course', 'fullname', 'moodle'),
(8, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(9, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(10, 'course', 'report log', 'course', 'fullname', 'moodle'),
(11, 'course', 'report live', 'course', 'fullname', 'moodle'),
(12, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(13, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(14, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(15, 'category', 'add', 'course_categories', 'name', 'moodle'),
(16, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(17, 'category', 'move', 'course_categories', 'name', 'moodle'),
(18, 'category', 'show', 'course_categories', 'name', 'moodle'),
(19, 'category', 'update', 'course_categories', 'name', 'moodle'),
(20, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(21, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(23, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(24, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(25, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(26, 'group', 'view', 'groups', 'name', 'moodle'),
(27, 'tag', 'update', 'tag', 'name', 'moodle'),
(28, 'tag', 'flag', 'tag', 'name', 'moodle'),
(29, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(30, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(40, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(41, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(42, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(43, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(44, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(45, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(46, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(47, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(48, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(49, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(50, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(51, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(52, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(53, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(54, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(55, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(56, 'book', 'add', 'book', 'name', 'mod_book'),
(57, 'book', 'update', 'book', 'name', 'mod_book'),
(58, 'book', 'view', 'book', 'name', 'mod_book'),
(59, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(60, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(61, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(62, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(63, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(64, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(65, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(66, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(67, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(68, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(69, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(70, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(71, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(72, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(73, 'data', 'view', 'data', 'name', 'mod_data'),
(74, 'data', 'add', 'data', 'name', 'mod_data'),
(75, 'data', 'update', 'data', 'name', 'mod_data'),
(76, 'data', 'record delete', 'data', 'name', 'mod_data'),
(77, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(78, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(79, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(80, 'data', 'templates def', 'data', 'name', 'mod_data'),
(81, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(82, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(83, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(84, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(85, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(86, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(87, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(88, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(89, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(90, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(91, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(92, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(93, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(94, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(95, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(96, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(97, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(98, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(99, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(100, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(101, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(102, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(103, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(104, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(105, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(106, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(107, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(108, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(109, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(110, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(111, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(112, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(113, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(114, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(115, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(116, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(117, 'label', 'add', 'label', 'name', 'mod_label'),
(118, 'label', 'update', 'label', 'name', 'mod_label'),
(119, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(120, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(121, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(122, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(123, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(124, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(125, 'page', 'view', 'page', 'name', 'mod_page'),
(126, 'page', 'view all', 'page', 'name', 'mod_page'),
(127, 'page', 'update', 'page', 'name', 'mod_page'),
(128, 'page', 'add', 'page', 'name', 'mod_page'),
(129, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(130, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(131, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(132, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(133, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(134, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(135, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(136, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(137, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(138, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(139, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(140, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(141, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(142, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(143, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(144, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(145, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(146, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(147, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(148, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(149, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(150, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(151, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(152, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(153, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(154, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(155, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(156, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(157, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(158, 'url', 'view', 'url', 'name', 'mod_url'),
(159, 'url', 'view all', 'url', 'name', 'mod_url'),
(160, 'url', 'update', 'url', 'name', 'mod_url'),
(161, 'url', 'add', 'url', 'name', 'mod_url'),
(162, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(163, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(164, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(165, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(166, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(167, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(168, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(169, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(170, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(171, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(172, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(173, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(174, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(175, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(176, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(177, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(178, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(179, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(180, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(181, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(182, 'book', 'print', 'book', 'name', 'booktool_print'),
(183, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sqlparams` longtext COLLATE utf8_unicode_ci,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_log_queries`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `securetoolurl` longtext COLLATE utf8_unicode_ci,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` longtext COLLATE utf8_unicode_ci,
  `secureicon` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lti`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lti_submission`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `tooldomain` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lti_types`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_lti_types_config`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_message`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_message_contacts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Volcar la base de datos para la tabla `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `component` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=24 ;

--
-- Volcar la base de datos para la tabla `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'assign_notification', 'mod_assign', NULL),
(10, 'assignment_updates', 'mod_assignment', NULL),
(11, 'submission', 'mod_feedback', NULL),
(12, 'message', 'mod_feedback', NULL),
(13, 'posts', 'mod_forum', NULL),
(14, 'graded_essay', 'mod_lesson', NULL),
(15, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(16, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(17, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(18, 'authorize_enrolment', 'enrol_authorize', NULL),
(19, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(20, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(21, 'expiry_notification', 'enrol_manual', NULL),
(22, 'paypal_enrolment', 'enrol_paypal', NULL),
(23, 'expiry_notification', 'enrol_self', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext COLLATE utf8_unicode_ci,
  `fullmessage` longtext COLLATE utf8_unicode_ci,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext COLLATE utf8_unicode_ci,
  `smallmessage` longtext COLLATE utf8_unicode_ci,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext COLLATE utf8_unicode_ci,
  `contexturlname` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_message_read`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_message_working`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_mnetservice_enrol_courses`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_mnetservice_enrol_enrolments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `display_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ip_address` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `public_key` longtext COLLATE utf8_unicode_ci NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://localhost/moodle', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_host2service`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_log`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `plugintype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `pluginname` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext COLLATE utf8_unicode_ci NOT NULL,
  `profile` longtext COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `classname` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `apiversion` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_session`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_mnet_sso_access_control`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='modules available in the site' AUTO_INCREMENT=23 ;

--
-- Volcar la base de datos para la tabla `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `version`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 2013050100, 60, 0, '', 1),
(2, 'assignment', 2013050100, 60, 0, '', 0),
(3, 'book', 2013050100, 0, 0, '', 1),
(4, 'chat', 2013050100, 300, 0, '', 1),
(5, 'choice', 2013050100, 0, 0, '', 1),
(6, 'data', 2013050100, 0, 0, '', 1),
(7, 'feedback', 2013050100, 0, 0, '', 0),
(8, 'folder', 2013050100, 0, 0, '', 1),
(9, 'forum', 2013050100, 60, 0, '', 1),
(10, 'glossary', 2013050100, 0, 0, '', 1),
(11, 'imscp', 2013050100, 0, 0, '', 1),
(12, 'label', 2013050100, 0, 0, '', 1),
(13, 'lesson', 2013050100, 0, 0, '', 1),
(14, 'lti', 2013050100, 0, 0, '', 1),
(15, 'page', 2013050100, 0, 0, '', 1),
(16, 'quiz', 2013050100, 60, 0, '', 1),
(17, 'resource', 2013050100, 0, 0, '', 1),
(18, 'scorm', 2013050100, 300, 0, '', 1),
(19, 'survey', 2013050100, 0, 0, '', 1),
(20, 'url', 2013050100, 0, 0, '', 1),
(21, 'wiki', 2013050100, 0, 0, '', 1),
(22, 'workshop', 2013050100, 60, 0, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_page`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_portfolio_instance`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_portfolio_instance_config`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_portfolio_instance_user`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_file` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `caller_component` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `caller_sha1` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `continueurl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_portfolio_log`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_portfolio_mahara_queue`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8_unicode_ci,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_portfolio_tempdata`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `summary` longtext COLLATE utf8_unicode_ci,
  `content` longtext COLLATE utf8_unicode_ci,
  `uniquehash` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `publishstate` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_post`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_profiling`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext COLLATE utf8_unicode_ci,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext COLLATE utf8_unicode_ci,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_qtype_essay_options`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines the question-type specific options for matching ques' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_qtype_match_options`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The subquestions that make up a matching question' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_qtype_match_subquestions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypshoropti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_qtype_shortanswer_options`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questiontext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The questions themselves' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_answers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext COLLATE utf8_unicode_ci,
  `rightanswer` longtext COLLATE utf8_unicode_ci,
  `responsesummary` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_attempts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_attempt_steps`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_attempt_step_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_calculated`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext COLLATE utf8_unicode_ci,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_calculated_options`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext COLLATE utf8_unicode_ci NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Categories are for grouping questions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_categories`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_datasets`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_dataset_definitions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_dataset_items`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext COLLATE utf8_unicode_ci NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_hints`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_multianswer`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_multichoice`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multichoice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `answers` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que2_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_multichoice`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_numerical`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_numerical_options`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_numerical_units`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_randomsamatch`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_sessions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_states`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_truefalse`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_question_usages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `subnet` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The settings for each quiz.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext COLLATE utf8_unicode_ci NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_attempts`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_feedback`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_grades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_overrides`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_overview_regrades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_question_instances`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_response_stats`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_response_stats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aid` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `response` longtext COLLATE utf8_unicode_ci,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Quiz question responses.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_question_response_stats`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizstatisticsid` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext COLLATE utf8_unicode_ci,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext COLLATE utf8_unicode_ci,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Default comment for the table, please edit me' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_question_statistics`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'grading', 6000, 'mod/quiz:grade'),
(2, 'overview', 10000, NULL),
(3, 'responses', 9000, NULL),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL,
  `groupid` bigint(10) NOT NULL,
  `allattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='table to cache results from analysis done in statistics repo' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_quiz_statistics`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `ratingarea` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_rating`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `hubname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `huburl` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_registration_hubs`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'url', 1, 4),
(5, 'user', 1, 5),
(6, 'wikimedia', 1, 6),
(7, 'youtube', 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1372258539, 1372258539, 0),
(2, '', 2, 0, 1, NULL, NULL, 1372258542, 1372258542, 0),
(3, '', 3, 0, 1, NULL, NULL, 1372258545, 1372258545, 0),
(4, '', 4, 0, 1, NULL, NULL, 1372258546, 1372258546, 0),
(5, '', 5, 0, 1, NULL, NULL, 1372258546, 1372258546, 0),
(6, '', 6, 0, 1, NULL, NULL, 1372258547, 1372258547, 0),
(7, '', 7, 0, 1, NULL, NULL, 1372258548, 1372258548, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The config for intances' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_repository_instance_config`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_resource`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext COLLATE utf8_unicode_ci NOT NULL,
  `popup` longtext COLLATE utf8_unicode_ci NOT NULL,
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_resource_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shortname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Volcar la base de datos para la tabla `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, '', 'manager', '', 1, 'manager'),
(2, '', 'coursecreator', '', 2, 'coursecreator'),
(3, '', 'editingteacher', '', 3, 'editingteacher'),
(4, '', 'teacher', '', 4, 'teacher'),
(5, '', 'student', '', 5, 'student'),
(6, '', 'guest', '', 6, 'guest'),
(7, '', 'user', '', 7, 'user'),
(8, '', 'frontpage', '', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Volcar la base de datos para la tabla `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Volcar la base de datos para la tabla `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Volcar la base de datos para la tabla `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='assigning roles in different context' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(1, 3, 15, 3, 1372429210, 2, '', 0, 0),
(2, 5, 15, 4, 1372430157, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1132 ;

--
-- Volcar la base de datos para la tabla `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1372258357, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1372258357, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1372258357, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1372258357, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1372258357, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1372258357, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1372258357, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1372258357, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1372258357, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1372258357, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1372258357, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1372258357, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1372258357, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1372258357, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1372258357, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1372258357, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1372258357, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1372258357, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1372258357, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1372258357, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1372258357, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1372258357, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1372258357, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1372258357, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1372258357, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1372258357, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1372258357, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1372258357, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1372258357, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1372258357, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1372258357, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1372258357, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1372258357, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1372258357, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1372258357, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1372258357, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1372258357, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1372258357, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1372258357, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1372258357, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1372258357, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1372258357, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1372258357, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1372258357, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1372258357, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1372258357, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1372258357, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1372258357, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1372258357, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1372258357, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1372258357, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1372258357, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1372258357, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1372258357, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1372258358, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1372258358, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1372258358, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1372258358, 0),
(59, 1, 1, 'moodle/user:create', 1, 1372258358, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1372258358, 0),
(61, 1, 1, 'moodle/user:update', 1, 1372258358, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1372258358, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1372258358, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1372258358, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1372258358, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1372258358, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1372258358, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1372258358, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1372258358, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1372258358, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1372258358, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1372258358, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1372258358, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1372258358, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1372258358, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1372258358, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1372258358, 0),
(78, 1, 4, 'moodle/role:review', 1, 1372258358, 0),
(79, 1, 3, 'moodle/role:review', 1, 1372258358, 0),
(80, 1, 1, 'moodle/role:review', 1, 1372258358, 0),
(81, 1, 1, 'moodle/role:override', 1, 1372258358, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1372258358, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1372258358, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1372258358, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1372258358, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1372258358, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1372258358, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1372258358, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1372258358, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1372258358, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1372258358, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1372258358, 0),
(93, 1, 2, 'moodle/course:create', 1, 1372258358, 0),
(94, 1, 1, 'moodle/course:create', 1, 1372258358, 0),
(95, 1, 7, 'moodle/course:request', 1, 1372258358, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1372258358, 0),
(97, 1, 3, 'moodle/course:update', 1, 1372258358, 0),
(98, 1, 1, 'moodle/course:update', 1, 1372258358, 0),
(99, 1, 1, 'moodle/course:view', 1, 1372258358, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1372258358, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1372258358, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1372258358, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1372258358, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1372258358, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1372258358, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1372258358, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1372258358, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1372258359, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1372258359, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1372258359, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1372258359, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1372258359, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1372258359, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1372258359, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1372258359, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1372258359, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1372258359, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1372258359, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1372258359, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1372258359, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1372258359, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1372258359, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1372258359, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1372258359, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1372258359, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1372258359, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1372258359, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1372258359, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1372258359, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1372258359, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1372258359, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1372258359, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1372258359, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1372258359, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1372258359, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1372258359, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1372258359, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1372258359, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1372258359, 0),
(140, 1, 5, 'moodle/course:isincompletionreports', 1, 1372258359, 0),
(141, 1, 5, 'moodle/course:viewscales', 1, 1372258359, 0),
(142, 1, 4, 'moodle/course:viewscales', 1, 1372258359, 0),
(143, 1, 3, 'moodle/course:viewscales', 1, 1372258359, 0),
(144, 1, 1, 'moodle/course:viewscales', 1, 1372258359, 0),
(145, 1, 3, 'moodle/course:managescales', 1, 1372258359, 0),
(146, 1, 1, 'moodle/course:managescales', 1, 1372258359, 0),
(147, 1, 3, 'moodle/course:managegroups', 1, 1372258359, 0),
(148, 1, 1, 'moodle/course:managegroups', 1, 1372258359, 0),
(149, 1, 3, 'moodle/course:reset', 1, 1372258359, 0),
(150, 1, 1, 'moodle/course:reset', 1, 1372258359, 0),
(151, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1372258359, 0),
(152, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1372258359, 0),
(153, 1, 6, 'moodle/blog:view', 1, 1372258359, 0),
(154, 1, 7, 'moodle/blog:view', 1, 1372258359, 0),
(155, 1, 5, 'moodle/blog:view', 1, 1372258359, 0),
(156, 1, 4, 'moodle/blog:view', 1, 1372258359, 0),
(157, 1, 3, 'moodle/blog:view', 1, 1372258359, 0),
(158, 1, 1, 'moodle/blog:view', 1, 1372258359, 0),
(159, 1, 6, 'moodle/blog:search', 1, 1372258359, 0),
(160, 1, 7, 'moodle/blog:search', 1, 1372258359, 0),
(161, 1, 5, 'moodle/blog:search', 1, 1372258359, 0),
(162, 1, 4, 'moodle/blog:search', 1, 1372258359, 0),
(163, 1, 3, 'moodle/blog:search', 1, 1372258359, 0),
(164, 1, 1, 'moodle/blog:search', 1, 1372258359, 0),
(165, 1, 1, 'moodle/blog:viewdrafts', 1, 1372258359, 0),
(166, 1, 7, 'moodle/blog:create', 1, 1372258359, 0),
(167, 1, 1, 'moodle/blog:create', 1, 1372258359, 0),
(168, 1, 4, 'moodle/blog:manageentries', 1, 1372258359, 0),
(169, 1, 3, 'moodle/blog:manageentries', 1, 1372258359, 0),
(170, 1, 1, 'moodle/blog:manageentries', 1, 1372258359, 0),
(171, 1, 5, 'moodle/blog:manageexternal', 1, 1372258359, 0),
(172, 1, 7, 'moodle/blog:manageexternal', 1, 1372258359, 0),
(173, 1, 4, 'moodle/blog:manageexternal', 1, 1372258359, 0),
(174, 1, 3, 'moodle/blog:manageexternal', 1, 1372258359, 0),
(175, 1, 1, 'moodle/blog:manageexternal', 1, 1372258359, 0),
(176, 1, 7, 'moodle/calendar:manageownentries', 1, 1372258359, 0),
(177, 1, 1, 'moodle/calendar:manageownentries', 1, 1372258360, 0),
(178, 1, 4, 'moodle/calendar:managegroupentries', 1, 1372258360, 0),
(179, 1, 3, 'moodle/calendar:managegroupentries', 1, 1372258360, 0),
(180, 1, 1, 'moodle/calendar:managegroupentries', 1, 1372258360, 0),
(181, 1, 4, 'moodle/calendar:manageentries', 1, 1372258360, 0),
(182, 1, 3, 'moodle/calendar:manageentries', 1, 1372258360, 0),
(183, 1, 1, 'moodle/calendar:manageentries', 1, 1372258360, 0),
(184, 1, 1, 'moodle/user:editprofile', 1, 1372258360, 0),
(185, 1, 6, 'moodle/user:editownprofile', -1000, 1372258360, 0),
(186, 1, 7, 'moodle/user:editownprofile', 1, 1372258360, 0),
(187, 1, 1, 'moodle/user:editownprofile', 1, 1372258360, 0),
(188, 1, 6, 'moodle/user:changeownpassword', -1000, 1372258360, 0),
(189, 1, 7, 'moodle/user:changeownpassword', 1, 1372258360, 0),
(190, 1, 1, 'moodle/user:changeownpassword', 1, 1372258360, 0),
(191, 1, 5, 'moodle/user:readuserposts', 1, 1372258360, 0),
(192, 1, 4, 'moodle/user:readuserposts', 1, 1372258360, 0),
(193, 1, 3, 'moodle/user:readuserposts', 1, 1372258360, 0),
(194, 1, 1, 'moodle/user:readuserposts', 1, 1372258360, 0),
(195, 1, 5, 'moodle/user:readuserblogs', 1, 1372258360, 0),
(196, 1, 4, 'moodle/user:readuserblogs', 1, 1372258360, 0),
(197, 1, 3, 'moodle/user:readuserblogs', 1, 1372258360, 0),
(198, 1, 1, 'moodle/user:readuserblogs', 1, 1372258360, 0),
(199, 1, 1, 'moodle/user:editmessageprofile', 1, 1372258360, 0),
(200, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1372258360, 0),
(201, 1, 7, 'moodle/user:editownmessageprofile', 1, 1372258360, 0),
(202, 1, 1, 'moodle/user:editownmessageprofile', 1, 1372258360, 0),
(203, 1, 3, 'moodle/question:managecategory', 1, 1372258360, 0),
(204, 1, 1, 'moodle/question:managecategory', 1, 1372258360, 0),
(205, 1, 3, 'moodle/question:add', 1, 1372258360, 0),
(206, 1, 1, 'moodle/question:add', 1, 1372258360, 0),
(207, 1, 3, 'moodle/question:editmine', 1, 1372258360, 0),
(208, 1, 1, 'moodle/question:editmine', 1, 1372258360, 0),
(209, 1, 3, 'moodle/question:editall', 1, 1372258360, 0),
(210, 1, 1, 'moodle/question:editall', 1, 1372258360, 0),
(211, 1, 3, 'moodle/question:viewmine', 1, 1372258360, 0),
(212, 1, 1, 'moodle/question:viewmine', 1, 1372258360, 0),
(213, 1, 3, 'moodle/question:viewall', 1, 1372258360, 0),
(214, 1, 1, 'moodle/question:viewall', 1, 1372258360, 0),
(215, 1, 3, 'moodle/question:usemine', 1, 1372258360, 0),
(216, 1, 1, 'moodle/question:usemine', 1, 1372258360, 0),
(217, 1, 3, 'moodle/question:useall', 1, 1372258360, 0),
(218, 1, 1, 'moodle/question:useall', 1, 1372258360, 0),
(219, 1, 3, 'moodle/question:movemine', 1, 1372258360, 0),
(220, 1, 1, 'moodle/question:movemine', 1, 1372258360, 0),
(221, 1, 3, 'moodle/question:moveall', 1, 1372258360, 0),
(222, 1, 1, 'moodle/question:moveall', 1, 1372258360, 0),
(223, 1, 1, 'moodle/question:config', 1, 1372258360, 0),
(224, 1, 5, 'moodle/question:flag', 1, 1372258360, 0),
(225, 1, 4, 'moodle/question:flag', 1, 1372258360, 0),
(226, 1, 3, 'moodle/question:flag', 1, 1372258360, 0),
(227, 1, 1, 'moodle/question:flag', 1, 1372258360, 0),
(228, 1, 4, 'moodle/site:doclinks', 1, 1372258360, 0),
(229, 1, 3, 'moodle/site:doclinks', 1, 1372258360, 0),
(230, 1, 1, 'moodle/site:doclinks', 1, 1372258360, 0),
(231, 1, 3, 'moodle/course:sectionvisibility', 1, 1372258360, 0),
(232, 1, 1, 'moodle/course:sectionvisibility', 1, 1372258360, 0),
(233, 1, 3, 'moodle/course:useremail', 1, 1372258360, 0),
(234, 1, 1, 'moodle/course:useremail', 1, 1372258360, 0),
(235, 1, 3, 'moodle/course:viewhiddensections', 1, 1372258360, 0),
(236, 1, 1, 'moodle/course:viewhiddensections', 1, 1372258360, 0),
(237, 1, 3, 'moodle/course:setcurrentsection', 1, 1372258360, 0),
(238, 1, 1, 'moodle/course:setcurrentsection', 1, 1372258360, 0),
(239, 1, 3, 'moodle/course:movesections', 1, 1372258360, 0),
(240, 1, 1, 'moodle/course:movesections', 1, 1372258360, 0),
(241, 1, 4, 'moodle/grade:viewall', 1, 1372258360, 0),
(242, 1, 3, 'moodle/grade:viewall', 1, 1372258360, 0),
(243, 1, 1, 'moodle/grade:viewall', 1, 1372258360, 0),
(244, 1, 5, 'moodle/grade:view', 1, 1372258360, 0),
(245, 1, 4, 'moodle/grade:viewhidden', 1, 1372258360, 0),
(246, 1, 3, 'moodle/grade:viewhidden', 1, 1372258360, 0),
(247, 1, 1, 'moodle/grade:viewhidden', 1, 1372258360, 0),
(248, 1, 3, 'moodle/grade:import', 1, 1372258360, 0),
(249, 1, 1, 'moodle/grade:import', 1, 1372258360, 0),
(250, 1, 4, 'moodle/grade:export', 1, 1372258360, 0),
(251, 1, 3, 'moodle/grade:export', 1, 1372258360, 0),
(252, 1, 1, 'moodle/grade:export', 1, 1372258360, 0),
(253, 1, 3, 'moodle/grade:manage', 1, 1372258360, 0),
(254, 1, 1, 'moodle/grade:manage', 1, 1372258360, 0),
(255, 1, 3, 'moodle/grade:edit', 1, 1372258360, 0),
(256, 1, 1, 'moodle/grade:edit', 1, 1372258360, 0),
(257, 1, 3, 'moodle/grade:managegradingforms', 1, 1372258360, 0),
(258, 1, 1, 'moodle/grade:managegradingforms', 1, 1372258360, 0),
(259, 1, 1, 'moodle/grade:sharegradingforms', 1, 1372258360, 0),
(260, 1, 1, 'moodle/grade:managesharedforms', 1, 1372258360, 0),
(261, 1, 3, 'moodle/grade:manageoutcomes', 1, 1372258361, 0),
(262, 1, 1, 'moodle/grade:manageoutcomes', 1, 1372258361, 0),
(263, 1, 3, 'moodle/grade:manageletters', 1, 1372258361, 0),
(264, 1, 1, 'moodle/grade:manageletters', 1, 1372258361, 0),
(265, 1, 3, 'moodle/grade:hide', 1, 1372258361, 0),
(266, 1, 1, 'moodle/grade:hide', 1, 1372258361, 0),
(267, 1, 3, 'moodle/grade:lock', 1, 1372258361, 0),
(268, 1, 1, 'moodle/grade:lock', 1, 1372258361, 0),
(269, 1, 3, 'moodle/grade:unlock', 1, 1372258361, 0),
(270, 1, 1, 'moodle/grade:unlock', 1, 1372258361, 0),
(271, 1, 7, 'moodle/my:manageblocks', 1, 1372258361, 0),
(272, 1, 4, 'moodle/notes:view', 1, 1372258361, 0),
(273, 1, 3, 'moodle/notes:view', 1, 1372258361, 0),
(274, 1, 1, 'moodle/notes:view', 1, 1372258361, 0),
(275, 1, 4, 'moodle/notes:manage', 1, 1372258361, 0),
(276, 1, 3, 'moodle/notes:manage', 1, 1372258361, 0),
(277, 1, 1, 'moodle/notes:manage', 1, 1372258361, 0),
(278, 1, 4, 'moodle/tag:manage', 1, 1372258361, 0),
(279, 1, 3, 'moodle/tag:manage', 1, 1372258361, 0),
(280, 1, 1, 'moodle/tag:manage', 1, 1372258361, 0),
(281, 1, 1, 'moodle/tag:create', 1, 1372258361, 0),
(282, 1, 7, 'moodle/tag:create', 1, 1372258361, 0),
(283, 1, 1, 'moodle/tag:edit', 1, 1372258361, 0),
(284, 1, 7, 'moodle/tag:edit', 1, 1372258361, 0),
(285, 1, 1, 'moodle/tag:flag', 1, 1372258361, 0),
(286, 1, 7, 'moodle/tag:flag', 1, 1372258361, 0),
(287, 1, 4, 'moodle/tag:editblocks', 1, 1372258361, 0),
(288, 1, 3, 'moodle/tag:editblocks', 1, 1372258361, 0),
(289, 1, 1, 'moodle/tag:editblocks', 1, 1372258361, 0),
(290, 1, 6, 'moodle/block:view', 1, 1372258361, 0),
(291, 1, 7, 'moodle/block:view', 1, 1372258361, 0),
(292, 1, 5, 'moodle/block:view', 1, 1372258361, 0),
(293, 1, 4, 'moodle/block:view', 1, 1372258361, 0),
(294, 1, 3, 'moodle/block:view', 1, 1372258361, 0),
(295, 1, 3, 'moodle/block:edit', 1, 1372258361, 0),
(296, 1, 1, 'moodle/block:edit', 1, 1372258361, 0),
(297, 1, 7, 'moodle/portfolio:export', 1, 1372258361, 0),
(298, 1, 5, 'moodle/portfolio:export', 1, 1372258361, 0),
(299, 1, 4, 'moodle/portfolio:export', 1, 1372258361, 0),
(300, 1, 3, 'moodle/portfolio:export', 1, 1372258361, 0),
(301, 1, 8, 'moodle/comment:view', 1, 1372258361, 0),
(302, 1, 6, 'moodle/comment:view', 1, 1372258361, 0),
(303, 1, 7, 'moodle/comment:view', 1, 1372258361, 0),
(304, 1, 5, 'moodle/comment:view', 1, 1372258361, 0),
(305, 1, 4, 'moodle/comment:view', 1, 1372258361, 0),
(306, 1, 3, 'moodle/comment:view', 1, 1372258361, 0),
(307, 1, 1, 'moodle/comment:view', 1, 1372258361, 0),
(308, 1, 7, 'moodle/comment:post', 1, 1372258361, 0),
(309, 1, 5, 'moodle/comment:post', 1, 1372258361, 0),
(310, 1, 4, 'moodle/comment:post', 1, 1372258361, 0),
(311, 1, 3, 'moodle/comment:post', 1, 1372258361, 0),
(312, 1, 1, 'moodle/comment:post', 1, 1372258361, 0),
(313, 1, 3, 'moodle/comment:delete', 1, 1372258361, 0),
(314, 1, 1, 'moodle/comment:delete', 1, 1372258361, 0),
(315, 1, 1, 'moodle/webservice:createtoken', 1, 1372258361, 0),
(316, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1372258361, 0),
(317, 1, 7, 'moodle/rating:view', 1, 1372258361, 0),
(318, 1, 5, 'moodle/rating:view', 1, 1372258361, 0),
(319, 1, 4, 'moodle/rating:view', 1, 1372258362, 0),
(320, 1, 3, 'moodle/rating:view', 1, 1372258362, 0),
(321, 1, 1, 'moodle/rating:view', 1, 1372258362, 0),
(322, 1, 7, 'moodle/rating:viewany', 1, 1372258362, 0),
(323, 1, 5, 'moodle/rating:viewany', 1, 1372258362, 0),
(324, 1, 4, 'moodle/rating:viewany', 1, 1372258362, 0),
(325, 1, 3, 'moodle/rating:viewany', 1, 1372258362, 0),
(326, 1, 1, 'moodle/rating:viewany', 1, 1372258362, 0),
(327, 1, 7, 'moodle/rating:viewall', 1, 1372258362, 0),
(328, 1, 5, 'moodle/rating:viewall', 1, 1372258362, 0),
(329, 1, 4, 'moodle/rating:viewall', 1, 1372258362, 0),
(330, 1, 3, 'moodle/rating:viewall', 1, 1372258362, 0),
(331, 1, 1, 'moodle/rating:viewall', 1, 1372258362, 0),
(332, 1, 7, 'moodle/rating:rate', 1, 1372258362, 0),
(333, 1, 5, 'moodle/rating:rate', 1, 1372258362, 0),
(334, 1, 4, 'moodle/rating:rate', 1, 1372258362, 0),
(335, 1, 3, 'moodle/rating:rate', 1, 1372258362, 0),
(336, 1, 1, 'moodle/rating:rate', 1, 1372258362, 0),
(337, 1, 1, 'moodle/course:publish', 1, 1372258362, 0),
(338, 1, 4, 'moodle/course:markcomplete', 1, 1372258362, 0),
(339, 1, 3, 'moodle/course:markcomplete', 1, 1372258362, 0),
(340, 1, 1, 'moodle/course:markcomplete', 1, 1372258362, 0),
(341, 1, 1, 'moodle/community:add', 1, 1372258362, 0),
(342, 1, 4, 'moodle/community:add', 1, 1372258362, 0),
(343, 1, 3, 'moodle/community:add', 1, 1372258362, 0),
(344, 1, 1, 'moodle/community:download', 1, 1372258362, 0),
(345, 1, 3, 'moodle/community:download', 1, 1372258362, 0),
(346, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1372258362, 0),
(347, 1, 5, 'moodle/badges:manageglobalsettings', -1, 1372258362, 0),
(348, 1, 1, 'moodle/badges:viewbadges', 1, 1372258362, 0),
(349, 1, 7, 'moodle/badges:viewbadges', 1, 1372258362, 0),
(350, 1, 5, 'moodle/badges:viewbadges', 1, 1372258362, 0),
(351, 1, 7, 'moodle/badges:manageownbadges', 1, 1372258362, 0),
(352, 1, 7, 'moodle/badges:viewotherbadges', 1, 1372258362, 0),
(353, 1, 7, 'moodle/badges:earnbadge', 1, 1372258362, 0),
(354, 1, 5, 'moodle/badges:earnbadge', 1, 1372258362, 0),
(355, 1, 1, 'moodle/badges:createbadge', 1, 1372258362, 0),
(356, 1, 2, 'moodle/badges:createbadge', 1, 1372258362, 0),
(357, 1, 3, 'moodle/badges:createbadge', 1, 1372258362, 0),
(358, 1, 5, 'moodle/badges:createbadge', -1, 1372258362, 0),
(359, 1, 1, 'moodle/badges:deletebadge', 1, 1372258362, 0),
(360, 1, 2, 'moodle/badges:deletebadge', 1, 1372258362, 0),
(361, 1, 3, 'moodle/badges:deletebadge', 1, 1372258362, 0),
(362, 1, 5, 'moodle/badges:deletebadge', -1, 1372258362, 0),
(363, 1, 1, 'moodle/badges:configuredetails', 1, 1372258363, 0),
(364, 1, 2, 'moodle/badges:configuredetails', 1, 1372258363, 0),
(365, 1, 3, 'moodle/badges:configuredetails', 1, 1372258363, 0),
(366, 1, 5, 'moodle/badges:configuredetails', -1, 1372258363, 0),
(367, 1, 1, 'moodle/badges:configurecriteria', 1, 1372258363, 0),
(368, 1, 2, 'moodle/badges:configurecriteria', 1, 1372258363, 0),
(369, 1, 3, 'moodle/badges:configurecriteria', 1, 1372258363, 0),
(370, 1, 5, 'moodle/badges:configurecriteria', -1, 1372258363, 0),
(371, 1, 1, 'moodle/badges:configuremessages', 1, 1372258363, 0),
(372, 1, 2, 'moodle/badges:configuremessages', 1, 1372258363, 0),
(373, 1, 3, 'moodle/badges:configuremessages', 1, 1372258363, 0),
(374, 1, 5, 'moodle/badges:configuremessages', -1, 1372258363, 0),
(375, 1, 1, 'moodle/badges:awardbadge', 1, 1372258363, 0),
(376, 1, 2, 'moodle/badges:awardbadge', 1, 1372258363, 0),
(377, 1, 4, 'moodle/badges:awardbadge', 1, 1372258363, 0),
(378, 1, 3, 'moodle/badges:awardbadge', 1, 1372258363, 0),
(379, 1, 5, 'moodle/badges:awardbadge', -1, 1372258363, 0),
(380, 1, 1, 'moodle/badges:viewawarded', 1, 1372258363, 0),
(381, 1, 4, 'moodle/badges:viewawarded', 1, 1372258363, 0),
(382, 1, 3, 'moodle/badges:viewawarded', 1, 1372258363, 0),
(383, 1, 6, 'mod/assign:view', 1, 1372258410, 0),
(384, 1, 5, 'mod/assign:view', 1, 1372258410, 0),
(385, 1, 4, 'mod/assign:view', 1, 1372258410, 0),
(386, 1, 3, 'mod/assign:view', 1, 1372258410, 0),
(387, 1, 1, 'mod/assign:view', 1, 1372258410, 0),
(388, 1, 5, 'mod/assign:submit', 1, 1372258410, 0),
(389, 1, 4, 'mod/assign:grade', 1, 1372258410, 0),
(390, 1, 3, 'mod/assign:grade', 1, 1372258410, 0),
(391, 1, 1, 'mod/assign:grade', 1, 1372258410, 0),
(392, 1, 4, 'mod/assign:exportownsubmission', 1, 1372258410, 0),
(393, 1, 3, 'mod/assign:exportownsubmission', 1, 1372258410, 0),
(394, 1, 1, 'mod/assign:exportownsubmission', 1, 1372258410, 0),
(395, 1, 5, 'mod/assign:exportownsubmission', 1, 1372258410, 0),
(396, 1, 3, 'mod/assign:addinstance', 1, 1372258410, 0),
(397, 1, 1, 'mod/assign:addinstance', 1, 1372258410, 0),
(398, 1, 4, 'mod/assign:grantextension', 1, 1372258410, 0),
(399, 1, 3, 'mod/assign:grantextension', 1, 1372258410, 0),
(400, 1, 1, 'mod/assign:grantextension', 1, 1372258410, 0),
(401, 1, 3, 'mod/assign:revealidentities', 1, 1372258410, 0),
(402, 1, 1, 'mod/assign:revealidentities', 1, 1372258410, 0),
(403, 1, 6, 'mod/assignment:view', 1, 1372258411, 0),
(404, 1, 5, 'mod/assignment:view', 1, 1372258411, 0),
(405, 1, 4, 'mod/assignment:view', 1, 1372258411, 0),
(406, 1, 3, 'mod/assignment:view', 1, 1372258411, 0),
(407, 1, 1, 'mod/assignment:view', 1, 1372258411, 0),
(408, 1, 3, 'mod/assignment:addinstance', 1, 1372258411, 0),
(409, 1, 1, 'mod/assignment:addinstance', 1, 1372258411, 0),
(410, 1, 5, 'mod/assignment:submit', 1, 1372258411, 0),
(411, 1, 4, 'mod/assignment:grade', 1, 1372258411, 0),
(412, 1, 3, 'mod/assignment:grade', 1, 1372258411, 0),
(413, 1, 1, 'mod/assignment:grade', 1, 1372258411, 0),
(414, 1, 4, 'mod/assignment:exportownsubmission', 1, 1372258411, 0),
(415, 1, 3, 'mod/assignment:exportownsubmission', 1, 1372258411, 0),
(416, 1, 1, 'mod/assignment:exportownsubmission', 1, 1372258411, 0),
(417, 1, 5, 'mod/assignment:exportownsubmission', 1, 1372258411, 0),
(418, 1, 3, 'mod/book:addinstance', 1, 1372258412, 0),
(419, 1, 1, 'mod/book:addinstance', 1, 1372258412, 0),
(420, 1, 6, 'mod/book:read', 1, 1372258412, 0),
(421, 1, 8, 'mod/book:read', 1, 1372258412, 0),
(422, 1, 5, 'mod/book:read', 1, 1372258412, 0),
(423, 1, 4, 'mod/book:read', 1, 1372258412, 0),
(424, 1, 3, 'mod/book:read', 1, 1372258412, 0),
(425, 1, 1, 'mod/book:read', 1, 1372258412, 0),
(426, 1, 4, 'mod/book:viewhiddenchapters', 1, 1372258412, 0),
(427, 1, 3, 'mod/book:viewhiddenchapters', 1, 1372258412, 0),
(428, 1, 1, 'mod/book:viewhiddenchapters', 1, 1372258412, 0),
(429, 1, 3, 'mod/book:edit', 1, 1372258412, 0),
(430, 1, 1, 'mod/book:edit', 1, 1372258412, 0),
(431, 1, 3, 'mod/chat:addinstance', 1, 1372258413, 0),
(432, 1, 1, 'mod/chat:addinstance', 1, 1372258413, 0),
(433, 1, 5, 'mod/chat:chat', 1, 1372258413, 0),
(434, 1, 4, 'mod/chat:chat', 1, 1372258413, 0),
(435, 1, 3, 'mod/chat:chat', 1, 1372258413, 0),
(436, 1, 1, 'mod/chat:chat', 1, 1372258413, 0),
(437, 1, 5, 'mod/chat:readlog', 1, 1372258413, 0),
(438, 1, 4, 'mod/chat:readlog', 1, 1372258413, 0),
(439, 1, 3, 'mod/chat:readlog', 1, 1372258413, 0),
(440, 1, 1, 'mod/chat:readlog', 1, 1372258413, 0),
(441, 1, 4, 'mod/chat:deletelog', 1, 1372258413, 0),
(442, 1, 3, 'mod/chat:deletelog', 1, 1372258413, 0),
(443, 1, 1, 'mod/chat:deletelog', 1, 1372258413, 0),
(444, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1372258413, 0),
(445, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1372258413, 0),
(446, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1372258413, 0),
(447, 1, 4, 'mod/chat:exportsession', 1, 1372258413, 0),
(448, 1, 3, 'mod/chat:exportsession', 1, 1372258413, 0),
(449, 1, 1, 'mod/chat:exportsession', 1, 1372258413, 0),
(450, 1, 3, 'mod/choice:addinstance', 1, 1372258413, 0),
(451, 1, 1, 'mod/choice:addinstance', 1, 1372258413, 0),
(452, 1, 5, 'mod/choice:choose', 1, 1372258413, 0),
(453, 1, 4, 'mod/choice:choose', 1, 1372258413, 0),
(454, 1, 3, 'mod/choice:choose', 1, 1372258413, 0),
(455, 1, 4, 'mod/choice:readresponses', 1, 1372258413, 0),
(456, 1, 3, 'mod/choice:readresponses', 1, 1372258413, 0),
(457, 1, 1, 'mod/choice:readresponses', 1, 1372258413, 0),
(458, 1, 4, 'mod/choice:deleteresponses', 1, 1372258413, 0),
(459, 1, 3, 'mod/choice:deleteresponses', 1, 1372258413, 0),
(460, 1, 1, 'mod/choice:deleteresponses', 1, 1372258413, 0),
(461, 1, 4, 'mod/choice:downloadresponses', 1, 1372258413, 0),
(462, 1, 3, 'mod/choice:downloadresponses', 1, 1372258413, 0),
(463, 1, 1, 'mod/choice:downloadresponses', 1, 1372258413, 0),
(464, 1, 3, 'mod/data:addinstance', 1, 1372258414, 0),
(465, 1, 1, 'mod/data:addinstance', 1, 1372258414, 0),
(466, 1, 8, 'mod/data:viewentry', 1, 1372258414, 0),
(467, 1, 6, 'mod/data:viewentry', 1, 1372258414, 0),
(468, 1, 5, 'mod/data:viewentry', 1, 1372258414, 0),
(469, 1, 4, 'mod/data:viewentry', 1, 1372258414, 0),
(470, 1, 3, 'mod/data:viewentry', 1, 1372258414, 0),
(471, 1, 1, 'mod/data:viewentry', 1, 1372258414, 0),
(472, 1, 5, 'mod/data:writeentry', 1, 1372258414, 0),
(473, 1, 4, 'mod/data:writeentry', 1, 1372258414, 0),
(474, 1, 3, 'mod/data:writeentry', 1, 1372258414, 0),
(475, 1, 1, 'mod/data:writeentry', 1, 1372258414, 0),
(476, 1, 5, 'mod/data:comment', 1, 1372258414, 0),
(477, 1, 4, 'mod/data:comment', 1, 1372258414, 0),
(478, 1, 3, 'mod/data:comment', 1, 1372258414, 0),
(479, 1, 1, 'mod/data:comment', 1, 1372258414, 0),
(480, 1, 4, 'mod/data:rate', 1, 1372258414, 0),
(481, 1, 3, 'mod/data:rate', 1, 1372258414, 0),
(482, 1, 1, 'mod/data:rate', 1, 1372258414, 0),
(483, 1, 4, 'mod/data:viewrating', 1, 1372258414, 0),
(484, 1, 3, 'mod/data:viewrating', 1, 1372258414, 0),
(485, 1, 1, 'mod/data:viewrating', 1, 1372258414, 0),
(486, 1, 4, 'mod/data:viewanyrating', 1, 1372258414, 0),
(487, 1, 3, 'mod/data:viewanyrating', 1, 1372258414, 0),
(488, 1, 1, 'mod/data:viewanyrating', 1, 1372258414, 0),
(489, 1, 4, 'mod/data:viewallratings', 1, 1372258414, 0),
(490, 1, 3, 'mod/data:viewallratings', 1, 1372258414, 0),
(491, 1, 1, 'mod/data:viewallratings', 1, 1372258414, 0),
(492, 1, 4, 'mod/data:approve', 1, 1372258414, 0),
(493, 1, 3, 'mod/data:approve', 1, 1372258414, 0),
(494, 1, 1, 'mod/data:approve', 1, 1372258414, 0),
(495, 1, 4, 'mod/data:manageentries', 1, 1372258414, 0),
(496, 1, 3, 'mod/data:manageentries', 1, 1372258414, 0),
(497, 1, 1, 'mod/data:manageentries', 1, 1372258414, 0),
(498, 1, 4, 'mod/data:managecomments', 1, 1372258414, 0),
(499, 1, 3, 'mod/data:managecomments', 1, 1372258415, 0),
(500, 1, 1, 'mod/data:managecomments', 1, 1372258415, 0),
(501, 1, 3, 'mod/data:managetemplates', 1, 1372258415, 0),
(502, 1, 1, 'mod/data:managetemplates', 1, 1372258415, 0),
(503, 1, 4, 'mod/data:viewalluserpresets', 1, 1372258415, 0),
(504, 1, 3, 'mod/data:viewalluserpresets', 1, 1372258415, 0),
(505, 1, 1, 'mod/data:viewalluserpresets', 1, 1372258415, 0),
(506, 1, 1, 'mod/data:manageuserpresets', 1, 1372258415, 0),
(507, 1, 1, 'mod/data:exportentry', 1, 1372258415, 0),
(508, 1, 4, 'mod/data:exportentry', 1, 1372258415, 0),
(509, 1, 3, 'mod/data:exportentry', 1, 1372258415, 0),
(510, 1, 1, 'mod/data:exportownentry', 1, 1372258415, 0),
(511, 1, 4, 'mod/data:exportownentry', 1, 1372258415, 0),
(512, 1, 3, 'mod/data:exportownentry', 1, 1372258415, 0),
(513, 1, 5, 'mod/data:exportownentry', 1, 1372258415, 0),
(514, 1, 1, 'mod/data:exportallentries', 1, 1372258415, 0),
(515, 1, 4, 'mod/data:exportallentries', 1, 1372258415, 0),
(516, 1, 3, 'mod/data:exportallentries', 1, 1372258415, 0),
(517, 1, 1, 'mod/data:exportuserinfo', 1, 1372258415, 0),
(518, 1, 4, 'mod/data:exportuserinfo', 1, 1372258415, 0),
(519, 1, 3, 'mod/data:exportuserinfo', 1, 1372258415, 0),
(520, 1, 3, 'mod/feedback:addinstance', 1, 1372258416, 0),
(521, 1, 1, 'mod/feedback:addinstance', 1, 1372258416, 0),
(522, 1, 6, 'mod/feedback:view', 1, 1372258416, 0),
(523, 1, 5, 'mod/feedback:view', 1, 1372258416, 0),
(524, 1, 4, 'mod/feedback:view', 1, 1372258416, 0),
(525, 1, 3, 'mod/feedback:view', 1, 1372258416, 0),
(526, 1, 1, 'mod/feedback:view', 1, 1372258416, 0),
(527, 1, 5, 'mod/feedback:complete', 1, 1372258416, 0),
(528, 1, 5, 'mod/feedback:viewanalysepage', 1, 1372258416, 0),
(529, 1, 3, 'mod/feedback:viewanalysepage', 1, 1372258416, 0),
(530, 1, 1, 'mod/feedback:viewanalysepage', 1, 1372258416, 0),
(531, 1, 3, 'mod/feedback:deletesubmissions', 1, 1372258416, 0),
(532, 1, 1, 'mod/feedback:deletesubmissions', 1, 1372258416, 0),
(533, 1, 1, 'mod/feedback:mapcourse', 1, 1372258416, 0),
(534, 1, 3, 'mod/feedback:edititems', 1, 1372258416, 0),
(535, 1, 1, 'mod/feedback:edititems', 1, 1372258416, 0),
(536, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1372258416, 0),
(537, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1372258416, 0),
(538, 1, 3, 'mod/feedback:createpublictemplate', 1, 1372258416, 0),
(539, 1, 1, 'mod/feedback:createpublictemplate', 1, 1372258416, 0),
(540, 1, 3, 'mod/feedback:deletetemplate', 1, 1372258416, 0),
(541, 1, 1, 'mod/feedback:deletetemplate', 1, 1372258416, 0),
(542, 1, 4, 'mod/feedback:viewreports', 1, 1372258417, 0),
(543, 1, 3, 'mod/feedback:viewreports', 1, 1372258417, 0),
(544, 1, 1, 'mod/feedback:viewreports', 1, 1372258417, 0),
(545, 1, 4, 'mod/feedback:receivemail', 1, 1372258417, 0),
(546, 1, 3, 'mod/feedback:receivemail', 1, 1372258417, 0),
(547, 1, 3, 'mod/folder:addinstance', 1, 1372258418, 0),
(548, 1, 1, 'mod/folder:addinstance', 1, 1372258418, 0),
(549, 1, 6, 'mod/folder:view', 1, 1372258418, 0),
(550, 1, 7, 'mod/folder:view', 1, 1372258418, 0),
(551, 1, 3, 'mod/folder:managefiles', 1, 1372258418, 0),
(552, 1, 3, 'mod/forum:addinstance', 1, 1372258419, 0),
(553, 1, 1, 'mod/forum:addinstance', 1, 1372258419, 0),
(554, 1, 8, 'mod/forum:viewdiscussion', 1, 1372258419, 0),
(555, 1, 6, 'mod/forum:viewdiscussion', 1, 1372258419, 0),
(556, 1, 5, 'mod/forum:viewdiscussion', 1, 1372258419, 0),
(557, 1, 4, 'mod/forum:viewdiscussion', 1, 1372258419, 0),
(558, 1, 3, 'mod/forum:viewdiscussion', 1, 1372258419, 0),
(559, 1, 1, 'mod/forum:viewdiscussion', 1, 1372258419, 0),
(560, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1372258419, 0),
(561, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1372258419, 0),
(562, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1372258419, 0),
(563, 1, 5, 'mod/forum:startdiscussion', 1, 1372258419, 0),
(564, 1, 4, 'mod/forum:startdiscussion', 1, 1372258419, 0),
(565, 1, 3, 'mod/forum:startdiscussion', 1, 1372258419, 0),
(566, 1, 1, 'mod/forum:startdiscussion', 1, 1372258419, 0),
(567, 1, 5, 'mod/forum:replypost', 1, 1372258419, 0),
(568, 1, 4, 'mod/forum:replypost', 1, 1372258419, 0),
(569, 1, 3, 'mod/forum:replypost', 1, 1372258419, 0),
(570, 1, 1, 'mod/forum:replypost', 1, 1372258419, 0),
(571, 1, 4, 'mod/forum:addnews', 1, 1372258419, 0),
(572, 1, 3, 'mod/forum:addnews', 1, 1372258419, 0),
(573, 1, 1, 'mod/forum:addnews', 1, 1372258419, 0),
(574, 1, 4, 'mod/forum:replynews', 1, 1372258419, 0),
(575, 1, 3, 'mod/forum:replynews', 1, 1372258419, 0),
(576, 1, 1, 'mod/forum:replynews', 1, 1372258419, 0),
(577, 1, 5, 'mod/forum:viewrating', 1, 1372258419, 0),
(578, 1, 4, 'mod/forum:viewrating', 1, 1372258419, 0),
(579, 1, 3, 'mod/forum:viewrating', 1, 1372258419, 0),
(580, 1, 1, 'mod/forum:viewrating', 1, 1372258419, 0),
(581, 1, 4, 'mod/forum:viewanyrating', 1, 1372258419, 0),
(582, 1, 3, 'mod/forum:viewanyrating', 1, 1372258419, 0),
(583, 1, 1, 'mod/forum:viewanyrating', 1, 1372258419, 0),
(584, 1, 4, 'mod/forum:viewallratings', 1, 1372258420, 0),
(585, 1, 3, 'mod/forum:viewallratings', 1, 1372258420, 0),
(586, 1, 1, 'mod/forum:viewallratings', 1, 1372258420, 0),
(587, 1, 4, 'mod/forum:rate', 1, 1372258420, 0),
(588, 1, 3, 'mod/forum:rate', 1, 1372258420, 0),
(589, 1, 1, 'mod/forum:rate', 1, 1372258420, 0),
(590, 1, 5, 'mod/forum:createattachment', 1, 1372258420, 0),
(591, 1, 4, 'mod/forum:createattachment', 1, 1372258420, 0),
(592, 1, 3, 'mod/forum:createattachment', 1, 1372258420, 0),
(593, 1, 1, 'mod/forum:createattachment', 1, 1372258420, 0),
(594, 1, 5, 'mod/forum:deleteownpost', 1, 1372258420, 0),
(595, 1, 4, 'mod/forum:deleteownpost', 1, 1372258420, 0),
(596, 1, 3, 'mod/forum:deleteownpost', 1, 1372258420, 0),
(597, 1, 1, 'mod/forum:deleteownpost', 1, 1372258420, 0),
(598, 1, 4, 'mod/forum:deleteanypost', 1, 1372258420, 0),
(599, 1, 3, 'mod/forum:deleteanypost', 1, 1372258420, 0),
(600, 1, 1, 'mod/forum:deleteanypost', 1, 1372258420, 0),
(601, 1, 4, 'mod/forum:splitdiscussions', 1, 1372258420, 0),
(602, 1, 3, 'mod/forum:splitdiscussions', 1, 1372258420, 0),
(603, 1, 1, 'mod/forum:splitdiscussions', 1, 1372258420, 0),
(604, 1, 4, 'mod/forum:movediscussions', 1, 1372258420, 0),
(605, 1, 3, 'mod/forum:movediscussions', 1, 1372258420, 0),
(606, 1, 1, 'mod/forum:movediscussions', 1, 1372258420, 0),
(607, 1, 4, 'mod/forum:editanypost', 1, 1372258420, 0),
(608, 1, 3, 'mod/forum:editanypost', 1, 1372258420, 0),
(609, 1, 1, 'mod/forum:editanypost', 1, 1372258420, 0),
(610, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1372258420, 0),
(611, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1372258420, 0),
(612, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1372258420, 0),
(613, 1, 4, 'mod/forum:viewsubscribers', 1, 1372258420, 0),
(614, 1, 3, 'mod/forum:viewsubscribers', 1, 1372258420, 0),
(615, 1, 1, 'mod/forum:viewsubscribers', 1, 1372258420, 0),
(616, 1, 4, 'mod/forum:managesubscriptions', 1, 1372258420, 0),
(617, 1, 3, 'mod/forum:managesubscriptions', 1, 1372258420, 0),
(618, 1, 1, 'mod/forum:managesubscriptions', 1, 1372258420, 0),
(619, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1372258420, 0),
(620, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1372258420, 0),
(621, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1372258420, 0),
(622, 1, 4, 'mod/forum:exportdiscussion', 1, 1372258420, 0),
(623, 1, 3, 'mod/forum:exportdiscussion', 1, 1372258420, 0),
(624, 1, 1, 'mod/forum:exportdiscussion', 1, 1372258420, 0),
(625, 1, 4, 'mod/forum:exportpost', 1, 1372258420, 0),
(626, 1, 3, 'mod/forum:exportpost', 1, 1372258420, 0),
(627, 1, 1, 'mod/forum:exportpost', 1, 1372258420, 0),
(628, 1, 4, 'mod/forum:exportownpost', 1, 1372258420, 0),
(629, 1, 3, 'mod/forum:exportownpost', 1, 1372258420, 0),
(630, 1, 1, 'mod/forum:exportownpost', 1, 1372258420, 0),
(631, 1, 5, 'mod/forum:exportownpost', 1, 1372258420, 0),
(632, 1, 4, 'mod/forum:addquestion', 1, 1372258420, 0),
(633, 1, 3, 'mod/forum:addquestion', 1, 1372258420, 0),
(634, 1, 1, 'mod/forum:addquestion', 1, 1372258420, 0),
(635, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1372258420, 0),
(636, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1372258420, 0),
(637, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1372258420, 0),
(638, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1372258421, 0),
(639, 1, 3, 'mod/glossary:addinstance', 1, 1372258422, 0),
(640, 1, 1, 'mod/glossary:addinstance', 1, 1372258422, 0),
(641, 1, 8, 'mod/glossary:view', 1, 1372258422, 0),
(642, 1, 6, 'mod/glossary:view', 1, 1372258422, 0),
(643, 1, 5, 'mod/glossary:view', 1, 1372258422, 0),
(644, 1, 4, 'mod/glossary:view', 1, 1372258422, 0),
(645, 1, 3, 'mod/glossary:view', 1, 1372258422, 0),
(646, 1, 1, 'mod/glossary:view', 1, 1372258422, 0),
(647, 1, 5, 'mod/glossary:write', 1, 1372258422, 0),
(648, 1, 4, 'mod/glossary:write', 1, 1372258423, 0),
(649, 1, 3, 'mod/glossary:write', 1, 1372258423, 0),
(650, 1, 1, 'mod/glossary:write', 1, 1372258423, 0),
(651, 1, 4, 'mod/glossary:manageentries', 1, 1372258423, 0),
(652, 1, 3, 'mod/glossary:manageentries', 1, 1372258423, 0),
(653, 1, 1, 'mod/glossary:manageentries', 1, 1372258423, 0),
(654, 1, 4, 'mod/glossary:managecategories', 1, 1372258423, 0),
(655, 1, 3, 'mod/glossary:managecategories', 1, 1372258423, 0),
(656, 1, 1, 'mod/glossary:managecategories', 1, 1372258423, 0),
(657, 1, 5, 'mod/glossary:comment', 1, 1372258423, 0),
(658, 1, 4, 'mod/glossary:comment', 1, 1372258423, 0),
(659, 1, 3, 'mod/glossary:comment', 1, 1372258423, 0),
(660, 1, 1, 'mod/glossary:comment', 1, 1372258423, 0),
(661, 1, 4, 'mod/glossary:managecomments', 1, 1372258423, 0),
(662, 1, 3, 'mod/glossary:managecomments', 1, 1372258423, 0),
(663, 1, 1, 'mod/glossary:managecomments', 1, 1372258423, 0),
(664, 1, 4, 'mod/glossary:import', 1, 1372258423, 0),
(665, 1, 3, 'mod/glossary:import', 1, 1372258423, 0),
(666, 1, 1, 'mod/glossary:import', 1, 1372258423, 0),
(667, 1, 4, 'mod/glossary:export', 1, 1372258423, 0),
(668, 1, 3, 'mod/glossary:export', 1, 1372258423, 0),
(669, 1, 1, 'mod/glossary:export', 1, 1372258423, 0),
(670, 1, 4, 'mod/glossary:approve', 1, 1372258423, 0),
(671, 1, 3, 'mod/glossary:approve', 1, 1372258423, 0),
(672, 1, 1, 'mod/glossary:approve', 1, 1372258423, 0),
(673, 1, 4, 'mod/glossary:rate', 1, 1372258423, 0),
(674, 1, 3, 'mod/glossary:rate', 1, 1372258423, 0),
(675, 1, 1, 'mod/glossary:rate', 1, 1372258423, 0),
(676, 1, 4, 'mod/glossary:viewrating', 1, 1372258423, 0),
(677, 1, 3, 'mod/glossary:viewrating', 1, 1372258423, 0),
(678, 1, 1, 'mod/glossary:viewrating', 1, 1372258423, 0),
(679, 1, 4, 'mod/glossary:viewanyrating', 1, 1372258423, 0),
(680, 1, 3, 'mod/glossary:viewanyrating', 1, 1372258423, 0),
(681, 1, 1, 'mod/glossary:viewanyrating', 1, 1372258423, 0),
(682, 1, 4, 'mod/glossary:viewallratings', 1, 1372258423, 0),
(683, 1, 3, 'mod/glossary:viewallratings', 1, 1372258423, 0),
(684, 1, 1, 'mod/glossary:viewallratings', 1, 1372258423, 0),
(685, 1, 4, 'mod/glossary:exportentry', 1, 1372258423, 0),
(686, 1, 3, 'mod/glossary:exportentry', 1, 1372258423, 0),
(687, 1, 1, 'mod/glossary:exportentry', 1, 1372258423, 0),
(688, 1, 4, 'mod/glossary:exportownentry', 1, 1372258423, 0),
(689, 1, 3, 'mod/glossary:exportownentry', 1, 1372258423, 0),
(690, 1, 1, 'mod/glossary:exportownentry', 1, 1372258423, 0),
(691, 1, 5, 'mod/glossary:exportownentry', 1, 1372258423, 0),
(692, 1, 6, 'mod/imscp:view', 1, 1372258424, 0),
(693, 1, 7, 'mod/imscp:view', 1, 1372258424, 0),
(694, 1, 3, 'mod/imscp:addinstance', 1, 1372258424, 0),
(695, 1, 1, 'mod/imscp:addinstance', 1, 1372258424, 0),
(696, 1, 3, 'mod/label:addinstance', 1, 1372258425, 0),
(697, 1, 1, 'mod/label:addinstance', 1, 1372258425, 0),
(698, 1, 3, 'mod/lesson:addinstance', 1, 1372258427, 0),
(699, 1, 1, 'mod/lesson:addinstance', 1, 1372258427, 0),
(700, 1, 3, 'mod/lesson:edit', 1, 1372258427, 0),
(701, 1, 1, 'mod/lesson:edit', 1, 1372258427, 0),
(702, 1, 4, 'mod/lesson:manage', 1, 1372258427, 0),
(703, 1, 3, 'mod/lesson:manage', 1, 1372258427, 0),
(704, 1, 1, 'mod/lesson:manage', 1, 1372258427, 0),
(705, 1, 6, 'mod/lti:view', 1, 1372258428, 0),
(706, 1, 5, 'mod/lti:view', 1, 1372258428, 0),
(707, 1, 4, 'mod/lti:view', 1, 1372258428, 0),
(708, 1, 3, 'mod/lti:view', 1, 1372258428, 0),
(709, 1, 1, 'mod/lti:view', 1, 1372258428, 0),
(710, 1, 3, 'mod/lti:addinstance', 1, 1372258428, 0),
(711, 1, 1, 'mod/lti:addinstance', 1, 1372258428, 0),
(712, 1, 4, 'mod/lti:grade', 1, 1372258428, 0),
(713, 1, 3, 'mod/lti:grade', 1, 1372258428, 0),
(714, 1, 1, 'mod/lti:grade', 1, 1372258428, 0),
(715, 1, 4, 'mod/lti:manage', 1, 1372258428, 0),
(716, 1, 3, 'mod/lti:manage', 1, 1372258428, 0),
(717, 1, 1, 'mod/lti:manage', 1, 1372258428, 0),
(718, 1, 4, 'mod/lti:addcoursetool', 1, 1372258428, 0),
(719, 1, 3, 'mod/lti:addcoursetool', 1, 1372258428, 0),
(720, 1, 1, 'mod/lti:addcoursetool', 1, 1372258428, 0),
(721, 1, 4, 'mod/lti:requesttooladd', 1, 1372258428, 0),
(722, 1, 3, 'mod/lti:requesttooladd', 1, 1372258428, 0),
(723, 1, 1, 'mod/lti:requesttooladd', 1, 1372258428, 0),
(724, 1, 6, 'mod/page:view', 1, 1372258429, 0),
(725, 1, 7, 'mod/page:view', 1, 1372258429, 0),
(726, 1, 3, 'mod/page:addinstance', 1, 1372258429, 0),
(727, 1, 1, 'mod/page:addinstance', 1, 1372258429, 0),
(728, 1, 6, 'mod/quiz:view', 1, 1372258430, 0),
(729, 1, 5, 'mod/quiz:view', 1, 1372258430, 0),
(730, 1, 4, 'mod/quiz:view', 1, 1372258430, 0),
(731, 1, 3, 'mod/quiz:view', 1, 1372258430, 0),
(732, 1, 1, 'mod/quiz:view', 1, 1372258430, 0),
(733, 1, 3, 'mod/quiz:addinstance', 1, 1372258430, 0),
(734, 1, 1, 'mod/quiz:addinstance', 1, 1372258430, 0),
(735, 1, 5, 'mod/quiz:attempt', 1, 1372258430, 0),
(736, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1372258430, 0),
(737, 1, 3, 'mod/quiz:manage', 1, 1372258430, 0),
(738, 1, 1, 'mod/quiz:manage', 1, 1372258430, 0),
(739, 1, 3, 'mod/quiz:manageoverrides', 1, 1372258430, 0),
(740, 1, 1, 'mod/quiz:manageoverrides', 1, 1372258430, 0),
(741, 1, 4, 'mod/quiz:preview', 1, 1372258430, 0),
(742, 1, 3, 'mod/quiz:preview', 1, 1372258430, 0),
(743, 1, 1, 'mod/quiz:preview', 1, 1372258430, 0),
(744, 1, 4, 'mod/quiz:grade', 1, 1372258430, 0),
(745, 1, 3, 'mod/quiz:grade', 1, 1372258430, 0),
(746, 1, 1, 'mod/quiz:grade', 1, 1372258430, 0),
(747, 1, 4, 'mod/quiz:regrade', 1, 1372258430, 0),
(748, 1, 3, 'mod/quiz:regrade', 1, 1372258430, 0),
(749, 1, 1, 'mod/quiz:regrade', 1, 1372258430, 0),
(750, 1, 4, 'mod/quiz:viewreports', 1, 1372258430, 0),
(751, 1, 3, 'mod/quiz:viewreports', 1, 1372258430, 0),
(752, 1, 1, 'mod/quiz:viewreports', 1, 1372258430, 0),
(753, 1, 3, 'mod/quiz:deleteattempts', 1, 1372258430, 0),
(754, 1, 1, 'mod/quiz:deleteattempts', 1, 1372258430, 0),
(755, 1, 6, 'mod/resource:view', 1, 1372258431, 0),
(756, 1, 7, 'mod/resource:view', 1, 1372258431, 0),
(757, 1, 3, 'mod/resource:addinstance', 1, 1372258431, 0),
(758, 1, 1, 'mod/resource:addinstance', 1, 1372258431, 0),
(759, 1, 3, 'mod/scorm:addinstance', 1, 1372258432, 0),
(760, 1, 1, 'mod/scorm:addinstance', 1, 1372258432, 0),
(761, 1, 4, 'mod/scorm:viewreport', 1, 1372258432, 0),
(762, 1, 3, 'mod/scorm:viewreport', 1, 1372258432, 0),
(763, 1, 1, 'mod/scorm:viewreport', 1, 1372258432, 0),
(764, 1, 5, 'mod/scorm:skipview', 1, 1372258432, 0),
(765, 1, 5, 'mod/scorm:savetrack', 1, 1372258432, 0),
(766, 1, 4, 'mod/scorm:savetrack', 1, 1372258432, 0),
(767, 1, 3, 'mod/scorm:savetrack', 1, 1372258432, 0),
(768, 1, 1, 'mod/scorm:savetrack', 1, 1372258432, 0),
(769, 1, 5, 'mod/scorm:viewscores', 1, 1372258432, 0),
(770, 1, 4, 'mod/scorm:viewscores', 1, 1372258432, 0),
(771, 1, 3, 'mod/scorm:viewscores', 1, 1372258432, 0),
(772, 1, 1, 'mod/scorm:viewscores', 1, 1372258432, 0),
(773, 1, 4, 'mod/scorm:deleteresponses', 1, 1372258432, 0),
(774, 1, 3, 'mod/scorm:deleteresponses', 1, 1372258432, 0),
(775, 1, 1, 'mod/scorm:deleteresponses', 1, 1372258432, 0),
(776, 1, 3, 'mod/survey:addinstance', 1, 1372258434, 0),
(777, 1, 1, 'mod/survey:addinstance', 1, 1372258434, 0),
(778, 1, 5, 'mod/survey:participate', 1, 1372258434, 0),
(779, 1, 4, 'mod/survey:participate', 1, 1372258434, 0),
(780, 1, 3, 'mod/survey:participate', 1, 1372258434, 0),
(781, 1, 1, 'mod/survey:participate', 1, 1372258434, 0),
(782, 1, 4, 'mod/survey:readresponses', 1, 1372258434, 0),
(783, 1, 3, 'mod/survey:readresponses', 1, 1372258435, 0),
(784, 1, 1, 'mod/survey:readresponses', 1, 1372258435, 0),
(785, 1, 4, 'mod/survey:download', 1, 1372258435, 0),
(786, 1, 3, 'mod/survey:download', 1, 1372258435, 0),
(787, 1, 1, 'mod/survey:download', 1, 1372258435, 0),
(788, 1, 6, 'mod/url:view', 1, 1372258435, 0),
(789, 1, 7, 'mod/url:view', 1, 1372258435, 0),
(790, 1, 3, 'mod/url:addinstance', 1, 1372258435, 0),
(791, 1, 1, 'mod/url:addinstance', 1, 1372258435, 0),
(792, 1, 3, 'mod/wiki:addinstance', 1, 1372258436, 0),
(793, 1, 1, 'mod/wiki:addinstance', 1, 1372258436, 0),
(794, 1, 6, 'mod/wiki:viewpage', 1, 1372258436, 0),
(795, 1, 5, 'mod/wiki:viewpage', 1, 1372258436, 0),
(796, 1, 4, 'mod/wiki:viewpage', 1, 1372258436, 0),
(797, 1, 3, 'mod/wiki:viewpage', 1, 1372258436, 0),
(798, 1, 1, 'mod/wiki:viewpage', 1, 1372258436, 0),
(799, 1, 5, 'mod/wiki:editpage', 1, 1372258436, 0),
(800, 1, 4, 'mod/wiki:editpage', 1, 1372258436, 0),
(801, 1, 3, 'mod/wiki:editpage', 1, 1372258436, 0),
(802, 1, 1, 'mod/wiki:editpage', 1, 1372258436, 0),
(803, 1, 5, 'mod/wiki:createpage', 1, 1372258436, 0),
(804, 1, 4, 'mod/wiki:createpage', 1, 1372258436, 0),
(805, 1, 3, 'mod/wiki:createpage', 1, 1372258436, 0),
(806, 1, 1, 'mod/wiki:createpage', 1, 1372258436, 0),
(807, 1, 5, 'mod/wiki:viewcomment', 1, 1372258436, 0),
(808, 1, 4, 'mod/wiki:viewcomment', 1, 1372258436, 0),
(809, 1, 3, 'mod/wiki:viewcomment', 1, 1372258436, 0),
(810, 1, 1, 'mod/wiki:viewcomment', 1, 1372258436, 0),
(811, 1, 5, 'mod/wiki:editcomment', 1, 1372258436, 0),
(812, 1, 4, 'mod/wiki:editcomment', 1, 1372258436, 0),
(813, 1, 3, 'mod/wiki:editcomment', 1, 1372258436, 0),
(814, 1, 1, 'mod/wiki:editcomment', 1, 1372258436, 0),
(815, 1, 4, 'mod/wiki:managecomment', 1, 1372258436, 0),
(816, 1, 3, 'mod/wiki:managecomment', 1, 1372258436, 0),
(817, 1, 1, 'mod/wiki:managecomment', 1, 1372258436, 0),
(818, 1, 4, 'mod/wiki:managefiles', 1, 1372258436, 0),
(819, 1, 3, 'mod/wiki:managefiles', 1, 1372258436, 0),
(820, 1, 1, 'mod/wiki:managefiles', 1, 1372258436, 0),
(821, 1, 4, 'mod/wiki:overridelock', 1, 1372258436, 0),
(822, 1, 3, 'mod/wiki:overridelock', 1, 1372258436, 0),
(823, 1, 1, 'mod/wiki:overridelock', 1, 1372258436, 0),
(824, 1, 4, 'mod/wiki:managewiki', 1, 1372258436, 0),
(825, 1, 3, 'mod/wiki:managewiki', 1, 1372258436, 0),
(826, 1, 1, 'mod/wiki:managewiki', 1, 1372258436, 0),
(827, 1, 6, 'mod/workshop:view', 1, 1372258439, 0),
(828, 1, 5, 'mod/workshop:view', 1, 1372258439, 0),
(829, 1, 4, 'mod/workshop:view', 1, 1372258439, 0),
(830, 1, 3, 'mod/workshop:view', 1, 1372258439, 0),
(831, 1, 1, 'mod/workshop:view', 1, 1372258439, 0),
(832, 1, 3, 'mod/workshop:addinstance', 1, 1372258439, 0),
(833, 1, 1, 'mod/workshop:addinstance', 1, 1372258439, 0),
(834, 1, 4, 'mod/workshop:switchphase', 1, 1372258439, 0),
(835, 1, 3, 'mod/workshop:switchphase', 1, 1372258439, 0),
(836, 1, 1, 'mod/workshop:switchphase', 1, 1372258439, 0),
(837, 1, 3, 'mod/workshop:editdimensions', 1, 1372258439, 0),
(838, 1, 1, 'mod/workshop:editdimensions', 1, 1372258439, 0),
(839, 1, 5, 'mod/workshop:submit', 1, 1372258439, 0),
(840, 1, 5, 'mod/workshop:peerassess', 1, 1372258439, 0),
(841, 1, 4, 'mod/workshop:manageexamples', 1, 1372258439, 0),
(842, 1, 3, 'mod/workshop:manageexamples', 1, 1372258439, 0),
(843, 1, 1, 'mod/workshop:manageexamples', 1, 1372258439, 0),
(844, 1, 4, 'mod/workshop:allocate', 1, 1372258439, 0),
(845, 1, 3, 'mod/workshop:allocate', 1, 1372258439, 0),
(846, 1, 1, 'mod/workshop:allocate', 1, 1372258439, 0),
(847, 1, 4, 'mod/workshop:publishsubmissions', 1, 1372258439, 0),
(848, 1, 3, 'mod/workshop:publishsubmissions', 1, 1372258439, 0),
(849, 1, 1, 'mod/workshop:publishsubmissions', 1, 1372258439, 0),
(850, 1, 5, 'mod/workshop:viewauthornames', 1, 1372258439, 0),
(851, 1, 4, 'mod/workshop:viewauthornames', 1, 1372258439, 0),
(852, 1, 3, 'mod/workshop:viewauthornames', 1, 1372258439, 0),
(853, 1, 1, 'mod/workshop:viewauthornames', 1, 1372258439, 0),
(854, 1, 4, 'mod/workshop:viewreviewernames', 1, 1372258439, 0),
(855, 1, 3, 'mod/workshop:viewreviewernames', 1, 1372258439, 0),
(856, 1, 1, 'mod/workshop:viewreviewernames', 1, 1372258439, 0),
(857, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1372258439, 0),
(858, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1372258439, 0),
(859, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1372258439, 0),
(860, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1372258439, 0),
(861, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1372258439, 0),
(862, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1372258439, 0),
(863, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1372258439, 0),
(864, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1372258439, 0),
(865, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1372258439, 0),
(866, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1372258439, 0),
(867, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1372258439, 0),
(868, 1, 4, 'mod/workshop:viewallassessments', 1, 1372258439, 0),
(869, 1, 3, 'mod/workshop:viewallassessments', 1, 1372258439, 0),
(870, 1, 1, 'mod/workshop:viewallassessments', 1, 1372258439, 0),
(871, 1, 4, 'mod/workshop:overridegrades', 1, 1372258439, 0),
(872, 1, 3, 'mod/workshop:overridegrades', 1, 1372258439, 0),
(873, 1, 1, 'mod/workshop:overridegrades', 1, 1372258439, 0),
(874, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1372258439, 0),
(875, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1372258439, 0),
(876, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1372258439, 0),
(877, 1, 1, 'enrol/authorize:config', 1, 1372258456, 0),
(878, 1, 1, 'enrol/authorize:manage', 1, 1372258456, 0),
(879, 1, 3, 'enrol/authorize:manage', 1, 1372258456, 0),
(880, 1, 1, 'enrol/authorize:unenrol', 1, 1372258456, 0),
(881, 1, 1, 'enrol/authorize:managepayments', 1, 1372258456, 0),
(882, 1, 1, 'enrol/authorize:uploadcsv', 1, 1372258456, 0),
(883, 1, 3, 'enrol/cohort:config', 1, 1372258457, 0),
(884, 1, 1, 'enrol/cohort:config', 1, 1372258457, 0),
(885, 1, 1, 'enrol/cohort:unenrol', 1, 1372258457, 0),
(886, 1, 1, 'enrol/database:unenrol', 1, 1372258458, 0),
(887, 1, 1, 'enrol/guest:config', 1, 1372258460, 0),
(888, 1, 3, 'enrol/guest:config', 1, 1372258460, 0),
(889, 1, 1, 'enrol/ldap:manage', 1, 1372258461, 0),
(890, 1, 1, 'enrol/manual:config', 1, 1372258462, 0),
(891, 1, 1, 'enrol/manual:enrol', 1, 1372258462, 0),
(892, 1, 3, 'enrol/manual:enrol', 1, 1372258462, 0),
(893, 1, 1, 'enrol/manual:manage', 1, 1372258462, 0),
(894, 1, 3, 'enrol/manual:manage', 1, 1372258462, 0),
(895, 1, 1, 'enrol/manual:unenrol', 1, 1372258462, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(896, 1, 3, 'enrol/manual:unenrol', 1, 1372258462, 0),
(897, 1, 1, 'enrol/meta:config', 1, 1372258462, 0),
(898, 1, 3, 'enrol/meta:config', 1, 1372258462, 0),
(899, 1, 1, 'enrol/meta:selectaslinked', 1, 1372258462, 0),
(900, 1, 1, 'enrol/meta:unenrol', 1, 1372258462, 0),
(901, 1, 1, 'enrol/paypal:config', 1, 1372258464, 0),
(902, 1, 1, 'enrol/paypal:manage', 1, 1372258464, 0),
(903, 1, 3, 'enrol/paypal:manage', 1, 1372258464, 0),
(904, 1, 1, 'enrol/paypal:unenrol', 1, 1372258464, 0),
(905, 1, 3, 'enrol/self:config', 1, 1372258465, 0),
(906, 1, 1, 'enrol/self:config', 1, 1372258465, 0),
(907, 1, 3, 'enrol/self:manage', 1, 1372258465, 0),
(908, 1, 1, 'enrol/self:manage', 1, 1372258465, 0),
(909, 1, 5, 'enrol/self:unenrolself', 1, 1372258465, 0),
(910, 1, 3, 'enrol/self:unenrol', 1, 1372258465, 0),
(911, 1, 1, 'enrol/self:unenrol', 1, 1372258465, 0),
(912, 1, 3, 'block/activity_modules:addinstance', 1, 1372258470, 0),
(913, 1, 1, 'block/activity_modules:addinstance', 1, 1372258470, 0),
(914, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1372258471, 0),
(915, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1372258471, 0),
(916, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1372258471, 0),
(917, 1, 3, 'block/badges:addinstance', 1, 1372258471, 0),
(918, 1, 1, 'block/badges:addinstance', 1, 1372258471, 0),
(919, 1, 7, 'block/badges:myaddinstance', 1, 1372258471, 0),
(920, 1, 3, 'block/blog_menu:addinstance', 1, 1372258472, 0),
(921, 1, 1, 'block/blog_menu:addinstance', 1, 1372258472, 0),
(922, 1, 3, 'block/blog_recent:addinstance', 1, 1372258473, 0),
(923, 1, 1, 'block/blog_recent:addinstance', 1, 1372258473, 0),
(924, 1, 3, 'block/blog_tags:addinstance', 1, 1372258473, 0),
(925, 1, 1, 'block/blog_tags:addinstance', 1, 1372258473, 0),
(926, 1, 7, 'block/calendar_month:myaddinstance', 1, 1372258474, 0),
(927, 1, 3, 'block/calendar_month:addinstance', 1, 1372258474, 0),
(928, 1, 1, 'block/calendar_month:addinstance', 1, 1372258474, 0),
(929, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1372258475, 0),
(930, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1372258475, 0),
(931, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1372258475, 0),
(932, 1, 7, 'block/comments:myaddinstance', 1, 1372258475, 0),
(933, 1, 3, 'block/comments:addinstance', 1, 1372258475, 0),
(934, 1, 1, 'block/comments:addinstance', 1, 1372258475, 0),
(935, 1, 7, 'block/community:myaddinstance', 1, 1372258476, 0),
(936, 1, 3, 'block/community:addinstance', 1, 1372258476, 0),
(937, 1, 1, 'block/community:addinstance', 1, 1372258476, 0),
(938, 1, 3, 'block/completionstatus:addinstance', 1, 1372258476, 0),
(939, 1, 1, 'block/completionstatus:addinstance', 1, 1372258476, 0),
(940, 1, 7, 'block/course_list:myaddinstance', 1, 1372258476, 0),
(941, 1, 3, 'block/course_list:addinstance', 1, 1372258477, 0),
(942, 1, 1, 'block/course_list:addinstance', 1, 1372258477, 0),
(943, 1, 7, 'block/course_overview:myaddinstance', 1, 1372258477, 0),
(944, 1, 3, 'block/course_summary:addinstance', 1, 1372258477, 0),
(945, 1, 1, 'block/course_summary:addinstance', 1, 1372258477, 0),
(946, 1, 3, 'block/feedback:addinstance', 1, 1372258478, 0),
(947, 1, 1, 'block/feedback:addinstance', 1, 1372258478, 0),
(948, 1, 7, 'block/glossary_random:myaddinstance', 1, 1372258478, 0),
(949, 1, 3, 'block/glossary_random:addinstance', 1, 1372258478, 0),
(950, 1, 1, 'block/glossary_random:addinstance', 1, 1372258478, 0),
(951, 1, 7, 'block/html:myaddinstance', 1, 1372258479, 0),
(952, 1, 3, 'block/html:addinstance', 1, 1372258479, 0),
(953, 1, 1, 'block/html:addinstance', 1, 1372258479, 0),
(954, 1, 3, 'block/login:addinstance', 1, 1372258480, 0),
(955, 1, 1, 'block/login:addinstance', 1, 1372258480, 0),
(956, 1, 7, 'block/mentees:myaddinstance', 1, 1372258481, 0),
(957, 1, 3, 'block/mentees:addinstance', 1, 1372258481, 0),
(958, 1, 1, 'block/mentees:addinstance', 1, 1372258481, 0),
(959, 1, 7, 'block/messages:myaddinstance', 1, 1372258481, 0),
(960, 1, 3, 'block/messages:addinstance', 1, 1372258481, 0),
(961, 1, 1, 'block/messages:addinstance', 1, 1372258481, 0),
(962, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1372258481, 0),
(963, 1, 3, 'block/mnet_hosts:addinstance', 1, 1372258481, 0),
(964, 1, 1, 'block/mnet_hosts:addinstance', 1, 1372258481, 0),
(965, 1, 7, 'block/myprofile:myaddinstance', 1, 1372258482, 0),
(966, 1, 3, 'block/myprofile:addinstance', 1, 1372258482, 0),
(967, 1, 1, 'block/myprofile:addinstance', 1, 1372258482, 0),
(968, 1, 7, 'block/navigation:myaddinstance', 1, 1372258483, 0),
(969, 1, 3, 'block/navigation:addinstance', 1, 1372258483, 0),
(970, 1, 1, 'block/navigation:addinstance', 1, 1372258483, 0),
(971, 1, 7, 'block/news_items:myaddinstance', 1, 1372258484, 0),
(972, 1, 3, 'block/news_items:addinstance', 1, 1372258484, 0),
(973, 1, 1, 'block/news_items:addinstance', 1, 1372258485, 0),
(974, 1, 7, 'block/online_users:myaddinstance', 1, 1372258485, 0),
(975, 1, 3, 'block/online_users:addinstance', 1, 1372258485, 0),
(976, 1, 1, 'block/online_users:addinstance', 1, 1372258486, 0),
(977, 1, 7, 'block/online_users:viewlist', 1, 1372258486, 0),
(978, 1, 6, 'block/online_users:viewlist', 1, 1372258486, 0),
(979, 1, 5, 'block/online_users:viewlist', 1, 1372258486, 0),
(980, 1, 4, 'block/online_users:viewlist', 1, 1372258486, 0),
(981, 1, 3, 'block/online_users:viewlist', 1, 1372258486, 0),
(982, 1, 1, 'block/online_users:viewlist', 1, 1372258486, 0),
(983, 1, 3, 'block/participants:addinstance', 1, 1372258486, 0),
(984, 1, 1, 'block/participants:addinstance', 1, 1372258486, 0),
(985, 1, 7, 'block/private_files:myaddinstance', 1, 1372258487, 0),
(986, 1, 3, 'block/private_files:addinstance', 1, 1372258487, 0),
(987, 1, 1, 'block/private_files:addinstance', 1, 1372258487, 0),
(988, 1, 3, 'block/quiz_results:addinstance', 1, 1372258487, 0),
(989, 1, 1, 'block/quiz_results:addinstance', 1, 1372258487, 0),
(990, 1, 3, 'block/recent_activity:addinstance', 1, 1372258487, 0),
(991, 1, 1, 'block/recent_activity:addinstance', 1, 1372258487, 0),
(992, 1, 7, 'block/rss_client:myaddinstance', 1, 1372258488, 0),
(993, 1, 3, 'block/rss_client:addinstance', 1, 1372258488, 0),
(994, 1, 1, 'block/rss_client:addinstance', 1, 1372258488, 0),
(995, 1, 4, 'block/rss_client:manageownfeeds', 1, 1372258488, 0),
(996, 1, 3, 'block/rss_client:manageownfeeds', 1, 1372258488, 0),
(997, 1, 1, 'block/rss_client:manageownfeeds', 1, 1372258488, 0),
(998, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1372258488, 0),
(999, 1, 3, 'block/search_forums:addinstance', 1, 1372258488, 0),
(1000, 1, 1, 'block/search_forums:addinstance', 1, 1372258488, 0),
(1001, 1, 3, 'block/section_links:addinstance', 1, 1372258488, 0),
(1002, 1, 1, 'block/section_links:addinstance', 1, 1372258488, 0),
(1003, 1, 3, 'block/selfcompletion:addinstance', 1, 1372258488, 0),
(1004, 1, 1, 'block/selfcompletion:addinstance', 1, 1372258488, 0),
(1005, 1, 7, 'block/settings:myaddinstance', 1, 1372258489, 0),
(1006, 1, 3, 'block/settings:addinstance', 1, 1372258489, 0),
(1007, 1, 1, 'block/settings:addinstance', 1, 1372258489, 0),
(1008, 1, 3, 'block/site_main_menu:addinstance', 1, 1372258489, 0),
(1009, 1, 1, 'block/site_main_menu:addinstance', 1, 1372258489, 0),
(1010, 1, 3, 'block/social_activities:addinstance', 1, 1372258489, 0),
(1011, 1, 1, 'block/social_activities:addinstance', 1, 1372258489, 0),
(1012, 1, 3, 'block/tag_flickr:addinstance', 1, 1372258489, 0),
(1013, 1, 1, 'block/tag_flickr:addinstance', 1, 1372258489, 0),
(1014, 1, 3, 'block/tag_youtube:addinstance', 1, 1372258490, 0),
(1015, 1, 1, 'block/tag_youtube:addinstance', 1, 1372258490, 0),
(1016, 1, 7, 'block/tags:myaddinstance', 1, 1372258490, 0),
(1017, 1, 3, 'block/tags:addinstance', 1, 1372258490, 0),
(1018, 1, 1, 'block/tags:addinstance', 1, 1372258490, 0),
(1019, 1, 4, 'report/completion:view', 1, 1372258515, 0),
(1020, 1, 3, 'report/completion:view', 1, 1372258515, 0),
(1021, 1, 1, 'report/completion:view', 1, 1372258515, 0),
(1022, 1, 4, 'report/courseoverview:view', 1, 1372258515, 0),
(1023, 1, 3, 'report/courseoverview:view', 1, 1372258515, 0),
(1024, 1, 1, 'report/courseoverview:view', 1, 1372258515, 0),
(1025, 1, 4, 'report/log:view', 1, 1372258516, 0),
(1026, 1, 3, 'report/log:view', 1, 1372258516, 0),
(1027, 1, 1, 'report/log:view', 1, 1372258516, 0),
(1028, 1, 4, 'report/log:viewtoday', 1, 1372258516, 0),
(1029, 1, 3, 'report/log:viewtoday', 1, 1372258516, 0),
(1030, 1, 1, 'report/log:viewtoday', 1, 1372258516, 0),
(1031, 1, 4, 'report/loglive:view', 1, 1372258517, 0),
(1032, 1, 3, 'report/loglive:view', 1, 1372258517, 0),
(1033, 1, 1, 'report/loglive:view', 1, 1372258517, 0),
(1034, 1, 4, 'report/outline:view', 1, 1372258517, 0),
(1035, 1, 3, 'report/outline:view', 1, 1372258517, 0),
(1036, 1, 1, 'report/outline:view', 1, 1372258517, 0),
(1037, 1, 4, 'report/participation:view', 1, 1372258518, 0),
(1038, 1, 3, 'report/participation:view', 1, 1372258518, 0),
(1039, 1, 1, 'report/participation:view', 1, 1372258518, 0),
(1040, 1, 1, 'report/performance:view', 1, 1372258518, 0),
(1041, 1, 4, 'report/progress:view', 1, 1372258519, 0),
(1042, 1, 3, 'report/progress:view', 1, 1372258519, 0),
(1043, 1, 1, 'report/progress:view', 1, 1372258519, 0),
(1044, 1, 1, 'report/security:view', 1, 1372258520, 0),
(1045, 1, 4, 'report/stats:view', 1, 1372258521, 0),
(1046, 1, 3, 'report/stats:view', 1, 1372258521, 0),
(1047, 1, 1, 'report/stats:view', 1, 1372258521, 0),
(1048, 1, 4, 'gradeexport/ods:view', 1, 1372258521, 0),
(1049, 1, 3, 'gradeexport/ods:view', 1, 1372258521, 0),
(1050, 1, 1, 'gradeexport/ods:view', 1, 1372258521, 0),
(1051, 1, 1, 'gradeexport/ods:publish', 1, 1372258521, 0),
(1052, 1, 4, 'gradeexport/txt:view', 1, 1372258522, 0),
(1053, 1, 3, 'gradeexport/txt:view', 1, 1372258522, 0),
(1054, 1, 1, 'gradeexport/txt:view', 1, 1372258522, 0),
(1055, 1, 1, 'gradeexport/txt:publish', 1, 1372258522, 0),
(1056, 1, 4, 'gradeexport/xls:view', 1, 1372258522, 0),
(1057, 1, 3, 'gradeexport/xls:view', 1, 1372258522, 0),
(1058, 1, 1, 'gradeexport/xls:view', 1, 1372258522, 0),
(1059, 1, 1, 'gradeexport/xls:publish', 1, 1372258522, 0),
(1060, 1, 4, 'gradeexport/xml:view', 1, 1372258523, 0),
(1061, 1, 3, 'gradeexport/xml:view', 1, 1372258523, 0),
(1062, 1, 1, 'gradeexport/xml:view', 1, 1372258523, 0),
(1063, 1, 1, 'gradeexport/xml:publish', 1, 1372258523, 0),
(1064, 1, 3, 'gradeimport/csv:view', 1, 1372258523, 0),
(1065, 1, 1, 'gradeimport/csv:view', 1, 1372258523, 0),
(1066, 1, 3, 'gradeimport/xml:view', 1, 1372258524, 0),
(1067, 1, 1, 'gradeimport/xml:view', 1, 1372258524, 0),
(1068, 1, 1, 'gradeimport/xml:publish', 1, 1372258524, 0),
(1069, 1, 4, 'gradereport/grader:view', 1, 1372258525, 0),
(1070, 1, 3, 'gradereport/grader:view', 1, 1372258525, 0),
(1071, 1, 1, 'gradereport/grader:view', 1, 1372258525, 0),
(1072, 1, 4, 'gradereport/outcomes:view', 1, 1372258526, 0),
(1073, 1, 3, 'gradereport/outcomes:view', 1, 1372258526, 0),
(1074, 1, 1, 'gradereport/outcomes:view', 1, 1372258526, 0),
(1075, 1, 5, 'gradereport/overview:view', 1, 1372258527, 0),
(1076, 1, 1, 'gradereport/overview:view', 1, 1372258527, 0),
(1077, 1, 5, 'gradereport/user:view', 1, 1372258528, 0),
(1078, 1, 4, 'gradereport/user:view', 1, 1372258528, 0),
(1079, 1, 3, 'gradereport/user:view', 1, 1372258528, 0),
(1080, 1, 1, 'gradereport/user:view', 1, 1372258528, 0),
(1081, 1, 7, 'repository/alfresco:view', 1, 1372258535, 0),
(1082, 1, 7, 'repository/boxnet:view', 1, 1372258535, 0),
(1083, 1, 2, 'repository/coursefiles:view', 1, 1372258536, 0),
(1084, 1, 4, 'repository/coursefiles:view', 1, 1372258536, 0),
(1085, 1, 3, 'repository/coursefiles:view', 1, 1372258536, 0),
(1086, 1, 1, 'repository/coursefiles:view', 1, 1372258536, 0),
(1087, 1, 7, 'repository/dropbox:view', 1, 1372258536, 0),
(1088, 1, 7, 'repository/equella:view', 1, 1372258537, 0),
(1089, 1, 2, 'repository/filesystem:view', 1, 1372258537, 0),
(1090, 1, 4, 'repository/filesystem:view', 1, 1372258537, 0),
(1091, 1, 3, 'repository/filesystem:view', 1, 1372258537, 0),
(1092, 1, 1, 'repository/filesystem:view', 1, 1372258537, 0),
(1093, 1, 7, 'repository/flickr:view', 1, 1372258537, 0),
(1094, 1, 7, 'repository/flickr_public:view', 1, 1372258538, 0),
(1095, 1, 7, 'repository/googledocs:view', 1, 1372258538, 0),
(1096, 1, 2, 'repository/local:view', 1, 1372258539, 0),
(1097, 1, 4, 'repository/local:view', 1, 1372258539, 0),
(1098, 1, 3, 'repository/local:view', 1, 1372258539, 0),
(1099, 1, 1, 'repository/local:view', 1, 1372258539, 0),
(1100, 1, 7, 'repository/merlot:view', 1, 1372258540, 0),
(1101, 1, 7, 'repository/picasa:view', 1, 1372258541, 0),
(1102, 1, 7, 'repository/recent:view', 1, 1372258544, 0),
(1103, 1, 7, 'repository/s3:view', 1, 1372258545, 0),
(1104, 1, 7, 'repository/upload:view', 1, 1372258545, 0),
(1105, 1, 7, 'repository/url:view', 1, 1372258546, 0),
(1106, 1, 7, 'repository/user:view', 1, 1372258546, 0),
(1107, 1, 2, 'repository/webdav:view', 1, 1372258547, 0),
(1108, 1, 4, 'repository/webdav:view', 1, 1372258547, 0),
(1109, 1, 3, 'repository/webdav:view', 1, 1372258547, 0),
(1110, 1, 1, 'repository/webdav:view', 1, 1372258547, 0),
(1111, 1, 7, 'repository/wikimedia:view', 1, 1372258547, 0),
(1112, 1, 7, 'repository/youtube:view', 1, 1372258548, 0),
(1113, 1, 1, 'tool/customlang:view', 1, 1372258560, 0),
(1114, 1, 1, 'tool/customlang:edit', 1, 1372258560, 0),
(1115, 1, 3, 'booktool/importhtml:import', 1, 1372258577, 0),
(1116, 1, 1, 'booktool/importhtml:import', 1, 1372258577, 0),
(1117, 1, 6, 'booktool/print:print', 1, 1372258577, 0),
(1118, 1, 8, 'booktool/print:print', 1, 1372258577, 0),
(1119, 1, 5, 'booktool/print:print', 1, 1372258577, 0),
(1120, 1, 4, 'booktool/print:print', 1, 1372258577, 0),
(1121, 1, 3, 'booktool/print:print', 1, 1372258577, 0),
(1122, 1, 1, 'booktool/print:print', 1, 1372258577, 0),
(1123, 1, 4, 'quiz/grading:viewstudentnames', 1, 1372258579, 0),
(1124, 1, 3, 'quiz/grading:viewstudentnames', 1, 1372258579, 0),
(1125, 1, 1, 'quiz/grading:viewstudentnames', 1, 1372258579, 0),
(1126, 1, 4, 'quiz/grading:viewidnumber', 1, 1372258579, 0),
(1127, 1, 3, 'quiz/grading:viewidnumber', 1, 1372258579, 0),
(1128, 1, 1, 'quiz/grading:viewidnumber', 1, 1372258579, 0),
(1129, 1, 4, 'quiz/statistics:view', 1, 1372258579, 0),
(1130, 1, 3, 'quiz/statistics:view', 1, 1372258579, 0),
(1131, 1, 1, 'quiz/statistics:view', 1, 1372258579, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Volcar la base de datos para la tabla `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_role_names`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_role_sortorder`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Defines grading scales' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scale`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scale` longtext COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='History table' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scale_history`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scormtype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'local',
  `reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `md5hash` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `hidenav` tinyint(1) NOT NULL DEFAULT '0',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `scormstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sessiontime` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_aicc_session`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `organization` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `parent` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `identifier` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `launch` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scormtype` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_scoes`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_scoes_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_scoes_track`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_seq_mapinfo`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_seq_objective`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `action` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_seq_rolluprule`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_seq_rolluprulecond`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_seq_rulecond`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_scorm_seq_ruleconds`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext COLLATE utf8_unicode_ci,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=23 ;

--
-- Volcar la base de datos para la tabla `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(17, 0, '3kpgl8ikm06pvdjpgnq1uusv23', 0, 'OTNnWGo0a25NY0JWRHd4NDQ2U0xkRnR5cjBSMVpjdDBodHNoSi00bUxiMllEOU52d0pCN09fX3VpcjlYU1VkT0o3dFZSSUJDWVlvSE9zQ2dRNmdWbW8yd01jTkpFTndtVUxhZGxtVlRtUjFOaDQtVkFqVE0ycGdUc3l6cExnMHhueV9ubDFvRG9qRklGZHR3ZDRpM3hKckpXbmlhZ1dCakNCejJSZlFsbW5zbTU2SnJ1cHo0NGFkTUxpdHlkaElKV3RoWnM2WVp6RkljMDdzV1VxZ001NHJVWGotNk1MckVZdmZzcnBLajBiekdScVIzbHZyRHktOGJ5OXRjdmN4V0NNVUYycmZQamhGaEQ1Nk5sR09OTkFNQVdIX21ITm1QeDh2cVFDVEctcVJ0dDJfZnlDNWtZcUFqeU1WSXVCQnNsVkxBa1RCajZIcGFYQWRDeTN4OXZFQzJrQTFPVUpXdkhURGpWdEVfWlY1V0xPZlN1Q3ZPOFVPN2I5UllaM0JIZEhCSTEtenpQS01Pd2xiQ2tiNkg2WGQ5eGJEUDljZUx0VC1seGZCSE8zMDFuYkQ2Q3cxQjVQZDBydGtLR3YyVXdGampQREVZeHpXOGFNYV9IMTdJQTdIbXozaWVENXZVZGhadkVFU0tzaGhTRHZNbUFHY1FnbUtWS2lTaTRyQVg3OEdGSDJVNEVTWDg2VUQ4cGQ5T243ZDN2cGdwRjNEajhmWjNSSmMzVjZmNkY5bHJ5VXdhYXlsbXhFV1pEQlhfSE5IX1I4T0k1OTR3U2Y2RFVIc093WGJXSWt1RlA0OWYyVHVRdVZ0MXpVLUozVTJWdXVjUlVsQUM4YUJMaThXcHF4MjJ4bG1CZzVvTDFzaE9PV0gzeHhKR2dSaVdfcnlsQm1yb1ByVGNCWWpudU5YV2VfUV9NRmxEb0ZKNU44UjdRTmllek41eDUybGNoR0JRZ2F3YktnX1h5WkZaMF9YcU9lWS1MMEpuQmUzbHRmeGNRZWxMaEJLLXBlQXI3VFRWY0c1U1FDN0R5RWlMMHVsU3k5bVlhcXRSMTU5ZjlJQ2RHdVVIRWZiYjZ4eGtIUXBYSUh0QWNGWWF1Ujd1aDJ6MUo5TndiOHpHNF9tNk4wdHpZelk2c1ZKQTJBZ2VhQjNlV1JDNmVoNXA0TEhac3RwbkwxTnlVdEJfZVdqR3VpbWFVQnhXNlpfcFhETWtlcTE5V3RfcDhGa2hsMFAxLUpPUzQ5QzZ1YXVESTR4d3NJX3ppTG1NaWhVdHpQc3h6TE9Icm12Q0pwUFFQbm5JbFdnWEpySXNxNWQ2cmVwNDctelpyTVdtb1VJYk5PekhUMjNoQnQ3R0JDMmJyQzRoa0lkMXFTcms4dWRHQi1DUnBoWWRvaDA4MGpfX1lDYTVPT3VhMS1DcUI0d0pmQjM0U0xCZVFFZkdqVUtQZXctblVhZ0EwN19fZU44UmRvcDFxY0xyYng0MkwxcmE2ZDIwbHZBall5RWtraTZJZTdGb09ac2RQMlRaeUdsWkJQMU1ENlltVFQtLVJ0WGJTS2JoNC1OUTJMb2J5a3ZRQlFGcmNnTmlXX0tjeHVmSDFWNHBQaEZPbVA0SHc0N2ZzeXotOUhLYVNHRnVaN3hzb3BYRUJXTnA5YnJjNDZqdUxPNGtWc2NURGVwZDBjZ19YZTlydDN5WE9lZGs0MW1XckliMHFDcmtJRVlIZ0poYWJYd2piTTN6dXRvNjZaZ2I4bXlNdzY1XzR5enNiWloxc0Q0UU9xX1AtVVFRN3FCOVFVQjFwaHpXRjRra1ZpeEtmelhJVjJ6VUFVanVFSWFBV3RIWkFBMjY3N2dvdEtYM1FKX0NlekxQNmxqLTVNSFozNXFrTmFvV1RmVl9HZEwtNTJCNzhzcjllM0twcDM4QjdBb1NZMkNfWkltazNldm96ZFFxSlhfRjlzcEZjb0RpVkpXSGluMDhpT0VXU2M4a2t5Wlk4MG9MMHRKSDN4bXJpMTVMT0Q0bjlxcjBlSWNsM3g2eWI4Vmh5T1hqX1lnUEJVRVBqWmZrRHpOMmMwNk9FOFRlRGtvazJabzJxZkVWb2pvUmJvU0tKdmEwRWdhOVc3M3dHR3otc0dPdzVTVmJLZ3lfOGdHZVVuRUNFaUJmN0Y1OEZuQ09ncjhJM3ROWjRONHJVUmlVbUVKeFpBWGJ4dEJOazN2aGZ0amdreXdfdFNKYWtpX3k3MWRxbGdob0tOa0RpUjI4b2ZoS1JDbnZrWXVLU0tkZmZmWmxMS01XeFNwaVZ3d0M0MzducjZDT3ZGb1VPZTBnaWRvWXhnMmRfc3FFRTY0LXJLNUdpTV9MWDAwZlNpLUNmeUpmOVR6UDY3cENEWkVLajlfTFFvOV9HRjFkQnFnX0NNYkFiNDdkX1lOV2lmVVBHYnJoVUVzYkRGU3Vua0VHdGNRUGUxeWozSnltUWswMi00My04dzh0clNNMEpNVVZ2c2t6R1dWcW51LXhBekl2Szg1UklEYW1GUkMtajFROTZ1WHJnY3I2RDZtdnpOZFE5cFpScGdjVzBZUUpESVNjSzUzdTRuckxDR0RfT2g5SGdod1dVazhEWngxUWw4M1RWZlRMX2xCV1NuQlM3Umk0M0NncVVLanljUU1hRTN4cFFMMDF4RkUxbGJhQURLZnZlWUZCT1NoYXBZUzBndHY4SVlhVHJLaWFoci1wOVN6S001TkN6R3gxY0x3SDI1RHZEWWFfcEl5c0FPeWVMZWItM0ZSdzZqdmVyUEktcWtlRkk5WGdnSG5WczFYMjBwR3BaakdheWtNUjBPQXo0Sm5JMmJZVDBPeEJ3SjBfTGRfMWZwSXFzY0xxTzlzb1E1b0Vwd1lIakJpWnBveENaSW9GWTgyU2IxMmJxVGZsc2NSRGgxbnRqQm1lMkhIS2dnZ3VaZEFYeVR2akctZHdjTEp6Nk9NeHZKcWpUME5nT195dVFreEVvdnd0OTdZT200T3RXaGg3Q2RvSU9FT2lTX242TEtGRlpZWF93OU9QX2M1V1NLMFg0NW9ocWdwanI2aWZGcTg5d1BubEw5UGJNT2hZQlRuU0M1bmJuYUEyRmxHTUhSSjctMmVhTTRQSUtkUW9DdVZxWjlHUTZGNXVzWXROcnRONVN5bXlGaGcyZDZBLVZWTzBZM3h4bEwyVkhMTkxjNm5fM3RPTVJvcWdCck9JbGNnYktJUjNxSVZoc0xWMnc5Umh6bG5SUGl1VmM5RmNDOGdBRGFTNjZtTlZsNUlWeGp4RzgtYVpwRHBDSFc4bnk0RlJKVEVTVHRxcEV5Ylc4Rl9MY2RxWTd4NzJ0V2xRdGFxOEh4dDlrY2dxTXpSanktRGEyQWtDRlAtT2lLYklHOThsd0pFWWFER3RLMnZEUkcxZDNSY0tOWjlwMk1HLW03SlVhTzhQeDBzaE1iS2ZpQkZnSW9zY05QWEtra195ajhVUjA1YVlJQUllMG56dlZpVXZBUG1oMlpDYUdjNE5yU05xYlMtUnl3RExNSndzVmY3QWZuYTA0LUVhWFNFMTQ4REdxWXB4S3dzUkp5N3hUcWYyUmJkWGlzSGZ5akRVSlU3X1Vmc1dWY2tmcktjMVdyTUREZUhkQUFLRW8zOE41N05LUkxNZTA5dGFyQzY4LUxXUWJONGFzMm1NX1JJbEdMbGNDS0hTODR0a0Y1R0diLWd2VTA0bUdES0JhV3VLU09Edml2MHJMWkVPY1djQkFnOEJSNTNMRElqdFloTWV0bjQ5QzZLeGhLZnhCMEVrYURISGM2NWFXaDRGMmNuS3V5aVAyNG92Q1hkS0k3SWl2ZjRBUG1KdFhNcW9FcmV1', 1372422879, 1372423080, '127.0.0.1', '127.0.0.1'),
(22, 0, 'gj0hpgb9o6fa16hvehp6482pp6', 3, 'Q0xETTFLRGJSS09YbE5TZE05dnI5dWNnQy1yazQ0THFBcEdlSWtjd1FNVW5ZM2I3bVZRUHRJejVrZkNGcW4ydENwLXhiSDFhNHRYUkFMUHJsZG1EODEzXy1qR0ZTSzJrbFZUZjRYR2ZETlkzUzRjR2xvbGlXemplTXN0ckhJaWFJMVNtTlBVT3N3ZUJ4LVlhMXdLR3ktZDY1SDlYLVRSTEMyUGdVRklveTRqd1EwMV9RT21Qb2huU1Z4UW1yakg5V20tcWJXZWlRV0pfb0FBWUk4RDFsa3VjOWpqQklJMXc3YWtLR3NaWmxfcnBFcDVGcEJWMXVqSHBRU1llcmh4UHlWaG5FczAtOHBkdThtYWpzUGZhUm0yQ1pEUkZVWE1vY0s5VllCYnFTYVJOcW5laThFZmVmNDBkVDFpZjJvR1QwLW1JaEkzZW9QUHNnWWRCUDFwT2RhdmZXRXJ4UHlIVGVSazIxdDJ3bGk3Y3B1bl80TmtLZlAwV1F6cG96Tjh3ZjlnYlktdUQ3M3JRdVIyWmhZNGlHMWZZY3lVYVVPRGxMTVN4S2JVb1dnNXItY2puWmVKQXpidloyYVhjNFN0Qms1WXNwallLM3J4aXRwdGZNS1hEX19tVF9WVjRXZDF6Tk52QnpjSG9WS01nMHBPTG9vWDVYaFZBcGRMdzB5ZjZMY09pRHdINnkxanBxYzIxTWRKTkJlNk1BQ2N2Wlp4MWVWbHZkcS1ySWtMU1dBcXltLWUtNWpmcHc4YjhpSmFOby0wV3FKRElDZzJKT3gzRzNtcWVqNFJLM2ltdDJWWEItYzFkcEFoZkU3ZWlnS1BQYUNQQ01rWmcxV3d3dHFOZkQ5UkFsaWFJYlFVQUFXeDZmXzl3UWx6UlpfM0x4M0loSUxTVjV4WDhuSjZualF2N3NGRFlYM2R0SzVKcnlEMHNaYThmalFRN3E0bk5mUFV5RmQ3Tnl5bWVsbEtYUGJqcWZWNEhtckJJdFhSTTZfV2RUd2xuOEJrUGJOZFNmZGdqNzNGZ2ZyT3RYbGhHMzdGWmlJSVJJSkh0elVzMDhWczFuZUw2YlhwR1c3U2Z1ZS1fdjc5MkZtSFZkVGVpNVR3elpUdE9LclUxbTZ0ai1scktsc0RGZE0tRHZNZ3dpcW96REdkMjJNNlVPcWRXOGFaZ3RHNl9YSGRWTDNuWlRjS2R4RHJoZGE1enNsdEtkcnlRNk5yVnJVX3RQR0tvSk8yRlE4a0N3M2huNGJkOEhlcHMzZWktX3hjZWFjYjExVWhjbWI5MHBndVZjdXJXUlA3UVdrZEZWTXRTUUg3ejNyNlNKQWNsTTl3ZDVjSnpEZ2I4eE9PYm5LbldhS0dJclo1eURiM0Q4WmNRSE9vZG5PNWZ2S0ZRU1pHQlFXWno4bVdPd2xoMk5YRHB3amNfcUlUYk5hc1djVmJHRGpIU0RJeWQxeXBiWGhrMS1VOGpfYkhya3kzdl9yRjczTzNDWFVSRzJNcm9QZ1dYYzFSVDVjRjJRM1FSa3pEVURmamtyVE5oVG1HZlhteUdRSHpTX3RLQ2NTVDJmdktfVGlLWVFHTFQwczEwOVpiZ1BucE01YjIxSHc3NnlKbTJvNDd3SmJINHBTVm5HLTRRUXZEQ19EX1JRdUdFUFN1VmM0NHJNNXJfRVRyR2pVZXhNSkpvc2dFdloyYU9ZbFU4NlN0Xy1TNmtrWU1KaDZGSXBDdFBGcy1TMGhmMUZKaWR3QXdWSkhYMVhHaGlZN2JybXkwSEVzTzhLdG1PWDZiUWw3WW45dmMzbE8wd3lTMGloQ2hZQWhpbEhUZVBFa2VOZEczeGxsQWsxY2hVUjJxaFRHakhQbk5wXy04Z2cwanBFVDNxZ2pnQ0F0MEFDRTF1ZG54dDRzUnEtNm9tYllfRjJpZWhrZzFaUzdqTE5Vd09NREdHblUwT09VQVhrWDZmVlpVc2tvRlZFN3hWai1hbGI2bFQtQUJicTQ1N3FSUzg3d1lfNEpjN1YxWUp2b0wtbTdBZHp4Z2dDenUyUHRPd1ExTXRsNm5FS2hhdEFTeWtCaHFwemFLZ3VOZ19nSU54Q3JQRzZjTy1KWWx3SzNiSzVDZ1F3RFhVTmxLZDdscUdla3pjOE9ueWZ6ajh0VjlEZGh5N2tiSWNCdWFPUHhXRGctSHVGeG9oVUlqZ3ZHZWRibEkyQm1ZY3Z4S04zSDdMWmNiUHRpWnRLVG5fY0hDdlJ5UFJ4REZIUGtTbWZRcGlwRFg5NGpzZ18zSGVwU1R1WEs2YmZhZU5PVlVIeWM1NGF2bVJhUkJPSTdzSGstSlA2QjJGQXNrUjdpYjNFLVEwN25BYmp0eENiZEZhYW40WC1lLV9ucjFzX2o4V1dBLUZTYS1Zb3J6ZERaekdhMWl0aHRnbHg4R01OUmE5dFJQZDBEcFJFdy1Pem1Bd3ZSWGhxaVVKeVBSTnRyczBjV0h4NXVWV0F5Qk9DRDlydW5zZUJfTHdKYloxdGZySlZHbmVaeWZ3dmFnMFo4SC1LeFZCT2NYN2NEVE5ZV0FPVFYzaHFfSXZReGRWcUFxQVpiUkxOMlRZeW9QcWZIM0poOHFtd291NXVKMnU0ZVNHTjlkbTFVRHdOeUFwb3h4bHNtOFpEaE9BWTVDWHpzOXRZcnRuRF9CMXZTb2l0ZFNjQllrYUQxSEtUUER2ZFNlNURLLXFEY2JSaTZzbXhhYTRqZXNFNFZNS25ySkRlOW5tU0xxM1J5UjBmbEcybWVGNEpmNGZ4cTd1SndDbnAwaWdoMG5xOHh0ZmxjTWxTSlloRUE2UFoxWlRBNnhlM2IzWXdIQ01Sc2JjSnNUaG5fZ3RRXzJ6R1o0anV5NGFUVjdoNnRrZ2xsU1dNWUUzY1doSEczemNEUmxjNWJUTVpnZ29GejJJZ1lONWtkU3dYSzJrbTU3aEs2Y2l4NlNueTVzNHhmSWJvUUUzWC13RDNPcHlqMkFlaGtYOFFLZ1RKbzlvZExCNlJiRU1kNzR0TS1QSDNyUmpzalMxOGpSeVBFbDE3VTV0TkJqWGw1ODZvOXBVNEhaTlhCdFpOdmg0TW56akExZ0tZSVFUR3RLN3JuMVM1SnJSajdZVUR2N0pWNjdyZDFOZ1BqaDU5T0JzcGlZOUZiWERLb3JrX3p5Y19iU3ptYmRjTE1mWVJaZW5ZRzhoVzZ4ZDBYQ3RpY3V6dGozSU5namExOURTVVRqbmVUNlAzRDNBTFB0S3lRV3JWSDNBbS1pbi1hSWVKMmhKNTlPT1NDODJ3ekZKWHlEUm1JUnVha2Z3cXZJQTlaamtOZWg0Z1B2V2RPeGN6ODRFQUpLNm5DSG1xWjh0a1BrNFdTSFQzLWpIc0JOUlBDb0tCLVpBRVVIaXkyMm1zNzIzVThIcUFqeW1XMmNaaGJ6UWpVdjEwQ09XSjVWTVh6SU9iQzBCa1NmTzRFelY2enpha3JEb2k4Sl9mTW5yWHNaZFoxb0VGbFZNWllpay10bW9JRlZhZHVNcGtoMWpLT2VUeWNtbTltM2dGNmU0d2s0MVAxZG5kWkpPbGFZbTU0ZUs1aFVIRkRzSkNBUFBpemJDaC1vbnNVc1FWTENWc2NSeERGZ3h0ZDJZZGd6WWNxZ2tKWEM1by1FODBkZU1OaWUzbDF1ZjRqcHoxVFJDeXFxT3NpSlFWSXV4SkNzbkV5UjBkQXFFZ0hndnE2VFpKSHRNRGZDTVROUVJCT1dkSndRakhLeDNUWW03SVp1RWdrTWRfWWh6V1pyNU9JZm10RzZncHBjakR3c0pobjVSMHZsazdpMmxRb29HcHlZS05DWmR4WDU2bFh2eml3ZVZIc1NLVjlQcDE1ZDJkQVpydG1PcVJZak8tWjZCelJZakFaeUtjdzBVb3dvc1BqVjNDYjBMNUJQT1pMRno3aXpFdTdBSGxxejI1N0Y3Nm52MjhKX1l1VmdqLTN2OC1zUklnd3Q5N3V1cVFmcnpURnpNd3U0ZVlZemJuanpUUzFweG9zbWJGSzA5VEtDWXZmY3pFRnBDdVUxMlhUMWlVSUtjaDZDckpJb1pqck1NTGp1cGFldmVJdXN0STU3NXNTUGl2YXlZaFd5VDhyT3lPbDhXc1VKczNGWXZKWHVrdGpPMy01RjZ0ZHRYVy1JVk9aQ2p3ZkxDZlVJTTJRRnVxT2dBc2F3aGNLZHFGdFVNS1Iydzl1eHRZb2lfX2ttVjdnSUY4Q3JtbDRGR2sybjZsNHlWeXhkMmIwd1E1XzlqUHRzU0h0S0RJRGd0S0tFeWZmVTdNVlVnTzVSWmphZVZMTWVuV2t2cnFVNURtbm5nRUFHQXNKV2JtelNEcTl6ejBCdE91ZFdaUnVIOVJDMnJxbjcwSU1WQkV0cWp2UjN2Z0ttRHU0c0xTcU1LNUlrRVFndWNJNVVBU0Qyci1YNHhqVjRPUndwN1FmNzQyVllrSTBzSUFRT3gzRkNVS2hzREp6WVFQc0V5YW9iVFcyQnRFNVU3ajZMU3hxdjIwdWxyMTJoclV3cWMtN2s2Vk9KbTNJRXRXeS03OUFYQ3VIcW8yaEZuWnBoYmZweGd4b3lOSGVSaThHWFRzWWNDRlBhM1BTbWNheFVlQ0V6UGFpcGY3MEo0Vk1PZFQyeC1qMmd1cFFxWE01c2h2aXBia2EzLWZTUnc3Um5VVmZkUDVYbGZ3Zlk1UEJxeDNQN01vRmlZR0d1NFNIUUNKNWhxR1g1VXR5ZHUwZzk4cW9OOUxJSlRrNEhXQnZJY2oxcnRSSzB1bVdmMlcxZW1NUzNpRGp4dmtZc1ZrUXV5N2FQQVQtUWxGMWRJYzBtek50c0lqY2Z5Y191RjJnV2hBb1NTTWs4N0VzSGRyalltUEszV25VVlo2YlplM3R1SkhSbWhKUUhrVHhOd1pnN0JkMWM3RS15UVhGZEo1cGRsa0lNRGM2bklwUG1Ha0lOMFJSeUZDemtMR0g2UEJCdGJQa00yQVVSTXpyMVNzU2lGYWNoc3FKdmxQNXhaV2lYdVRJQkJRMEVxQXhRZzktUzNZcFdhUzZpbUlSVnlXVi1VQjc5WC12WUU3Y1RWbjB1aWhmb2N6amNMb0NiOGdmeG9ZRGlJNnVpcWtfVlZpc3RSdVBCQ1FkR0YtbF9aSng4MDc3SGtBZXJrYk9sSi1MOEhrX21UNVpWV3RZbkJKZ01GQWxldS1DdnI3c21tNGxzMWNTTGJNRldKWnV5UEEtelN4RG5SWG9OTmxWU195Y2RKdERjTHFsanhkTHE3Q1lvNmZ4cTBSdm1GXzNvSG5BMzk2Tk1ZM2JzR3lDcEtqR1g0bm0wSkpZOUNRM3AtSWpXWkxHclkyNC1tQXJMQjFvSUJDWHpuTXlUM3V0cHJZWjVGRDdNMy10Z1U4OUM2S3VtcU9md09RR1JGMGt0RW1pcjhsemtkcHFvX2c0SUlvMlZkT21TblhJTU9sd2Q3Umd6T0g0c2JQeXYxN0ZHX0ZiaXBMYjYtMTJfbEFHYmdQbHV5OS1ldlJSck1DaEJlN1kzcHNxRjdabFlyUjFlMUx3MU10VDM0TWZqMlNRU1cyQklzNDgwbk9Pd2xqTmczZWRvYng2QWU2WHl3Q1JwWVdFTzJIYVVGcENrZ1U2OG5YYnhEb0xaMnlYQVg0dkNYNkxuQXlYc2hySGJJNGJPZDRWT2QzeUswT3RGeG5WaVE4bzZqaFFtTTFsdTR2c3FvNGxSVTNLa3E4N2RZVEFCa0lnd3R6dlFaeG9pOVp5dXNxTG9WdTY5QXZQNHZKcnNhY2lBcGJDbFpqN3BUWHRndmxXQThYZGlLZ1dscDIzNjI2WGdpamNibHRuLWNOTDdUUGZ2cnRxSnNGdmU2LTJJUldQZVhZNWlwMGdFM3dUczNtS0dDVGNoYXdaOEV1aGdYOENLS243Z05WVXdzM2JGb1lGX0lucm1zRE5laEp2R2lNSkVOb3d3ZGxlT3ZHOUpQdjliYTRwZ2VreERlM0ZFREVfeGdPQlhnckRHcHByWmpYR3I1UHI0cUdqRUxnVE9FZENhdW5aejc1dGZVeVk1Y2JKVzh0ZlR5YU9pZzlsZXVIUVVHVkNGazV5TnJrNDVXamJZWS1Ka2J6NlhXTkNkN3QzNUJyclFtWUZaOEVEMmwzSXM4VEJ5YXBVVnMyZ0JVSWFjMnVwNlliWmktb25WalQ0dkJmaFJYUDU5UG00d3AwQnowa2xWRG9NTXRTWkl0bS03VzZxZFE5QmxHMktLRU91X3lBeDQweWx1VXp1Nnc4SmZGOS1ncnR1aTAxNFlpY1NGNldoQ1QzRGpwVW0zTTRqZnQxemE1RE5sOUt5UW1BaktLZnF2NnEzS2NxM1JHM0pPRkphc3Nvdk05ME9INjNMa3EtLUl2VEhEaXBCTlBFRDZGYVFTSl9QeXNtMmRIWGctblh1QWJ5WjZyU3otbzBJNzZOdnFmYUhRbm9ncHlnYThJV3Bmejl2X293TWY5QllFd21EbXNNQ05ZcTJISl8tVkw0ZGp6UWpuTWNvNnBQeWo0eko5M3hmZEp3RU8xY2IwTFA4dXhybmM0R1gyYU9sVkpiUE1Cb0twcGtPX1pJdEJJV3hKX3ZBb2U2WHJmOGFmejhsMUNWOFhhM2Z6VDNRWXNwRWk4dkIyVFZXVkxJOGlzYXRBMU92QWc3QVk3Q1hHS2RERUNQMDJ0ak9QUHNIUDRfN2ItbzNlWTNXbUZ5YmlrMDhmQi1ZTjhHdFU2enVUTURMVGFub2NaRW00SVlUR0Yya25WWlJlT1NvUFlKYVlTeGJYb1cxWkRzX0Nzc2VzQlVNakpOYTU2QWFWcUx0M0ZubUlqLUtCRUphcHFac2l1T054VzhXMUJJYmRNY2xBTlZhZnRxX2sxRU5BTFNUd1dlbDMxb2JDendSMVVwdllKWFpzTU5NdnlpSVJ2QUUwbVNBa2RHdlE2VnFqY3JkRV9XTXZURVVCNlZZaUdqbnJMUDNqMGl4YzFTLVJ4OWlsWVdZcXJQcmwzdlJWYkVfbkItak1nU0Y0ek5laTZ1SlBLUmNGdFp0S1pQWUQzWGxTbUw2TVpYYjB6V3Vva2dtaGs5WUJ2V1ltQXpyeGJvUDFGS2tiYmQ1eHFoOUpLZTVkZ1RyNnBvdlhrZE05MFpLcmtEQ3lHbGdoOVltdUh6R05zMjZHTGFacC1rMmZ3UHBFOEdLc0puWTBoVkFCb3ZfanJtNl9PSC15amE5djlyOUNINzFsM2xEczBzamRFcTc2bjVsVTdyUWJUUnNGR2lSclpVbU5BN0lSc2g3UnBEeDY2ZURTT1pMaGpFYWxwRjF3bXp6SlRvR0s3Y3NWem53RGdob1VpLWxLaE12OE5ZTUN6WXZoMVk5MHExRzZzdVNsM0xLQ3FYYVp2WnZLRWJQVTNnX25zSU1VZWJIdHdSUXdqbG5yLXNSR0VpSjhRMFVlZWRZalJxRGRZNUZqaDZDZmJJRFpTbzJUb09jaHVweFVhU0Y5WU5PaHVBY2NidWFlWW5aRjVKOVp1RHhpLU4xVWd1VkZZX183Mnl1cGJMNV80VURQR3gxeWdnUTlEeXNHYW5acmNON0hFVXlZNFI4b2VEaTc1cEpDaGRYb0VocV80V0xqeWxySkFpT2RTaWtpaVhDNXZSY1EtTmJtYWVXVGNWc2x5dExDNmRyZ1NWRmNTcW15MVJEZDUxVE02b0IwT21rVXNVaS1rZU5kQ01FY0NjMkhHZ3Bhd1hJT3FUSDE2S2g0OU5VM3hpYUpxNGZFUkFvMXhzaXZINHhJb1h5bjRhSUhDMG5QenpQQXZuQVA0dmR5RXN2S2lSNWtvS1YxNWJuOTh3bWtuZTJMWGg2TURyazFtYzJDSXlncjJJZ2hvN2JKeTZ3U1hYTk1Ka2p0b1FUYjJYc0puT0NId25NX2tON05DZFdCUVlfOW04THdKV0gtZlBKc0kzUXdkLXVjZGswVnB5N2tuVFZLdktscjhiT2I0M3liWks1ei1XZzctd2YyWWNEWE5DV0dUU2w5UFF2ejZTZUNmUEdSeGt6SkVRLXVheHMzS3BPbUs4ZHQwdlliWU1fZkNrOTVrNGVLU05fQkN5YWVuN1pVYXJTSkFPX05jcjdKcHJHY1MyMXNKeWk2OGNBSGJFSmMyeHgxa0drc2N2ODdqZlRtTTM5UzBkdEEyV2s3QkZCOUxlZ1g2ME1lX19TMmRMR1hQcm4yRlhYX2FxZ2RFcHJLdVNBZ2E5X0pVck41Mzd4b0w0RUJKVHFsT0tQQXlGbDZEWWgtdk91RUhGZEUyOEVuR3daT1NmZ3ZBTkdNVzJJUVRhdUxMRGZGSkV6RjN4M21zVnY2WUZ3SG44RVlXVVdQVlJoVTVCZEdCanpVTGs5cGhTUjJkVjYtMzRRTnBRdE8zOTF5NkRUZUh5TkpOUWQwczRiQnd6T2xjanhoTE5TTFl2ZUV3WkFIY1BHbUE0Nkxlak5hSk5kN196enhWVk0yZzV2aHBtTFlIbmNNR3YyeVVhQmVXek1CTF9iNmhTWDVUUmxCMmpiSkc3UmRNeDhKbWVYdFhsWEZTUmg1YUowWDBqMXR1ak9tNHJoa09Ga05lQ0pnWmxsX183S1dLY2lYdWFhMDNLZDUxandxNXJzYlgzWEM1OHd2MGh1UjVtMEw3SGhpcjJBbnBvQ1gyTWJIeldPaGxUZ3M0UlFLUmNCeG1mR0tabUJFd0c1NTM0LUE4WU1SLU9HRGd3eUlqN0tXMmdkS0dkQm1mS3pWN3gzc3hxZVFBem15ZVBMeWlqM3NyaHhFTkxRdnAwTllEYXlMRkVBdkwtUEhhSUNTakU5Z21LNU8yMVg3Ymp2SUx6T0VtMkJRdU5mMVpkMlI3aDYwNGF6TGl6c0NFSC1UZkZDTEY0cGJxd2V3a3hVZDB3ZFNjZG5oYi1WTVZ1U3k4b2RwWjlRcFAzdnR2eXgzVTRKWmlhZGZzYU1od19Qbjg4TDFzZHViZUlYeWdNWVFVTVB1QXJHdFlMOVNvRjNwcU0ycmNKeklBZy1qdjNmcEdCbGNUTmUyUWRQUHRNTEd3bFNqX3NUZVN6Y3FsUU1EdlgzWGdmM3ZlS0JtRmJsMUkwZTRSc1hyQzRHNHNiVHFEX0wwS1ZSS2szZy02Rk5pY3Q1Q2hlV0R1bmVZcDhnSGZRbHFmQTFBa01GQ2tDdGRHZmJZWEJGM3p1ZW41QWVQLUNfVTc2c0tqUXZROWtOZ0ZNV3ZSTGtrRm1fdEVQRDJTTXhBRTZ2LS03LUJCcDZUMm8zLUlGV3lxUVZKc29ucDVJSVVXaXRLUk9yaFQ5MWFLcTFwbWJ4U3A4UkNHY0M0b0FPMllGbVlVOTVCMk5rLWZPazJCM3FvSmlBUXVpamctVjI2VmZnMkRGa01KXzdhZHNVU1g3VkVXY0dGUmdLS2l3VEgtRU9wRGI0NlFkTDJteHZxVlhuamR0VUcyc0NHeVNKQ2lwRTN4dlhzOWNBZGFzaUVQRUVaYjFUTjF1MDZXQ011Vk1TR0p0SzBTdGFJQWhZeDJlZmJFZ0VaZmN6d2s5RTRLRnQ1aHEza1NDa0I2cXlsdjdxbk5IYjZxTU9Kb2NrWW40TV9FeGo3WUdaRGt3MndBcjVscnFaNkNKVF9lbU5RTFBKVjVkUWFQS2xPTnRDOTdRNlV6LUhrd0tNSXcteTI5aS05Q2E4YzBzT1plTVFuSDJuR1J4bk5vTUR6NVQtU0lsb3QyRFB6ZFlsQ0J4OGZRcmJNYkE2R1RpMkhlVUFDcEFibFdocWFDWF9Hb0RWRl9QNDZwbF9HcVY1UjZaai1KNUFnb1BZRWIwM1BZTF9XUUt6X1J1V3pNT0x1MHp3VDhXNnJEWHV6Z2Rqd0IxYXdtSWRheU9jUXYyOVdCaUl4cE9zNmZBUnhGa2VZT24tUGphdkpMWjRiUGtqaDdMWTM3N1BnWjVwYjVqUFRLRzduZGM2UzJSc3dmLW45T3cyVENMRlBVdUZ4LVA0X2xhc1N1YkZpZDQzTGhYbHFrNElFVlJ6SmxILUt0LUxzMWlQZTZxQklSRlRCUmNfeFpJYzRoMGJBOUlBWDI4NDdndGNrWV8wbU5PY09Nb3BZWnJkcmhEU244VGR2VXFCcl8zT01PcGlacFRBQV83VngtNHcyRTZIcHRmdFg5dnRhdTJLdHN6WHFrNXBGaHRPWG1BMGF5VGVIbXBWY19Uek1TV1lhZUlPTjBKZXdJY1doLUNtWkg3NEVjUHdaNGtUbzQwQmgtSDlrdFZhZzlKR3ZKcjRrLUhQa0FSXzd2a2twTXpzVW1jQ2xtYTNJM0pWaE5EbFhRMFczYkRNRVRtVWZ3OVVQNDBTZ1pQWGJnMk9WU1BDbHNQbWgtbzdtbGt4NVAxUzJJVlBRMmROSzRaWGJIeG1wTWNkZkVjRjlhYVE5NHpYRDBNNFM5VFhpbnR6Y21sbE5hemJmdU9zRkxsNWM3Vk1YckJsQktNRENsc2htdUIxWDJLa3BiazJidTdtYUtyQWxRQmxIVVB0Y2dUQmVmWXVVN0tLU1hUSWF1TDZYSEdWY24wZldHRkc5NDVWZXJJSjdwdmdYMWdpLTdOVk1vcXA5NmhiUEZMbldfVUtUczZ6NU05RUdnOFRGZEliWWFZQ3NHcDBkNVRyNlo4SThjOW54aG9kZFBCS0w1M3Z6Wk1LcDhDUmdwanJDLWVhQWFKc1BkdTdrNUlzcFFSUzdrcmU0NW16RHdSRk1PNUdEODNwUTNtR0NIdEU2YjJXaVpZSHpPMnhVeEpPTWduS0xJakc5Wm03MEJPTW1ZZ2tTZnZiZXFvd2tlX214TktwRVRoc19YOUVQanVJUkpmYjJ6R1NqUUJLdmhIaGJUeGlidnpTT3hKMkRiLUVWVk5zRG81ZU1TWTYwdmM1M3lsVlF2ZUVOX01SMU9oVWQ0T2t1M1ZJQ2pnVGQxOUkxSXZmeTRPSUItMmp3QnUxNV85a0ZmVTNQWk94SWE5VFlPZmEteW8zTkRHeFVLVTJJbEtOVHpSQWNqLUx1TlBqRlZHZEdzVVg4Z1RpUXNoc2xpV2VzY01MUlVzTmJwSlBKTWZqWnVpMmJGTFdjbGtZOWkzRE5CNlJEdjRrSFdTMld1MV9WaDdUcDVKX08yR1UyMzdJYU5oN1BySEJDQ2RPVEQ1Rnc1R1BscHlEcHdyUldLX0xjb3NhQW9tV2VyRlBUemp3MGN6aG9VT3BSMjk2bzdUSUluZ0owanU0eUZjX0J2d1dSdXZTS053ZTMwNjkwSTJ3enBYb2ZWdXNsYjFieU96Y3ZSZ1hBMDV2bzBNN1h6NHVGSlFVakFoVjJVTFRqWHpfTFI4d3V0TllodGFkLWFUdzZqUVFEMWVydV9DVXNSajJoWUpkQlB2VDVNYWRnTndzd3VwQ3A5MjFvbkN6YzJGb3pNR3lVaXpWMlpPNWVnbzBOc2w2VlhvSWtGTVJyM25Cd1RMOTlVd08ycS1MMmV4Ui1fRG56RzZWS1VtTEkzUXdBalFNZ0hPcm9PQzRJSUZqa3lwOWZ4Q25XMGkyeThlZl94dGhRMk16b2ZXVndJX2xRWDVOZEFKWklReUh6TmVQS3owZ2pvbkVQTWMxd0lsUVRwM21jcVpRVkI4dUlTbEhIQTJwUUR2YW9kNjB5SklKcV9NRHMyT3A0dGJrT2VvLUk2OEg0VXRmN29YMi1JcWFGcVJEWC0zXzM5aGVNU2xMWVY4XzBzOEhUcnBPZmpMdzBhaVd4LWhkSkVpdmloYjUwTVg0eF83b25JUmxKRUY0elRZd1JlVnFpMmFxOFNJNHlYR1ZTZ21KZTVHNlpHV0xEM2NZQWthdERoZFNaN2ZoM2FWX0NxZjN5X0hHWmNtSnpDb1FZX1hPelg2U21CMTZJVTMtS214Wk1DVFBRWVc0aW5NS0lRM1l6WEhaNVM2ZndEc2ZUSlFLUERtSVVGcXBRcmZBSTBUaG1MYTJpVWpuelFqVXpzT0dUNVdNZGlLYnhKVGl1aWlfSFFJcnp6bHdGM1VISXFGWWpPSVE3eU5VU0ZheGRNNy0zNHRUYmtEV1I4U0dBbXBkTkdRaWY5dDQ1MnJ1REtMY3VXZGRSN3VfWkVFM0VqT1FUTkZFejlmVmV5NWZKcE1LSjBfVXVxSmJkUTVlWU0yM2Y2ZXJFdHV0T1NYVHNSeEhtRHVRX1l6cDJrZFhWVF9Tc1ExMU5ldGZUdHhYSmFVQWVxVzV6VTltNjNRSVo3Rl93NGxraktvaUlaY0VtX1c1ckFYclBFdWNRLXpJOGFMaTV1ZVI2azVlYVVMdzRXQnlrbDVHaGFmOWJJSnpRRS1fanZ0cGQ2dXhkLTBKMUh5bmZ3SmNZR2dXZy1neW9qdzZlZnRjcWZ4MnhjRGtqZ0JuYnlyLXNsQndQOVQ2ZFRkcVNHZGlEMDF3LU81c3ZKenlOZmlPQm00dl9VSXZFMHAwekthTU9HT0h3OEFvc2VJcl8yVGc0eFFSazNlbnU2WmtrRFNSR29ZOW4yVU1uclMxOEVVb1ZvVVhlWWxSbXJQVV9iUndVU0RJNGV6VUdRQ3NlX0ZLdmRpdzlLbGF2dEFrX0VCM01FZWhtUjduU3pVeEl1NGRLQTRweHRITm1RLVh1akJDWGJyT0VIcmFWN00zSEZLZkMxTUhlSWFBNXJDUEhpdGNxenBzTW53Ti1MQ0hoX1NNMjlxb3NBRThxVHFmZlpzN0RZdkpVZ2VnT3lxdW9DdmVQcUtsWjFjbUU4ZGRjUlJtRmVtdmQ4bUV1TzZVeTBIbUdnZS1mMWkwMDRhMjFuNTd2MDh5Y0Z6QjlaN2gzUnFDX1g2NFFFLUVQWW1tQTZkOFJvbmxfVE83dDh2Z3ZMNVFvTkU2SWtRdlFERGVFR2NDMGRDN2h2bjB5U19uQXg1ZmNyd0hNbU5yOE9tRnRRaG85dGVhV3czQXRzNHFDdC0zS1FaUHdYQVhWaXJvQnJrN1daLVUyMkZNTWo2bDlsVXFwRzhKLVN4TGJHd3R6LU9mZWV0Wlg0WE5pNHZZbUNTb2RwRE1PeXN1NTZTQzg1SU1nY3Z6SDQ1TElITzN2eTZEbzJLa0Z5YzNrNlUtQXpneEN3VFRGOW13Q0xkZUFtZFZ5bl9hNEZVSlhMcUVzR05UWllwSUVvblI1TUV2N0ZGd01xM29GMDNZdGJRR0c1YkphaVF4cWJtWVhFdVJiU1FNUFFERWpIUlh2YnBRX0FBUFdENnlRSVZiLXNEWmVUSkNBYTBNLVBZSU1lMXRwdXFoQXBDV0ttRzR3Sm4tYXI2VlFyZ3JUcVJFbkpMMUtwbnZZZGVQdC1vQ3JsMnpSQXBSTFVaOHpBS1pwTW5kMVZfcDk1aWxCNEhfQlVTRUVzb0Q1VHhRQW4wMklWcVBJTXFIbklZbXhEakQwTUFsdW5JMVEza3JSWGdiZTJPU09LX08wMlF6aUh3ZEVsOWlqX05GZUFONzNfLVRqZmpQX3V2Q2x5Q2RzbE1aU3dNVGJpWXNPSE9MOGViZFhnSTZuWmgzazZreHhJUzB5TTROemNWUE13WGlnenZYWmx5cWQ1b2VVcm5pZUFlbGtiQzcyUFdOeVU3VlZHOHRpODM2Y3ZuOXdqTVhrbmpBRi1LNlNfVUlHUVlFai1hM18zNE8weGdxQVpLd2FXc1FDRHlFZE9aeUtfTEswRU5GN3hEN1p2Q1dNYm80QzZaRkNoREx3QXR4ZE0xRnRjMEpUcU1oZXVGQWQxMTlESW1nbXRadHZscWxhNERyQkRYYW10bmVGa2tmaTZXcExLNWJRaUNzcUlpMjdoMEI1ZDRuOTdpNllPQ1B6Zl9LRXBaNHpwbm1idGwyZkk5T2hKNmptSVV0WUtyemdEQkZTZWtKUzlWSy1ETXhhNF8wTDhXVXNyLXZaVVY1djVPb3c2NWx3MWlVbC1iYmpydWVaU3JtdVlIQkY5R29EMFd3alZTa3o0Rk1uQXlyOWkxOEJ1N3FFbm1EY1RIcDlYS2JuNGd1QTgzRzJQMjBxZzZZeWQ3MlNsVGhlNnM2ZzQxZ1NXelFUREVzMHo4WmRKMUlod3c5azM1YlBtczhSQlBhYjA1c0tJQ090QzQ4dFNWbmlad3BnUENOVENSbUM0Ql9nTzRwWTVEckQtdlFqTklGWENtUWRzdE1BZFlNck9yQ1RLS1ZseVV3MEhaNUd6OHdzNEMyT0FrN2NiVG5ERlQteV8tWEF5Y0ROVGdyb2RlV1VZUEp0aFF3ZWpLeVRMRmNLVGd3SXNad1lRZGhaMURJMnltRWNkTnVSMWRrTEh2WUlyZ0hUSktPRDliMUlsenNudk81MTM0dktLWWpSbmR5X2MwMkhQZ2IwZVhwT3I0SE5NRldvQzBKbHBFN1FibUJybnZIdWpZY1l5dXFwbFJvcDQzSWdERlVoTG94VlA1SWZKQVdJSkVmOUZ1X0dkVGpzYlM0b24xYjFqTFpTLThRT0VPOXlCNXJwMmV3d0loSGc5U2d3QlJodDNBWG5zM1l0M1dsaUlQeUNSS29WY0hkbDNzXzdoY1ExeGJPQzFFaGdSTm0zM2xMZl9HM0xwVURsa3BDZ1liNzMyRFZrYmNmNUJ4czRkbEFkQ0UtWjYwUmdYNVVsUjRLa3l0ZGpzcnIxT0xhQWd6VGJ5ZnVMWlpEdXJ2SGNzMmZIaFNXQjJ3NVF4T2x1Mlp5NWozbXlHaUc5UVpPcmhvazNneVFBc3h4T0dISGtlYjRXajlpTGUtR2pxN3k2bWg0VVFzazBvNjR1S0VtbWlMRWdwS1g1VFNmdUtYU1FLb0xzU1JLU0NYTE5yZzFsdFdQeUpqNnpjckg0a0FJSG9tU0N3ajF5TkcxU21lclA1ZDY5ZFdnQk5iOVBSSkc0S1dWSS1LejNYWGJXZk53ekFiVHNpUFZ3Ym1hTWtUOUlDSFpfWDY3Z2RsemdDbXo1Z09EeTA0YjltTDR3TkJPcU84azFyUjV2NlFJbDAyelNORDF6M0M2TVRXb0tzREpFWkFMS2tSbkFTX3U2aTR1STFmb3dnZElMS2VyTXNHbmxUY2dyeElFWTZMb0hwYTFmdVc4ODh4Y0NURUZHMTVnZko4Tl9mUlN0Vl9fN2lyUU1XZnVxTEcyenlib1owU0J1MmhSbHp4bGhUalhoUngtdm11MldMWGM0MmFrRnpBTVU5cExVcDhrZVh0U1c2QzRnVl9iNXNhSFpWQVB0N3lqMnpPLW01Sl9vUmkxSUFtYzdDWXptVUdDSzZjWk14MnRKSFNjdzhrZmRieEJPTEZIbkZST3lWMEFMRVVlYXJwTEpfQkNmSGQtcFhhQ0hzdUFWbDRTNG55ZEE3MUJIRG82QmVOZVAtUkN5Tm0yZUVZXzBJa1dWUkFsMkZkdW9UdXpRd3JkZU81Umg0NmpSZ1RSbTJ6RndMdUtZTkNnNXNPQ0RZRmlKNUlTQnpXUVVqeWRWSDAtdnVPMmpXbHpYV0NydUE2cG5iaUlFSGhiNXNzYllRU1l4YnVlOEo0cG54MjZpR3pDQk94VThpUmozQ2w4SEFtTmdGeE5BazNSNDJrNFh4THhMTHFmckJSMWZ4M0diRDN5bFRXU0NZN191cHh4VXg4aXB1NjFaTlBlTjNIcGVGV1pMU25kYjB2aEFvVXlBREtrS3Z2cFBYaGNtbmtHRFAwNzEtbnp2YU1MZVhPMGN0NkU4Zk9iN05udkJqTWxxaFN6ZzRod1NWYV9OT3BLNDVkNDRqUjNaTTN4TUFkcjFjY2d2MWM4YU94dlUyNTFyMzZReWtKdE9ROER4VVc5aGtnS2NEampQc05NbXRxbmxFTFBWX3lFNTROVTY3TzZxbnZ1Q1prdDg3UElkLUxoZ1N0cjE4RGgtSWVOdDRtbU9SeGhpU2tsSXNjcDFxYkRUeXIxUHBPWnZhdlB1UWZtY2I3LVJhUTNZcEI5NldOZVk5VHNCXzc4TDNNRVJ0bHdwdXVUZjIyVnAwUkM0TlFZZjJGX0Q0OTVvbXg1OXg2Y08zdWJMRUYyaHJoNEdNQ3gzV1JTeFo5bTBPbnVpbWJNSFhQWE5NdkVGejJMckVNanBaLXhDOG9KMTMzdmRtdkwxWmhiLWRYd09TM0hycldVZUliSUZqa2RpZkhjeVlZVkthRU84amNURGFjV0dtdFBfc1Nyd0hwb0JzTDFOLU1fM0lpeW9nc19Bdk4zYUg2M2N1RC1lT25mS1VJMzRKTVFaWXV0REdyRXpWWGxsbDhtR2Vyb0drYTRoT2VFTVI3LUZQTWVaOXVIdEI4cGQydXVMZWRjZjViRFBaR3dCZzZvc0JhRFhqd29WS2ZjWVEwWUhYenBISEx5T2JjQkVPYUp2RUo0T2ZHaWJ3ckM2b3J0bkR6R0JRenF1ajF4dTI5RU1lNzZHbmNheFpCazZMY1gwOTJwUkQ4VS1fVVZsY2lWdC1wSzZGRHlRbDZrcWZ2d1hnMVBnMHk2d1ZUVFdLX2RvM3NTMHdqX1Vqbk9wQ2I2RGQ1VElzV0g3Vng0NFl2akhNSVJuNWtUREhQM2ZDdDdQNktlVjJibDBPdTJZMWZwVDJnVWQxdG5BeFozejF3ZlMyNXVVUUFkWjlJRVNXQmhFLWVFSC0ydzIwLVpxem5QRU5qQTdaVEltS1c1a3QzbFlkZ1BiUEE5VXR4dHpSRzlXeUZ5NFdUdWljbXlaRU9uTm1SaVFKS2JKVGp6MHh4VjJzRncxaFJqUm4wdGxjZ1FkVkFEOERTQkMtUTFLd0NwdFlMQmNPWVd0aG9xRlpFeWlaNFJPc3dmeVZyZk5WaDRxampPYVNnTURQUm1kbkxKNzZrV2p3S3R6enZBb2EwWjZqWEpod19GYmZIR2RRSlhkaE1EZ3BZd1VadDdwS3VKNGctOUd0LWZZa3RDWnZwczBuYTc3WkFmYjhsS01peDNYY29IYzJza0JFbDZBZUs2N1NwVDFPY3JlR3laZGlBbXRRRFExYjZ6Wm1OMXJyR2xNcE1uc2NlVFZUNmM5cG1EaDJ0amdxMlBZQ1k4WDNGOUxSdW14UF9tb3Z6ckk1R0U5a2hFY0JjSlZPc29FQTdQVkxQTFdTalFmSlRGUm5vU3ZHcXFFMXpuX2VnaHE1dVpNMzdpbEdXNmE3dy02Zi1heklIdndmRzBWX3F0MTRnb0pwVkN4M1pCRi1zaFBmNm51TWhkb3R1WWZVUXllbVhINDRJaHc2cFlzY2U1eXJBT2RRd2hJTGhZWWhSUXI5d0pXS242YkZBQl9WdTZ5dmJVU2V0SjVOelRQTk1lcUVhU3RrMWR2OVNPMUpvQXZFdUxmT0tNeURTVFFvdklCNFVuWWl0Yy1nc1BDTXB1MVFPaEo1b3FRRjdQSUFPVlNMVFJ4dHdZQTRUOEZoY0c5WU44cHBna2l5dkdMN25nRGdQeWp6SUdNcnpOZ3ZMV0ZZNzRxV1o1WkJMRkFGLVdkNC11T2ZWbW90NVExMmFkdFRvVGVEeFNQUTMzdHNpNDB6MURNR2c1X1UxUlZvZXAwdV9qbkVzRmh4M08xMkE2X2ZWb2NXd2tYbzJZR1RUWEJNX1hLX3dkb19fb2paN2l0OTRMckhoSFE3T3A1T3ZzT19IOC1BYXZVN3F6UExVTkJWcXIzUF9GSnh4bzJDNzRiSDFXWHllQjNWVlhveW1kUWlqZEdRbEd5UVpGMk1BaTZuVmVFa2ZyQzg0RkE3VUplbjZJSnFUZWQxMnNxbUM5ampoR2VXMFZJM2xDdEg4NlVBVWlWSE1zWkZtbE52WUVBWnZXaUFCVVhjeDludVlaNFVfYUtGR19CYld1RXZSRFcwek0zS3JDa25UN08zNlJiaHdnQkxISEo0UTNoS21YejNiT0djSHZ2VFRRcm9PT2U3VlBNWi1Fb1QyWF9nR2lWR055TzR2eTJwOTBva0NsVF9UYXBBbjBEZS1JQkJqMldleFdtR3ZaRTFFVnc4cWpVQWJicTc4dkk3MFlud3RnVmNSQnpxa3QwMHhPQXBRZl9oYVBWSWkzaHpyYXNRcDNxd2NxRUpXX0lJZW53QWVXcmctU21aeGFqQWczV202MFRpV3VGOUNGUDFKZWh6eHphbXhZN0Z0eHZzbE1Ib2xDbFhQMWFvV20tdXdkSjlDTHprSlpvbFNUSnJPNHhxNFB4NVF5T3AwNlZOaGxsWmNvaDVTcGtfYzFYU0lwS1RVaGZ6S19xRzNGLWtxOHkyXzdwVGFpYnJJV1hqaW5mZDd1ZkJPVDVIMFE0ZXhmTkRPZFJXbTV2QS1tZmxNVmJ6UTNvZDB6Q3lOZjFrOFJRd0J6aFp3RFZNeHlVSkdBMm9FNUFOdC1WZlVZNlNKT3NlMUtHMm1BT0t0eE9FOEtNTzJFbnZyenM3QVhTRTd5S3BmRDk0bllXZ1JIS3U1SUlfLTRHYzRWbnFvQWtuNnI1RjVqMGR1MnlzMkhwdVVPdERCbi16NVZIOXZOeGk5ejFHRm5PbUJ0b3VxT1E2Z1NoR01BWGM5LWxrZG5hZWs2blNIRy1nOTA3eExhd1BnTXRIWkR5Z281WElNVlhWNUZUMG8tdFpBZTdPRXNpR0NyaUhxRUtRUXZ6WGlJRHU2VVBNbkl5bHI3Mm85U05YSG9zNm44MDBBOEVXTjExUWhKNWtuRzRaUE9ycGE1cUFKakNuR010aFpoRUNzVzV1WDBRaG5Uck5yM2M1bDRLdHMtaGdfWENlZEhTM2E0dGJxUUN4Q0VweGdoaTVNa1pMU1IzbGNnNEZGY3RwTC1qSlQ4N0M3MHJVUFc1a1hXbnZWbWJTLWJuRXNBNGFUYWJockg4YUtuR2hDM2plckJ6VTlibmpTcWl4bk5LYWFzNmMxdkxvRDQtSkdhNEpuX1ZvRVkweXhGUElra3BvODAzVTE3TllZeHRRVTJWQmVVZk50VWFIdzdWY0RBLTJCUTlfOE93cmFQLVlHektuT3Ewdm0zemh0UEVselVHVWtqTFJ5VFNoUmJKcURRMUxHeVRpbHQxT0Z5UDZpcWZOQzR4WTZNUlZoZy1ndWwzSWd1MjhCTmtuZkMzYldNQVhsQU5tellvdWJrVlBNM2pod3NJb0pRcks5SGE4RGZWUi1CS25PSnZBRjVuS1d0RlZXSjJhVDc2dE85a0J0TTZYbl90M254VFZvOUxLMzBFUjByMlQzV3ZZNHk4SkVPeEE2NzNWTUtTY0FhZkVyV0FSZ3FHTENfN0g3TVVNSkMwYVNvM2tWSzQyME5PSFdLQ1FZbDE4Vy1qQXdSd2ttWUVxUEVYeUMyMWtYUlFCQUZQNmFtZHFEalRvNFZaYndGSFFIc25rczNIN3A3WWJIdXF4amp0OWJ2YURuN0VRNnpEQTNmeXZ2cUxySjQwTWVRNkJzMERHd3ZqeVRFamFRbFljaEU3ZEVWb2FNV0JKU0tDcWlqdFZPYU4zOUNILWQzNlpCZWdjV3hDRmZBbV9RUlI1QW1aRFJtR3N3Q0JJeTFhVk83dW82MHdzNFBJS25WSERvMS0yOWpfb05landGcVV4RjlCRmVNeWpGSVU3cllXUUZyVnRXNmlNNDd3NmlJNHZMU2ZsVjNMV2Y4UUNmSHZ4cEZGS0FBa0xRU1d2U0NuM1lfd2lIMUltcEZhNXBmZ3ZpV2w0UUVqVHRIQUNKcGJtc1JnWmt4ZmdNalRrQm05VkFQclRIUzZKVy1rY1hrNmlReWh0UnY2VlNCZDRwX0V2dmhTb192WDBWSzNoNkNNSDlJdzZRVWlrX0FRVHVFYkZpcGRGMmNqZjJyLXhuTmwzdFBLOWNlWXBRYVR1aFgycC1pSTd3ZXVWNU9aMkF6RDNraFdFaXdVVTNZU1VMRXFBYXcwenFJc05kdzhub1d3TE1Nck9ubUpram8yY3g1d2xjOUJxSTBBRnE5MU9PSGhMaDJTSUZSS1RLcy1WOUU4aXJyQW4zVTBvM2hWb3RDWTlVYkxvZVh5SHB2ckVCYTdoNTdjTXZ3bXpuRWRhcVpLaXMzeUV5X1I0cnRHdGFMeWtHYWYzSGxON0p4Q1hWaHAxWmtVcFotdDR1TVpRaWE1Z3BEcUdKN3BOQjdjdlRiQk1SVUhWNHhHN0tVVVVFVENXT0w0SW9RRzhMRlVIbVFEbjJPZUtkdlRydmVBMmVSNUZzZ2FVT0stdHpfZnBOLVdjWUc0aV9zUkRKSU4zY09CZTF0QzY0djZnbU5TR0FSYXczRWtzYUNGTWNsVDN4LWlOZzVCZjh3dk9yUVNaYTJ1aUVKall1b1VRcnd0ZEs1UEVnRkMxR3lQUjhTX3lBdkRpdmc1M3U3Y3dPb2dXZ29EVjFkaG9vLWM5bE9Hbk9mYms3X3RVeWx3VGdvOWlMNlRJd0htUnNqVFdMek56SXpZWkhUUHc5N0xlOWlWWjA5SUxtZjcwQS0yb2lCRU1RN0hHeHJKY0ZFeWJ0enhZaUVjUlpLbUxENVQ5VEpPQk5leDJXTUQ3blpMMG1QX25Md05zc0w3NkJGcEtqU2pXTVNjMnNrWU1tMjZmOTdfYTBORER6dEUzM3F2ZXZJV3JrUGN3MGNjZUhYRm5LN1hWN3k2b21hSzJvVDJFaHBaWmM1S1lRNWJNRElBa244RmtZMHhGNnV1bEVwZ3BsR2EwQkxZY2VZZTFEN3pDN0xSdVVVWW9nV3F2MlNKSUJyYlp1RUI5ZUJZV0Zvd3JxeFItSDVEZTJvcnJfUmZLUlFocWtsZkRXb1dhT3BZeUk2bDVNNWdxSm9RWkNwaXZZX004VC1jU2NRMDFBZTFlcWEtQ2FhYUFvc1VvNXliRmNEWUFETmdxeEd6RWFNbnB5N0FVMlBmeDVGYzg1bVQzSEZWeVQtcVUxSEIzRkNVM0VKQ1Q4NGJuY01Rc0JrdUpVQkVQWnJEb1BSaVZhR0l5Nkl6V0lfSDFVZmxMcHpqZkhNQXFkYi1rSUljWlE3b3pXTGphTlhFd21vSGgza0FCaWxha2xlLVpMQ2h1T2lsZXVkZXVsSUNBbmtyblJpNHk4dWswblU3ampIdWxrbE1wekF5Y1lvVEdfeDJGbXdVbHJOeXFTTF81OXdOdXF1WkhUem9UMTRBSW1GYmRZblpsak5SZGpxRHhUUl9KMkdvanBWZ192Qm5KRkh4VHAwZHdCVnFsYlZGbjNGcjlJWFBqZU52VHVSZ2czQXM2VUpNb3dralZsUjBFWGx2LWxDSENaTnFhZkJrWU1fR2tnOE1uVUYweEM5MmFVd3BkcnNWZkxyaktjMFdWLUg0QVlVeExTdXFUdFdDVEUyNV9paEh1VzhvNndtbzZ3UnpJRFJkTS04Mm45YUZCR3ZvVFFsWnRwTWF3bWhsUE9oMkhfa01WSmlXYS1kc2xUc0x5SXB6WnBjdEhZYk4zTEJFLWg0RWRPSUI0N09WSVdFMmJpWTlGajluQzVrNUN5Rlh5YXMwZnpMUWpCMk1kemdlVzBvUDdnTjNveHBvOW5IX3Nhdjdsc2pRNGg2ek5yenhtY2lNbTJCNTFYS2hLUW1nbFFzYUNQalU2WXJ5OFd6ckFVd0ZCVm5YWGZSQmZlT0ZlYVJUNlgtTG93MHFPbXMydTFsWTVZNWpKUmpwczFZNGlrUkdVaFhidHRBRl9wbS1jSUU0dnphUmtMbmZiZVUzbXdxbWp1T0YtNW1SWlMyeGIzV05kSVBJaUdGaTNuUHgwT0VoY2VFVXVWZHU4UFMxYnF0Z3VTT1NyMTA5TGd2RlJHc1VJSUtEZ24zR2RPQ0FsdE10ZmxpT0F6a3FidzNQX2kyRkFpQWhfUFNjQXBOdWV3dlpYQlhtbXo2UW5rbE9nbE5JdUYySzFKWXZ4djNXYmZpbnNGU05RemlQNi1aNGZPMnF1SjNRa0ppdHBVWllRSW1uUjliMXhuczVkcUktdDZlYktlLVpSUkNIeXpKQ3NNeE5Wa2M1UFVjal9DUnlRc2lsOTUxRExud3dqTmNXVU5oazZ6cUJFVFljVXlpSl9ZSHNWaWpqRDNhRlJ3OHluRUZkdHJIQkdrLVNOd0pLcFhIeWdobzJmVGh5US1BWGlIU0Jvenk2MEJUMFRUakVqcWtFbW0tS2RlcEZnMmxURjY5NDd1V3hKREd1V1J2eWJLb1hBUHRtNVR4Um1uUG1FQmxUVC1zbGozWTN5N2Z1T1ptZ1JsakxJd2hYU2dhdGdkZWZhOEZkQXVNNDFOckFmcEc4Z01BSEFjS0p6OUotZ2tnZVZvWE5mWkRPQzNYaU1mcEdvNGJFN1VDOFdzaHpuajNDUkZRR09nZ2xQUF9oVFIzMVQwbFo3RllES3ZOUkNhYVJmTWdXdjEwMDZuejlBNVhfZUM3azhaT3ZKUXpLYTZadGdjVmctdnBQT05waDVwT21JdkxLYlZLVmxpdHJVOTZCX1dUUjZRV01FbG00cEhNMUpWeTEwSDd2OHFGbWhOTHNwM0ZUWkFFcE1SX3BnSVBWTnY0MmMybWZQVk5ycnhvWEVwdXV4SzgtWDJXU2pDcWR1TmR6MHV4VmhiZWxDQ1NBUlZwOC1ONDJZN0lyOEk0M3ZBOERROTRiXzFVdWVkVDdXblJBR3lORkhlSHgzQlZGRmFTbEozRGFhMGk5SU1jS3RqaVZWOEhsa0RYaDl1OXRZV09pSm4wN3JjMDFEdGtOYThnQ29GSnVSY2N3RVdPUjBqdnRkZ0k0c2RnU1NNVk5UUjd5ZFNqRlF3ZGs0YjF0WGtUUUl3d2dNRFE4X2JoTVhoN2VzekZzV0xCaWNLeUl6aUZhYm0yZEpYamREREpMMHM3Y1BaOHFTQld0WWItYkZkaTktMkpnZXRjZDg1ZDVtclg1RGN3Q3l5VFlPUklmRENYYl9jLV9odzlUN0dDLVREVGxVWjNuVTdCSXB4UkktaEJ4ZGMyelNxU1loQ3FoMnZsaUcxV1JlMXdvbVdDc05ScmZSZngwR25Xd1M0dFF4RWhwOWpGMG9zTDFhUWhNVnlmYl93OHJMaFlEa0RweUx0N0l4OEg2WXhkZkdTOWRxMVNkQUZKcW1IWmVnVm9OR2EwSF9rSmJma3lEUnd6bE04Ql9zN1NCVEZzZWxESFVxWEJ3UnBXYVRzNkF2bDd5WnVsNWRFSTZ6aGR5OGxUMWcwVV9ZSUl0WEtzcFVqbEcyRTN6cWkzT0lTd1Q1WlNCai1xdnZ6X3hWR1hrZkpuUkptS2tnSklYaVY2dWFVckNHZ21uNG9FUktpeks5dnpCR3oyczZsRzc0RVNCT0xWUDR5NWtLb0E3UkpJdnZDMHZ3V3ZnQTd5SDIxOVo1YzFCMGZUUVBUY3hYVlN2LXJvb2tHbDFrTXJ6R193UVdHM3Y1TWRvUThZNEpLSmhlZmdXYUZxbkN2RlVBQndnZFBLMUZuVERERmJraFFMdEVROHJNcUdHOXNEbWJ2enNCUDEzZ3kxaGRuWWkyMmlvSi1HNl9OMl9KYldkaU9seE1OTEpoMmFiaWlJT1ljWlhGTmQ5WUx4T0hTdlNud3ZOaTh4RWJLNENuYjZNOGdJZkFxbXo2Ml95M29yczVvbmloaTFpQjlfSDRFMTRLdFZqNXN0Vm0zLXFtQW1pQTRMcmVNRHgxQnVVMWFuTUt5N2F4U0hhbUNHN2NvTy1Pc3RSbTgtWkRfY3BzT1dMMnNKb2xMUGlJX3NjSnp2X2E5QUZsbHdmM09URkJ4RFA3ZGdaclVsc3J1QWpsRUl2WjNoc254cUVmOFdiSGI5bUItVVVqYUl0UkZlMHZZR0JYbENMTXNoRFNGRktHb1FHb2VLemJqRFdYTDhFM2JHeGN6MHBCclEyT1pJQ1RjOUhsSnplN3dxY3Zidm82eEJTWnA1SjYyNXJVLXJ0MlRnMEtVeVFkQVJyMUpGSkhaRUJ5U0FyYjN4MnpTSXNJQ1dURGFOaUpVYmtnMkpMNjh4OHlqM19tR1UyS3pYNzhUUUp2UGVkTkVYOXJsUFUtWTluSFdjMXVhZ3cwV0FLWWNEYkxjSHpvM0xWUHc2LXBuY3p3VkhsYkFqNmpiSDB0SHRXWG5FZWotSEQ3Vk9YcDM4VE1qSTYyUTBrY1pHT3RQcWNhNml5cXpzNE9LWm13ckh2aGVkUmlqVXI0RWFxdlhSSlpHY0QtVWZxVzduSHhUdUtfdy1zX2VDOGtuVmtrVHBCVjRqdG5GR0FIOGxnM2k5LW00WG5hVUtubTJnYW9Gbm9ja2w2TDJRZHZZV0RZTGZ2VHI0Wmx2MjJGTWdfc3pseDN2bXkzYkQ3NzQ5Zk9sNUNhNWJ2MzIyT0w5WmJrY1l1eWE1dnVHNmRnMlh4NmlhUUU0bkdJeE5nUlhVWnMxUUZJUU1tYXRvRzlBOXhqOFBOdHRwTHdRNjZfTDRhUEZ3QjZ0ekl4bVJFT1dsMUdxR0V1NGxld3NMRzVGT2pWdloxaU1BZEE4dFBzSXdEbjdYbUlJcW81RmxwRzVzTWNyWUcwQ1R0WjIxaWRhX3JjRFdGTGtFQnVWRWZZQTk0QnV1d1huT3dmZ19iSmdLV2J3WldaVVU5eEJtUmRSR0x6NWNya19EbUJxVm5RaTBfRmtGTHFBZjQzTjdzNldyaVB4UXlBeFkzRzkwb2ZtZUo2M3hYZWJKc1VVQzBxV0gyZ20yY1pZbHBERXRDRmY0NTZRVzFENk5Ic3h5aEQxMmNIbUJkTWIyTVU0M3RZa0g4bDlESjc3ZXZmaUhaMHdXR01KVHFjX3FlbHBjN24tTWdKempTNmpnZ3Zfam9kZDdfQzVLOFVkUHNjUDF4M2lTM19rd3hVdE4za2FuX2U3Z0UyQTBTclJ0N1lHNDRsaEdFVTFGXzlBVjdYYkZCaGkwV3F2eFlhNmZwTWtEVnNRZlpqT2pDRkNaVi1icFZLTkV4WmNsM1g3cURXSGc5eDJfOVhtaU1IYWNMM0xnMXpCV2p5NWNnTGlCcHQ1VXZtWFU5MmpUVzZTMFJoTEQzNWFDVFlLZmlMS0hFTnpIa1ZPMEZvWGRhT0t1VnhBRHRCVUFBT3ppVGg1bDdRLUtMRWxzblJIWWNhMFltX2pRdkFWSVJ4c1JOVk5XaHVBTFhxMk85ZTQwZlNibUNKT3R2TjRPUGlOOGRuUU5zMEJRcUNvV3hXUjFacFBINk9lQndWak9ONDV5VjROMkVwbkFpOXpyaEtZS2Y0LXlQb0pLZHdNWWk2cVZRRThxb0pOT09JaXFBTzJhLWc5NklBZ1lJUjZvbHhvNXloYVR1Y2E0TzE1dTVVdGFydDJReFVIWDdnempsQ0U0MURRc25yNmV4VHMtNUdiNkpUQ3F0bkYtWG5YZ1NiQjdHVHVRcElyaVY4TnlkQTJaNldTM091anJ4WTdaNEhXV2dwS0QtT2tmdkFZUERERlZlNmR4WGVCNXVzeDduLXdSc2c5UzUySlNISDdiTXg4OGJpZm4yOHY5cUo4SC1OYnFxTnk5TnFweXdaMVRyVmxuTl91Nk1hdy1zZllEMW1HeHJVQ3gwTUczWnNsb3ZKMWF4d0JvaG5RYi1LQ3l0Q3dnMUUySjEyVzVQaXFZQU9uWGZZUGRPejY5TTI4YjZZUE5ZVzNkcHZ6UVU3aXpSeHJHdElfQ2pnYUlFb2Z0VjBuYjY2LU1zcXZFeXI2ZTlXRnBXNURnRnpYRFhieEdRd2YybU9ONUhHTWFYemNaMXlqeHZDMG5nN0Y1ZHZEcDd5SnVSeWdaU2JaS3l2enVnRnVoaml0b3pkYVdLSDRmbjh1eE9lVTl2X1ZNTVlvSkRDYlNMSEh5SEp4TEpHYjRNbm4ydlctbVU5RzRlMXNpYUJISU5CQUx1YkhYaVJNSmp0MHJES05EQVlZR01WTHoxVV9DWFNSVDNCbDctUWlVaHpDeC1IbHN1aUJWTGs2U2JaenotYmNDMnhfZUZnZHF3M0hUWFdsUWNhSUwtMnF6elpPRGtZZ2VVU0tiOFRIM2Y1T2R2MFF0YTZRRTd2T282clI2V0RVd1BiLUtCZV9QRVZfUy1UQW1Wb1ZRR2pteEQ1UTREa0RZZW4xSGdqa2NEdUVaaUJnVnl6WVBlcVptM1dUVk1IRHE0aHctdDFXSzdQTTRZeGdLRFhIYzFwajFQdFZzNkhtZE01OUxqejVCUng1V3ZUVnduSHRYVmZpZ2JYZzZUNktTVmZ5V3lTNGNESnh5cHVlbWhnaUhDd3BlV1d5T21RSmRzajVjVzV6cjBtb042TGpzRUt2d3VwRC0ybGZGM1JKUWRXWFVHbmpoTVg4T0RVMzJVWHNZdEQ5TXZUdnpMbWJnMW1fNzl5T1ZuclJ6alN2eUQ2UmVIQ2YwMmljSVAzaVVOUWxxem9jX251U0tUVXNSUlU5NEhfMUgtdno2WTd2SXN5R0ZHVzk1TkhoZnVjYjNkT3NudUp1TXBCV3NwSVY0czczMHBRMmh4T0hVY0l4V2oyZC1hQlFhNE51T0REZUtGcVJWRGZiNjJqZFdtcTgzVzVpUS13dTVpR0R3V1UzcW1jaXNIZ1lfN2x2eG12N2hUNzRTTkp1R1dpX0FqX3ByYTF3ekgza3ZqZFlUaVYwQ3VpU3ZjclFKdU9aZkppbzlqRjAtblF1QnJZSF85LXh6cTFXdTdWTktTb0x4eGNOdzVNeVJjTGRCTUcwOVlOVXlEVml1UzlNVm5qc2EyaDVtU1hPU0pGV2hpQm1tYTFueTNlWkJ4anZ3SlVhaVRJbGlqNlFjbTZWNG9UQV80QzRCUEFzMEZUNDhvTW9PZFFTYXpYMU9Zb1ZqcjI0R2wtN0hpdk1Yc1UtZWdJSDlSd090MUdMOGh4OTQzQWlMcjg5MTU4dTRfMHhTdnZUT29pYkJZUVNhMmNZVC1qa3JqQmkyLTR2NDF1RWlmd0hCUlpQS1h5NjIzcV9pUU80OERQdXcxRUFPc2hWTDNOcjZ2dzNOeXVoVDRQSFFzcjBiTm1zQ3FWcFJHTktiZ3dBUnY1VEQ1dzQxVE50RU5kYUxvTHNWVGc2U3lobW5wZUJ0R2FsbEpjcVBaTy1aNXBEQjdPMVgtNnV1YllSSDFQa21yM2Z2ZGR2RXRfcUt3U3o1OXJNUmgtMFhyYnBHejRfQTRNLVRDSVJRd3lJbkViSXhaSHJpWFE4MXNzY0g4QWYtOFl0Um95cU1vWmN1U0FpTUtCTXBxbDk4VkxacmViMXJ2UXJDY195b1o1UmpVR19yU21nYnJrMDZMV1A1ZHQ0MGQ3cDRRM3lmWnNXaWYzdWFXM1R2SzVQWVZ1R1pVM09yZjJSVkNWMGxDdXZidXZVOTFvWTU3Mkg3MDU5UVdTclk4RTQ5ODZBa2NHbFlVenlVVGxPd1E2OHJPbV9XdUJNZ1QtT3U3UGVkeWRDRXMwMnk3Z2pZWE9jWnpNZUlCc3VlVWF1S2ZYbExxVWtQRVRDN0IwcmZrQUVNRVpQVFlBQjFqNDdDX0V5c2ZxYnJ0em4taVUtWU5TQzNDUkRBT05xOEoybG5pTlRXdEtCUkpMYndmMGZLQlNROFl0WWhvZlcxMDNlRF9ObVJYQS0zY1I2TWRidFE3OUw1RXplRkx1cHE5dW5CWXhpZFhEMXNqTUMxSEpaRDdlaUlVcVdnY3g5VEVyVExqWGIwRnBRdkdwMDBzaTlGYnFlTFlxSEVnSmNGcG4wRGFDYlI5Qk80TXVSN0dKanRRMURVOTRPa0RCc0pTWVpMS1hWXzV0ZDNYZE0xTUJ6cW9LMnFZeDdreFROMW04YTV0VUpQWmxPVVVKSWd0V0hSVm1VM2lwRDU2dUdHT2Q3ZWJGdldFbTc0SnpQdW1iUXlaV1BpWHlWUmpjYXByeVZFVXFNX0pKWGVhV3ZnQWxiY2FlZEpFWS1KTjR3TmJJMzRXSXBnNVZHV0U2UUVnMUVyTGF3dDlmMHBDTnJVYTdXSk9SSEN2TmlVd2NZZnd5YVlyOFBkd1ZQaDhCLUZhX2pCVzdiSEx6MXVHc2FTWFV5MjhTSzZBSDBRYkxCdWlzQnlNeEQtdHoyU2FtMDkyYXN1aVBNZmRHTGNWeE8ySXFNYUFfN25rNjhIeGh4Z05fRkJNNlpmc3lfVVR4bmlqQVc0aVM1QkFsTDlpWjlFQzJkb1lfRS1laHpPWEptWndYd2NOTWpkRkV4NmxvZHVSY1I3d3RkSzVkOHlzMkN5RVMzWUhmdDFCV1NuZERsOElzVC1ESnBMZUhLU2tlUnNPLXZFc2txMG5DdVhxblRhekFyVV9ES2h0LTNwdFFkVzYzUDRyRFVwdlU4clZ2ZWNhdGM1cXZhc0YzQXo5SEtFX0d4b3NsYVpTN28zYXlKbTZSUUs4eWpYRl8ybk1IdFVYTURxSEg4bXVrR1lob2xUUm1HZGNFSWNuTWh6WFMzX0JzbzA5WmtoQVZOajdfYTZSYVAxZlFuT1NERWJSUmhNcTM5RVlUYk9CMnRmX05ORmpDdk9SeXd6eU80YnhJUXZac0xNTTYyVlJUaE1vNVBpNUlGaVUyX3FtTDE1ZENpR3JFZG1EYmQ1M243c0JVNHA0OWFKZGpzeTVBOGZrbndTZlI1Z1VmbjRnTllvRDF4QWFpak1ITEMwWS1qNkdVMlp6NlpOTDNhbVdGa040TzhGSDM5a29LclA3STQ5Y2VkU1Y4Wml5MEUwb1E4aU9Fb0t0eTBINjhoM3Z1ZlRteXQ4RllmUzlJVUNhS0ZWLTdBc3FacnBqd3I2ZXNhSGZWRWpJdExEWjlWVVdUZ25JTVF1RS1sUTFFU0lqU05mY3Vjd3RsUjZFRVdHaFE4TmJzcVZZcDZzTXFOS0dJX01IMmdNZHVvWl82cTZoaEp6aTZXanNlVUdKV0NfOHZOOUtmdzJhWEl0YzNOUFlVMTFRTVY1NmhlVDlOM2xJZXRaV3ZZeFdEM3FwbFRfY1J6MUNvMTN5VVpWODdmd09sOFc2T00zS1lCX1QtMF9fa2lJaHQwSVNjaXBYMlVHZlp5RmxEQXc5LUtqZGdvbDFvaWZmSlZtc0cxRGFqdFJXZC00WHhUM25mV2N3V1pxV004VnEyc080UUxaQ25LSm5heTExbDlwNURCQ2x1OHR5SUFfWDQ3N3REZFEwbW4xV0Vkd3J6ekwwZFJjV3NRTmdtdG9xUHpqZmFOQzhaXzVrSlFmNFhUMExUdHdhU2RBZW9zVDdqUXVBcnpKLVZfM29MVk1zZkgxcFJzY214QTY5MFRwWVpxUjZFVlhBcWcwYWx0bU9RMEFNUXVrTnY2MUJ5LU5Ccmo2T085MFF4LWdKcEtEZ25PLU9Zb2JQc3VxUnV4bDZqQzFIYWFuS1FZLU9qOGZjaXM1b1NRbVk0dUZkODE4NHpxRGpSbW1ya3I3TTctTHIyQnlWd3JtSElVazBnRmZWZkZ6Rzc1ZldCVVNCRGZyTmUzc1FCVmZZamNKcnFFbjNrWlhPM3VPbF9SM2Q1Yk9hS3FfRHQtTTBnUEUzeGxHWkV4SGZLdjNSXzBfZTdoZlBvU3ZucTF1YzhvZXJwWFpVMzc1R1RKcmEyZEhkbnZSRVhIZzdRU0FRSVMxSmMzcHRnMjlJOVFBSl9ldUU0emdRdjlHVkgyTGZqaTRDSU5TZnp0MTVnLUpPMl8yT0J2Zy1OVFBaYkZZREFxaEMzM21Hb280SjByTHBneEwwZnBhTUY1ZkxlbUk4SzBGVE9fRkNMSVYzWUQydEF3Ukh4ODN2ODhIRTdLZ3pzdXk5RDZOM3ZRVHdEZWJYaU1RQlh2SHFVSVA5Y0h6MzJUR1BsNzNNOGZyZnhGMGQ5SGg5OGNPMGtRZFR5b3ZPT3pzMi05M3lxdWpFSVhSbTFHN1RhaThoTkR4U280bkhEeVU1eTVDcnJDQ0Qxd3FNNkZTTXdKSzBKZ0NRdUtUSjQxeGp4RkJjZUw4cjhFZ05NblNtTEQzWVp3LWlDZEhjYlhWdFVhMDlCM3JsN0phX0ZWRDIwTTQzcTZQcUFXS3dUakVteldLYVBqWmlVVjU1VVBDbzZSb3VPVG90WGt4MUM5MmJpWlIyaXRuTjY4bWdSSW0wMEJnMmlWa2R5TEliem8zOGlSbHRnZzRDVnVKTjhfOHZCNUhmaUlPenl0S1FNdWVpYW55dHp2d2lVTG9VOXo2dEQtQXVXMlRzYW1sb0x3UktMV3pxWkE1ek15bXhZLUlPcFlsSi1TQ3BUOGY5YTdTaGExMjVUZWs5SkVUVmd4bW9CV3hsdVpKcGwtLUtYTDNQdm1jTmR0STVyUmdYc0steXNfREI3ZFpYVkNaUlB6Qnh4UXR2eUo3aE9YZjJQWmoyMzBvNXlVdVZCWmNLekpoeWJNQ0RYeklUYTVDMFR1aXNEQXNCcWtUeW1rS0lrNzJyOGMtRnFjMWhMLTRTaHF3cDBhTUJWRDZqNjdibUNOODZLcVVsZmR4UF9PQTFjN0hwT0RGUFNOZ1R2VDU3NTdrVWhXTmJKUnpBMDdRR3BYeEhlMVBtMW5LMlJHSXZLMFhfcmx1bUk2cjZwcjJqN3B2NXJmSV9talB0dEh5dDYyVEVEUkV1eS1Jbk43VTg0VkN1aldKUnBvZ1JEbnhSeC12bWtjQ2NkWnRkTjA4TjhXTTRldjVaeFlLZmdwSURWYjFGRXk1ZXlqRUJaUUhoTWZEQTFfTDVPMXJ1ZUxUSHlTVGp6cm5NWkwwbkl2VzltZlIzRmY3dk9neE81TE1NNVVtNy1sQlRiVFcwa182MDVKZllzVHFoWWt0LW01ZDN1ZnFGcHI3dTlaTzBtUWVXd2xVQkhtMW1SYmRzR1BqMVE5Y2tGUXY3Vk1PNUFOeVV1SFg5YjNsY1pUeU5fV0RtUVhzZ2ZGa3ZHeTg4dVlic1JuQVpPTG1MWGlhU3YyYjJYS0I2VXhzaWhscG8zZThxNUVkSXZzeHlzcGtxVWxWdlNFWFFjaUJJNnlwaURUVEF1SERCQjVDeW9aRFI2UG0wMHhkQ25Eem9ZdWlwdy1LMzl1ZWsyanhtWU5kTHhHemNDUWNDZmR4cjJDV243Mm9FcFZmUXVIZXhlejREUnJBMV90T2ZUUmxDTDdRNm1UQW5zNnp1M1JXOVlTYnVVcDd0NnBnbDRMV3V6Z2FaeFkxVE5uMk1BbTVZQm1GemJEV0YtaFA0VzFkRlFqZWRPQzByc0czcE9IMWg3XzNqaDBMMWpGZVFMczVwYnRKSE1SLW5iT0swNTJKWVlrQUhyVzlxVERIem9GcGY5MVZ6bVh3Yk1TRnZQc1hRTE16MjJJcVBmMU1yRUVtaG5rQXNITjMzUENFYmtEZmM4YmtmTGtGcVBRcjdPdnlEUVZnejk3N2JYanlQRUtzUjBNTFd1N01nNlJHT2hBUVZqZ1BqQ0tJc2xmd1FoaXZCakMteElfN05kRmRtMlBnQi1PVzJCMDlsRk5vM3h4MVBDV2dCalBrRnozeFNHX3JZdlFhUkpwU2lROElFRmt0RTJONXJKSE9nXzA2M2pTbWQ0V01NZmdVMm9JdWJKSm44bEJQY3BDb2Q3Q0ctb3dBVVZwM2t4T2NNcDFLUy1yMW43LXBGeEx2TUpxWmhLMnlWZmFYUzlxQzZBT09jQ2g5U3pCUkxvX0lsbjdEM3JMZ3A2Zl92MS1wQnBlOWc0VVNXcWZVYTNzQkdJT1dyeHhQWHpvVUNZSTMwS05jeUxleTNGXzJ4dUVKdE1qUWdjU2dTSFM3X2x6UUdUSjM4amdzZzl2NVJ6ZzVwRDc1eGRrZzYwUEpvSHNwZFhDbHkxb25nYVl3by1JdHBMWWFHUmZMMVRhNGswcE16TVgwd2ZRUG1wYXN6UVo0YWZqVE5hTURzMUVOcXp3SURDTmJrYWd1cUs2ZnZJT0ZXTkhpMk01ZUZ2eEtRX3A0Q241UlNyQi1KdTllU012b0pWTF90QVVMTFdvTkRmclBGV0QyR1BMbEIySE5hVTYzV3RLdUpWaHMxQ3Vub2RrcWhUVmpEaGF1dU1IamllQ3NIVUZBTUdYNDZobkVUX2Jsd1lxVjZWWGxUcGhvY3lwNldkMzdHTlczZkkwOEw4WE9TMkJJbEduTEROUmFSejhtNHQxOUtQQnVBd3JfY3N5SVFsYzlGN2w1SWN5UFhxXzA1M0lqOHpIRjhrZTZKc3VpN29aUTNra1h5MV9UdUFSYnQtZFQ0b1NaUTZKQWQ3Vl9aWHpMdVZIaHNIdVc1Z3pxc0lzTmZJRjVCUzBFd3p0eTNMbjJ5SUdfVW9rTkFiQ04wMVRfYjhINFIySlJxVXNFRjJSeXNERjhjVm5QUkl4SS1GY2lsZEV2Ulp5ZDVGLWxmTlljUkRpengtVEtYcmNKODQzOUptYUxBMTZ6MUQzVzN3eC1RMVByU3NnTXFJaXpZZFUtNXJiZUpCaEYwbXlldlY2WTI1WTVVMkpPWTduRVRadFVCaUs3S1BPbWhaLTRIZkNDYnF1YUlDQnUzLWhVbzNZTVRHNnRWM0hQNHdXMFFaTWNKQ2Q1dkRwSUZOX28xdlZWOHNVdENGaGtLNm9nUlRQT0F6QjlWbWxMWUJMSEo4MWFVZ25BMmpjb1F6d0M2SkNtR2I0VHE0eGtoMjFGV211SlQ2VjNodTVjQmRIc0pYRldZOHVWS0UzM2RPX1lPUkIwSlNSOFV1ZjdqbGl5U0ZoVnZrdnNDT3N0Y1dsaThkV2RxN3lMTlNja3UtY2tQenprRGUwbXBqWEJuWUlsdmFVcWJnU3I0MUF5eGtMRjN1NmlIa0llaHlTNkJwVlM4YUtDOVZSUHFhcnV4SXhQSmdoa2t2ZHAzd1ZlTk1iQ0xLV3lJTnoyWWdTNnpXYTgzanNVbkFqQUdPY2FkSWhpUllkY0NyNEhRVWZnOGp2cm8yOGt3aWhaYXdGVE1zVmdPM2dLSDVibm5nOXFiX19CbGNoYVVyeHdKZVJBVWFFdG1QUlNZamJzXzk1bWJsX3pqLUpDb1E3bWdidEFpVjJkOUdkeU1lVlJXT2lXeHNTVkJSeTlFemx0MEplanFFV2d2Zk94aEFhdG9EdmNxZUdYNXY5cDBGd2tMa1J2dVVGeUVmRzlvMUd4Z0pldUxnQTUxMVY5NlFxWHZSUEN6QVJTbEo0a085UklJT21pN1Q4SlZNYzliRmhFMW1oQ1ZnblprY20zRUxOaTBzZGhOOWJvN0xGaVk0NzNWM2E4S1JsYUNOVmxCM3Q5NFdjMVIzUnpDUUMzT0hyajltaU9lRTNoUjFRTUJzTzJMYXBqYzhfalg1LThoTEFDRlNETWV0QWpPMEw4V1J1VDFYRzJveG1pbHdpem9LTXc0eVVwZ1hFSzN3V1ZnM0xHaFlTVUVPMU1fcm83WE1VSGVQNWtuLXM0NGFHbU1kVEpIUWlVRWV3OG9rdWlXNUh5WEJkRDNmWllsXzR0dktZU2lGV0l1RnJuTGxjZVF0UVJtRWQwdHVlV3Fkbm56Zk5LMnpPdUhHb09fTU93bzhNUTMyR2JVb2V2Z282ZDYxRndUdXlYMmxWN1poWUQzQnRlUTRYOWxHN2N4eXIxQ1E3ZzIwTzNEVVRlajVLc1lJem5yTUZTOGpfT2NkOWthcWdFWGJWOE5JYVhfYXhRcjBkb3o5TlJGdkgwMm1hRENqd3Fwa1lBUWFXU3NTYnlMOFRYOFgxemwtZjJFdDlHUGlOek54LXRjZ0dLbkFacFFOb2JwaDhYQUxmNzd1T0gzRlFjUDNvUFA5STZpN1lLbmZ2endxWEdReTJKU2laaEM0eFFqdWk3TTFVSG52QXl5alpHaUpHckdhaDJxNTFJa3RhMXA0SWlQeW1wcFlXSHhGNjNvcjN0eTY0YnJhY3J4TkRINVVSbXVTSzY2WE8wNVF5bjJDa3dJa2toNlhBWTM5aVNnczlkR01Ub0VQZld4RUlycjJwMVdkdnlXRlNiZzhBNFBNSWpXdzJZQXBKcWtkYTk3akZwYzZTS292ZTQ5UTJmOUlfRnJDbXpYMjI0TlVtWDUtUkU0emxjYmpRdGVNQ2dWa29BZ1VoY1ByR1cyOXVHTmFpV2V1VG9PQkRBMjJJQ2dINlJ3NlVUQ0tsQ3pTLWdGMW1LcUlKeThqdkFiVU9DMTloelpzUFhmaGN3VTRySWstcmwwYXk2REd0djFGVmx6T0Iwcy1vVzdHeFBMV0laNS0ydWl4cjMzSDFlcVFDaFFLYWUtWmZ2clRselJzVEhRYTZxdU4zX0ZRaGFSN3p6Y1ZhY3Zia3hqTnhTVkdZelMwV2ZRcmdFNndaLWhKa3JIZVg4MHRmT3ZxeTlycWc3aDlCc3NwT2x5ZmpCbF9UR0haWllQOWpKX202X2w0amY4cjBieDJoTUdlMlFWM2c2NUVoVmpCZXI4T01GcjhpZkxfVWpMVnJBdzJPXzRrVnlIUnJTSnBrVlREUzVNUmtOMUIxSzhYT1FXb0pxUXNwNXAwRU5PdHVGMFpZT2J6aU9ZMExCcnlKUDZETGI0TmxwR1N0bDZKVkV5bjd0TE5lR3hWMDZad2tqN1kxRmFyTk5RckRyNUZ3TFJPTFlydzlIaHNPYXNyZ2RkUTNfSGNEM3Jad1FOOHU4S0N4enJ3TVp6MTUtc2psTm0zRTdGdmVnaUx2OWlJc2hMOHNxTEFoMEtFY2UtcEw2UlV6dzlmYklYSndvSFlLeFZBUmxiaFFCdGhCQUlCZDJMTmlPYkx1UldzNVByb1RhNnUxU3ZSeDhtZGUwZ0JzdXpFWVJ0RnBsS3JrdnR4Ukd4c25PVXVlZVQ2ZnRoS1liQW1TWHNfVVdXeGVpeGxoTFgwX1hCV2d5cnZVMnhrWW9GeklPN1NqSkx1bWhlN3pjOVpzWmlLSFdNSEpVVUtuLTl5WnI5OGg4QmdyQnYyamtEN3pBUHZDQnVTQkcteEtYOTRNM014NUc3T0pRMnQxUnVvWlRHZEVEVG5zQVlROVV5VXRNZEFQMVJwOXBQQ3VQSDJwUVR6Y0Y1aWIwZmlMOFRwSGE4QnEweWRnYjY5UEx3cjZYX1FyYmkxZldkanc5dy15WHN4ekpIQWRaREJJQVZiODVIZkJuVDdMS2JNYkVrYnRJQzgyZEhGem16NVh3cHJkdUxtbnBzUG1QWlBGOXZSU3F2emR4ZHNfVFROUl9ZMWVKemVMSko2elBvTkRTZXlFVFpvSzhzM1Q3N2JoLS1NUXF0SDNBckRlN3lMZXZlZnoxcjkwTGk5VWx6QW04QndaVE4zbUU3UGNXc1JHMURSR0JlNEhxOEpEd0pyTzcyeEFUYll6RFZYS2doWnBrZWZvR05HYWhzUnJDekVjSGtVVjlsRzFqQlZHU3lFZDdXVU1LRFltelBtV0NoSHZlZ2MySWdtb2dmNjJlUUtMQnhMYXdPblMySll6R0l6QTZLUzY1bE53WmtoaWR1M3hMMHJVdkxpY2x5UGk4N3pCRzRVTWMtUzZTamRiTVgyalJCUlIxNXVsSWFYWkpDVEdxLWNqWll3OVEuLg==', 1372430287, 1372431067, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_stats_daily`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_stats_monthly`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_stats_user_daily`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_stats_user_monthly`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_stats_user_weekly`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_stats_weekly`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Volcar la base de datos para la tabla `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_survey_analysis`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `answer2` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_survey_answers`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `shorttext` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `multi` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Volcar la base de datos para la tabla `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `rawname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `tagtype` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_tag`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_tag_correlation`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_tag_instance`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_temp_enroled_template`
--

CREATE TABLE IF NOT EXISTS `mdl_temp_enroled_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tempenrotemp_use_ix` (`userid`),
  KEY `mdl_tempenrotemp_cou_ix` (`courseid`),
  KEY `mdl_tempenrotemp_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary storage for course enrolments' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_temp_enroled_template`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_temp_log_template`
--

CREATE TABLE IF NOT EXISTS `mdl_temp_log_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_templogtemp_act_ix` (`action`),
  KEY `mdl_templogtemp_cou_ix` (`course`),
  KEY `mdl_templogtemp_use_ix` (`userid`),
  KEY `mdl_templogtemp_usecouact_ix` (`userid`,`course`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Temporary storage for daily logs' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_temp_log_template`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_timezone`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `original` longtext COLLATE utf8_unicode_ci NOT NULL,
  `master` longtext COLLATE utf8_unicode_ci,
  `local` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_tool_customlang`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `version` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_tool_customlang_components`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `targetversion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `info` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `details` longtext COLLATE utf8_unicode_ci,
  `backtrace` longtext COLLATE utf8_unicode_ci,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Upgrade logging' AUTO_INCREMENT=881 ;

--
-- Volcar la base de datos para la tabla `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2013051400', '2013051400', 'Upgrade savepoint reached', NULL, '', 0, 1372258364),
(2, 0, 'core', '2013051400', '2013051400', 'Core installed', NULL, '', 0, 1372258403),
(3, 0, 'qtype_calculated', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258403),
(4, 0, 'qtype_calculated', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258404),
(5, 0, 'qtype_calculated', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258404),
(6, 0, 'qtype_calculatedmulti', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258404),
(7, 0, 'qtype_calculatedmulti', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258404),
(8, 0, 'qtype_calculatedmulti', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258405),
(9, 0, 'qtype_calculatedsimple', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258405),
(10, 0, 'qtype_calculatedsimple', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258405),
(11, 0, 'qtype_calculatedsimple', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258405),
(12, 0, 'qtype_description', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258405),
(13, 0, 'qtype_description', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258405),
(14, 0, 'qtype_description', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258405),
(15, 0, 'qtype_essay', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258405),
(16, 0, 'qtype_essay', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258405),
(17, 0, 'qtype_essay', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258406),
(18, 0, 'qtype_match', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258406),
(19, 0, 'qtype_match', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258406),
(20, 0, 'qtype_match', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258407),
(21, 0, 'qtype_missingtype', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258407),
(22, 0, 'qtype_missingtype', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258407),
(23, 0, 'qtype_missingtype', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258407),
(24, 0, 'qtype_multianswer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258407),
(25, 0, 'qtype_multianswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258407),
(26, 0, 'qtype_multianswer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258408),
(27, 0, 'qtype_multichoice', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258408),
(28, 0, 'qtype_multichoice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258408),
(29, 0, 'qtype_multichoice', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258408),
(30, 0, 'qtype_numerical', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258408),
(31, 0, 'qtype_numerical', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258408),
(32, 0, 'qtype_numerical', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258409),
(33, 0, 'qtype_random', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258409),
(34, 0, 'qtype_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258409),
(35, 0, 'qtype_random', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258409),
(36, 0, 'qtype_randomsamatch', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258409),
(37, 0, 'qtype_randomsamatch', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258409),
(38, 0, 'qtype_randomsamatch', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258409),
(39, 0, 'qtype_shortanswer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258409),
(40, 0, 'qtype_shortanswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258409),
(41, 0, 'qtype_shortanswer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258409),
(42, 0, 'qtype_truefalse', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258410),
(43, 0, 'qtype_truefalse', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258410),
(44, 0, 'qtype_truefalse', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258410),
(45, 0, 'mod_assign', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258410),
(46, 0, 'mod_assign', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258411),
(47, 0, 'mod_assignment', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258411),
(48, 0, 'mod_assignment', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258412),
(49, 0, 'mod_book', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258412),
(50, 0, 'mod_book', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258412),
(51, 0, 'mod_chat', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258412),
(52, 0, 'mod_chat', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258413),
(53, 0, 'mod_choice', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258413),
(54, 0, 'mod_choice', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258414),
(55, 0, 'mod_data', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258414),
(56, 0, 'mod_data', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258415),
(57, 0, 'mod_feedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258415),
(58, 0, 'mod_feedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258417),
(59, 0, 'mod_folder', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258417),
(60, 0, 'mod_folder', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258418),
(61, 0, 'mod_forum', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258418),
(62, 0, 'mod_forum', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258421),
(63, 0, 'mod_glossary', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258421),
(64, 0, 'mod_glossary', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258424),
(65, 0, 'mod_imscp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258424),
(66, 0, 'mod_imscp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258425),
(67, 0, 'mod_label', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258425),
(68, 0, 'mod_label', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258426),
(69, 0, 'mod_lesson', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258426),
(70, 0, 'mod_lesson', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258427),
(71, 0, 'mod_lti', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258427),
(72, 0, 'mod_lti', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258428),
(73, 0, 'mod_page', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258429),
(74, 0, 'mod_page', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258429),
(75, 0, 'mod_quiz', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258429),
(76, 0, 'mod_quiz', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258430),
(77, 0, 'mod_resource', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258431),
(78, 0, 'mod_resource', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258431),
(79, 0, 'mod_scorm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258431),
(80, 0, 'mod_scorm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258433),
(81, 0, 'mod_survey', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258433),
(82, 0, 'mod_survey', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258435),
(83, 0, 'mod_url', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258435),
(84, 0, 'mod_url', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258435),
(85, 0, 'mod_wiki', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258435),
(86, 0, 'mod_wiki', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258437),
(87, 0, 'mod_workshop', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258437),
(88, 0, 'mod_workshop', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258440),
(89, 0, 'auth_cas', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258440),
(90, 0, 'auth_cas', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258440),
(91, 0, 'auth_cas', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258440),
(92, 0, 'auth_db', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258440),
(93, 0, 'auth_db', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258440),
(94, 0, 'auth_db', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258441),
(95, 0, 'auth_email', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258441),
(96, 0, 'auth_email', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258441),
(97, 0, 'auth_email', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258441),
(98, 0, 'auth_fc', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258441),
(99, 0, 'auth_fc', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258441),
(100, 0, 'auth_fc', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258442),
(101, 0, 'auth_imap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258442),
(102, 0, 'auth_imap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258442),
(103, 0, 'auth_imap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258442),
(104, 0, 'auth_ldap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258442),
(105, 0, 'auth_ldap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258442),
(106, 0, 'auth_ldap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258443),
(107, 0, 'auth_manual', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258443),
(108, 0, 'auth_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258443),
(109, 0, 'auth_manual', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258443),
(110, 0, 'auth_mnet', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258444),
(111, 0, 'auth_mnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258444),
(112, 0, 'auth_mnet', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258445),
(113, 0, 'auth_nntp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258445),
(114, 0, 'auth_nntp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258445),
(115, 0, 'auth_nntp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258445),
(116, 0, 'auth_nologin', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258445),
(117, 0, 'auth_nologin', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258445),
(118, 0, 'auth_nologin', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258446),
(119, 0, 'auth_none', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258446),
(120, 0, 'auth_none', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258446),
(121, 0, 'auth_none', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258447),
(122, 0, 'auth_pam', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258448),
(123, 0, 'auth_pam', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258449),
(124, 0, 'auth_pam', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258450),
(125, 0, 'auth_pop3', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258450),
(126, 0, 'auth_pop3', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258450),
(127, 0, 'auth_pop3', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258451),
(128, 0, 'auth_radius', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258452),
(129, 0, 'auth_radius', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258452),
(130, 0, 'auth_radius', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258453),
(131, 0, 'auth_shibboleth', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258453),
(132, 0, 'auth_shibboleth', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258453),
(133, 0, 'auth_shibboleth', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258454),
(134, 0, 'auth_webservice', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258454),
(135, 0, 'auth_webservice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258454),
(136, 0, 'auth_webservice', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258455),
(137, 0, 'enrol_authorize', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258455),
(138, 0, 'enrol_authorize', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258456),
(139, 0, 'enrol_authorize', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258456),
(140, 0, 'enrol_category', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258457),
(141, 0, 'enrol_category', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258457),
(142, 0, 'enrol_category', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258457),
(143, 0, 'enrol_cohort', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258457),
(144, 0, 'enrol_cohort', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258457),
(145, 0, 'enrol_cohort', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258458),
(146, 0, 'enrol_database', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258458),
(147, 0, 'enrol_database', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258458),
(148, 0, 'enrol_database', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258459),
(149, 0, 'enrol_flatfile', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258459),
(150, 0, 'enrol_flatfile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258459),
(151, 0, 'enrol_flatfile', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258460),
(152, 0, 'enrol_guest', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258460),
(153, 0, 'enrol_guest', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258460),
(154, 0, 'enrol_guest', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258460),
(155, 0, 'enrol_imsenterprise', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258460),
(156, 0, 'enrol_imsenterprise', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258460),
(157, 0, 'enrol_imsenterprise', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258461),
(158, 0, 'enrol_ldap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258461),
(159, 0, 'enrol_ldap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258461),
(160, 0, 'enrol_ldap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258461),
(161, 0, 'enrol_manual', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258461),
(162, 0, 'enrol_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258461),
(163, 0, 'enrol_manual', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258462),
(164, 0, 'enrol_meta', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258462),
(165, 0, 'enrol_meta', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258462),
(166, 0, 'enrol_meta', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258463),
(167, 0, 'enrol_mnet', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258463),
(168, 0, 'enrol_mnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258463),
(169, 0, 'enrol_mnet', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258464),
(170, 0, 'enrol_paypal', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258464),
(171, 0, 'enrol_paypal', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258464),
(172, 0, 'enrol_paypal', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258464),
(173, 0, 'enrol_self', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258465),
(174, 0, 'enrol_self', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258465),
(175, 0, 'enrol_self', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258465),
(176, 0, 'message_email', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258465),
(177, 0, 'message_email', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258465),
(178, 0, 'message_email', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258467),
(179, 0, 'message_jabber', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258467),
(180, 0, 'message_jabber', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258467),
(181, 0, 'message_jabber', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258469),
(182, 0, 'message_popup', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258469),
(183, 0, 'message_popup', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258469),
(184, 0, 'message_popup', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258470),
(185, 0, 'block_activity_modules', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258470),
(186, 0, 'block_activity_modules', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258470),
(187, 0, 'block_admin_bookmarks', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258471),
(188, 0, 'block_admin_bookmarks', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258471),
(189, 0, 'block_badges', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258471),
(190, 0, 'block_badges', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258472),
(191, 0, 'block_blog_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258472),
(192, 0, 'block_blog_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258472),
(193, 0, 'block_blog_recent', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258473),
(194, 0, 'block_blog_recent', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258473),
(195, 0, 'block_blog_tags', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258473),
(196, 0, 'block_blog_tags', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258474),
(197, 0, 'block_calendar_month', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258474),
(198, 0, 'block_calendar_month', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258474),
(199, 0, 'block_calendar_upcoming', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258475),
(200, 0, 'block_calendar_upcoming', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258475),
(201, 0, 'block_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258475),
(202, 0, 'block_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258475),
(203, 0, 'block_community', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258475),
(204, 0, 'block_community', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258476),
(205, 0, 'block_completionstatus', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258476),
(206, 0, 'block_completionstatus', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258476),
(207, 0, 'block_course_list', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258476),
(208, 0, 'block_course_list', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258477),
(209, 0, 'block_course_overview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258477),
(210, 0, 'block_course_overview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258477),
(211, 0, 'block_course_summary', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258477),
(212, 0, 'block_course_summary', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258478),
(213, 0, 'block_feedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258478),
(214, 0, 'block_feedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258478),
(215, 0, 'block_glossary_random', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258478),
(216, 0, 'block_glossary_random', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258479),
(217, 0, 'block_html', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258479),
(218, 0, 'block_html', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258480),
(219, 0, 'block_login', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258480),
(220, 0, 'block_login', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258480),
(221, 0, 'block_mentees', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258480),
(222, 0, 'block_mentees', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258481),
(223, 0, 'block_messages', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258481),
(224, 0, 'block_messages', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258481),
(225, 0, 'block_mnet_hosts', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258481),
(226, 0, 'block_mnet_hosts', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258482),
(227, 0, 'block_myprofile', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258482),
(228, 0, 'block_myprofile', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258482),
(229, 0, 'block_navigation', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258482),
(230, 0, 'block_navigation', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258484),
(231, 0, 'block_news_items', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258484),
(232, 0, 'block_news_items', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258485),
(233, 0, 'block_online_users', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258485),
(234, 0, 'block_online_users', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258486),
(235, 0, 'block_participants', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258486),
(236, 0, 'block_participants', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258486),
(237, 0, 'block_private_files', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258486),
(238, 0, 'block_private_files', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258487),
(239, 0, 'block_quiz_results', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258487),
(240, 0, 'block_quiz_results', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258487),
(241, 0, 'block_recent_activity', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258487),
(242, 0, 'block_recent_activity', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258487),
(243, 0, 'block_rss_client', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258488),
(244, 0, 'block_rss_client', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258488),
(245, 0, 'block_search_forums', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258488),
(246, 0, 'block_search_forums', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258488),
(247, 0, 'block_section_links', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258488),
(248, 0, 'block_section_links', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258488),
(249, 0, 'block_selfcompletion', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258488),
(250, 0, 'block_selfcompletion', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258489),
(251, 0, 'block_settings', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258489),
(252, 0, 'block_settings', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258489),
(253, 0, 'block_site_main_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258489),
(254, 0, 'block_site_main_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258489),
(255, 0, 'block_social_activities', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258489),
(256, 0, 'block_social_activities', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258489),
(257, 0, 'block_tag_flickr', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258489),
(258, 0, 'block_tag_flickr', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258489),
(259, 0, 'block_tag_youtube', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258489),
(260, 0, 'block_tag_youtube', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258490),
(261, 0, 'block_tags', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258490),
(262, 0, 'block_tags', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258490),
(263, 0, 'filter_activitynames', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258491),
(264, 0, 'filter_activitynames', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258491),
(265, 0, 'filter_activitynames', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258491),
(266, 0, 'filter_algebra', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258491),
(267, 0, 'filter_algebra', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258491),
(268, 0, 'filter_algebra', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258492),
(269, 0, 'filter_censor', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258492),
(270, 0, 'filter_censor', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258492),
(271, 0, 'filter_censor', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258492),
(272, 0, 'filter_data', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258492),
(273, 0, 'filter_data', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258492),
(274, 0, 'filter_data', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258492),
(275, 0, 'filter_emailprotect', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258492),
(276, 0, 'filter_emailprotect', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258492),
(277, 0, 'filter_emailprotect', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258493),
(278, 0, 'filter_emoticon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258493),
(279, 0, 'filter_emoticon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258493),
(280, 0, 'filter_emoticon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258493),
(281, 0, 'filter_glossary', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258493),
(282, 0, 'filter_glossary', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258493),
(283, 0, 'filter_glossary', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258493),
(284, 0, 'filter_mediaplugin', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258494),
(285, 0, 'filter_mediaplugin', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258494),
(286, 0, 'filter_mediaplugin', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258495),
(287, 0, 'filter_multilang', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258496),
(288, 0, 'filter_multilang', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258499),
(289, 0, 'filter_multilang', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258502),
(290, 0, 'filter_tex', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258503),
(291, 0, 'filter_tex', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258503),
(292, 0, 'filter_tex', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258504),
(293, 0, 'filter_tidy', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258504),
(294, 0, 'filter_tidy', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258504),
(295, 0, 'filter_tidy', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258505),
(296, 0, 'filter_urltolink', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258505),
(297, 0, 'filter_urltolink', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258505),
(298, 0, 'filter_urltolink', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258506),
(299, 0, 'editor_textarea', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258506),
(300, 0, 'editor_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258506),
(301, 0, 'editor_textarea', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258507),
(302, 0, 'editor_tinymce', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258507),
(303, 0, 'editor_tinymce', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258507),
(304, 0, 'editor_tinymce', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258508),
(305, 0, 'format_scorm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258508),
(306, 0, 'format_scorm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258508),
(307, 0, 'format_scorm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258509),
(308, 0, 'format_social', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258509),
(309, 0, 'format_social', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258509),
(310, 0, 'format_social', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258510),
(311, 0, 'format_topics', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258510),
(312, 0, 'format_topics', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258510),
(313, 0, 'format_topics', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258510),
(314, 0, 'format_weeks', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258511),
(315, 0, 'format_weeks', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258511),
(316, 0, 'format_weeks', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258511),
(317, 0, 'profilefield_checkbox', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258511),
(318, 0, 'profilefield_checkbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258511),
(319, 0, 'profilefield_checkbox', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258511),
(320, 0, 'profilefield_datetime', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258512),
(321, 0, 'profilefield_datetime', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258512),
(322, 0, 'profilefield_datetime', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258512),
(323, 0, 'profilefield_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258512),
(324, 0, 'profilefield_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258512),
(325, 0, 'profilefield_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258512),
(326, 0, 'profilefield_text', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258512),
(327, 0, 'profilefield_text', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258512),
(328, 0, 'profilefield_text', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258513),
(329, 0, 'profilefield_textarea', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258513),
(330, 0, 'profilefield_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258514),
(331, 0, 'profilefield_textarea', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258514),
(332, 0, 'report_backups', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258514),
(333, 0, 'report_backups', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258514),
(334, 0, 'report_backups', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258514),
(335, 0, 'report_completion', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258514),
(336, 0, 'report_completion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258514),
(337, 0, 'report_completion', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258515),
(338, 0, 'report_configlog', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258515),
(339, 0, 'report_configlog', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258515),
(340, 0, 'report_configlog', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258515),
(341, 0, 'report_courseoverview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258515),
(342, 0, 'report_courseoverview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258515),
(343, 0, 'report_courseoverview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258516),
(344, 0, 'report_log', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258516),
(345, 0, 'report_log', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258516),
(346, 0, 'report_log', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258516),
(347, 0, 'report_loglive', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258517),
(348, 0, 'report_loglive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258517),
(349, 0, 'report_loglive', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258517),
(350, 0, 'report_outline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258517),
(351, 0, 'report_outline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258517),
(352, 0, 'report_outline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258517),
(353, 0, 'report_participation', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258517),
(354, 0, 'report_participation', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258517),
(355, 0, 'report_participation', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258518),
(356, 0, 'report_performance', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258518),
(357, 0, 'report_performance', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258518),
(358, 0, 'report_performance', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258518),
(359, 0, 'report_progress', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258519),
(360, 0, 'report_progress', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258519),
(361, 0, 'report_progress', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258519),
(362, 0, 'report_questioninstances', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258519),
(363, 0, 'report_questioninstances', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258519),
(364, 0, 'report_questioninstances', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258520),
(365, 0, 'report_security', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258520),
(366, 0, 'report_security', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258520),
(367, 0, 'report_security', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258520),
(368, 0, 'report_stats', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258520),
(369, 0, 'report_stats', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258521),
(370, 0, 'report_stats', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258521),
(371, 0, 'gradeexport_ods', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258521),
(372, 0, 'gradeexport_ods', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258521),
(373, 0, 'gradeexport_ods', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258522),
(374, 0, 'gradeexport_txt', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258522),
(375, 0, 'gradeexport_txt', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258522),
(376, 0, 'gradeexport_txt', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258522),
(377, 0, 'gradeexport_xls', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258522),
(378, 0, 'gradeexport_xls', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258522),
(379, 0, 'gradeexport_xls', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258523),
(380, 0, 'gradeexport_xml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258523),
(381, 0, 'gradeexport_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258523),
(382, 0, 'gradeexport_xml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258523),
(383, 0, 'gradeimport_csv', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258523),
(384, 0, 'gradeimport_csv', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258523),
(385, 0, 'gradeimport_csv', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258524),
(386, 0, 'gradeimport_xml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258524),
(387, 0, 'gradeimport_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258524),
(388, 0, 'gradeimport_xml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258525),
(389, 0, 'gradereport_grader', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258525),
(390, 0, 'gradereport_grader', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258525),
(391, 0, 'gradereport_grader', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258526),
(392, 0, 'gradereport_outcomes', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258526),
(393, 0, 'gradereport_outcomes', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258526),
(394, 0, 'gradereport_outcomes', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258527),
(395, 0, 'gradereport_overview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258527),
(396, 0, 'gradereport_overview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258527),
(397, 0, 'gradereport_overview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258528),
(398, 0, 'gradereport_user', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258528),
(399, 0, 'gradereport_user', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258528),
(400, 0, 'gradereport_user', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258528),
(401, 0, 'gradingform_guide', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258529),
(402, 0, 'gradingform_guide', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258529),
(403, 0, 'gradingform_guide', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258529),
(404, 0, 'gradingform_rubric', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258530),
(405, 0, 'gradingform_rubric', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258530),
(406, 0, 'gradingform_rubric', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258531),
(407, 0, 'mnetservice_enrol', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258531),
(408, 0, 'mnetservice_enrol', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258531),
(409, 0, 'mnetservice_enrol', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258531),
(410, 0, 'webservice_amf', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258531),
(411, 0, 'webservice_amf', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258531),
(412, 0, 'webservice_amf', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258532),
(413, 0, 'webservice_rest', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258532),
(414, 0, 'webservice_rest', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258532),
(415, 0, 'webservice_rest', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258532),
(416, 0, 'webservice_soap', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258533),
(417, 0, 'webservice_soap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258533),
(418, 0, 'webservice_soap', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258533),
(419, 0, 'webservice_xmlrpc', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258533),
(420, 0, 'webservice_xmlrpc', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258533),
(421, 0, 'webservice_xmlrpc', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258534),
(422, 0, 'repository_alfresco', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258534),
(423, 0, 'repository_alfresco', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258534),
(424, 0, 'repository_alfresco', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258535),
(425, 0, 'repository_boxnet', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258535),
(426, 0, 'repository_boxnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258535),
(427, 0, 'repository_boxnet', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258535),
(428, 0, 'repository_coursefiles', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258536),
(429, 0, 'repository_coursefiles', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258536),
(430, 0, 'repository_coursefiles', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258536),
(431, 0, 'repository_dropbox', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258536),
(432, 0, 'repository_dropbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258536),
(433, 0, 'repository_dropbox', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258536),
(434, 0, 'repository_equella', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258537),
(435, 0, 'repository_equella', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258537),
(436, 0, 'repository_equella', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258537),
(437, 0, 'repository_filesystem', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258537),
(438, 0, 'repository_filesystem', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258537),
(439, 0, 'repository_filesystem', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258537),
(440, 0, 'repository_flickr', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258537),
(441, 0, 'repository_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258537),
(442, 0, 'repository_flickr', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258538),
(443, 0, 'repository_flickr_public', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258538),
(444, 0, 'repository_flickr_public', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258538),
(445, 0, 'repository_flickr_public', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258538),
(446, 0, 'repository_googledocs', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258538),
(447, 0, 'repository_googledocs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258538),
(448, 0, 'repository_googledocs', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258538),
(449, 0, 'repository_local', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258538),
(450, 0, 'repository_local', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258538),
(451, 0, 'repository_local', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258539),
(452, 0, 'repository_merlot', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258539),
(453, 0, 'repository_merlot', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258539),
(454, 0, 'repository_merlot', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258540),
(455, 0, 'repository_picasa', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258540),
(456, 0, 'repository_picasa', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258541),
(457, 0, 'repository_picasa', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258541),
(458, 0, 'repository_recent', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258542),
(459, 0, 'repository_recent', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258542),
(460, 0, 'repository_recent', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258544),
(461, 0, 'repository_s3', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258545),
(462, 0, 'repository_s3', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258545),
(463, 0, 'repository_s3', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258545),
(464, 0, 'repository_upload', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258545),
(465, 0, 'repository_upload', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258545),
(466, 0, 'repository_upload', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258546),
(467, 0, 'repository_url', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258546),
(468, 0, 'repository_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258546),
(469, 0, 'repository_url', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258546),
(470, 0, 'repository_user', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258546),
(471, 0, 'repository_user', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258546),
(472, 0, 'repository_user', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258547),
(473, 0, 'repository_webdav', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258547),
(474, 0, 'repository_webdav', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258547),
(475, 0, 'repository_webdav', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258547),
(476, 0, 'repository_wikimedia', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258547),
(477, 0, 'repository_wikimedia', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258547),
(478, 0, 'repository_wikimedia', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258548),
(479, 0, 'repository_youtube', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258548),
(480, 0, 'repository_youtube', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258548),
(481, 0, 'repository_youtube', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258548),
(482, 0, 'portfolio_boxnet', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258548);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(483, 0, 'portfolio_boxnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258549),
(484, 0, 'portfolio_boxnet', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258549),
(485, 0, 'portfolio_download', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258549),
(486, 0, 'portfolio_download', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258549),
(487, 0, 'portfolio_download', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258549),
(488, 0, 'portfolio_flickr', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258549),
(489, 0, 'portfolio_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258549),
(490, 0, 'portfolio_flickr', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258550),
(491, 0, 'portfolio_googledocs', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258550),
(492, 0, 'portfolio_googledocs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258550),
(493, 0, 'portfolio_googledocs', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258550),
(494, 0, 'portfolio_mahara', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258550),
(495, 0, 'portfolio_mahara', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258550),
(496, 0, 'portfolio_mahara', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258551),
(497, 0, 'portfolio_picasa', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258551),
(498, 0, 'portfolio_picasa', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258552),
(499, 0, 'portfolio_picasa', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258552),
(500, 0, 'qbehaviour_adaptive', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258552),
(501, 0, 'qbehaviour_adaptive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258552),
(502, 0, 'qbehaviour_adaptive', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258553),
(503, 0, 'qbehaviour_adaptivenopenalty', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258553),
(504, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258553),
(505, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258553),
(506, 0, 'qbehaviour_deferredcbm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258553),
(507, 0, 'qbehaviour_deferredcbm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258553),
(508, 0, 'qbehaviour_deferredcbm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258553),
(509, 0, 'qbehaviour_deferredfeedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258553),
(510, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258553),
(511, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258554),
(512, 0, 'qbehaviour_immediatecbm', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258554),
(513, 0, 'qbehaviour_immediatecbm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258554),
(514, 0, 'qbehaviour_immediatecbm', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258554),
(515, 0, 'qbehaviour_immediatefeedback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258554),
(516, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258554),
(517, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258555),
(518, 0, 'qbehaviour_informationitem', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258555),
(519, 0, 'qbehaviour_informationitem', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258555),
(520, 0, 'qbehaviour_informationitem', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258555),
(521, 0, 'qbehaviour_interactive', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258555),
(522, 0, 'qbehaviour_interactive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258555),
(523, 0, 'qbehaviour_interactive', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258556),
(524, 0, 'qbehaviour_interactivecountback', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258556),
(525, 0, 'qbehaviour_interactivecountback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258556),
(526, 0, 'qbehaviour_interactivecountback', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258556),
(527, 0, 'qbehaviour_manualgraded', NULL, '2013050800', 'Starting plugin installation', NULL, '', 0, 1372258556),
(528, 0, 'qbehaviour_manualgraded', '2013050800', '2013050800', 'Upgrade savepoint reached', NULL, '', 0, 1372258556),
(529, 0, 'qbehaviour_manualgraded', '2013050800', '2013050800', 'Plugin installed', NULL, '', 0, 1372258557),
(530, 0, 'qbehaviour_missing', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258557),
(531, 0, 'qbehaviour_missing', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258557),
(532, 0, 'qbehaviour_missing', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258557),
(533, 0, 'qformat_aiken', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258557),
(534, 0, 'qformat_aiken', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258557),
(535, 0, 'qformat_aiken', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258557),
(536, 0, 'qformat_blackboard_six', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258557),
(537, 0, 'qformat_blackboard_six', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258557),
(538, 0, 'qformat_blackboard_six', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258558),
(539, 0, 'qformat_examview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258558),
(540, 0, 'qformat_examview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258558),
(541, 0, 'qformat_examview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258558),
(542, 0, 'qformat_gift', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258558),
(543, 0, 'qformat_gift', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258558),
(544, 0, 'qformat_gift', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258558),
(545, 0, 'qformat_learnwise', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258558),
(546, 0, 'qformat_learnwise', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258558),
(547, 0, 'qformat_learnwise', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258558),
(548, 0, 'qformat_missingword', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258558),
(549, 0, 'qformat_missingword', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258558),
(550, 0, 'qformat_missingword', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258558),
(551, 0, 'qformat_multianswer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258558),
(552, 0, 'qformat_multianswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258558),
(553, 0, 'qformat_multianswer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(554, 0, 'qformat_webct', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(555, 0, 'qformat_webct', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258559),
(556, 0, 'qformat_webct', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(557, 0, 'qformat_xhtml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(558, 0, 'qformat_xhtml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258559),
(559, 0, 'qformat_xhtml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(560, 0, 'qformat_xml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(561, 0, 'qformat_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258559),
(562, 0, 'qformat_xml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(563, 0, 'tool_assignmentupgrade', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(564, 0, 'tool_assignmentupgrade', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258559),
(565, 0, 'tool_assignmentupgrade', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(566, 0, 'tool_behat', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(567, 0, 'tool_behat', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258559),
(568, 0, 'tool_behat', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(569, 0, 'tool_capability', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(570, 0, 'tool_capability', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258559),
(571, 0, 'tool_capability', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258559),
(572, 0, 'tool_customlang', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258559),
(573, 0, 'tool_customlang', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258560),
(574, 0, 'tool_customlang', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258560),
(575, 0, 'tool_dbtransfer', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258560),
(576, 0, 'tool_dbtransfer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258560),
(577, 0, 'tool_dbtransfer', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258560),
(578, 0, 'tool_generator', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258560),
(579, 0, 'tool_generator', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258560),
(580, 0, 'tool_generator', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258560),
(581, 0, 'tool_health', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258560),
(582, 0, 'tool_health', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258560),
(583, 0, 'tool_health', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258560),
(584, 0, 'tool_innodb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258561),
(585, 0, 'tool_innodb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258561),
(586, 0, 'tool_innodb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258561),
(587, 0, 'tool_installaddon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258561),
(588, 0, 'tool_installaddon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258561),
(589, 0, 'tool_installaddon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258561),
(590, 0, 'tool_langimport', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258561),
(591, 0, 'tool_langimport', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258561),
(592, 0, 'tool_langimport', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258561),
(593, 0, 'tool_multilangupgrade', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258562),
(594, 0, 'tool_multilangupgrade', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258562),
(595, 0, 'tool_multilangupgrade', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258562),
(596, 0, 'tool_phpunit', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258562),
(597, 0, 'tool_phpunit', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258562),
(598, 0, 'tool_phpunit', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258562),
(599, 0, 'tool_profiling', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258562),
(600, 0, 'tool_profiling', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258562),
(601, 0, 'tool_profiling', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258562),
(602, 0, 'tool_qeupgradehelper', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258562),
(603, 0, 'tool_qeupgradehelper', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258562),
(604, 0, 'tool_qeupgradehelper', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258562),
(605, 0, 'tool_replace', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258563),
(606, 0, 'tool_replace', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258563),
(607, 0, 'tool_replace', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258563),
(608, 0, 'tool_spamcleaner', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258563),
(609, 0, 'tool_spamcleaner', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258563),
(610, 0, 'tool_spamcleaner', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258563),
(611, 0, 'tool_timezoneimport', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258563),
(612, 0, 'tool_timezoneimport', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258563),
(613, 0, 'tool_timezoneimport', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258563),
(614, 0, 'tool_unsuproles', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258563),
(615, 0, 'tool_unsuproles', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258563),
(616, 0, 'tool_unsuproles', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258563),
(617, 0, 'tool_uploaduser', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258564),
(618, 0, 'tool_uploaduser', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258564),
(619, 0, 'tool_uploaduser', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258564),
(620, 0, 'tool_xmldb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258564),
(621, 0, 'tool_xmldb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258564),
(622, 0, 'tool_xmldb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258564),
(623, 0, 'cachestore_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258564),
(624, 0, 'cachestore_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258564),
(625, 0, 'cachestore_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258565),
(626, 0, 'cachestore_memcache', NULL, '2013050700', 'Starting plugin installation', NULL, '', 0, 1372258565),
(627, 0, 'cachestore_memcache', '2013050700', '2013050700', 'Upgrade savepoint reached', NULL, '', 0, 1372258565),
(628, 0, 'cachestore_memcache', '2013050700', '2013050700', 'Plugin installed', NULL, '', 0, 1372258565),
(629, 0, 'cachestore_memcached', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258565),
(630, 0, 'cachestore_memcached', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258565),
(631, 0, 'cachestore_memcached', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258565),
(632, 0, 'cachestore_mongodb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258565),
(633, 0, 'cachestore_mongodb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258565),
(634, 0, 'cachestore_mongodb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258566),
(635, 0, 'cachestore_session', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258566),
(636, 0, 'cachestore_session', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258566),
(637, 0, 'cachestore_session', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258566),
(638, 0, 'cachestore_static', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258566),
(639, 0, 'cachestore_static', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258566),
(640, 0, 'cachestore_static', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258566),
(641, 0, 'theme_afterburner', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258566),
(642, 0, 'theme_afterburner', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258566),
(643, 0, 'theme_afterburner', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258567),
(644, 0, 'theme_anomaly', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258567),
(645, 0, 'theme_anomaly', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258567),
(646, 0, 'theme_anomaly', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258567),
(647, 0, 'theme_arialist', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258567),
(648, 0, 'theme_arialist', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258567),
(649, 0, 'theme_arialist', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258567),
(650, 0, 'theme_base', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258567),
(651, 0, 'theme_base', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258567),
(652, 0, 'theme_base', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258568),
(653, 0, 'theme_binarius', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258568),
(654, 0, 'theme_binarius', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258568),
(655, 0, 'theme_binarius', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258568),
(656, 0, 'theme_bootstrapbase', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258568),
(657, 0, 'theme_bootstrapbase', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258568),
(658, 0, 'theme_bootstrapbase', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258568),
(659, 0, 'theme_boxxie', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258568),
(660, 0, 'theme_boxxie', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258568),
(661, 0, 'theme_boxxie', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258568),
(662, 0, 'theme_brick', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258568),
(663, 0, 'theme_brick', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258568),
(664, 0, 'theme_brick', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258569),
(665, 0, 'theme_canvas', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258569),
(666, 0, 'theme_canvas', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258569),
(667, 0, 'theme_canvas', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258569),
(668, 0, 'theme_clean', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258569),
(669, 0, 'theme_clean', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258569),
(670, 0, 'theme_clean', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258569),
(671, 0, 'theme_formal_white', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258570),
(672, 0, 'theme_formal_white', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258570),
(673, 0, 'theme_formal_white', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258570),
(674, 0, 'theme_formfactor', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258570),
(675, 0, 'theme_formfactor', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258570),
(676, 0, 'theme_formfactor', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258570),
(677, 0, 'theme_fusion', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258570),
(678, 0, 'theme_fusion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258570),
(679, 0, 'theme_fusion', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258571),
(680, 0, 'theme_leatherbound', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258571),
(681, 0, 'theme_leatherbound', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258571),
(682, 0, 'theme_leatherbound', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258571),
(683, 0, 'theme_magazine', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258571),
(684, 0, 'theme_magazine', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258571),
(685, 0, 'theme_magazine', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258571),
(686, 0, 'theme_mymobile', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258571),
(687, 0, 'theme_mymobile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258571),
(688, 0, 'theme_mymobile', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258571),
(689, 0, 'theme_nimble', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258571),
(690, 0, 'theme_nimble', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258571),
(691, 0, 'theme_nimble', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258572),
(692, 0, 'theme_nonzero', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258572),
(693, 0, 'theme_nonzero', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258572),
(694, 0, 'theme_nonzero', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258572),
(695, 0, 'theme_overlay', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258572),
(696, 0, 'theme_overlay', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258572),
(697, 0, 'theme_overlay', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258572),
(698, 0, 'theme_serenity', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258572),
(699, 0, 'theme_serenity', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258572),
(700, 0, 'theme_serenity', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258572),
(701, 0, 'theme_sky_high', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258572),
(702, 0, 'theme_sky_high', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258572),
(703, 0, 'theme_sky_high', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258572),
(704, 0, 'theme_splash', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258572),
(705, 0, 'theme_splash', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258572),
(706, 0, 'theme_splash', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258573),
(707, 0, 'theme_standard', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258573),
(708, 0, 'theme_standard', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258573),
(709, 0, 'theme_standard', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258573),
(710, 0, 'theme_standardold', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258573),
(711, 0, 'theme_standardold', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258573),
(712, 0, 'theme_standardold', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258573),
(713, 0, 'assignsubmission_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258573),
(714, 0, 'assignsubmission_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258573),
(715, 0, 'assignsubmission_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258573),
(716, 0, 'assignsubmission_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258573),
(717, 0, 'assignsubmission_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258573),
(718, 0, 'assignsubmission_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258574),
(719, 0, 'assignsubmission_onlinetext', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258574),
(720, 0, 'assignsubmission_onlinetext', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258574),
(721, 0, 'assignsubmission_onlinetext', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258574),
(722, 0, 'assignfeedback_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258575),
(723, 0, 'assignfeedback_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258575),
(724, 0, 'assignfeedback_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258575),
(725, 0, 'assignfeedback_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258575),
(726, 0, 'assignfeedback_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258575),
(727, 0, 'assignfeedback_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258575),
(728, 0, 'assignfeedback_offline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258575),
(729, 0, 'assignfeedback_offline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258575),
(730, 0, 'assignfeedback_offline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258575),
(731, 0, 'assignment_offline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258576),
(732, 0, 'assignment_offline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258576),
(733, 0, 'assignment_offline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258576),
(734, 0, 'assignment_online', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258576),
(735, 0, 'assignment_online', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258576),
(736, 0, 'assignment_online', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258576),
(737, 0, 'assignment_upload', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258576),
(738, 0, 'assignment_upload', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258576),
(739, 0, 'assignment_upload', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258576),
(740, 0, 'assignment_uploadsingle', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258576),
(741, 0, 'assignment_uploadsingle', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258576),
(742, 0, 'assignment_uploadsingle', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258576),
(743, 0, 'booktool_exportimscp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258577),
(744, 0, 'booktool_exportimscp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258577),
(745, 0, 'booktool_exportimscp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258577),
(746, 0, 'booktool_importhtml', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258577),
(747, 0, 'booktool_importhtml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258577),
(748, 0, 'booktool_importhtml', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258577),
(749, 0, 'booktool_print', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258577),
(750, 0, 'booktool_print', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258577),
(751, 0, 'booktool_print', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258577),
(752, 0, 'datafield_checkbox', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258577),
(753, 0, 'datafield_checkbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258577),
(754, 0, 'datafield_checkbox', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258577),
(755, 0, 'datafield_date', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258577),
(756, 0, 'datafield_date', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258577),
(757, 0, 'datafield_date', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258577),
(758, 0, 'datafield_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258577),
(759, 0, 'datafield_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258577),
(760, 0, 'datafield_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(761, 0, 'datafield_latlong', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(762, 0, 'datafield_latlong', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(763, 0, 'datafield_latlong', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(764, 0, 'datafield_menu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(765, 0, 'datafield_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(766, 0, 'datafield_menu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(767, 0, 'datafield_multimenu', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(768, 0, 'datafield_multimenu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(769, 0, 'datafield_multimenu', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(770, 0, 'datafield_number', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(771, 0, 'datafield_number', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(772, 0, 'datafield_number', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(773, 0, 'datafield_picture', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(774, 0, 'datafield_picture', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(775, 0, 'datafield_picture', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(776, 0, 'datafield_radiobutton', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(777, 0, 'datafield_radiobutton', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(778, 0, 'datafield_radiobutton', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(779, 0, 'datafield_text', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(780, 0, 'datafield_text', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(781, 0, 'datafield_text', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258578),
(782, 0, 'datafield_textarea', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258578),
(783, 0, 'datafield_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258578),
(784, 0, 'datafield_textarea', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(785, 0, 'datafield_url', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(786, 0, 'datafield_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(787, 0, 'datafield_url', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(788, 0, 'datapreset_imagegallery', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(789, 0, 'datapreset_imagegallery', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(790, 0, 'datapreset_imagegallery', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(791, 0, 'quiz_grading', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(792, 0, 'quiz_grading', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(793, 0, 'quiz_grading', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(794, 0, 'quiz_overview', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(795, 0, 'quiz_overview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(796, 0, 'quiz_overview', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(797, 0, 'quiz_responses', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(798, 0, 'quiz_responses', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(799, 0, 'quiz_responses', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(800, 0, 'quiz_statistics', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(801, 0, 'quiz_statistics', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(802, 0, 'quiz_statistics', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258579),
(803, 0, 'quizaccess_delaybetweenattempts', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258579),
(804, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258579),
(805, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(806, 0, 'quizaccess_ipaddress', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(807, 0, 'quizaccess_ipaddress', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(808, 0, 'quizaccess_ipaddress', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(809, 0, 'quizaccess_numattempts', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(810, 0, 'quizaccess_numattempts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(811, 0, 'quizaccess_numattempts', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(812, 0, 'quizaccess_openclosedate', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(813, 0, 'quizaccess_openclosedate', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(814, 0, 'quizaccess_openclosedate', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(815, 0, 'quizaccess_password', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(816, 0, 'quizaccess_password', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(817, 0, 'quizaccess_password', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(818, 0, 'quizaccess_safebrowser', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(819, 0, 'quizaccess_safebrowser', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(820, 0, 'quizaccess_safebrowser', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(821, 0, 'quizaccess_securewindow', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(822, 0, 'quizaccess_securewindow', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(823, 0, 'quizaccess_securewindow', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(824, 0, 'quizaccess_timelimit', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(825, 0, 'quizaccess_timelimit', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(826, 0, 'quizaccess_timelimit', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(827, 0, 'scormreport_basic', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(828, 0, 'scormreport_basic', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(829, 0, 'scormreport_basic', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(830, 0, 'scormreport_graphs', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(831, 0, 'scormreport_graphs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(832, 0, 'scormreport_graphs', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(833, 0, 'scormreport_interactions', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(834, 0, 'scormreport_interactions', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(835, 0, 'scormreport_interactions', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(836, 0, 'workshopform_accumulative', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258580),
(837, 0, 'workshopform_accumulative', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258580),
(838, 0, 'workshopform_accumulative', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258580),
(839, 0, 'workshopform_comments', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(840, 0, 'workshopform_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(841, 0, 'workshopform_comments', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(842, 0, 'workshopform_numerrors', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(843, 0, 'workshopform_numerrors', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(844, 0, 'workshopform_numerrors', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(845, 0, 'workshopform_rubric', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(846, 0, 'workshopform_rubric', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(847, 0, 'workshopform_rubric', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(848, 0, 'workshopallocation_manual', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(849, 0, 'workshopallocation_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(850, 0, 'workshopallocation_manual', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(851, 0, 'workshopallocation_random', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(852, 0, 'workshopallocation_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(853, 0, 'workshopallocation_random', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(854, 0, 'workshopallocation_scheduled', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(855, 0, 'workshopallocation_scheduled', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(856, 0, 'workshopallocation_scheduled', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(857, 0, 'workshopeval_best', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(858, 0, 'workshopeval_best', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(859, 0, 'workshopeval_best', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(860, 0, 'tinymce_ctrlhelp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(861, 0, 'tinymce_ctrlhelp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(862, 0, 'tinymce_ctrlhelp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258581),
(863, 0, 'tinymce_dragmath', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258581),
(864, 0, 'tinymce_dragmath', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258581),
(865, 0, 'tinymce_dragmath', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258582),
(866, 0, 'tinymce_moodleemoticon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258582),
(867, 0, 'tinymce_moodleemoticon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258582),
(868, 0, 'tinymce_moodleemoticon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258582),
(869, 0, 'tinymce_moodleimage', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258582),
(870, 0, 'tinymce_moodleimage', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258582),
(871, 0, 'tinymce_moodleimage', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258582),
(872, 0, 'tinymce_moodlemedia', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258582),
(873, 0, 'tinymce_moodlemedia', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258582),
(874, 0, 'tinymce_moodlemedia', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258582),
(875, 0, 'tinymce_moodlenolink', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258582),
(876, 0, 'tinymce_moodlenolink', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258582),
(877, 0, 'tinymce_moodlenolink', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258582),
(878, 0, 'tinymce_spellchecker', NULL, '2013050100', 'Starting plugin installation', NULL, '', 0, 1372258582),
(879, 0, 'tinymce_spellchecker', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 0, 1372258582),
(880, 0, 'tinymce_spellchecker', '2013050100', '2013050100', 'Plugin installed', NULL, '', 0, 1372258582);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext COLLATE utf8_unicode_ci NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext COLLATE utf8_unicode_ci,
  `parameters` longtext COLLATE utf8_unicode_ci,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_url`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `idnumber` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `firstname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lastname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `skype` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `yahoo` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `aim` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `msn` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone1` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `phone2` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `institution` varchar(40) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `department` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(70) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(120) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `country` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `lang` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `theme` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timezone` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `secret` varchar(15) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `htmleditor` tinyint(1) NOT NULL DEFAULT '1',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='One record for each person' AUTO_INCREMENT=5 ;

--
-- Volcar la base de datos para la tabla `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `htmleditor`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', 'a49a2439f2ca4aec290e07b808fc45b3', '', 'Invitado', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'es_ar', '', '99', 0, 0, 0, 0, '', '', 0, '', 'Este usuario sólo tiene acceso de lectura en ciertos cursos.', 1, 1, 0, 2, 1, 1, 0, 0, 1372258356, 0, NULL),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', 'ac9f56e7bb7f9e4b7b596e7845dba634', '', 'Administrador', 'Principal', 'lau.ibarra@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Resistencia', 'AR', 'es_ar', '', '99', 1372258675, 1372430138, 1372421049, 1372423169, '127.0.0.1', '', 0, '', '', 1, 1, 0, 1, 1, 1, 0, 0, 1372258980, 0, NULL),
(3, 'manual', 1, 0, 0, 0, 1, 'profesor', '3afe22651f237841cb177dda04c1d8a4', '', 'Profesor', 'Principal', 'lau_ibarra@outlook.com', 0, '', '', '', '', '', '', '', '', '', '', 'Resistencia', 'AR', 'es_ar', '', '99', 1372430286, 1372431066, 0, 1372430286, '127.0.0.1', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1372425566, 1372425566, 0, ''),
(4, 'manual', 1, 0, 0, 0, 1, 'alumno01', '4c51cf7c1f6aad0253f5156e9865abd3', '', 'Alumno01', 'De Prueba', 'reddeenergiasrenovables@gmail.com', 0, '', '', '', '', '', '', '', '', '', '', 'Resistencia', 'AR', 'es_ar', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 1, 0, 1372430016, 1372430016, 0, '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(1, 0, 1, 3, 1372388400, 0, 2, 1372429209, 1372429209),
(2, 0, 1, 4, 1372388400, 0, 2, 1372430157, 1372430157);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable fields categories' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_user_info_category`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_user_info_data`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'shortname',
  `name` longtext COLLATE utf8_unicode_ci NOT NULL,
  `datatype` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext COLLATE utf8_unicode_ci,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext COLLATE utf8_unicode_ci,
  `param2` longtext COLLATE utf8_unicode_ci,
  `param3` longtext COLLATE utf8_unicode_ci,
  `param4` longtext COLLATE utf8_unicode_ci,
  `param5` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_user_info_field`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=3 ;

--
-- Volcar la base de datos para la tabla `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1372430121),
(2, 3, 2, 1372431066);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(1333) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=14 ;

--
-- Volcar la base de datos para la tabla `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'email_bounce_count', '1'),
(2, 2, 'email_send_count', '1'),
(3, 2, 'filepicker_recentrepository', '3'),
(4, 2, 'filepicker_recentlicense', 'allrightsreserved'),
(5, 3, 'auth_forcepasswordchange', '0'),
(6, 3, 'email_bounce_count', '1'),
(7, 3, 'email_send_count', '1'),
(8, 2, 'userselector_preserveselected', '0'),
(9, 2, 'userselector_autoselectunique', '0'),
(10, 2, 'userselector_searchanywhere', '0'),
(11, 4, 'auth_forcepasswordchange', '0'),
(12, 4, 'email_bounce_count', '1'),
(13, 4, 'email_send_count', '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `value` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_user_private_key`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_webdav_locks`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Wiki',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki_links`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki_locks`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'title',
  `cachedcontent` longtext COLLATE utf8_unicode_ci NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki_pages`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki_subwikis`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki_synonyms`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `contentformat` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_wiki_versions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` longtext COLLATE utf8_unicode_ci,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext COLLATE utf8_unicode_ci,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext COLLATE utf8_unicode_ci,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `evaluation` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext COLLATE utf8_unicode_ci,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext COLLATE utf8_unicode_ci,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resultlog` longtext COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopallocation_scheduled`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopeval_best_settings`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_accumulative`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_comments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `grade1` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_numerrors`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_numerrors_map`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_rubric`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) COLLATE utf8_unicode_ci DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_rubric_config`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext COLLATE utf8_unicode_ci,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshopform_rubric_levels`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_aggregations`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext COLLATE utf8_unicode_ci,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_assessments`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext COLLATE utf8_unicode_ci,
  `teachercomment` longtext COLLATE utf8_unicode_ci,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_assessments_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_comments_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_elements_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext COLLATE utf8_unicode_ci,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_grades`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext COLLATE utf8_unicode_ci NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_grades_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_rubrics_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_stockcomments_old`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `content` longtext COLLATE utf8_unicode_ci,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext COLLATE utf8_unicode_ci,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_submissions`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

--
-- Volcar la base de datos para la tabla `mdl_workshop_submissions_old`
--

