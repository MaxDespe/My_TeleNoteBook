CREATE TABLE IF NOT EXISTS `telegram_NoteBot_memo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `memo` text NOT NULL,
  `timestamp` int(11) NOT NULL,
  `type` text,
  PRIMARY KEY (`id`),
  FULLTEXT KEY `memo` (`memo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `telegram_NoteBot_reminder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `memoid` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;

CREATE TABLE IF NOT EXISTS `telegram_NoteBot_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` text,
  `username` text,
  `name` text,
  `status` text,
  `lang` text,
  `invertmemodata` int(1) NOT NULL DEFAULT '0',
  `justwritemode` tinyint(1) NOT NULL DEFAULT '1',
  `timezone` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 ;
