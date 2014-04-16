-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 17, 2014 at 12:50 AM
-- Server version: 5.5.32
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `madlyincraft`
--
CREATE DATABASE IF NOT EXISTS `madlyincraft` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `madlyincraft`;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `USERNAME` varchar(30) NOT NULL DEFAULT '',
  `PASSWORD` varchar(32) NOT NULL,
  `DISPLAY_PICTURE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`USERNAME`, `PASSWORD`, `DISPLAY_PICTURE`) VALUES
('admin', 'admin', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TUTORIAL_ID` int(11) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `CONTENT` varchar(100) NOT NULL,
  `DATE_POSTED` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`ID`, `TUTORIAL_ID`, `USER_ID`, `CONTENT`, `DATE_POSTED`) VALUES
(1, 1, 'nabila', 'waahh.. bisa comment', '2014-04-15 02:06:12'),
(2, 1, 'bone', 'hihihi', '2014-04-17 05:12:25'),
(5, 1, 'Namanya Namanya', 'Saya ingin memberikan komentar', '2014-04-16 17:44:06'),
(6, 1, 'Namanya Namanya', 'Kereeeeeeen (>o<)', '2014-04-16 20:55:11'),
(7, 2, 'Namanya Namanya', 'mau coba bikin di yang kedua ', '2014-04-17 04:08:45'),
(8, 2, 'Namanya Namanya', 'ciee bisa', '2014-04-17 04:10:21'),
(9, 4, 'Namanya Namanya', 'ini bisa juga kan?', '2014-04-17 04:11:36'),
(10, 1, 'Namanya Namanya', 'huhu', '2014-04-17 05:22:15'),
(11, 1, 'Namanya Namanya', 'huaa', '2014-04-17 05:25:03'),
(12, 1, 'Namanya Namanya', 'hah', '2014-04-17 05:26:27');

-- --------------------------------------------------------

--
-- Table structure for table `foto_kreasi`
--

CREATE TABLE IF NOT EXISTS `foto_kreasi` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TUTORIAL_ID` int(11) NOT NULL,
  `USER_ID` varchar(30) NOT NULL,
  `DATE_POSTED` datetime NOT NULL,
  `URL` varchar(100) NOT NULL,
  `TOTAL_VOTEUP` int(11) DEFAULT NULL,
  `TOTAL_VOTEDOWN` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
  `NAMA_KATEGORI` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`NAMA_KATEGORI`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`NAMA_KATEGORI`) VALUES
('Art'),
('Jewelry'),
('Papercraft'),
('Sewing');

-- --------------------------------------------------------

--
-- Table structure for table `link`
--

CREATE TABLE IF NOT EXISTS `link` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(30) NOT NULL,
  `URL` varchar(200) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `material`
--

CREATE TABLE IF NOT EXISTS `material` (
  `ID` int(11) NOT NULL DEFAULT '0',
  `TUTORIAL_ID` int(11) NOT NULL DEFAULT '0',
  `nama` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`,`TUTORIAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `material`
--

INSERT INTO `material` (`ID`, `TUTORIAL_ID`, `nama`) VALUES
(1, 1, 'White Felt fabric (about 7 x 5.5 inches)'),
(1, 2, 'Mod Melts nature mold'),
(1, 3, 'Canvas'),
(1, 4, 'Colored Cardstock Paper'),
(2, 1, 'Cotton fabric for lining (about 7 x 5.5 inches)'),
(2, 2, 'Mod Melts sticks'),
(2, 3, 'Washi Tapes'),
(2, 4, 'Scissors'),
(3, 1, '3 inch white zipper'),
(3, 2, 'high temp glue gun'),
(3, 3, 'Waxed Paper'),
(3, 4, 'Hot Glue Gun'),
(4, 1, 'Disappearing Ink Pen (optional)'),
(4, 2, '6 or 7mm jump rings'),
(4, 3, 'Scissors'),
(4, 4, 'Hot Glue Sticks'),
(5, 1, 'Disappearing Ink Pen (optional)'),
(5, 2, '4mm jump rings'),
(5, 4, 'Floral Stakes'),
(6, 1, 'Scissors'),
(6, 2, 'lobster clasp'),
(6, 4, 'Vase'),
(7, 2, 'jewelry chain'),
(7, 4, 'Pencil (Optional)'),
(8, 2, 'jewelry pliers (2)'),
(9, 2, 'acrylic craft paint in blue and brown'),
(10, 2, 'paint brush');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SENDER_ID` varchar(30) NOT NULL,
  `RECEIVER_ID` varchar(30) NOT NULL,
  `CONTENT` varchar(500) NOT NULL,
  `DATE_POSTED` datetime NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tutorial`
--

CREATE TABLE IF NOT EXISTS `tutorial` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` varchar(30) NOT NULL,
  `TITLE` varchar(50) NOT NULL,
  `CONTENT` varchar(500) DEFAULT NULL,
  `TOTAL_LIKE` int(11) DEFAULT NULL,
  `DATE_POSTED` datetime NOT NULL,
  `DIFFICULTY` varchar(10) DEFAULT NULL,
  `KATEGORI` varchar(20) DEFAULT NULL,
  `FEATURED_IMAGE` varchar(200) DEFAULT NULL,
  `STATUS` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tutorial`
--

INSERT INTO `tutorial` (`ID`, `USER_ID`, `TITLE`, `CONTENT`, `TOTAL_LIKE`, `DATE_POSTED`, `DIFFICULTY`, `KATEGORI`, `FEATURED_IMAGE`, `STATUS`) VALUES
(1, 'bonita', 'Bunny Coin Purse', 'Easter is right around the corner and I couldn''t resist whipping up a cute little bunny DIY. My niece is a big fan of Miffy the bunny and of anything purse-like, so of course, a little bunny coin purse was in order. Filled with candy or other treasures and shaped like an adorable bunny, what could be better? As a gift to all of you, I''ve created a PDF pattern of the bunny shape so you''ll be able to make your own!', NULL, '2014-04-30 02:02:04', 'Easy', 'Sewing', 'http://1.bp.blogspot.com/-qMiS6wC312A/U0569iUqYHI/AAAAAAAABCE/L2UV0GQnVtI/s1600/1.jpg', NULL),
(2, 'Heidi', 'Robin''s Egg Nest Bracelet', 'Musings on craft design aside, I just don’t have enough springy jewelry in my wardrobe, and this subtle, colorful bracelet makes me think of something I’d find at an indie craft fair or on an indie online shop. You know, a bold piece you don’t see a gillion variations of walking down the street.', 0, '2014-04-15 01:19:52', 'Medium', 'Jewelry', 'http://2.bp.blogspot.com/-XduYzlTwwO0/U06GDozMdBI/AAAAAAAABDQ/mCdBMavoBdA/s1600/2.jpg', NULL),
(3, 'nabila', 'Washi Tape Pop Floral Art', 'I was playing with tape and testing out new shapes over the weekend, and before I knew it, I''d grown a garden of colourful pop florals. Simple shapes, bold colours, lots of fun!\r\n\r\nThis is just a really simple example of working with washi tape on one of those pre-stretched canvases you can pick up at your local craft/art store. Would love to see what you dream up when you apply tape to canvas.', 0, '2014-04-02 10:17:12', 'Easy', 'Art', 'http://4.bp.blogspot.com/-kFQXoE0ueIw/U06NzZFUy3I/AAAAAAAABD0/2gwReatQ250/s1600/3.jpg', NULL),
(4, 'mawan', 'Paper Flowers Tutorial', 'These DIY paper flowers are so easy to make, it’s almost ridiculous. I made a bouquet out of them, so I am going to show the complete process, from start to finish.', 0, '2014-04-01 03:13:27', 'Medium', 'Papercraft', 'http://2.bp.blogspot.com/-qnaTV_a_Fpo/U06TSndNxXI/AAAAAAAABFI/-FNG6BwuKPc/s1600/4.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tutorial_steps`
--

CREATE TABLE IF NOT EXISTS `tutorial_steps` (
  `TUTORIAL_ID` int(11) NOT NULL DEFAULT '0',
  `NOMOR` int(11) NOT NULL DEFAULT '0',
  `deskripsi` text,
  `LINK_GAMBAR` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TUTORIAL_ID`,`NOMOR`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tutorial_steps`
--

INSERT INTO `tutorial_steps` (`TUTORIAL_ID`, `NOMOR`, `deskripsi`, `LINK_GAMBAR`) VALUES
(1, 1, 'Cut out bunny shape along dotted line. Cut 2 pieces of white felt and 2 pieces of pink cotton for lining.', 'http://2.bp.blogspot.com/-96snJZ8FXcY/U0569iiBbxI/AAAAAAAABCA/gQ_Z-Ur198s/s1600/s1.jpg'),
(1, 2, 'Place felt right sides together. Using a 1/4 inch seam allowance, stitch around edge leaving a 3 inch gap at the bottom. Repeat with lining.', 'http://2.bp.blogspot.com/-eeG0FRF81ME/U0569C_mwpI/AAAAAAAABB8/GD_yGkWd2yk/s1600/s2.jpg'),
(1, 3, 'Pin zipper to opening, right sides together. Baste and stitch. Trim corners of felt and turn felt right side out. Push ears out with a knitting needle.', 'http://1.bp.blogspot.com/-OLGdWdhVk6U/U056-OF62aI/AAAAAAAABCU/TVOWnwbEq00/s1600/s3.jpg'),
(1, 4, 'Insert lining inside felt. Push the lining up into the ears using a knitting needle. Turn in raw edge of lining and pin in place. Hand stitch lining to zipper.', 'http://3.bp.blogspot.com/-YEzBbQQFKG0/U059TysaMNI/AAAAAAAABCw/z_G7LVceSd0/s1600/s4.jpg'),
(1, 5, 'Embroider eyes and nose on bunny using a satin stitch for the eyes and a large cross stitch for the nose. (I embroidered at the end but it might be easier to do it before stitching the pieces together', 'http://3.bp.blogspot.com/-bAGbtJET97c/U056-YTe7_I/AAAAAAAABCY/SEE7egDg5VE/s1600/s5.jpg'),
(2, 1, 'Heat up a Mod Melt stick in a high temp glue gun. Fill one of the space in a mod melts mold to the brim, and while it’s still wet, place two 7mm jump rings in the mold, one of each across from each other. I obviously filled the bird’s nest mold for today’s project, but pictured below was an early experiment for this project.', 'http://3.bp.blogspot.com/-Yufd1teORpY/U06GCsn4DwI/AAAAAAAABDM/2PWOOh9slHY/s1600/2.1.jpg'),
(2, 2, 'When your mold has hardened completely, paint it however you like (or like a robin’s egg nest like I did – it was pretty easy and I suck at painting!). Let dry. Break your chain into two pieces, each long enough to just barely wrap around your wrist. Attach a piece of chain to each side of your nest with a 4mm jump ring.', 'http://1.bp.blogspot.com/-vgKqEMWM_Vg/U06GCredf_I/AAAAAAAABDU/oVrGXE6_nlQ/s1600/2.2.jpg'),
(2, 3, 'Fold your chain exactly in half and attach the other raw end to the nest with another 4mm ring. Repeat for the other side.\r\n\r\nAttach your lobster clasp to the center of one piece of the chain with a 4mm ring. Make a chain of jump rings: 1 7mm, 1 4mm, 1 7 mm, and 1 4mm ring, and attach the second 4mm ring to the center of the non-lobster clasp side of your bracelet.\r\n\r\nA visual of how to attach the chain and clasp to the nest charm:', 'http://2.bp.blogspot.com/-3vwwD3TMULs/U06GCkHJrKI/AAAAAAAABDY/NejcZPfSz1Y/s1600/2.3.jpg'),
(3, 1, 'Start by applying thin strips of washi tape in varying heights - these will become the stems of your flowers.', 'http://2.bp.blogspot.com/-9Juyf9O_uy4/U06NypxNEGI/AAAAAAAABDo/FYnkY_gfcww/s1600/3.1.jpg'),
(3, 2, 'Cut shapes out of washi tape covered parchment / waxed paper. Any shape will do - from actual flower shapes to circles, whatever you fancy. Add centres and stamens in a contrasting colour.', 'http://4.bp.blogspot.com/-9dxKZQKd-Us/U06NyoiCmNI/AAAAAAAABEA/ktynmnP46Rg/s1600/3.2.jpg'),
(3, 3, 'Add leaves in varying shapes and lengths.\r\n', 'http://4.bp.blogspot.com/-49kYIeQEeIk/U06NyjbNDKI/AAAAAAAABDs/PNFEPMh8lxM/s1600/3.3.jpg'),
(4, 1, 'Depending on the size of your paper, you could fold it a few times and cut it into squares. You need squares.\r\nTake your scissors and cut out a spiral from your square piece of paper.', 'http://1.bp.blogspot.com/-toANkrFqlJM/U06TQLShSEI/AAAAAAAABEY/Mi4K-vG-DzA/s1600/4.1.jpg'),
(4, 2, 'Evenness is not needed, and kind of ruins the effect, so just cut and cut and cut. You could use a pencil to draw out a spiral first, but I just wing it. I live dangerously in the craft world, yo.', 'http://3.bp.blogspot.com/-kS3ZLsnJmUw/U06TQAmtTGI/AAAAAAAABEQ/jh_7sQB8Lcg/s1600/4.2.jpg'),
(4, 3, 'Begin rolling up the spiral, starting from the outside.\r\nIt’s very important to start from the outside, it won’t work if you start from the middle.', 'http://2.bp.blogspot.com/-LxjjS1-NhaA/U06TQEa1nGI/AAAAAAAABEU/pAswf8wT4A0/s1600/4.3.jpg'),
(4, 4, 'Roll it up tightly, all the way til you reach the end.', 'http://3.bp.blogspot.com/-UrFZCGUlfQc/U06TQ5EZzCI/AAAAAAAABEs/wq65W_rU-70/s1600/4.4.jpg'),
(4, 5, 'Fold the last rounded section of the spiral across the bottom of the flower and then release your grip on the whole thing, allowing it to spread back out into a pretty blossom!', 'http://4.bp.blogspot.com/-_3SCtgmV5A4/U06TSBnQq_I/AAAAAAAABE8/yU5rxk9eVK8/s1600/4.5.jpg'),
(4, 6, 'At this point I went ahead and made all the other flowers I need for my bouquet. Once I’d finished that, I moved on to the next step: glue. Take the hot glue and place a dollop of it on the flat circle on the bottom and press the flower into it, sealing it into place. After the glue hardens, I started gluing the floral stakes to the bottom of the flowers. This process can get a little precarious, because the sticks do not want to stand on their own, so I had to balance them against a wall to harden. I lost two of them behind the dresser in the process. It was sad.', 'http://4.bp.blogspot.com/-b_Bosumpokw/U06TRFiNaMI/AAAAAAAABEo/PN_nJV0JSNc/s1600/4.6.jpg'),
(4, 7, 'Once the glue has dried and is nice and hard, you are ready to make your bouquet!\r\nAll you need to do for that is get your vase, and plop in the flowers until you are happy with its look!', 'http://4.bp.blogspot.com/-XNbg4h6TlTM/U06TR1ebk-I/AAAAAAAABE4/TK4Y3JAiLIU/s1600/4.7.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `USERNAME` varchar(30) NOT NULL DEFAULT '',
  `PASSWORD` varchar(32) NOT NULL,
  `DISPLAY_PICTURE` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(30) NOT NULL,
  PRIMARY KEY (`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`USERNAME`, `PASSWORD`, `DISPLAY_PICTURE`, `EMAIL`) VALUES
('bila', 'bone', NULL, 'ygg@jnj.com'),
('bonita', 'bonita', 'http://www.motherandbaby.co.id/asset/images/avatar_female.jpg', 'vvvvb@hh.com'),
('mawan', 'mawan', 'http://cdns2.freepik.com/fotos-kostenlos/super-einfach-avatar_318-1018.jpg', 'mmm@mm.com'),
('nabila', 'nabila', 'http://www.motherandbaby.co.id/asset/images/avatar_female.jpg', 'hhji@g.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
