-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2012 at 05:28 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `openchurch`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_1` varchar(30) NOT NULL,
  `line_2` varchar(30) DEFAULT NULL,
  `line_3` varchar(30) DEFAULT NULL,
  `city` varchar(20) NOT NULL,
  `state` varchar(20) NOT NULL,
  `postal_zip` int(9) NOT NULL,
  `country` varchar(30) NOT NULL,
  `comments` text,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `churches`
--

DROP TABLE IF EXISTS `churches`;
CREATE TABLE IF NOT EXISTS `churches` (
  `church_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `church_name` varchar(50) NOT NULL,
  PRIMARY KEY (`church_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `churches_have_addresses`
--

DROP TABLE IF EXISTS `churches_have_addresses`;
CREATE TABLE IF NOT EXISTS `churches_have_addresses` (
  `churches_church_id` int(10) unsigned NOT NULL,
  `addresses_address_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`churches_church_id`,`addresses_address_id`),
  KEY `churches_have_addresses_fk_2` (`addresses_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `churches_have_giving_records`
--

DROP TABLE IF EXISTS `churches_have_giving_records`;
CREATE TABLE IF NOT EXISTS `churches_have_giving_records` (
  `churches_church_id` int(10) unsigned NOT NULL,
  `giving_records_record_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`churches_church_id`,`giving_records_record_id`),
  KEY `churches_have_giving_records_fk_2` (`giving_records_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `churches_have_people`
--

DROP TABLE IF EXISTS `churches_have_people`;
CREATE TABLE IF NOT EXISTS `churches_have_people` (
  `churches_church_id` int(10) unsigned NOT NULL,
  `people_person_id` int(10) unsigned NOT NULL,
  `type` enum('Prospect','Member','Ex-Member') NOT NULL,
  PRIMARY KEY (`churches_church_id`,`people_person_id`),
  KEY `churches_have_people_fk_2` (`people_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `churches_have_roles`
--

DROP TABLE IF EXISTS `churches_have_roles`;
CREATE TABLE IF NOT EXISTS `churches_have_roles` (
  `churches_church_id` int(10) unsigned NOT NULL,
  `people_person_id` int(10) unsigned NOT NULL,
  `role` enum('Pastor','Assistant Pastor','Deacon','Trustee','Music Director','Treasurer','Secretary','Usher','Pianist','Organist','Choir Member','Youth Director','Sunday School Administrator','Sunday School Teacher','Jr. Church Leader','Jr. Church Helper','PA worker') NOT NULL,
  PRIMARY KEY (`churches_church_id`,`people_person_id`,`role`),
  KEY `churches_have_roles_fk_2` (`people_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `churches_have_services`
--

DROP TABLE IF EXISTS `churches_have_services`;
CREATE TABLE IF NOT EXISTS `churches_have_services` (
  `churches_church_id` int(10) unsigned NOT NULL,
  `services_service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`churches_church_id`,`services_service_id`),
  KEY `churches_have_services_fk_2` (`services_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `giving_records`
--

DROP TABLE IF EXISTS `giving_records`;
CREATE TABLE IF NOT EXISTS `giving_records` (
  `record_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `amount` decimal(9,2) NOT NULL,
  `designation` enum('General','Building','Missions','Bus','Music','Love Offering','Special Project','Other') NOT NULL,
  `comments` text,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `media_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_format` enum('DVD','CD','WAV','MP3','AVI','MP4','VHS','Cassette','Other','PDF','DOC') NOT NULL,
  `media_comments` text,
  `media_location` varchar(30) NOT NULL,
  `media_href` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
CREATE TABLE IF NOT EXISTS `people` (
  `person_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL,
  `middle_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `school_grade` enum('Nursery','Pre-K','K-5','First','Second','Third','Fourth','Fifth','Sixth','Seventh','Eighth','Highschool Freshman','Highschool Sophmore','Highschool Junior','Highschool Senior','College Freshman','College Sophmore','College Junior','College Senior','GED','Highschool Graduate','College Graduate') DEFAULT NULL,
  PRIMARY KEY (`person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `people_have_addresses`
--

DROP TABLE IF EXISTS `people_have_addresses`;
CREATE TABLE IF NOT EXISTS `people_have_addresses` (
  `people_person_id` int(10) unsigned NOT NULL,
  `addresses_address_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`people_person_id`,`addresses_address_id`),
  KEY `people_have_addresses_fk_2` (`addresses_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `people_have_giving_records`
--

DROP TABLE IF EXISTS `people_have_giving_records`;
CREATE TABLE IF NOT EXISTS `people_have_giving_records` (
  `people_person_id` int(10) unsigned NOT NULL,
  `giving_records_record_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`people_person_id`,`giving_records_record_id`),
  KEY `people_have_giving_records_fk_2` (`giving_records_record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `people_have_users`
--

DROP TABLE IF EXISTS `people_have_users`;
CREATE TABLE IF NOT EXISTS `people_have_users` (
  `people_person_id` int(10) unsigned NOT NULL,
  `users_user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`people_person_id`,`users_user_id`),
  KEY `people_have_users_fk_2` (`users_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `preachers`
--

DROP TABLE IF EXISTS `preachers`;
CREATE TABLE IF NOT EXISTS `preachers` (
  `preacher_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `people_person_id` int(10) unsigned NOT NULL,
  `comments` text,
  PRIMARY KEY (`preacher_id`),
  KEY `preachers_fk_1` (`people_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `relationships`
--

DROP TABLE IF EXISTS `relationships`;
CREATE TABLE IF NOT EXISTS `relationships` (
  `relationship_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `people_person_id` int(10) unsigned NOT NULL,
  `relationship_type` enum('Mother','Father','Daughter','Son','Grandmother','Grandfather','Sister','Brother','Aunt','Uncle','Neice','Nephew','Step Father','Step Mother','Step Sister','Step Brother','Half Sister','Half Brother','Mother in Law','Father in Law','Sister in Law','Brother in Law','Daughter in Law','Son in Law','Grandchild','Cousin') NOT NULL,
  `related_person_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`relationship_id`),
  UNIQUE KEY `relationships_index01` (`people_person_id`,`related_person_id`),
  KEY `relationship_fk_2` (`related_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sermons`
--

DROP TABLE IF EXISTS `sermons`;
CREATE TABLE IF NOT EXISTS `sermons` (
  `sermon_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `preachers_preacher_id` int(10) unsigned NOT NULL,
  `services_service_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sermon_id`),
  KEY `sermons_fk_1` (`preachers_preacher_id`),
  KEY `sermons_fk_2` (`services_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `sermons_have_media`
--

DROP TABLE IF EXISTS `sermons_have_media`;
CREATE TABLE IF NOT EXISTS `sermons_have_media` (
  `sermons_sermon_id` int(10) unsigned NOT NULL,
  `media_media_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`sermons_sermon_id`,`media_media_id`),
  KEY `sermons_have_media_fk_2` (`media_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
CREATE TABLE IF NOT EXISTS `services` (
  `service_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_date` date NOT NULL,
  `service_type` enum('Sunday School','Sunday Worship','Sunday Evening','Wednesday Evening','Revival','Conference','Special Service','Other') NOT NULL,
  `comments` text,
  PRIMARY KEY (`service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `services_have_media`
--

DROP TABLE IF EXISTS `services_have_media`;
CREATE TABLE IF NOT EXISTS `services_have_media` (
  `services_service_id` int(10) unsigned NOT NULL,
  `media_media_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`services_service_id`,`media_media_id`),
  KEY `services_have_media_fk_2` (`media_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `singing_groups`
--

DROP TABLE IF EXISTS `singing_groups`;
CREATE TABLE IF NOT EXISTS `singing_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`group_id`),
  UNIQUE KEY `singing_groups_index01` (`group_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `singing_groups_have_people`
--

DROP TABLE IF EXISTS `singing_groups_have_people`;
CREATE TABLE IF NOT EXISTS `singing_groups_have_people` (
  `singing_groups_group_id` int(10) unsigned NOT NULL,
  `people_person_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`singing_groups_group_id`,`people_person_id`),
  KEY `singing_groups_have_people_fk_2` (`people_person_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `special_songs`
--

DROP TABLE IF EXISTS `special_songs`;
CREATE TABLE IF NOT EXISTS `special_songs` (
  `song_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `singing_groups_group_id` int(10) unsigned NOT NULL,
  `services_service_id` int(10) unsigned DEFAULT NULL,
  `song_name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`song_id`),
  UNIQUE KEY `special_songs_index01` (`song_name`),
  KEY `special_songs_fk_1` (`singing_groups_group_id`),
  KEY `special_songs_fk_2` (`services_service_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `special_songs_have_media`
--

DROP TABLE IF EXISTS `special_songs_have_media`;
CREATE TABLE IF NOT EXISTS `special_songs_have_media` (
  `special_songs_song_id` int(10) unsigned NOT NULL,
  `media_media_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`special_songs_song_id`,`media_media_id`),
  KEY `special_songs_have_media_fk_2` (`media_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(14) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_have_churches`
--

DROP TABLE IF EXISTS `user_have_churches`;
CREATE TABLE IF NOT EXISTS `user_have_churches` (
  `users_user_id` int(10) unsigned NOT NULL,
  `churches_church_id` int(10) unsigned NOT NULL,
  KEY `users_have_churches_fk_1` (`users_user_id`),
  KEY `users_have_churches_fk_2` (`churches_church_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `churches_have_addresses`
--
ALTER TABLE `churches_have_addresses`
  ADD CONSTRAINT `churches_have_addresses_fk_1` FOREIGN KEY (`churches_church_id`) REFERENCES `churches` (`church_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `churches_have_addresses_fk_2` FOREIGN KEY (`addresses_address_id`) REFERENCES `addresses` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `churches_have_giving_records`
--
ALTER TABLE `churches_have_giving_records`
  ADD CONSTRAINT `churches_have_giving_records_fk_1` FOREIGN KEY (`churches_church_id`) REFERENCES `churches` (`church_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `churches_have_giving_records_fk_2` FOREIGN KEY (`giving_records_record_id`) REFERENCES `giving_records` (`record_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `churches_have_people`
--
ALTER TABLE `churches_have_people`
  ADD CONSTRAINT `churches_have_people_fk_1` FOREIGN KEY (`churches_church_id`) REFERENCES `churches` (`church_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `churches_have_people_fk_2` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `churches_have_roles`
--
ALTER TABLE `churches_have_roles`
  ADD CONSTRAINT `churches_have_roles_fk_1` FOREIGN KEY (`churches_church_id`) REFERENCES `churches` (`church_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `churches_have_roles_fk_2` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `churches_have_services`
--
ALTER TABLE `churches_have_services`
  ADD CONSTRAINT `churches_have_services_fk_1` FOREIGN KEY (`churches_church_id`) REFERENCES `churches` (`church_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `churches_have_services_fk_2` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `people_have_addresses`
--
ALTER TABLE `people_have_addresses`
  ADD CONSTRAINT `people_have_addresses_fk_1` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `people_have_addresses_fk_2` FOREIGN KEY (`addresses_address_id`) REFERENCES `addresses` (`address_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `people_have_giving_records`
--
ALTER TABLE `people_have_giving_records`
  ADD CONSTRAINT `people_have_giving_records_fk_1` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `people_have_giving_records_fk_2` FOREIGN KEY (`giving_records_record_id`) REFERENCES `giving_records` (`record_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `people_have_users`
--
ALTER TABLE `people_have_users`
  ADD CONSTRAINT `people_have_users_fk_1` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `people_have_users_fk_2` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `preachers`
--
ALTER TABLE `preachers`
  ADD CONSTRAINT `preachers_fk_1` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `relationships`
--
ALTER TABLE `relationships`
  ADD CONSTRAINT `relationship_fk_1` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `relationship_fk_2` FOREIGN KEY (`related_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sermons`
--
ALTER TABLE `sermons`
  ADD CONSTRAINT `sermons_fk_1` FOREIGN KEY (`preachers_preacher_id`) REFERENCES `preachers` (`preacher_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sermons_fk_2` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `sermons_have_media`
--
ALTER TABLE `sermons_have_media`
  ADD CONSTRAINT `sermons_have_media_fk_1` FOREIGN KEY (`sermons_sermon_id`) REFERENCES `sermons` (`sermon_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `sermons_have_media_fk_2` FOREIGN KEY (`media_media_id`) REFERENCES `media` (`media_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `services_have_media`
--
ALTER TABLE `services_have_media`
  ADD CONSTRAINT `services_have_media_fk_1` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `services_have_media_fk_2` FOREIGN KEY (`media_media_id`) REFERENCES `media` (`media_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `singing_groups_have_people`
--
ALTER TABLE `singing_groups_have_people`
  ADD CONSTRAINT `singing_groups_have_people_fk_1` FOREIGN KEY (`singing_groups_group_id`) REFERENCES `singing_groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `singing_groups_have_people_fk_2` FOREIGN KEY (`people_person_id`) REFERENCES `people` (`person_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `special_songs`
--
ALTER TABLE `special_songs`
  ADD CONSTRAINT `special_songs_fk_1` FOREIGN KEY (`singing_groups_group_id`) REFERENCES `singing_groups` (`group_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `special_songs_fk_2` FOREIGN KEY (`services_service_id`) REFERENCES `services` (`service_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `special_songs_have_media`
--
ALTER TABLE `special_songs_have_media`
  ADD CONSTRAINT `special_songs_have_media_fk_1` FOREIGN KEY (`special_songs_song_id`) REFERENCES `special_songs` (`song_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `special_songs_have_media_fk_2` FOREIGN KEY (`media_media_id`) REFERENCES `media` (`media_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_have_churches`
--
ALTER TABLE `user_have_churches`
  ADD CONSTRAINT `users_have_churches_fk_1` FOREIGN KEY (`users_user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `users_have_churches_fk_2` FOREIGN KEY (`churches_church_id`) REFERENCES `churches` (`church_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
