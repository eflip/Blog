-- In case you are using an old blog table style
ALTER TABLE io_threads ADD category varchar(128) DEFAULT 'uncategorized';
ALTER TABLE io_threads ADD instance varchar(128) DEFAULT 'default';

RENAME TABLE io_threads TO blog_threads, io_messages TO blog_messages;

CREATE TABLE IF NOT EXISTS `blog_threads` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `owner_id` int(11) NOT NULL,
  `category` varchar(128) NOT NULL,
  `title` varchar(128) NOT NULL,
  `content` text NOT NULL,
  `likes` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `blog_messages` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `date` varchar(20) DEFAULT NOW(),
  `parent_id` int(11) NOT NULL,
  `sender_id` int(11) NOT NULL,
  `device` varchar(128) NOT NULL,
  `link` varchar(128) NOT NULL,
  `body` text NOT NULL,
  `likes` int(11) NOT NULL,
  `reply` int(11) NOT NULL,
  PRIMARY KEY (`msg_id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;