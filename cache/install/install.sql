

DROP TABLE IF EXISTS `{dbprefix}1_block`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_block` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(100) NOT NULL COMMENT '名称',
  `code` varchar(100) NOT NULL COMMENT '别名',
  `content` text NOT NULL COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资料块表';

DROP TABLE IF EXISTS `{dbprefix}1_book`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `schedule` varchar(255) DEFAULT NULL COMMENT '进度情况',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='主表';

REPLACE INTO `{dbprefix}1_book` VALUES(2, 2, 'POSCMS入门学习', '', 'POSCMS', 'PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、...', '连载中', 1, 1, 'admin', 9, '/index.php?c=show&id=2', 0, 0, '127.0.0.1', 1535527390, 1535528040, 0, 0, 0);

DROP TABLE IF EXISTS `{dbprefix}1_book_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_book_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_book_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_book_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_book_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_book_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

REPLACE INTO `{dbprefix}1_book_comment_index` VALUES(1, 2, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

DROP TABLE IF EXISTS `{dbprefix}1_book_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_book_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '简介'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

REPLACE INTO `{dbprefix}1_book_data_0` VALUES(2, 1, 2, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>');

DROP TABLE IF EXISTS `{dbprefix}1_book_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_book_extend`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend` (
  `id` int(10) unsigned NOT NULL,
  `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展表';

REPLACE INTO `{dbprefix}1_book_extend` VALUES(1, 2, 1, 2, 'admin', '第一节 环境配置', '/index.php?c=extend&id=1', 9, 0, 1535528000, 1535528000, 0, 0, 0, 0);
REPLACE INTO `{dbprefix}1_book_extend` VALUES(2, 2, 1, 2, 'admin', '第二节 安装方法', '/index.php?c=extend&id=2', 9, 0, 1535528029, 1535528029, 0, 0, 0, 0);

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned NOT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `body` mediumtext COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展附表';

REPLACE INTO `{dbprefix}1_book_extend_data_0` VALUES(1, 2, 1, 2, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="word-wrap: break-word;">安装环境要求：</strong></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">PHP5.3以上（支持PHP7）<br style="word-wrap: break-word;"/></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">MySql5.0以上</p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">PHP支持MySQLi扩展</p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">Web服务器选择apache、Nginx、IIs均可</p><p><br/></p>');
REPLACE INTO `{dbprefix}1_book_extend_data_0` VALUES(2, 2, 1, 2, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="word-wrap: break-word;">安装方法：</strong></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;;">1、到官网下载程序包&nbsp;</span><br style="word-wrap: break-word; box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;;"/><span style="word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;;">2、解压到web目录中，例如根目录下&nbsp;</span><br style="word-wrap: break-word; box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;;"/><span style="word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;;">3、用域名访问这个目录，例如：127.0.0.1/install.php&nbsp;</span><br style="word-wrap: break-word; box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;;"/><span style="word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;;">4、程序自动进入安装界面，填写数据库信息即可傻瓜式完成安装&nbsp;</span><br style="word-wrap: break-word; box-sizing: border-box; font-family: &quot;Microsoft Yahei&quot;;"/><span style="word-wrap: break-word; font-family: &quot;Microsoft Yahei&quot;;">5、进入后台，例如 127.0.0.1/admin.php&nbsp;<br style="word-wrap: break-word;"/></span>6、进入后台之后更新全站缓存，并刷新后台界面（首次必须更新一次缓存）</p><p><br/></p>');

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_index` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='扩展索引表';

REPLACE INTO `{dbprefix}1_book_extend_index` VALUES(1, 2, 1, 2, 9);
REPLACE INTO `{dbprefix}1_book_extend_index` VALUES(2, 2, 1, 2, 9);

DROP TABLE IF EXISTS `{dbprefix}1_book_extend_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_extend_verify` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_book_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_book_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_book_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

REPLACE INTO `{dbprefix}1_book_hits` VALUES(2, 1, 1, 2, 2, 1);

DROP TABLE IF EXISTS `{dbprefix}1_book_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_book_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

REPLACE INTO `{dbprefix}1_book_index` VALUES(2, 1, 2, 9, 1535527390);

DROP TABLE IF EXISTS `{dbprefix}1_book_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_book_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_book_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

REPLACE INTO `{dbprefix}1_book_tag` VALUES(1, 'POSCMS', 'poscms', 0);

DROP TABLE IF EXISTS `{dbprefix}1_book_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_book_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_demo`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `fuxuankuang` varchar(255) DEFAULT NULL,
  `ysxqfyb` varchar(10) DEFAULT NULL,
  `yuedushoufei` text,
  `dangewenjian` varchar(255) DEFAULT NULL,
  `dgwjhtp` text,
  `tpzy` varchar(255) DEFAULT NULL,
  `ldcd` mediumint(8) unsigned DEFAULT NULL,
  `spsx` text,
  `nrglxw` text,
  `spwj` text,
  `danxuananniu` varchar(255) DEFAULT NULL,
  `xialaxuanze` varchar(255) DEFAULT NULL,
  `baiduditu_lng` decimal(9,6) DEFAULT NULL,
  `baiduditu_lat` decimal(9,6) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='主表';

REPLACE INTO `{dbprefix}1_demo` VALUES(1, 1, '测试功能', '', '测试功能,测试', '测试功能测试功能测试功能测试功能', 0, 1, 'admin', 9, '/index.php?s=demo&c=show&id=1', 0, 0, '127.0.0.1', 1535528202, 1535528202, 0, 0, 0, '["1","2"]', '', '', '', '', '', 0, '', '', '', '2', '2', '0.000000', '0.000000');

DROP TABLE IF EXISTS `{dbprefix}1_demo_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='栏目表';

REPLACE INTO `{dbprefix}1_demo_category` VALUES(1, 0, '0', '演示', 'y', 'yanshi', '', 0, '1', '', 1, NULL, '{"edit":"0","linkurl":"","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{modname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{modname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html"}}', 0);

DROP TABLE IF EXISTS `{dbprefix}1_demo_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

REPLACE INTO `{dbprefix}1_demo_data_0` VALUES(1, 1, 1, '<p>测试功能测试功能测试功能测试功能</p>');

DROP TABLE IF EXISTS `{dbprefix}1_demo_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

DROP TABLE IF EXISTS `{dbprefix}1_demo_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

REPLACE INTO `{dbprefix}1_demo_index` VALUES(1, 1, 1, 9, 1535528202);

DROP TABLE IF EXISTS `{dbprefix}1_demo_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_demo_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

REPLACE INTO `{dbprefix}1_demo_tag` VALUES(1, '测试功能', 'ceshigongneng', 0);
REPLACE INTO `{dbprefix}1_demo_tag` VALUES(2, '测试', 'ceshi', 0);

DROP TABLE IF EXISTS `{dbprefix}1_demo_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_demo_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_down`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `version` varchar(255) DEFAULT NULL COMMENT '版本号',
  `language` varchar(255) DEFAULT NULL COMMENT '软件语言',
  `license` varchar(255) DEFAULT NULL COMMENT '软件授权',
  `os` varchar(255) DEFAULT NULL COMMENT '运行环境',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量',
  `favorites` int(10) unsigned DEFAULT '0' COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='主表';

REPLACE INTO `{dbprefix}1_down` VALUES(12, 3, 'POSCMS个人版', '', '3.2.0', '简体中文', '共享版', '["WinXp","Win7","Win8"]', 'POSCMS', 'POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码...', 0, 1, 'admin', 9, '/index.php?c=show&id=12', 0, 0, '127.0.0.1', 1535528054, 1535528054, 0, 0, 0);
REPLACE INTO `{dbprefix}1_down` VALUES(13, 3, 'POSCMS个人版', '', '3.2.0', '简体中文', '共享版', '["WinXp","Win7","Win8"]', 'POSCMS', 'POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码...', 0, 1, 'admin', 9, '/index.php?c=show&id=13', 0, 0, '127.0.0.1', 1535528054, 1535528054, 0, 0, 0);
REPLACE INTO `{dbprefix}1_down` VALUES(14, 3, 'POSCMS个人版', '', '3.2.0', '简体中文', '共享版', '["WinXp","Win7","Win8"]', 'POSCMS', 'POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码...', 0, 1, 'admin', 9, '/index.php?c=show&id=14', 0, 0, '127.0.0.1', 1535528054, 1535528054, 0, 0, 0);

DROP TABLE IF EXISTS `{dbprefix}1_down_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_down_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_down_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_down_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_down_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_down_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_down_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_down_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `file` varchar(255) DEFAULT NULL COMMENT '文件',
  `demo` varchar(255) DEFAULT NULL COMMENT '演示地址',
  `siteurl` varchar(255) DEFAULT NULL COMMENT '官方网站',
  `images` text COMMENT '图片展示',
  `content` mediumtext COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

REPLACE INTO `{dbprefix}1_down_data_0` VALUES(12, 1, 3, 'http://www.phpkaiyuancms.com/down/', 'http://www.phpkaiyuancms.com/down/', 'http://www.phpkaiyuancms.com/down/', '', '<p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></p><p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></span></p><p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></span></span></p>');
REPLACE INTO `{dbprefix}1_down_data_0` VALUES(13, 1, 3, 'http://www.phpkaiyuancms.com/down/', 'http://www.phpkaiyuancms.com/down/', 'http://www.phpkaiyuancms.com/down/', '', '<p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></p><p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></span></p><p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></span></span></p>');
REPLACE INTO `{dbprefix}1_down_data_0` VALUES(14, 1, 3, 'http://www.phpkaiyuancms.com/down/', 'http://www.phpkaiyuancms.com/down/', 'http://www.phpkaiyuancms.com/down/', '', '<p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></p><p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></span></p><p><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);"><span style="color: rgb(85, 85, 85); font-family: &quot;Microsoft YaHei&quot;, 宋体; text-align: center; background-color: rgb(255, 255, 255);">POSCMS源码请在官网下载，请勿使用非官网渠道提供的源码</span></span></span></p>');

DROP TABLE IF EXISTS `{dbprefix}1_down_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_down_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_down_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_down_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

DROP TABLE IF EXISTS `{dbprefix}1_down_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_down_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

REPLACE INTO `{dbprefix}1_down_index` VALUES(12, 1, 3, 9, 1535528054);
REPLACE INTO `{dbprefix}1_down_index` VALUES(13, 1, 3, 9, 1535528054);
REPLACE INTO `{dbprefix}1_down_index` VALUES(14, 1, 3, 9, 1535528054);
REPLACE INTO `{dbprefix}1_down_index` VALUES(15, 1, 3, 9, 1535528054);
REPLACE INTO `{dbprefix}1_down_index` VALUES(16, 1, 3, 9, 1535528054);
REPLACE INTO `{dbprefix}1_down_index` VALUES(17, 1, 3, 9, 1535528054);

DROP TABLE IF EXISTS `{dbprefix}1_down_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_down_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_down_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

REPLACE INTO `{dbprefix}1_down_tag` VALUES(1, 'POSCMS', 'poscms', 0);

DROP TABLE IF EXISTS `{dbprefix}1_down_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_down_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_fang`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0',
  `area` mediumint(8) unsigned DEFAULT NULL,
  `xiaoqumingcheng` varchar(255) DEFAULT NULL,
  `dizhi` varchar(255) DEFAULT NULL,
  `weizhi_lng` decimal(9,6) DEFAULT NULL,
  `weizhi_lat` decimal(9,6) DEFAULT NULL,
  `huxing` varchar(255) DEFAULT NULL,
  `shi` int(10) DEFAULT NULL,
  `ting` int(10) DEFAULT NULL,
  `wei` int(10) DEFAULT NULL,
  `mianji` int(10) DEFAULT NULL,
  `zhuangxiu` varchar(255) DEFAULT NULL,
  `chaoxiang` varchar(255) DEFAULT NULL,
  `zongceng` varchar(255) DEFAULT NULL,
  `suozaiceng` varchar(255) DEFAULT NULL,
  `zujin` int(10) DEFAULT NULL,
  `zujinleixing` varchar(255) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='主表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `peitao` varchar(255) DEFAULT NULL,
  `images` text,
  `lianxiren` varchar(255) DEFAULT NULL,
  `lianxidianhua` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

DROP TABLE IF EXISTS `{dbprefix}1_fang_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

DROP TABLE IF EXISTS `{dbprefix}1_fang_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_fang_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_form`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_form` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `table` varchar(50) NOT NULL COMMENT '表名',
  `setting` text COMMENT '配置信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='表单模型表';

DROP TABLE IF EXISTS `{dbprefix}1_navigator`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_navigator` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级id',
  `pids` text COMMENT '所有上级id数据项',
  `type` tinyint(1) unsigned NOT NULL COMMENT '导航类型',
  `name` varchar(255) NOT NULL COMMENT '导航名称',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `url` varchar(255) NOT NULL COMMENT '导航地址',
  `thumb` varchar(255) NOT NULL COMMENT '图片标示',
  `show` tinyint(1) unsigned NOT NULL COMMENT '显示',
  `mark` varchar(255) DEFAULT NULL COMMENT '类型标示',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否继承下级',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有下级',
  `childids` text COMMENT '所有下级数据项',
  `target` tinyint(1) unsigned NOT NULL COMMENT '是否站外链接',
  `displayorder` tinyint(3) NOT NULL COMMENT '显示顺序'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='网站导航表';

REPLACE INTO `{dbprefix}1_navigator` VALUES(1, 0, '0', 1, 'POSCMS', 'POSCMS', 'http://www.phpkaiyuancms.com', 'http://www.phpkaiyuancms.com/statics/poscms/about1.png', 1, '', 0, 0, '1', 1, 0);
REPLACE INTO `{dbprefix}1_navigator` VALUES(2, 0, '0', 2, '1', 'POSCMS授权版购买', 'http://www.phpkaiyuancms.com/buy/', '', 1, '', 0, 0, '2', 0, 0);
REPLACE INTO `{dbprefix}1_navigator` VALUES(3, 0, '0', 2, '2', 'POSCMS 源码下载', 'http://www.phpkaiyuancms.com/down/', '', 1, '', 0, 0, '3', 0, 0);
REPLACE INTO `{dbprefix}1_navigator` VALUES(4, 0, '0', 4, 'poscms', 'poscms', 'http://www.phpkaiyuancms.com', '', 1, '', 0, 0, '4', 0, 0);
REPLACE INTO `{dbprefix}1_navigator` VALUES(5, 0, '0', 4, '网站建设', '网站建设', 'http://www.phpkaiyuancms.com', '', 1, '', 0, 0, '5', 0, 0);
REPLACE INTO `{dbprefix}1_navigator` VALUES(6, 0, '0', 2, '3', 'POSCMS项目 安全更新补丁通知', 'http://www.phpkaiyuancms.com', '', 1, '', 0, 0, '6', 0, 0);

DROP TABLE IF EXISTS `{dbprefix}1_news`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='主表';

REPLACE INTO `{dbprefix}1_news` VALUES(1, 1, 'PHP开源内容管理系统', '', '域名,POSCMS,授权', 'PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、...', 0, 1, 'admin', 9, '/index.php?c=show&id=1', 0, 0, '127.0.0.1', 1535527333, 1535527333, 0, 0, 0);
REPLACE INTO `{dbprefix}1_news` VALUES(3, 1, 'PHP开源内容管理系统23', '', '开源,管理系统,内容', 'PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、...', 0, 1, 'admin', 9, '/index.php?c=show&id=3', 0, 0, '127.0.0.1', 1535527827, 1535527827, 0, 0, 0);
REPLACE INTO `{dbprefix}1_news` VALUES(4, 1, 'PHP开源内容管理系统23', '', '开源,管理系统,内容', 'PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、...', 0, 1, 'admin', 9, '/index.php?c=show&id=4', 0, 0, '127.0.0.1', 1535527827, 1535527827, 0, 0, 0);
REPLACE INTO `{dbprefix}1_news` VALUES(5, 1, 'PHP开源内容管理系统23', '', '开源,管理系统,内容', 'PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、...', 1, 1, 'admin', 9, '/index.php?c=show&id=5', 0, 0, '127.0.0.1', 1535527827, 1535527827, 0, 0, 0);
REPLACE INTO `{dbprefix}1_news` VALUES(6, 1, 'PHP开源内容管理系统23', '', '开源,管理系统,内容', 'PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、...', 0, 1, 'admin', 9, '/index.php?c=show&id=6', 0, 0, '127.0.0.1', 1535527827, 1535527827, 0, 0, 0);

DROP TABLE IF EXISTS `{dbprefix}1_news_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_news_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_news_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_news_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_news_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_news_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='评论索引表';

REPLACE INTO `{dbprefix}1_news_comment_index` VALUES(1, 5, 0, 0, 0, '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', 0);

DROP TABLE IF EXISTS `{dbprefix}1_news_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_news_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

REPLACE INTO `{dbprefix}1_news_data_0` VALUES(1, 1, 1, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>');
REPLACE INTO `{dbprefix}1_news_data_0` VALUES(3, 1, 1, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>');
REPLACE INTO `{dbprefix}1_news_data_0` VALUES(4, 1, 1, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>');
REPLACE INTO `{dbprefix}1_news_data_0` VALUES(5, 1, 1, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>');
REPLACE INTO `{dbprefix}1_news_data_0` VALUES(6, 1, 1, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>');

DROP TABLE IF EXISTS `{dbprefix}1_news_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_news_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_news_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_news_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

REPLACE INTO `{dbprefix}1_news_hits` VALUES(5, 1, 1, 2, 2, 1);

DROP TABLE IF EXISTS `{dbprefix}1_news_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_news_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='内容索引表';

REPLACE INTO `{dbprefix}1_news_index` VALUES(1, 1, 1, 9, 1535527333);
REPLACE INTO `{dbprefix}1_news_index` VALUES(3, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(4, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(5, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(6, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(7, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(8, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(9, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(10, 1, 1, 9, 1535527827);
REPLACE INTO `{dbprefix}1_news_index` VALUES(11, 1, 1, 9, 1535527827);

DROP TABLE IF EXISTS `{dbprefix}1_news_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_news_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_news_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

REPLACE INTO `{dbprefix}1_news_tag` VALUES(1, '域名', 'yuming', 0);
REPLACE INTO `{dbprefix}1_news_tag` VALUES(2, 'POSCMS', 'poscms', 0);
REPLACE INTO `{dbprefix}1_news_tag` VALUES(3, '授权', 'shouquan', 0);
REPLACE INTO `{dbprefix}1_news_tag` VALUES(4, '开源', 'kaiyuan', 0);
REPLACE INTO `{dbprefix}1_news_tag` VALUES(5, '管理系统', 'guanlixitong', 0);
REPLACE INTO `{dbprefix}1_news_tag` VALUES(6, '内容', 'neirong', 0);

DROP TABLE IF EXISTS `{dbprefix}1_news_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_news_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_page`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_page` (
  `id` smallint(5) unsigned NOT NULL,
  `module` varchar(20) NOT NULL COMMENT '模块dir',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(255) NOT NULL COMMENT '单页名称',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL COMMENT '是否有子类',
  `childids` varchar(255) NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `title` varchar(255) NOT NULL COMMENT 'seo标题',
  `keywords` varchar(255) NOT NULL COMMENT 'seo关键字',
  `description` varchar(255) NOT NULL COMMENT 'seo描述',
  `content` mediumtext COMMENT '单页内容',
  `attachment` text COMMENT '附件信息',
  `template` varchar(30) NOT NULL COMMENT '模板文件',
  `urlrule` smallint(5) unsigned DEFAULT NULL COMMENT 'url规则id',
  `urllink` varchar(255) NOT NULL COMMENT 'url外链',
  `getchild` tinyint(1) unsigned NOT NULL COMMENT '将下级第一个菜单作为当前菜单',
  `show` tinyint(1) unsigned NOT NULL COMMENT '是否显示在菜单',
  `url` varchar(255) NOT NULL COMMENT 'url地址',
  `setting` mediumtext NOT NULL COMMENT '自定义内容',
  `displayorder` tinyint(2) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='单页表';

DROP TABLE IF EXISTS `{dbprefix}1_photo`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(20) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `images` text COMMENT '图片'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

DROP TABLE IF EXISTS `{dbprefix}1_photo_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

DROP TABLE IF EXISTS `{dbprefix}1_photo_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_photo_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_remote`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_remote` (
  `id` tinyint(2) unsigned NOT NULL,
  `url` varchar(255) NOT NULL,
  `type` tinyint(2) NOT NULL COMMENT '远程附件类型',
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `exts` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='远程附件表';

DROP TABLE IF EXISTS `{dbprefix}1_share_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_share_category` (
  `id` smallint(5) unsigned NOT NULL,
  `tid` tinyint(1) NOT NULL COMMENT '栏目类型，0单页，1模块，2外链',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `mid` varchar(20) NOT NULL COMMENT '模块目录',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `domain` varchar(50) NOT NULL COMMENT '绑定域名',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `pcatpost` tinyint(1) NOT NULL COMMENT '是否父栏目发布',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `content` mediumtext NOT NULL COMMENT '单页内容',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='共享模块栏目表';

REPLACE INTO `{dbprefix}1_share_category` VALUES(1, 1, 0, 'news', '0', '新闻', '', 'x', 'xinwen', '', 0, '1', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"},"admin":[],"member":[],"html":0,"getchild":0}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(2, 1, 0, 'book', '0', '图书', '', 't', 'tushu', '', 0, '2', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(3, 1, 0, 'down', '0', '下载', '', 'x', 'xiazai', '', 0, '3', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(4, 1, 0, 'fang', '0', '租房', '', 'z', 'zufang', '', 0, '4', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(5, 1, 0, 'photo', '0', '图片', '', 't', 'tupian', '', 0, '5', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(6, 1, 0, 'video', '0', '视频', '', 's', 'shipin', '', 0, '6', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(7, 1, 0, 'special', '0', '专题', '', 'z', 'zhuanti', '', 0, '7', 0, '', 1, '', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"}}', 0);
REPLACE INTO `{dbprefix}1_share_category` VALUES(8, 0, 0, '', '0', '关于我们', '', 'g', 'guanyuwomen', '', 0, '8', 0, '', 1, '<p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);">PHP开源网站管理系统（PhpOpenSourceCMS，简称POSCMS）以开放、开源、灵活为产品理念，基于PHP+MYSQL+CI框架开发的开源Web内容管理系统，程序完美兼容PHP7，并在PHP7基础上做了性能优化，系统更加稳定，操作人性化、功能强大、扩展性强、<span style="word-wrap: break-word;">无任何加密代码</span>，二次开发及后期维护方便，可以帮您快速构建起一个强大专业的WEB网站系统、微信网站、APP服务端等应用。</span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">以PHP+MYSQL为开发语言、国外热门框架CodeIgniter为内核，全面支持PHP7平台，并在PHP7语言基础上做特殊性能优化，系统更稳定。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">1、CodeIgniter框架的性能始终优于大多数同类框架。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">2、安装包中包含《用户手册》，手册囊括了入门介绍、教程、“手把手”指导，还包括了框架组件的参考文档。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">3、只需&nbsp;PHP&nbsp;5.4&nbsp;以上版，完美支持PHP7，几乎可以运行在任何虚拟主机或云平台上。</span><br style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; color: rgb(84, 90, 108); font-size: 16px;"/><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">4、只需遵守几个注意事项，你就可以使用自己的编码规范和命名约定。CodeIgniter&nbsp;是来帮你的，而不是来添乱的。</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 20px; padding: 0px; white-space: normal; box-sizing: border-box; color: rgb(68, 68, 68); font-family: &quot;Open Sans&quot;, sans-serif; background-color: rgb(255, 255, 255);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block; color: rgb(51, 51, 51);"><span style="word-wrap: break-word; box-sizing: border-box; margin: 0px; padding: 0px; display: inline-block;">凭借成都天睿程序设计团队的不断创新精神和认真的工作态度，相信POSCMS能够为您带来全新的使用体验！</span></span></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">程序官网：<a target="_blank" href="http://www.phpkaiyuancms.com/" _src="http://www.phpkaiyuancms.com" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.phpkaiyuancms.com</a></p><p style="word-wrap: break-word; margin-top: 0px; margin-bottom: 10px; padding: 0px; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, &quot;Hiragino Sans GB&quot;, &quot;Helvetica Neue&quot;, Helvetica, tahoma, arial, &quot;WenQuanYi Micro Hei&quot;, Verdana, sans-serif, 宋体; white-space: normal; background-color: rgb(255, 255, 255);">产品论坛：<a target="_blank" href="http://www.wendacms.com/poscms/" style="word-wrap: break-word; outline: 0px; text-decoration-line: none; cursor: pointer; color: rgb(51, 51, 51);">www.wendacms.com/poscms</a></p><p><br/></p>', '{"1":{"add":"1","edit":"1","del":"1"},"2":{"add":"1","edit":"1","del":"1"},"3_1":{"add":"1","edit":"1","del":"1"},"3_2":{"add":"1","edit":"1","del":"1"},"3_3":{"add":"1","edit":"1","del":"1"},"3_4":{"add":"1","edit":"1","del":"1"},"4_5":{"add":"1","edit":"1","del":"1"},"4_6":{"add":"1","edit":"1","del":"1"},"4_7":{"add":"1","edit":"1","del":"1"},"4_8":{"add":"1","edit":"1","del":"1"}}', '{"edit":"0","linkurl":"","urlrule":"0","seo":{"show_title":"[\\u7b2c{page}\\u9875{join}]{title}{join}{catpname}{join}{SITE_NAME}","list_title":"[\\u7b2c{page}\\u9875{join}]{catpname}{join}{SITE_NAME}","list_keywords":"","list_description":""},"template":{"pagesize":"20","show":"show.html","category":"category.html","list":"list.html","search":"search.html","page":"page.html"},"admin":[],"member":[],"html":0,"getchild":0}', 0);

DROP TABLE IF EXISTS `{dbprefix}1_share_extend_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_share_extend_index` (
  `id` int(10) unsigned NOT NULL,
  `mid` varchar(22) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='共享模块扩展索引表';

REPLACE INTO `{dbprefix}1_share_extend_index` VALUES(1, 'book');
REPLACE INTO `{dbprefix}1_share_extend_index` VALUES(2, 'book');

DROP TABLE IF EXISTS `{dbprefix}1_share_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_share_index` (
  `id` int(10) unsigned NOT NULL,
  `mid` varchar(20) NOT NULL COMMENT '模块目录'
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='共享模块内容索引表';

REPLACE INTO `{dbprefix}1_share_index` VALUES(1, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(2, 'book');
REPLACE INTO `{dbprefix}1_share_index` VALUES(3, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(4, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(5, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(6, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(7, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(8, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(9, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(10, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(11, 'news');
REPLACE INTO `{dbprefix}1_share_index` VALUES(12, 'down');
REPLACE INTO `{dbprefix}1_share_index` VALUES(13, 'down');
REPLACE INTO `{dbprefix}1_share_index` VALUES(14, 'down');
REPLACE INTO `{dbprefix}1_share_index` VALUES(15, 'down');
REPLACE INTO `{dbprefix}1_share_index` VALUES(16, 'down');
REPLACE INTO `{dbprefix}1_share_index` VALUES(17, 'down');

DROP TABLE IF EXISTS `{dbprefix}1_special`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='主表';

DROP TABLE IF EXISTS `{dbprefix}1_special_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_special_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_special_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_special_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_special_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_special_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_special_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_special_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '内容',
  `banner` text,
  `guanlian` text,
  `template` varchar(250) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

DROP TABLE IF EXISTS `{dbprefix}1_special_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_special_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_special_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_special_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

DROP TABLE IF EXISTS `{dbprefix}1_special_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_special_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表';

DROP TABLE IF EXISTS `{dbprefix}1_special_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_special_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_special_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

DROP TABLE IF EXISTS `{dbprefix}1_special_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_special_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_tag` (
  `id` int(10) unsigned NOT NULL,
  `pid` int(10) DEFAULT '0' COMMENT '父级id',
  `name` varchar(200) NOT NULL COMMENT '关键词名称',
  `code` varchar(200) NOT NULL COMMENT '关键词代码（拼音）',
  `pcode` varchar(255) DEFAULT NULL,
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量',
  `url` varchar(255) DEFAULT NULL COMMENT '关键词url',
  `childids` varchar(255) NOT NULL COMMENT '子类集合',
  `content` text NOT NULL COMMENT '关键词描述',
  `total` int(10) NOT NULL COMMENT '点击数量',
  `displayorder` int(10) NOT NULL COMMENT '排序值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='关键词库表';

DROP TABLE IF EXISTS `{dbprefix}1_video`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `title` varchar(255) DEFAULT NULL COMMENT '主题',
  `thumb` varchar(255) DEFAULT NULL COMMENT '缩略图',
  `banner` varchar(255) DEFAULT NULL COMMENT '宣传图',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` text COMMENT '描述',
  `schedule` varchar(255) DEFAULT NULL COMMENT '进度情况',
  `year` smallint(4) DEFAULT NULL COMMENT '年代',
  `area` varchar(50) DEFAULT NULL COMMENT '地区',
  `director` varchar(50) DEFAULT NULL COMMENT '导演',
  `actor` varchar(50) DEFAULT NULL COMMENT '演员',
  `hits` mediumint(8) unsigned DEFAULT NULL COMMENT '浏览数',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `status` tinyint(2) NOT NULL COMMENT '状态',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `link_id` int(10) NOT NULL DEFAULT '0' COMMENT '同步id',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '附表id',
  `inputip` varchar(15) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `comments` int(10) unsigned NOT NULL COMMENT '评论数量',
  `favorites` int(10) unsigned NOT NULL COMMENT '收藏数量',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主表';

DROP TABLE IF EXISTS `{dbprefix}1_video_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='主题购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_video_category`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_category` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) NOT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `letter` char(1) NOT NULL COMMENT '首字母',
  `dirname` varchar(30) NOT NULL COMMENT '栏目目录',
  `pdirname` varchar(100) NOT NULL COMMENT '上级目录',
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否有下级',
  `childids` text NOT NULL COMMENT '下级所有id',
  `thumb` varchar(255) NOT NULL COMMENT '栏目图片',
  `show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `permission` text COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '属性配置',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目表';

DROP TABLE IF EXISTS `{dbprefix}1_video_category_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_category_data` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_video_category_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_category_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='栏目附加表';

DROP TABLE IF EXISTS `{dbprefix}1_video_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_video_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_video_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_video_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_data_0` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext COMMENT '简介'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附表';

DROP TABLE IF EXISTS `{dbprefix}1_video_draft`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_draft` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `eid` int(10) DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容草稿表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者名称',
  `preview` varchar(255) DEFAULT NULL COMMENT '视频预览图',
  `name` varchar(255) DEFAULT NULL COMMENT '分集名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '简单描述',
  `url` varchar(255) DEFAULT NULL COMMENT '地址',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `tableid` smallint(5) unsigned NOT NULL COMMENT '副表id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间',
  `hits` int(10) unsigned DEFAULT NULL COMMENT '浏览数',
  `comments` int(10) unsigned DEFAULT NULL COMMENT '评论数',
  `favorites` int(10) unsigned DEFAULT NULL COMMENT '收藏数',
  `displayorder` tinyint(3) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_buy`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_buy` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned NOT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `thumb` varchar(255) NOT NULL COMMENT '缩略图',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `score` int(10) unsigned NOT NULL COMMENT '使用虚拟币',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展购买记录表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_comment_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_comment_data_0` (
  `id` int(10) unsigned NOT NULL COMMENT '评论ID',
  `cid` int(10) unsigned NOT NULL COMMENT '关联id',
  `uid` mediumint(8) unsigned DEFAULT '0' COMMENT '会员ID',
  `url` varchar(250) DEFAULT NULL COMMENT '主题地址',
  `title` varchar(250) DEFAULT NULL COMMENT '主题名称',
  `author` varchar(250) DEFAULT NULL COMMENT '评论者',
  `content` text COMMENT '评论内容',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort2` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort3` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort4` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort5` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort6` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort7` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort8` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `sort9` tinyint(1) unsigned DEFAULT '0' COMMENT '评分值',
  `reply` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '回复id',
  `in_reply` tinyint(1) unsigned DEFAULT '0' COMMENT '是否存在回复',
  `status` smallint(1) unsigned DEFAULT '0' COMMENT '审核状态',
  `inputip` varchar(50) DEFAULT NULL COMMENT '录入者ip',
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论内容表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_comment_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_comment_index` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `support` int(10) unsigned DEFAULT '0' COMMENT '支持数',
  `oppose` int(10) unsigned DEFAULT '0' COMMENT '反对数',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数',
  `avgsort` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '平均分',
  `sort1` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort2` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort3` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort4` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort5` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort6` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort7` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort8` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `sort9` decimal(4,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '选项分数',
  `tableid` smallint(5) unsigned DEFAULT '0' COMMENT '附表id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论索引表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_comment_my`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_comment_my` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `title` varchar(250) DEFAULT NULL COMMENT '内容标题',
  `url` varchar(250) DEFAULT NULL COMMENT 'URL地址',
  `comments` int(10) unsigned DEFAULT '0' COMMENT '评论数量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='我的评论表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_data_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_data_0` (
  `id` int(10) unsigned NOT NULL,
  `cid` mediumint(8) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `body` text COMMENT '分集简介',
  `video` text COMMENT '视频信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_index` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展索引表';

DROP TABLE IF EXISTS `{dbprefix}1_video_extend_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_extend_verify` (
  `id` int(10) unsigned NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='扩展内容审核表';

DROP TABLE IF EXISTS `{dbprefix}1_video_favorite`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_favorite` (
  `id` int(10) unsigned NOT NULL COMMENT 'id',
  `cid` int(10) unsigned NOT NULL COMMENT '文档id',
  `eid` int(10) unsigned DEFAULT NULL COMMENT '扩展id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT 'uid',
  `url` varchar(255) NOT NULL COMMENT 'URL地址',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收藏夹表';

DROP TABLE IF EXISTS `{dbprefix}1_video_flag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_flag` (
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '文档标记id',
  `id` int(10) unsigned NOT NULL COMMENT '文档内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='标记表';

DROP TABLE IF EXISTS `{dbprefix}1_video_hits`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_hits` (
  `id` int(10) unsigned NOT NULL COMMENT '文章id',
  `hits` int(10) unsigned NOT NULL COMMENT '总点击数',
  `day_hits` int(10) unsigned NOT NULL COMMENT '本日点击',
  `week_hits` int(10) unsigned NOT NULL COMMENT '本周点击',
  `month_hits` int(10) unsigned NOT NULL COMMENT '本月点击',
  `year_hits` int(10) unsigned NOT NULL COMMENT '年点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='时段点击量统计';

DROP TABLE IF EXISTS `{dbprefix}1_video_html`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_html` (
  `id` bigint(18) unsigned NOT NULL,
  `rid` int(10) unsigned NOT NULL COMMENT '相关id',
  `cid` int(10) unsigned NOT NULL COMMENT '内容id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `type` tinyint(1) unsigned NOT NULL COMMENT '文件类型',
  `catid` tinyint(3) unsigned NOT NULL COMMENT '栏目id',
  `filepath` text NOT NULL COMMENT '文件地址'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='html文件存储表';

DROP TABLE IF EXISTS `{dbprefix}1_video_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_index` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容索引表';

DROP TABLE IF EXISTS `{dbprefix}1_video_search`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_search` (
  `id` varchar(32) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `params` text NOT NULL COMMENT '参数数组',
  `keyword` varchar(255) NOT NULL COMMENT '关键字',
  `contentid` mediumtext NOT NULL COMMENT 'id集合',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索表';

DROP TABLE IF EXISTS `{dbprefix}1_video_search_index`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_search_index` (
  `id` varchar(32) NOT NULL,
  `cid` int(10) unsigned NOT NULL COMMENT '文档Id',
  `inputtime` int(10) unsigned NOT NULL COMMENT '搜索时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='搜索索引表';

DROP TABLE IF EXISTS `{dbprefix}1_video_tag`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_tag` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(200) NOT NULL COMMENT 'tag名称',
  `code` varchar(200) NOT NULL COMMENT 'tag代码（拼音）',
  `hits` mediumint(8) unsigned NOT NULL COMMENT '点击量'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Tag标签表';

DROP TABLE IF EXISTS `{dbprefix}1_video_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}1_video_verify` (
  `id` int(10) unsigned NOT NULL,
  `catid` smallint(5) unsigned NOT NULL COMMENT '栏目id',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '作者uid',
  `author` varchar(50) NOT NULL COMMENT '作者',
  `status` tinyint(2) NOT NULL COMMENT '审核状态',
  `content` mediumtext NOT NULL COMMENT '具体内容',
  `backuid` mediumint(8) unsigned NOT NULL COMMENT '操作人uid',
  `backinfo` text NOT NULL COMMENT '操作退回信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='内容审核表';

DROP TABLE IF EXISTS `{dbprefix}admin`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin` (
  `uid` mediumint(8) unsigned NOT NULL,
  `realname` varchar(50) DEFAULT NULL COMMENT '管理员姓名',
  `usermenu` text COMMENT '自定义面板菜单，序列化数组格式',
  `color` text COMMENT '定制权限'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

REPLACE INTO `{dbprefix}admin` VALUES(1, '网站创始人', '', '');

DROP TABLE IF EXISTS `{dbprefix}admin_login`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_login` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='登录日志记录';

REPLACE INTO `{dbprefix}admin_login` VALUES(1, 1, '127.0.0.1', 1535526993, 'Windows 10 Chrome 68.0.3440.106');

DROP TABLE IF EXISTS `{dbprefix}admin_menu`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_menu` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单语言名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT '外链地址',
  `mark` varchar(100) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标标示'
) ENGINE=MyISAM AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

REPLACE INTO `{dbprefix}admin_menu` VALUES(1, 0, '首页', '', NULL, 'home', 0, 0, 'fa fa-home');
REPLACE INTO `{dbprefix}admin_menu` VALUES(2, 1, '控制台', '', NULL, 'home-home', 0, 0, 'fa fa-home');
REPLACE INTO `{dbprefix}admin_menu` VALUES(3, 2, '后台首页', 'admin/home/main', '', '', 0, 0, 'fa fa-home');
REPLACE INTO `{dbprefix}admin_menu` VALUES(4, 2, '资料修改', 'admin/root/my', '', '', 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}admin_menu` VALUES(5, 2, '登录日志', 'admin/root/log', '', '', 0, 0, 'fa fa-calendar-check-o');
REPLACE INTO `{dbprefix}admin_menu` VALUES(6, 2, '错误日志', 'admin/system/debug', '', '', 0, 0, 'fa fa-bug');
REPLACE INTO `{dbprefix}admin_menu` VALUES(7, 2, '操作日志', 'admin/system/oplog', '', '', 0, 0, 'fa fa-calendar');
REPLACE INTO `{dbprefix}admin_menu` VALUES(8, 0, '设置', '', NULL, 'cog', 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}admin_menu` VALUES(9, 8, '系统设置', '', NULL, 'cog-sys', 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}admin_menu` VALUES(10, 9, '系统设置', 'admin/system/index', '', '', 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}admin_menu` VALUES(11, 9, '分离配置', 'admin/system/file', '', '', 0, 0, 'fa fa-cubes');
REPLACE INTO `{dbprefix}admin_menu` VALUES(12, 9, '邮件设置', 'admin/mail/index', '', '', 0, 0, 'fa fa-envelope');
REPLACE INTO `{dbprefix}admin_menu` VALUES(13, 9, '短信设置', 'admin/sms/index', '', '', 0, 0, 'fa fa-envelope');
REPLACE INTO `{dbprefix}admin_menu` VALUES(14, 9, '会员设置', 'member/admin/setting/index', '', '', 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}admin_menu` VALUES(15, 9, '网银接口', 'member/admin/setting/pay', '', '', 0, 0, 'fa fa-rmb');
REPLACE INTO `{dbprefix}admin_menu` VALUES(16, 9, '多语言设置', 'admin/language/index', '', '', 0, 0, 'fa fa-users');
REPLACE INTO `{dbprefix}admin_menu` VALUES(17, 8, '网站设置', '', NULL, '', 0, 0, 'fa fa-globe');
REPLACE INTO `{dbprefix}admin_menu` VALUES(18, 17, '网站设置', 'admin/site/config', '', '', 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}admin_menu` VALUES(19, 17, '内容模块', 'admin/module/index', '', '', 0, 0, 'fa fa-cogs');
REPLACE INTO `{dbprefix}admin_menu` VALUES(20, 17, '网站表单', 'admin/form/index', '', '', 0, 0, 'fa fa-tasks');
REPLACE INTO `{dbprefix}admin_menu` VALUES(21, 17, '模块评论', 'admin/frame_comment/index', '', '', 0, 0, 'fa fa-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(22, 8, '权限设置', '', NULL, '', 0, 0, 'fa fa-users');
REPLACE INTO `{dbprefix}admin_menu` VALUES(23, 22, '后台菜单', 'admin/menu/index', '', '', 0, 0, 'fa fa-list');
REPLACE INTO `{dbprefix}admin_menu` VALUES(24, 22, '审核流程', 'admin/verify/index', '', '', 0, 0, 'fa fa-square');
REPLACE INTO `{dbprefix}admin_menu` VALUES(25, 22, '角色管理', 'admin/role/index', '', '', 0, 0, 'fa fa-users');
REPLACE INTO `{dbprefix}admin_menu` VALUES(26, 22, '会员权限', 'member/admin/setting/permission', '', '', 0, 0, 'fa fa-users');
REPLACE INTO `{dbprefix}admin_menu` VALUES(27, 22, '管理员管理', 'admin/root/index', '', '', 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}admin_menu` VALUES(28, 0, '内容', '', NULL, 'content', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(29, 28, '内容管理', '', NULL, 'content-content', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(30, 29, '共享栏目', 'admin/category_share/index', '', '', 0, 0, 'fa fa-list');
REPLACE INTO `{dbprefix}admin_menu` VALUES(31, 29, '生成静态', 'admin/html/index', '', '', 0, 0, 'fa fa-file');
REPLACE INTO `{dbprefix}admin_menu` VALUES(32, 29, '关键词库', 'admin/tag/index', '', '', 0, 0, 'fa fa-tag');
REPLACE INTO `{dbprefix}admin_menu` VALUES(33, 29, '附件管理', 'admin/attachment/index', '', '', 0, 0, 'fa fa-folder');
REPLACE INTO `{dbprefix}admin_menu` VALUES(34, 29, '自定义链接', 'admin/navigator/index', '', '', 0, 0, 'fa fa-map-marker');
REPLACE INTO `{dbprefix}admin_menu` VALUES(35, 29, '自定义页面', 'admin/page/index', '', '', 0, 0, 'fa fa-adn');
REPLACE INTO `{dbprefix}admin_menu` VALUES(36, 29, '自定义内容', 'admin/block/index', '', '', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(37, 29, '内容维护工具', 'admin/frame_content/index', '', '', 0, 0, 'fa fa-wrench');
REPLACE INTO `{dbprefix}admin_menu` VALUES(38, 28, '网站表单', '', NULL, 'content-form', 0, 0, 'fa fa-table');
REPLACE INTO `{dbprefix}admin_menu` VALUES(39, 0, '会员', '', NULL, 'member', 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}admin_menu` VALUES(40, 39, '会员管理', '', NULL, '', 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}admin_menu` VALUES(41, 40, '会员管理', 'member/admin/home/index', '', '', 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}admin_menu` VALUES(42, 40, '会员模型', 'member/admin/group/index', '', '', 0, 0, 'fa fa-users');
REPLACE INTO `{dbprefix}admin_menu` VALUES(43, 40, '财务流水', 'member/admin/pay/index', '', '', 0, 0, 'fa fa-calculator');
REPLACE INTO `{dbprefix}admin_menu` VALUES(44, 40, '会员菜单', 'member/admin/menu/index', '', '', 0, 0, 'fa fa-list');
REPLACE INTO `{dbprefix}admin_menu` VALUES(45, 40, '快捷登录', 'member/admin/setting/oauth', '', '', 0, 0, 'fa fa-weibo');
REPLACE INTO `{dbprefix}admin_menu` VALUES(46, 40, '自定义字段', 'admin/field/index/rname/member/rid/0', '', '', 0, 0, 'fa fa-code');
REPLACE INTO `{dbprefix}admin_menu` VALUES(47, 0, '插件', '', NULL, 'myapp', 0, 0, 'fa fa-puzzle-piece');
REPLACE INTO `{dbprefix}admin_menu` VALUES(48, 47, '系统插件', '', NULL, 'cog-sys', 0, 0, 'fa fa-puzzle-piece');
REPLACE INTO `{dbprefix}admin_menu` VALUES(49, 48, '系统提醒', 'admin/notice/index', '', '', 0, 0, 'fa fa-volume-down');
REPLACE INTO `{dbprefix}admin_menu` VALUES(50, 48, '任务队列', 'admin/cron/index', '', '', 0, 0, 'fa fa-forward');
REPLACE INTO `{dbprefix}admin_menu` VALUES(51, 48, 'URL规则', 'admin/urlrule/index', '', '', 0, 0, 'fa fa-magnet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(52, 48, '下载镜像', 'admin/downservers/index', '', '', 0, 0, 'fa fa-arrow-circle-down');
REPLACE INTO `{dbprefix}admin_menu` VALUES(53, 48, '远程附件', 'admin/attachment2/index', '', '', 0, 0, 'fa fa-upload');
REPLACE INTO `{dbprefix}admin_menu` VALUES(54, 48, '联动菜单', 'admin/linkage/index', '', '', 0, 0, 'fa fa-windows');
REPLACE INTO `{dbprefix}admin_menu` VALUES(55, 48, '全局变量', 'admin/sysvar/index', '', '', 0, 0, 'fa fa-tumblr');
REPLACE INTO `{dbprefix}admin_menu` VALUES(56, 48, '数据结构', 'admin/db/index', '', '', 0, 0, 'fa fa-database');
REPLACE INTO `{dbprefix}admin_menu` VALUES(57, 0, '云服务', '', NULL, 'yun', 0, 250, 'fa fa-cloud');
REPLACE INTO `{dbprefix}admin_menu` VALUES(58, 57, '云服务', '', NULL, 'yun-home', 0, 0, 'fa fa-cloud');
REPLACE INTO `{dbprefix}admin_menu` VALUES(59, 58, '程序升级', 'admin/upgrade/index', '', '', 0, 0, 'fa fa-refresh');
REPLACE INTO `{dbprefix}admin_menu` VALUES(60, 58, '使用文档', 'admin/api/helponline', '', '', 0, 0, 'fa fa-book');
REPLACE INTO `{dbprefix}admin_menu` VALUES(61, 58, '在线插件', 'admin/api/cjonline', '', '', 0, 0, 'fa fa-plug');
REPLACE INTO `{dbprefix}admin_menu` VALUES(62, 58, '功能模块', 'admin/api/mkonline', '', '', 0, 0, 'fa fa-cogs');
REPLACE INTO `{dbprefix}admin_menu` VALUES(63, 58, '网站模板', 'admin/api/mbonline', '', '', 0, 0, 'fa fa-code');
REPLACE INTO `{dbprefix}admin_menu` VALUES(64, 28, '新闻管理', '', NULL, 'module-news', 0, 0, 'fa fa-tasks');
REPLACE INTO `{dbprefix}admin_menu` VALUES(65, 64, '已通过文档', 'news/admin/home/index', NULL, 'module-news', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(66, 64, '待审核文档', 'news/admin/home/verify', NULL, 'module-news', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(67, 64, '我的草稿箱', 'news/admin/home/draft', NULL, 'module-news', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(68, 64, '评论管理', 'news/admin/comment/index', NULL, 'module-news', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(69, 28, '图书管理', '', NULL, 'module-book', 0, 0, 'fa fa-book');
REPLACE INTO `{dbprefix}admin_menu` VALUES(70, 69, '已通过图书', 'book/admin/home/index', NULL, 'module-book', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(71, 69, '待审核图书', 'book/admin/home/verify', NULL, 'module-book', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(72, 69, '已通过章节', 'book/admin/extend/index', NULL, 'module-book', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(73, 69, '待审核章节', 'book/admin/verify/index', NULL, 'module-book', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(74, 69, '我的草稿箱', 'book/admin/home/draft', NULL, 'module-book', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(75, 69, '评论管理', 'book/admin/comment/index', NULL, 'module-book', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(76, 69, '章节评论', 'book/admin/ecomment/index', NULL, 'module-book', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(77, 0, '功能演示', '', NULL, 'module-demo', 0, 0, 'fa fa-table');
REPLACE INTO `{dbprefix}admin_menu` VALUES(78, 77, '文档管理', '', NULL, 'module-demo', 0, 0, 'fa fa-table');
REPLACE INTO `{dbprefix}admin_menu` VALUES(79, 78, '已通过文档', 'demo/admin/home/index', NULL, 'module-demo', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(80, 78, '待审核文档', 'demo/admin/home/verify', NULL, 'module-demo', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(81, 78, '我的草稿箱', 'demo/admin/home/draft', NULL, 'module-demo', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(82, 78, '栏目分类', 'demo/admin/category/index', NULL, 'module-demo', 0, 0, 'fa fa-list');
REPLACE INTO `{dbprefix}admin_menu` VALUES(83, 78, 'Tag标签', 'demo/admin/tag/index', NULL, 'module-demo', 0, 0, 'fa fa-tags');
REPLACE INTO `{dbprefix}admin_menu` VALUES(84, 77, '新闻评论', '', NULL, 'module-demo', 0, 0, 'fa fa-tasks');
REPLACE INTO `{dbprefix}admin_menu` VALUES(85, 84, '评论设置', 'demo/admin/comment/config', NULL, 'module-demo', 0, 0, 'fa fa-cogs');
REPLACE INTO `{dbprefix}admin_menu` VALUES(86, 84, '评论管理', 'demo/admin/comment/index', NULL, 'module-demo', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(87, 84, '自定义字段', 'admin/field/index/rname/comment-module-demo/rid/0', NULL, 'module-demo', 0, 0, 'fa fa-plus');
REPLACE INTO `{dbprefix}admin_menu` VALUES(88, 77, '相关功能', '', NULL, 'module-demo', 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}admin_menu` VALUES(89, 88, '生成静态', 'demo/admin/home/html', NULL, 'module-demo', 0, 0, 'fa fa-html5');
REPLACE INTO `{dbprefix}admin_menu` VALUES(90, 88, '自定义字段', 'admin/field/index/rname/module/rid/3', NULL, 'module-demo', 0, 0, 'fa fa-plus');
REPLACE INTO `{dbprefix}admin_menu` VALUES(91, 88, '模块属性配置', 'admin/module/config/id/3', NULL, 'module-demo', 0, 0, 'fa fa-cogs');
REPLACE INTO `{dbprefix}admin_menu` VALUES(92, 77, '模板风格', '', NULL, 'module-demo', 0, 0, 'fa fa-folder');
REPLACE INTO `{dbprefix}admin_menu` VALUES(93, 28, '下载管理', '', NULL, 'module-down', 0, 0, 'fa fa-file-code-o');
REPLACE INTO `{dbprefix}admin_menu` VALUES(94, 93, '已通过软件', 'down/admin/home/index', NULL, 'module-down', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(95, 93, '待审核软件', 'down/admin/home/verify', NULL, 'module-down', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(96, 93, '我的草稿箱', 'down/admin/home/draft', NULL, 'module-down', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(97, 93, '评论管理', 'down/admin/comment/index', NULL, 'module-down', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(98, 28, '租房管理', '', NULL, 'module-fang', 0, 0, 'fa fa-reorder');
REPLACE INTO `{dbprefix}admin_menu` VALUES(99, 98, '已通过房源', 'fang/admin/home/index', NULL, 'module-fang', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(100, 98, '待审核房源', 'fang/admin/home/verify', NULL, 'module-fang', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(101, 98, '我的草稿箱', 'fang/admin/home/draft', NULL, 'module-fang', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(102, 98, '评论管理', 'fang/admin/comment/index', NULL, 'module-fang', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(103, 28, '图片管理', '', NULL, 'module-photo', 0, 0, 'fa fa-file-photo-o');
REPLACE INTO `{dbprefix}admin_menu` VALUES(104, 103, '已通过图片', 'photo/admin/home/index', NULL, 'module-photo', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(105, 103, '待审核图片', 'photo/admin/home/verify', NULL, 'module-photo', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(106, 103, '我的草稿箱', 'photo/admin/home/draft', NULL, 'module-photo', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(107, 103, '评论管理', 'photo/admin/comment/index', NULL, 'module-photo', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(108, 28, '专题管理', '', NULL, 'module-special', 0, 0, 'fa fa-table');
REPLACE INTO `{dbprefix}admin_menu` VALUES(109, 108, '已通过专题', 'special/admin/home/index', NULL, 'module-special', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(110, 108, '待审核专题', 'special/admin/home/verify', NULL, 'module-special', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(111, 108, '评论管理', 'special/admin/comment/index', NULL, 'module-special', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(112, 28, '视频管理', '', NULL, 'module-video', 0, 0, 'fa fa-file-video-o');
REPLACE INTO `{dbprefix}admin_menu` VALUES(113, 112, '已通过视频', 'video/admin/home/index', NULL, 'module-video', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(114, 112, '待审核视频', 'video/admin/home/verify', NULL, 'module-video', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(115, 112, '已通过分集', 'video/admin/extend/index', NULL, 'module-video', 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}admin_menu` VALUES(116, 112, '待审核分集', 'video/admin/verify/index', NULL, 'module-video', 0, 0, 'fa fa-retweet');
REPLACE INTO `{dbprefix}admin_menu` VALUES(117, 112, '我的草稿箱', 'video/admin/home/draft', NULL, 'module-video', 0, 0, 'fa fa-edit');
REPLACE INTO `{dbprefix}admin_menu` VALUES(118, 112, '评论管理', 'video/admin/comment/index', NULL, 'module-video', 0, 0, 'icon-comments');
REPLACE INTO `{dbprefix}admin_menu` VALUES(119, 112, '评论管理', 'video/admin/ecomment/index', NULL, 'module-video', 0, 0, 'icon-comments');

DROP TABLE IF EXISTS `{dbprefix}admin_notice`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_notice` (
  `id` int(10) NOT NULL COMMENT 'id',
  `type` varchar(20) NOT NULL COMMENT '提醒类型：系统、内容、会员、应用',
  `msg` text NOT NULL COMMENT '提醒内容说明',
  `uri` varchar(100) NOT NULL COMMENT '对应的URI',
  `to_rid` smallint(5) NOT NULL COMMENT '指定角色组',
  `to_uid` int(10) NOT NULL COMMENT '指定管理员',
  `status` tinyint(1) NOT NULL COMMENT '未处理0，1已查看，2处理中，3处理完成',
  `uid` int(10) NOT NULL COMMENT '处理人',
  `username` varchar(100) NOT NULL COMMENT '处理人',
  `updatetime` int(10) NOT NULL COMMENT '处理时间',
  `inputtime` int(10) NOT NULL COMMENT '提醒时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台提醒表';

DROP TABLE IF EXISTS `{dbprefix}admin_role`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_role` (
  `id` smallint(5) NOT NULL,
  `site` text NOT NULL COMMENT '允许管理的站点，序列化数组格式',
  `name` text NOT NULL COMMENT '角色组语言名称',
  `system` text NOT NULL COMMENT '系统权限',
  `module` text NOT NULL COMMENT '模块权限',
  `application` text NOT NULL COMMENT '应用权限'
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='后台角色权限表';

REPLACE INTO `{dbprefix}admin_role` VALUES(1, '', '超级管理员', '', '', '');
REPLACE INTO `{dbprefix}admin_role` VALUES(2, '', '网站编辑员', '', '', '');

DROP TABLE IF EXISTS `{dbprefix}admin_verify`;
CREATE TABLE IF NOT EXISTS `{dbprefix}admin_verify` (
  `id` smallint(5) unsigned NOT NULL,
  `name` text NOT NULL COMMENT '名称',
  `verify` text NOT NULL COMMENT '审核部署'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='审核管理表';

REPLACE INTO `{dbprefix}admin_verify` VALUES(1, '审核一次', 'a:1:{i:1;a:2:{i:0;s:1:\\"2\\";i:1;s:1:\\"3\\";}}');

DROP TABLE IF EXISTS `{dbprefix}application`;
CREATE TABLE IF NOT EXISTS `{dbprefix}application` (
  `id` smallint(5) unsigned NOT NULL,
  `module` text COMMENT '模块划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) DEFAULT '0' COMMENT '是否禁用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='应用表';

DROP TABLE IF EXISTS `{dbprefix}attachment`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment` (
  `id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `tableid` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '附件副表id',
  `download` mediumint(8) NOT NULL DEFAULT '0' COMMENT '下载次数',
  `filesize` int(10) unsigned NOT NULL COMMENT '文件大小',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filemd5` varchar(50) NOT NULL COMMENT '文件md5值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

DROP TABLE IF EXISTS `{dbprefix}attachment_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_0` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表0';

DROP TABLE IF EXISTS `{dbprefix}attachment_1`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_1` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表1';

DROP TABLE IF EXISTS `{dbprefix}attachment_2`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_2` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表2';

DROP TABLE IF EXISTS `{dbprefix}attachment_3`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_3` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表3';

DROP TABLE IF EXISTS `{dbprefix}attachment_4`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_4` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表4';

DROP TABLE IF EXISTS `{dbprefix}attachment_5`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_5` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表5';

DROP TABLE IF EXISTS `{dbprefix}attachment_6`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_6` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表6';

DROP TABLE IF EXISTS `{dbprefix}attachment_7`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_7` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表7';

DROP TABLE IF EXISTS `{dbprefix}attachment_8`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_8` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表8';

DROP TABLE IF EXISTS `{dbprefix}attachment_9`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_9` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `related` varchar(50) NOT NULL COMMENT '相关表标识',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表9';

DROP TABLE IF EXISTS `{dbprefix}attachment_unused`;
CREATE TABLE IF NOT EXISTS `{dbprefix}attachment_unused` (
  `id` mediumint(8) unsigned NOT NULL COMMENT '附件id',
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '会员id',
  `author` varchar(50) NOT NULL COMMENT '会员',
  `siteid` tinyint(3) unsigned NOT NULL COMMENT '站点id',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '原文件名',
  `fileext` varchar(20) NOT NULL COMMENT '文件扩展名',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `attachment` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器路径',
  `remote` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '远程附件id',
  `attachinfo` text NOT NULL COMMENT '附件信息',
  `inputtime` int(10) unsigned NOT NULL COMMENT '入库时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='未使用的附件表';

DROP TABLE IF EXISTS `{dbprefix}comment`;
CREATE TABLE IF NOT EXISTS `{dbprefix}comment` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `value` text COMMENT '配置信息',
  `field` text COMMENT '自定义字段信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论配置表';

DROP TABLE IF EXISTS `{dbprefix}controller`;
CREATE TABLE IF NOT EXISTS `{dbprefix}controller` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '名称',
  `app` varchar(100) NOT NULL COMMENT '网站,会员,后台',
  `type` tinyint(1) unsigned NOT NULL COMMENT '前台0会员1后台2',
  `cname` varchar(100) NOT NULL COMMENT '控制器名称',
  `file` varchar(100) NOT NULL COMMENT '文件路径',
  `url` varchar(255) NOT NULL COMMENT '访问地址',
  `meta_title` varchar(255) NOT NULL COMMENT '网页标题',
  `meta_keywords` varchar(255) NOT NULL COMMENT '网页关键字',
  `meta_description` varchar(255) NOT NULL COMMENT '网页描述',
  `inputtime` int(10) unsigned NOT NULL COMMENT '录入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义控制器表';

DROP TABLE IF EXISTS `{dbprefix}cron_queue`;
CREATE TABLE IF NOT EXISTS `{dbprefix}cron_queue` (
  `id` int(10) NOT NULL,
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '值',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `error` varchar(255) NOT NULL COMMENT '错误信息',
  `updatetime` int(10) unsigned NOT NULL COMMENT '执行时间',
  `inputtime` int(10) unsigned NOT NULL COMMENT '写入时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务队列表';

DROP TABLE IF EXISTS `{dbprefix}downservers`;
CREATE TABLE IF NOT EXISTS `{dbprefix}downservers` (
  `id` tinyint(3) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '服务器名',
  `server` varchar(255) NOT NULL COMMENT '服务器地址',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='下载镜像服务器';

DROP TABLE IF EXISTS `{dbprefix}field`;
CREATE TABLE IF NOT EXISTS `{dbprefix}field` (
  `id` smallint(5) unsigned NOT NULL,
  `name` text NOT NULL COMMENT '字段别名语言',
  `fieldname` varchar(50) NOT NULL COMMENT '字段名称',
  `fieldtype` varchar(50) NOT NULL COMMENT '字段类型',
  `relatedid` smallint(5) unsigned NOT NULL COMMENT '相关id',
  `relatedname` varchar(50) NOT NULL COMMENT '相关表',
  `isedit` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可修改',
  `ismain` tinyint(1) unsigned NOT NULL COMMENT '是否主表',
  `issystem` tinyint(1) unsigned NOT NULL COMMENT '是否系统表',
  `ismember` tinyint(1) unsigned NOT NULL COMMENT '是否会员可见',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否可搜索',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '禁用？',
  `setting` text NOT NULL COMMENT '配置信息',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COMMENT='字段表';

REPLACE INTO `{dbprefix}field` VALUES(1, '相关附件', 'attachment', 'Files', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:5:{s:5:"width";s:3:"80%";s:4:"size";s:1:"2";s:5:"count";s:2:"10";s:3:"ext";s:31:"jpg,gif,png,ppt,doc,xls,rar,zip";s:10:"uploadpath";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"0";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"0";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(2, '单页内容', 'content', 'Ueditor', 1, 'page', 1, 1, 1, 1, 0, 0, 'a:2:{s:6:"option";a:7:{s:5:"width";s:3:"90%";s:6:"height";s:3:"400";s:4:"mode";s:1:"1";s:4:"tool";s:0:"";s:5:"mode2";s:1:"1";s:5:"tool2";s:0:"";s:5:"value";s:0:"";}s:8:"validate";a:9:{s:8:"required";s:1:"1";s:7:"pattern";s:0:"";s:9:"errortips";s:0:"";s:6:"isedit";s:1:"0";s:3:"xss";s:1:"1";s:5:"check";s:0:"";s:6:"filter";s:0:"";s:4:"tips";s:0:"";s:8:"formattr";s:0:"";}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(3, '主题', 'title', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(4, '缩略图', 'thumb', 'File', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(5, '关键字', 'keywords', 'Text', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(6, '描述', 'description', 'Textarea', 1, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(7, '内容', 'content', 'Ueditor', 1, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":1,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(8, '书名', 'title', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(9, '封面图', 'thumb', 'File', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(10, '关键字', 'keywords', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(11, '描述', 'description', 'Textarea', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(12, '进度情况', 'schedule', 'Text', 2, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":157,"value":"\\u8fde\\u8f7d\\u4e2d","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(13, '简介', 'content', 'Ueditor', 2, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":2,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(14, '章节名', 'name', 'Text', 2, 'extend', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(15, '内容', 'body', 'Ueditor', 2, 'extend', 1, 0, 1, 1, 1, 0, '{"option":{"mode":1,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(16, '复选框', 'fuxuankuang', 'Checkbox', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(17, '颜色选取（放右边）', 'ysxqfyb', 'Color', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"field":"title","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"1"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(18, '阅读收费', 'yuedushoufei', 'Fees', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"80%"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(19, '单个文件', 'dangewenjian', 'File', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"size":"12","ext":"zip","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(20, '多个文件或图片', 'dgwjhtp', 'Files', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"90%","size":"10","count":"10","ext":"jpg,gif,png,exe,rar,zip","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(21, '图片专用', 'tpzy', 'Image', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"80%","size":"10","count":"5","autodown":"0","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(22, '联动菜单', 'ldcd', 'Linkage', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"linkage":"address","value":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(23, '商品属性', 'spsx', 'Property', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"100%"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(24, '内容关联（新闻）', 'nrglxw', 'Related', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"module":"news","width":"90%","limit":"22"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(25, '视频文件', 'spwj', 'Video', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"90%","size":"10","ext":"mp4","uploadpath":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(26, '单选按钮', 'danxuananniu', 'Radio', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":"","fieldtype":"","fieldlength":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(27, '下拉选择', 'xialaxuanze', 'Select', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"options":"\\u9009\\u9879\\u540d\\u79f01|1\\n\\u9009\\u9879\\u540d\\u79f02|2\\n\\u9009\\u9879\\u540d\\u79f03|3","value":"","fieldtype":"","fieldlength":""},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(28, '百度地图', 'baiduditu', 'Baidumap', 3, 'module', 1, 1, 1, 0, 1, 0, '{"option":{"width":"700","height":"430","level":"15","city":"\\u5317\\u4eac"},"validate":{"required":"0","pattern":"","errortips":"","check":"","filter":"","tips":"","formattr":""},"is_right":"0"}', 0);
REPLACE INTO `{dbprefix}field` VALUES(29, '主题', 'title', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(30, '缩略图', 'thumb', 'File', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(31, '关键字', 'keywords', 'Text', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(32, '描述', 'description', 'Textarea', 3, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(33, '内容', 'content', 'Ueditor', 3, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":1,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(34, '软件名称', 'title', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\"","required":1}}', 1);
REPLACE INTO `{dbprefix}field` VALUES(35, '缩略图', 'thumb', 'File', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 97);
REPLACE INTO `{dbprefix}field` VALUES(36, '关键字', 'keywords', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 4);
REPLACE INTO `{dbprefix}field` VALUES(37, '描述', 'description', 'Textarea', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 5);
REPLACE INTO `{dbprefix}field` VALUES(38, '软件版本', 'version', 'Text', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1}}', 2);
REPLACE INTO `{dbprefix}field` VALUES(39, '软件语言', 'language', 'Select', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"\\u7b80\\u4f53\\u4e2d\\u6587\\r\\n\\u7e41\\u4f53\\u4e2d\\u6587\\r\\n\\u82f1\\u6587\\r\\n\\u591a\\u56fd\\u8bed\\u8a00"},"validate":{"xss":1}}', 7);
REPLACE INTO `{dbprefix}field` VALUES(40, '软件授权', 'license', 'Select', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"\\u5171\\u4eab\\u7248\\r\\n\\u514d\\u8d39\\u7248\\r\\n\\u5546\\u4e1a\\u7248\\r\\n\\u8bd5\\u7528\\u7248\\r\\n\\u5f00\\u6e90\\u8f6f\\u4ef6"},"validate":{"xss":1}}', 8);
REPLACE INTO `{dbprefix}field` VALUES(41, '适用环境', 'os', 'Checkbox', 4, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"options":"WinXp\\r\\nWin7\\r\\nWin8\\r\\nLinux\\r\\nMac"},"validate":{"xss":1}}', 9);
REPLACE INTO `{dbprefix}field` VALUES(42, '演示地址', 'demo', 'Text', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"prep_url"}}', 11);
REPLACE INTO `{dbprefix}field` VALUES(43, '官方网站', 'siteurl', 'Text', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"prep_url"}}', 10);
REPLACE INTO `{dbprefix}field` VALUES(44, '上传文件', 'file', 'File', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"zip,rar,7z,tar,gz","size":10,"count":1}}', 3);
REPLACE INTO `{dbprefix}field` VALUES(45, '更多图片', 'images', 'Files', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"gif,png,jpg","size":10,"count":10}}', 98);
REPLACE INTO `{dbprefix}field` VALUES(46, '软件简介', 'content', 'Ueditor', 4, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":2,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 99);
REPLACE INTO `{dbprefix}field` VALUES(47, '租金类型', 'zujinleixing', 'Select', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u62bc\\u4e00\\u4ed8\\u4e09\\n\\u62bc\\u4e00\\u4ed8\\u4e8c\\n\\u62bc\\u4e00\\u4ed8\\u4e00\\n\\u534a\\u5e74\\u4ed8\\n\\u5e74\\u4ed8\\n\\u9762\\u8bae","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(48, '租金', 'zujin', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(49, '所在层', 'suozaiceng', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(50, '总层', 'zongceng', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(51, '朝向', 'chaoxiang', 'Select', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u5357\\u5317\\u901a\\u900f\\n\\u4e1c\\u897f\\u5411\\n\\u671d\\u5357\\n\\u671d\\u5317\\n\\u671d\\u4e1c\\n\\u671d\\u897f","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(52, '装修', 'zhuangxiu', 'Select', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u6bdb\\u576f\\n\\u7b80\\u88c5\\u4fee\\n\\u4e2d\\u7b49\\u88c5\\u4fee\\n\\u7cbe\\u88c5\\u4fee\\n\\u8c6a\\u534e\\u88c5\\u4fee","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(53, '面积', 'mianji', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(54, '卫', 'wei', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(55, '厅', 'ting', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(56, '室', 'shi', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"50","value":"","fieldtype":"INT","fieldlength":"20"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(57, '户型', 'huxing', 'Select', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"options":"\\u4e00\\u5c45\\n\\u4e8c\\u5c45\\n\\u4e09\\u5c45\\n\\u56db\\u5c45\\n\\u56db\\u5c45\\u4ee5\\u4e0a","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(58, '位置', 'weizhi', 'Baidumap', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"700","height":"430","level":"15","city":"\\u6210\\u90fd"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 8);
REPLACE INTO `{dbprefix}field` VALUES(59, '小区名称', 'xiaoqumingcheng', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 6);
REPLACE INTO `{dbprefix}field` VALUES(60, '地址', 'dizhi', 'Text', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":"500","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 7);
REPLACE INTO `{dbprefix}field` VALUES(61, '区域', 'area', 'Linkage', 5, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"linkage":"address","value":""},"validate":{"xss":"0","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 5);
REPLACE INTO `{dbprefix}field` VALUES(62, '主题', 'title', 'Text', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":"400","value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 1);
REPLACE INTO `{dbprefix}field` VALUES(63, '缩略图', 'thumb', 'File', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"size":"10","ext":"jpg,gif,png","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 3);
REPLACE INTO `{dbprefix}field` VALUES(64, '关键字', 'keywords', 'Text', 5, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":"400","value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":"1","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","formattr":" data-role=\\"tagsinput\\""}}', 2);
REPLACE INTO `{dbprefix}field` VALUES(65, '描述', 'description', 'Textarea', 5, 'module', 1, 1, 1, 1, 1, 1, '{"option":{"width":"500","height":"60","value":""},"validate":{"xss":"1","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"{dbprefix}clearhtml","tips":"","formattr":""}}', 99);
REPLACE INTO `{dbprefix}field` VALUES(66, '联系人', 'lianxiren', 'Text', 5, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"200","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 13);
REPLACE INTO `{dbprefix}field` VALUES(67, '房屋图片', 'images', 'Files', 5, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"80%","size":"5","count":"5","ext":"gif,png,jpg","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
REPLACE INTO `{dbprefix}field` VALUES(68, '租金', 'zujin2', 'Group', 5, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"value":"<label>{zujin}<\\/label><label>\\u5143\\/\\u6708\\uff0c<\\/label><label>{zujinleixing}<\\/label>"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 11);
REPLACE INTO `{dbprefix}field` VALUES(69, '房屋状况', 'fangwuzhuangkuang', 'Group', 5, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"value":"<label>\\u5ba4<\\/label><label>{shi}<\\/label><label>\\uff0c\\u5385<\\/label><label>{ting}<\\/label><label> \\uff0c\\u536b<\\/label><label>{wei}<\\/label><label>\\uff0c<\\/label><label>{mianji}<\\/label><label>\\u5e73\\u7c73\\uff0c\\u7b2c<\\/label><label>{suozaiceng}<\\/label><label>\\u5c42\\uff0c\\u5171<\\/label><label>{zongceng}<\\/label><label>\\u5c42\\uff0c<\\/label><label>{huxing}<\\/label><label> {zhuangxiu}<\\/label><label> {chaoxiang}<\\/label>"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"a:1:{s:5:\\\\","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 9);
REPLACE INTO `{dbprefix}field` VALUES(70, '配套', 'peitao', 'Checkbox', 5, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"options":"\\u62ce\\u5305\\u5165\\u4f4f\\n\\u5bb6\\u7535\\u9f50\\u5168\\n\\u53ef\\u4e0a\\u7f51\\n\\u53ef\\u505a\\u996d\\n\\u53ef\\u6d17\\u6fa1\\n\\u7a7a\\u8c03\\u623f\\n\\u53ef\\u770b\\u7535\\u89c6\\n\\u6709\\u6696\\u6c14\\n\\u6709\\u8f66\\u4f4d","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 10);
REPLACE INTO `{dbprefix}field` VALUES(71, '联系电话', 'lianxidianhua', 'Text', 5, 'module', 1, 0, 0, 1, 1, 0, '{"option":{"width":"300","value":"","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 14);
REPLACE INTO `{dbprefix}field` VALUES(72, '内容', 'content', 'Ueditor', 5, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"100%","height":"400","mode":"2","tool":"''bold'', ''italic'', ''underline''","value":""},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 99);
REPLACE INTO `{dbprefix}field` VALUES(73, '主题', 'title', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(74, '缩略图', 'thumb', 'File', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(75, '关键字', 'keywords', 'Text', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(76, '描述', 'description', 'Textarea', 6, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(77, '图片', 'images', 'Files', 6, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"gif,png,jpg","size":10,"count":10}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(78, '详情', 'content', 'Ueditor', 6, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":2,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(79, '主题', 'title', 'Text', 7, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 1);
REPLACE INTO `{dbprefix}field` VALUES(80, '缩略图', 'thumb', 'File', 7, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"}}', 3);
REPLACE INTO `{dbprefix}field` VALUES(81, '关键字', 'keywords', 'Text', 7, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 2);
REPLACE INTO `{dbprefix}field` VALUES(82, '描述', 'description', 'Textarea', 7, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 98);
REPLACE INTO `{dbprefix}field` VALUES(83, '模板文件', 'template', 'Text', 7, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"157","value":"show.html","fieldtype":"","fieldlength":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"\\u4e5f\\u53ef\\u4ee5\\u5728\\u8fd9\\u91cc\\u6307\\u5b9a\\u6a21\\u677f\\u6587\\u4ef6","formattr":""}}', 100);
REPLACE INTO `{dbprefix}field` VALUES(84, '新闻关联', 'guanlian', 'Related', 7, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"module":"news","width":"80%"},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
REPLACE INTO `{dbprefix}field` VALUES(85, '封面图', 'banner', 'Files', 7, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"80%","size":"2","count":"10","ext":"gif,png,jpg","uploadpath":""},"validate":{"xss":"0","required":"0","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 4);
REPLACE INTO `{dbprefix}field` VALUES(86, '简介', 'content', 'Ueditor', 7, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"width":"90%","height":"400","mode":"2","tool":"''bold'', ''italic'', ''underline''","value":""},"validate":{"xss":"1","required":"1","pattern":"","errortips":"","isedit":"0","check":"","filter":"","tips":"","formattr":""}}', 99);
REPLACE INTO `{dbprefix}field` VALUES(87, '名称', 'title', 'Text', 8, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1,"formattr":"onblur=\\"check_title();get_keywords(''keywords'');\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(88, '封面图', 'thumb', 'File', 8, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"tips":"\\u89c6\\u9891\\u5c01\\u9762\\u5c0f\\u56fe"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(89, '宣传图', 'banner', 'File', 8, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"tips":"\\u89c6\\u9891\\u5c01\\u9762\\u5927\\u56fe\\uff0c\\u7528\\u4e8e\\u9996\\u9875\\u5e7b\\u706f\\uff0c\\u5185\\u5bb9\\u9875Banner"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(90, '关键字', 'keywords', 'Text', 8, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"formattr":" data-role=\\"tagsinput\\""}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(91, '描述', 'description', 'Textarea', 8, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":500,"height":60,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(92, '进度情况', 'schedule', 'Text', 8, 'module', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"value":"\\u8fde\\u8f7d\\u4e2d","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"filter":"{dbprefix}clearhtml"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(93, '年代', 'year', 'Text', 8, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":200,"value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"tips":"\\u683c\\u5f0f\\u4e3a\\uff1a2013","filter":"intval"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(94, '地区', 'area', 'Select', 8, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":200,"value":"\\u5927\\u9646","options":"\\u5927\\u9646\\r\\n\\u9999\\u6e2f\\r\\n\\u53f0\\u6e7e\\r\\n\\u7f8e\\u56fd\\r\\n\\u97e9\\u56fd\\r\\n\\u65e5\\u672c\\r\\n\\u6b27\\u6d32\\r\\n\\u82f1\\u56fd\\r\\n\\u5176\\u4ed6"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(95, '导演', 'director', 'Text', 8, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":200,"value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"tips":"\\u591a\\u4e2a\\u5bfc\\u6f14\\u4ee5,\\u5206\\u9694"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(96, '演员', 'actor', 'Text', 8, 'module', 1, 1, 0, 1, 1, 0, '{"option":{"width":300,"value":"","fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"tips":"\\u591a\\u4e2a\\u6f14\\u5458\\u4ee5,\\u5206\\u9694"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(97, '简介', 'content', 'Ueditor', 8, 'module', 1, 0, 1, 1, 1, 0, '{"option":{"mode":2,"width":"90%","height":400},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(98, '预览图', 'preview', 'File', 8, 'extend', 1, 1, 1, 1, 1, 0, '{"option":{"ext":"jpg,gif,png","size":10,"width":400,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"tips":"\\u89c6\\u9891\\u7684\\u9884\\u89c8\\u56fe\\u7247"}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(99, '分集名称', 'name', 'Text', 8, 'extend', 1, 1, 1, 1, 1, 0, '{"option":{"width":200,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1,"required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(100, '简单描述', 'desc', 'Text', 8, 'extend', 1, 1, 1, 1, 1, 0, '{"option":{"width":300,"fieldtype":"VARCHAR","fieldlength":"255"},"validate":{"xss":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(101, '视频信息', 'video', 'Video', 8, 'extend', 1, 0, 1, 1, 1, 0, '{"option":{"ext":"mp4","size":10,"width":"90%"},"validate":{"tips":"","required":1}}', 0);
REPLACE INTO `{dbprefix}field` VALUES(102, '分集简介', 'body', 'Ueditor', 8, 'extend', 1, 0, 1, 1, 1, 0, '{"option":{"mode":2,"width":"90%","height":300},"validate":{"xss":1}}', 0);

DROP TABLE IF EXISTS `{dbprefix}linkage`;
CREATE TABLE IF NOT EXISTS `{dbprefix}linkage` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '菜单名称',
  `type` tinyint(1) unsigned NOT NULL,
  `code` char(20) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='联动菜单表';

REPLACE INTO `{dbprefix}linkage` VALUES(1, '中国地区', 0, 'address');

DROP TABLE IF EXISTS `{dbprefix}linkage_data_1`;
CREATE TABLE IF NOT EXISTS `{dbprefix}linkage_data_1` (
  `id` mediumint(8) unsigned NOT NULL,
  `site` mediumint(5) unsigned NOT NULL COMMENT '站点id',
  `pid` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '上级id',
  `pids` varchar(255) DEFAULT NULL COMMENT '所有上级id',
  `name` varchar(30) NOT NULL COMMENT '栏目名称',
  `cname` varchar(30) NOT NULL COMMENT '别名',
  `child` tinyint(1) unsigned DEFAULT '0' COMMENT '是否有下级',
  `hidden` tinyint(1) unsigned DEFAULT '0' COMMENT '前端隐藏',
  `childids` text COMMENT '下级所有id',
  `displayorder` tinyint(3) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='联动菜单数据表';

REPLACE INTO `{dbprefix}linkage_data_1` VALUES(1, 1, 0, '0', '地区1', 'diqu1', 0, 0, '1', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(2, 1, 0, '0', '城市', 'chengshi', 0, 0, '2', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(3, 1, 0, '0', '北京', 'beijing', 0, 0, '3', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(4, 1, 0, '0', '洞子口', 'dongzikou', 0, 0, '4', 0);
REPLACE INTO `{dbprefix}linkage_data_1` VALUES(5, 1, 0, '0', '细河区', 'xihequ', 0, 0, '5', 0);

DROP TABLE IF EXISTS `{dbprefix}mail_queue`;
CREATE TABLE IF NOT EXISTS `{dbprefix}mail_queue` (
  `id` int(10) unsigned NOT NULL,
  `email` varchar(50) NOT NULL COMMENT '邮件地址',
  `subject` varchar(255) NOT NULL COMMENT '邮件标题',
  `message` text NOT NULL COMMENT '邮件内容',
  `status` tinyint(1) unsigned NOT NULL COMMENT '发送状态',
  `updatetime` int(10) unsigned NOT NULL COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件队列表';

DROP TABLE IF EXISTS `{dbprefix}mail_smtp`;
CREATE TABLE IF NOT EXISTS `{dbprefix}mail_smtp` (
  `id` smallint(5) unsigned NOT NULL,
  `host` varchar(255) NOT NULL,
  `user` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `port` mediumint(8) unsigned NOT NULL,
  `displayorder` tinyint(2) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='邮件账户表';

DROP TABLE IF EXISTS `{dbprefix}member`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member` (
  `uid` mediumint(8) unsigned NOT NULL,
  `email` char(40) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` char(32) NOT NULL DEFAULT '' COMMENT '加密密码',
  `salt` char(10) NOT NULL COMMENT '随机加密码',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` char(20) NOT NULL COMMENT '手机号码',
  `avatar` varchar(255) NOT NULL COMMENT '头像地址',
  `money` decimal(10,2) unsigned NOT NULL COMMENT 'RMB',
  `freeze` decimal(10,2) unsigned NOT NULL COMMENT '冻结RMB',
  `spend` decimal(10,2) unsigned NOT NULL COMMENT '消费RMB总额',
  `score` int(10) unsigned NOT NULL COMMENT '虚拟币',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值',
  `adminid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '管理组id',
  `groupid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '用户组id',
  `levelid` smallint(5) unsigned NOT NULL COMMENT '会员级别',
  `overdue` int(10) unsigned NOT NULL COMMENT '到期时间',
  `regip` varchar(15) NOT NULL COMMENT '注册ip',
  `regtime` int(10) unsigned NOT NULL COMMENT '注册时间',
  `randcode` mediumint(6) unsigned NOT NULL COMMENT '随机验证码',
  `ismobile` tinyint(1) unsigned DEFAULT NULL COMMENT '手机认证标识'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员表';

REPLACE INTO `{dbprefix}member` VALUES(1, 'admin2@qq.com', 'admin', 'b552218f3245e8efe1ccc62c3178b8a2', 'd645920e39', '', '', '', '9999.00', '0.00', '0.00', 10000, 10000, 1, 3, 4, 0, '', 0, 0, 0);

DROP TABLE IF EXISTS `{dbprefix}member_address`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_address` (
  `id` mediumint(8) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员id',
  `city` mediumint(8) unsigned NOT NULL COMMENT '城市id',
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `zipcode` varchar(10) NOT NULL COMMENT '邮编',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `default` tinyint(1) unsigned NOT NULL COMMENT '是否默认'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员收货地址表';

DROP TABLE IF EXISTS `{dbprefix}member_data`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_data` (
  `uid` mediumint(8) unsigned NOT NULL,
  `complete` tinyint(1) unsigned NOT NULL COMMENT '完善资料标识',
  `is_auth` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '实名认证标识'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员表';

DROP TABLE IF EXISTS `{dbprefix}member_group`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_group` (
  `id` smallint(5) unsigned NOT NULL,
  `name` text NOT NULL COMMENT '会员组名称',
  `theme` varchar(255) NOT NULL COMMENT '风格目录',
  `template` varchar(50) NOT NULL COMMENT '模板目录',
  `price` decimal(10,2) NOT NULL COMMENT '售价',
  `unit` tinyint(1) unsigned NOT NULL COMMENT '价格单位:1虚拟卡，2金钱',
  `limit` tinyint(1) unsigned NOT NULL COMMENT '售价限制：1月，2半年，3年',
  `overdue` smallint(5) unsigned NOT NULL COMMENT '过期后变成的组',
  `allowregister` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员注册',
  `allowapply` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请',
  `allowapply_orther` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员申请其他组',
  `allowspace` tinyint(1) unsigned NOT NULL COMMENT '是否允许会员空间',
  `allowfield` text NOT NULL COMMENT '可用字段，序列化数组格式',
  `spacefield` text NOT NULL COMMENT '空间字段，序列化数组格式',
  `spacedomain` tinyint(1) unsigned DEFAULT NULL COMMENT '是否启用空间域名',
  `spacetemplate` varchar(50) DEFAULT NULL COMMENT '空间默认模板',
  `displayorder` tinyint(3) NOT NULL COMMENT '排序'
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='会员组表';

REPLACE INTO `{dbprefix}member_group` VALUES(1, '待审核会员', 'default', 'default', '0.00', 1, 1, 0, 0, 0, 0, 0, '', '', 1, 'default', 0);
REPLACE INTO `{dbprefix}member_group` VALUES(2, '快捷登录', 'default', 'default', '0.00', 0, 0, 0, 0, 0, 0, 0, '', '', 1, 'default', 0);
REPLACE INTO `{dbprefix}member_group` VALUES(3, '普通会员', 'default', 'default', '0.00', 1, 1, 3, 0, 1, 0, 1, '', '', 1, 'default', 0);
REPLACE INTO `{dbprefix}member_group` VALUES(4, '商业会员', 'default', 'default', '10.00', 2, 1, 3, 1, 0, 0, 1, '', '', 1, 'default', 0);

DROP TABLE IF EXISTS `{dbprefix}member_level`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_level` (
  `id` smallint(5) unsigned NOT NULL,
  `groupid` smallint(5) unsigned NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '会员级别名称',
  `stars` tinyint(2) NOT NULL COMMENT '星星数量',
  `experience` int(10) unsigned NOT NULL COMMENT '经验值要求',
  `allowupgrade` tinyint(1) NOT NULL COMMENT '允许自动升级'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='会员级别表';

REPLACE INTO `{dbprefix}member_level` VALUES(1, 3, '初级', 1, 0, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(2, 3, '中级', 5, 200, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(3, 3, '高级', 10, 500, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(4, 3, '元老', 15, 1000, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(5, 4, '普通', 16, 0, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(6, 4, '银牌', 23, 500, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(7, 4, '金牌', 35, 1000, 0);
REPLACE INTO `{dbprefix}member_level` VALUES(8, 4, '钻石', 55, 2000, 0);

DROP TABLE IF EXISTS `{dbprefix}member_login`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_login` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned DEFAULT NULL COMMENT '会员uid',
  `oauthid` varchar(30) NOT NULL COMMENT '快捷登录方式',
  `loginip` varchar(50) NOT NULL COMMENT '登录Ip',
  `logintime` int(10) unsigned NOT NULL COMMENT '登录时间',
  `useragent` varchar(255) NOT NULL COMMENT '客户端信息'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='登录日志记录';

DROP TABLE IF EXISTS `{dbprefix}member_menu`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_menu` (
  `id` smallint(5) unsigned NOT NULL,
  `pid` smallint(5) unsigned NOT NULL COMMENT '上级菜单id',
  `name` text NOT NULL COMMENT '菜单名称',
  `uri` varchar(255) DEFAULT NULL COMMENT 'uri字符串',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `mark` varchar(50) DEFAULT NULL COMMENT '菜单标识',
  `hidden` tinyint(1) unsigned DEFAULT NULL COMMENT '是否隐藏',
  `target` tinyint(3) unsigned DEFAULT NULL COMMENT '新窗口',
  `displayorder` tinyint(3) unsigned DEFAULT NULL COMMENT '排序值',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标'
) ENGINE=MyISAM AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COMMENT='会员菜单表';

REPLACE INTO `{dbprefix}member_menu` VALUES(1, 0, '账号', '', '', '', 0, 0, 0, 'icon-user');
REPLACE INTO `{dbprefix}member_menu` VALUES(2, 0, '财务', '', '', '', 0, 0, 0, 'fa fa-rmb');
REPLACE INTO `{dbprefix}member_menu` VALUES(4, 0, '应用', '', '', 'm_app', 0, 0, 0, 'fa fa-cloud');
REPLACE INTO `{dbprefix}member_menu` VALUES(43, 16, '转账服务', 'pay/transfer', '', '', 0, 0, 0, 'fa fa-rmb');
REPLACE INTO `{dbprefix}member_menu` VALUES(5, 1, '基本管理', '', '', '', 0, 0, 0, 'fa fa-cogs');
REPLACE INTO `{dbprefix}member_menu` VALUES(6, 5, '基本资料', 'account/index', '', '', 0, 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}member_menu` VALUES(10, 1, '会员相关', '', '', '', 0, 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}member_menu` VALUES(11, 5, '修改密码', 'account/password', '', '', 0, 0, 0, 'icon-lock');
REPLACE INTO `{dbprefix}member_menu` VALUES(12, 10, '快捷登录', 'account/oauth', '', '', 0, 0, 0, 'fa fa-weibo');
REPLACE INTO `{dbprefix}member_menu` VALUES(13, 10, '登录记录', 'account/login', '', '', 0, 0, 0, 'fa fa-calendar-o');
REPLACE INTO `{dbprefix}member_menu` VALUES(14, 10, '会员升级', 'account/upgrade', '', '', 0, 0, 0, 'fa fa-user-plus');
REPLACE INTO `{dbprefix}member_menu` VALUES(15, 10, '会员权限', 'account/permission', '', '', 0, 0, 0, 'fa fa-users');
REPLACE INTO `{dbprefix}member_menu` VALUES(16, 2, '充值付款', '', '', '', 0, 0, 0, 'fa fa-rmb');
REPLACE INTO `{dbprefix}member_menu` VALUES(17, 2, '财务记录', '', '', '', 0, 0, 0, 'fa fa-calendar-o');
REPLACE INTO `{dbprefix}member_menu` VALUES(18, 16, '在线充值', 'pay/add', '', '', 0, 0, 0, 'fa fa-rmb');
REPLACE INTO `{dbprefix}member_menu` VALUES(20, 16, '兑换服务', 'pay/convert', '', '', 0, 0, 0, 'fa fa-exchange');
REPLACE INTO `{dbprefix}member_menu` VALUES(21, 17, '收入记录', 'pay/index', '', '', 0, 0, 0, 'fa fa-calendar-plus-o');
REPLACE INTO `{dbprefix}member_menu` VALUES(22, 17, '消费记录', 'pay/spend', '', '', 0, 0, 0, 'fa fa-calendar-minus-o');
REPLACE INTO `{dbprefix}member_menu` VALUES(23, 17, '经验值记录', 'pay/experience', '', '', 0, 0, 0, 'fa fa-compass');
REPLACE INTO `{dbprefix}member_menu` VALUES(24, 17, '虚拟币记录', 'pay/score', '', '', 0, 0, 0, 'fa fa-diamond');
REPLACE INTO `{dbprefix}member_menu` VALUES(27, 25, '空间设置', 'space/space/index', '', '', 0, 0, 0, 'fa fa-cog');
REPLACE INTO `{dbprefix}member_menu` VALUES(28, 25, '模板设置', 'space/space/template', '', '', 0, 0, 0, 'fa fa-html5');
REPLACE INTO `{dbprefix}member_menu` VALUES(29, 26, '栏目分类', 'space/category/index', '', '', 0, 0, 0, 'fa fa-database');
REPLACE INTO `{dbprefix}member_menu` VALUES(30, 4, '我的应用', '', '', '', 0, 0, 99, 'fa fa-cloud');
REPLACE INTO `{dbprefix}member_menu` VALUES(31, 26, '文章管理', 'space/space1/index', '', 'space-1', 0, 0, 0, 'fa fa-navicon');
REPLACE INTO `{dbprefix}member_menu` VALUES(32, 26, '外链管理', 'space/space2/index', '', 'space-2', 0, 0, 0, 'fa fa-navicon');
REPLACE INTO `{dbprefix}member_menu` VALUES(33, 26, '日志管理', 'space/space3/index', '', 'space-3', 0, 0, 0, 'fa fa-navicon');
REPLACE INTO `{dbprefix}member_menu` VALUES(34, 26, '相册管理', 'space/space4/index', '', 'space-4', 0, 0, 0, 'fa fa-navicon');
REPLACE INTO `{dbprefix}member_menu` VALUES(35, 26, '幻灯管理', 'space/space5/index', '', 'space-5', 0, 0, 0, 'fa fa-navicon');
REPLACE INTO `{dbprefix}member_menu` VALUES(38, 37, '我的动态', 'space/sns/index', '', '', 0, 0, 0, 'fa fa-weibo');
REPLACE INTO `{dbprefix}member_menu` VALUES(39, 37, '我关注的', 'space/sns/follow', '', '', 0, 0, 0, 'fa fa-share-alt-square');
REPLACE INTO `{dbprefix}member_menu` VALUES(40, 37, '我的粉丝', 'space/sns/fans', '', '', 0, 0, 0, 'fa fa-user');
REPLACE INTO `{dbprefix}member_menu` VALUES(41, 25, '空间权限', 'space/sns/config', '', '', 0, 0, 99, 'fa fa-cog');
REPLACE INTO `{dbprefix}member_menu` VALUES(42, 25, '二级域名', 'space/space/domain', '', '', 0, 0, 95, 'fa fa-wifi');
REPLACE INTO `{dbprefix}member_menu` VALUES(45, 5, '上传头像', 'account/avatar', '', '', 0, 0, 0, 'icon-picture');
REPLACE INTO `{dbprefix}member_menu` VALUES(46, 5, '收货地址', 'address/index', '', '', 0, 0, 0, 'icon-home');
REPLACE INTO `{dbprefix}member_menu` VALUES(47, 5, '附件管理', 'account/attachment', '', '', 0, 0, 0, 'fa fa-folder');
REPLACE INTO `{dbprefix}member_menu` VALUES(48, 1, '通知提醒', '', '', '', 0, 0, 0, 'fa fa-bell-o');
REPLACE INTO `{dbprefix}member_menu` VALUES(50, 48, '系统提醒', 'notice/index', '', '', 0, 0, 0, 'fa fa-bell');
REPLACE INTO `{dbprefix}member_menu` VALUES(51, 48, '互动提醒', 'notice/member', '', '', 0, 0, 0, 'fa fa-at');
REPLACE INTO `{dbprefix}member_menu` VALUES(52, 48, '模块提醒', 'notice/module', '', '', 0, 0, 0, 'fa fa-whatsapp');
REPLACE INTO `{dbprefix}member_menu` VALUES(53, 48, '应用提醒', 'notice/app', '', '', 0, 0, 0, 'fa fa-volume-up');
REPLACE INTO `{dbprefix}member_menu` VALUES(54, 0, '内容', '', '', 'm_mod', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(55, 54, '文档管理', '', '', 'left-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(56, 55, '已通过的文档', 'news/home/index', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(57, 55, '待审核的文档', 'news/verify/index', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(58, 55, '被退回的文档', 'news/back/index', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(59, 55, '我推荐的文档', 'news/home/flag', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(60, 55, '我收藏的文档', 'news/home/favorite', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(61, 55, '我购买的文档', 'news/home/buy', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(62, 55, '我评论的文档', 'news/comment/index', '', 'module-news', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(63, 54, '图书管理', '', '', 'left-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(64, 63, '已通过的图书', 'book/home/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(65, 63, '待审核的图书', 'book/verify/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(66, 63, '被退回的图书', 'book/back/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(67, 63, '待审核的章节', 'book/everify/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(68, 63, '被退回的章节', 'book/eback/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(69, 63, '已推荐的图书', 'book/home/flag', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(70, 63, '我收藏的图书', 'book/home/favorite', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(71, 63, '我购买的图书', 'book/home/buy', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(72, 63, '我购买的章节', 'book/extend/buy', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(73, 63, '我评论的图书', 'book/comment/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(74, 63, '我评论的章节', 'book/ecomment/index', '', 'module-book', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(75, 54, '文档管理', '', '', 'left-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(76, 75, '已通过的文档', 'demo/home/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(77, 75, '待审核的文档', 'demo/verify/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(78, 75, '被退回的文档', 'demo/back/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(79, 75, '我推荐的文档', 'demo/home/flag', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(80, 75, '我收藏的文档', 'demo/home/favorite', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(81, 75, '我购买的文档', 'demo/home/buy', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(82, 75, '我评论的文档', 'demo/comment/index', '', 'module-demo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(83, 54, '软件管理', '', '', 'left-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(84, 83, '已通过的软件', 'down/home/index', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(85, 83, '待审核的软件', 'down/verify/index', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(86, 83, '被退回的软件', 'down/back/index', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(87, 83, '已推荐的软件', 'down/home/flag', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(88, 83, '我收藏的软件', 'down/home/favorite', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(89, 83, '我购买的软件', 'down/home/buy', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(90, 83, '我评论的软件', 'down/comment/index', '', 'module-down', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(91, 54, '房源管理', '', '', 'left-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(92, 91, '已通过的房源', 'fang/home/index', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(93, 91, '待审核的房源', 'fang/verify/index', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(94, 91, '被退回的房源', 'fang/back/index', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(95, 91, '已推荐的房源', 'fang/home/flag', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(96, 91, '我收藏的房源', 'fang/home/favorite', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(97, 91, '我购买的房源', 'fang/home/buy', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(98, 91, '我评论的房源', 'fang/comment/index', '', 'module-fang', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(99, 54, '图片管理', '', '', 'left-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(100, 99, '已通过的图片', 'photo/home/index', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(101, 99, '待审核的图片', 'photo/verify/index', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(102, 99, '被退回的图片', 'photo/back/index', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(103, 99, '已推荐的图片', 'photo/home/flag', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(104, 99, '我收藏的图片', 'photo/home/favorite', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(105, 99, '我购买的图片', 'photo/home/buy', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(106, 99, '我评论的图片', 'photo/comment/index', '', 'module-photo', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(107, 54, '专题管理', '', '', 'left-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(108, 107, '已通过的专题', 'special/home/index', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(109, 107, '待审核的专题', 'special/verify/index', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(110, 107, '被退回的专题', 'special/back/index', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(111, 107, '我推荐的专题', 'special/home/flag', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(112, 107, '我收藏的专题', 'special/home/favorite', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(113, 107, '我购买的专题', 'special/home/buy', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(114, 107, '我评论的专题', 'special/comment/index', '', 'module-special', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(115, 54, '视频管理', '', '', 'left-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(116, 115, '已通过的视频', 'video/home/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(117, 115, '待审核的视频', 'video/verify/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(118, 115, '被退回的视频', 'video/back/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(119, 115, '待审核的分集', 'video/everify/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(120, 115, '被退回的分集', 'video/eback/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(121, 115, '已推荐的视频', 'video/home/flag', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(122, 115, '我收藏的视频', 'video/home/favorite', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(123, 115, '我购买的视频', 'video/home/buy', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(124, 115, '我购买的分集', 'video/extend/buy', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(125, 115, '我评论的视频', 'video/comment/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');
REPLACE INTO `{dbprefix}member_menu` VALUES(126, 115, '我评论的分集', 'video/ecomment/index', '', 'module-video', 0, 0, 0, 'fa fa-th-large');

DROP TABLE IF EXISTS `{dbprefix}member_new_notice`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_new_notice` (
  `uid` smallint(8) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='新通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_0`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_0` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_1`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_1` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_2`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_2` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_3`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_3` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_4`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_4` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_5`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_5` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_6`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_6` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_7`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_7` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_8`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_8` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_notice_9`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_notice_9` (
  `id` int(10) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '类型',
  `uid` mediumint(8) unsigned NOT NULL COMMENT '通知者uid',
  `isnew` tinyint(1) unsigned NOT NULL COMMENT '新提醒',
  `content` text NOT NULL COMMENT '通知内容',
  `inputtime` int(10) unsigned NOT NULL COMMENT '提交时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员通知提醒表';

DROP TABLE IF EXISTS `{dbprefix}member_oauth`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_oauth` (
  `id` int(10) NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL COMMENT '会员uid',
  `oid` varchar(255) NOT NULL COMMENT 'OAuth返回id',
  `oauth` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `expire_at` int(10) unsigned NOT NULL,
  `access_token` varchar(255) DEFAULT NULL,
  `refresh_token` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员OAuth2授权表';

DROP TABLE IF EXISTS `{dbprefix}member_online`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_online` (
  `uid` mediumint(8) unsigned NOT NULL,
  `time` int(10) unsigned NOT NULL COMMENT '在线时间'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='会员在线情况表';

REPLACE INTO `{dbprefix}member_online` VALUES(1, 1535526993);

DROP TABLE IF EXISTS `{dbprefix}member_paylog`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_paylog` (
  `id` bigint(15) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL,
  `value` decimal(10,2) NOT NULL COMMENT '价格',
  `type` varchar(20) NOT NULL COMMENT '类型',
  `status` tinyint(1) unsigned NOT NULL COMMENT '状态',
  `order` varchar(255) DEFAULT NULL COMMENT '下单详情',
  `module` varchar(30) NOT NULL COMMENT '应用或模块目录',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL COMMENT '时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='支付记录表';

DROP TABLE IF EXISTS `{dbprefix}member_scorelog`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_scorelog` (
  `id` int(10) unsigned NOT NULL,
  `uid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL COMMENT '积分0,虚拟币1',
  `value` int(10) NOT NULL COMMENT '分数变化值',
  `mark` varchar(50) NOT NULL COMMENT '标记',
  `note` varchar(255) NOT NULL COMMENT '备注',
  `inputtime` int(10) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='得分日志';

DROP TABLE IF EXISTS `{dbprefix}member_setting`;
CREATE TABLE IF NOT EXISTS `{dbprefix}member_setting` (
  `name` varchar(50) NOT NULL,
  `value` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='会员属性参数表';

REPLACE INTO `{dbprefix}member_setting` VALUES('member', '');
REPLACE INTO `{dbprefix}member_setting` VALUES('permission', 'a:10:{i:1;a:13:{s:16:\\"login_experience\\";s:1:\\"1\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:10:\\"attachsize\\";s:1:\\"0\\";}i:2;a:14:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"1\\";s:12:\\"update_score\\";s:1:\\"0\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"5\\";}s:3:\\"3_1\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"10\\";}s:3:\\"3_2\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"10\\";}s:3:\\"3_3\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:2:\\"10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"2\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"20\\";}s:3:\\"3_4\\";a:15:{s:16:\\"login_experience\\";s:1:\\"5\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"3\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"30\\";}s:3:\\"4_5\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:2:\\"10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"50\\";}s:3:\\"4_6\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:2:\\"70\\";}s:3:\\"4_7\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:3:\\"100\\";}s:3:\\"4_8\\";a:15:{s:16:\\"login_experience\\";s:2:\\"10\\";s:11:\\"login_score\\";s:1:\\"0\\";s:17:\\"avatar_experience\\";s:2:\\"10\\";s:12:\\"avatar_score\\";s:1:\\"0\\";s:19:\\"complete_experience\\";s:2:\\"10\\";s:14:\\"complete_score\\";s:1:\\"0\\";s:15:\\"bang_experience\\";s:2:\\"10\\";s:10:\\"bang_score\\";s:1:\\"0\\";s:14:\\"jie_experience\\";s:3:\\"-10\\";s:9:\\"jie_score\\";s:1:\\"0\\";s:17:\\"update_experience\\";s:1:\\"5\\";s:12:\\"update_score\\";s:1:\\"0\\";s:9:\\"is_upload\\";s:1:\\"1\\";s:11:\\"is_download\\";s:1:\\"1\\";s:10:\\"attachsize\\";s:1:\\"0\\";}}');
REPLACE INTO `{dbprefix}member_setting` VALUES('pay', 'a:2:{s:6:\\"tenpay\\";a:3:{s:4:\\"name\\";s:9:\\"财付通\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}s:6:\\"alipay\\";a:4:{s:4:\\"name\\";s:9:\\"支付宝\\";s:8:\\"username\\";s:0:\\"\\";s:2:\\"id\\";s:0:\\"\\";s:3:\\"key\\";s:0:\\"\\";}}');
REPLACE INTO `{dbprefix}member_setting` VALUES('space', 'a:9:{s:6:\\"domain\\";s:0:\\"\\";s:4:\\"edit\\";s:1:\\"1\\";s:6:\\"verify\\";s:1:\\"0\\";s:7:\\"rewrite\\";s:1:\\"0\\";s:7:\\"seojoin\\";s:1:\\"_\\";s:5:\\"title\\";s:41:\\"会员空间_FineCMS自助建站平台！\\";s:8:\\"keywords\\";s:0:\\"\\";s:11:\\"description\\";s:0:\\"\\";s:4:\\"flag\\";a:9:{i:1;a:1:{s:4:\\"name\\";s:12:\\"达人空间\\";}i:2;a:1:{s:4:\\"name\\";s:12:\\"推荐空间\\";}i:3;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:4;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:5;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:6;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:7;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:8;a:1:{s:4:\\"name\\";s:0:\\"\\";}i:9;a:1:{s:4:\\"name\\";s:0:\\"\\";}}}');

DROP TABLE IF EXISTS `{dbprefix}module`;
CREATE TABLE IF NOT EXISTS `{dbprefix}module` (
  `id` smallint(5) unsigned NOT NULL,
  `site` text COMMENT '站点划分',
  `dirname` varchar(50) NOT NULL COMMENT '目录名称',
  `share` tinyint(1) unsigned DEFAULT NULL COMMENT '是否共享模块',
  `extend` tinyint(1) unsigned DEFAULT NULL COMMENT '是否是扩展模块',
  `sitemap` tinyint(1) unsigned DEFAULT NULL COMMENT '是否生成地图',
  `setting` text COMMENT '配置信息',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用？',
  `displayorder` tinyint(2) DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='模块表';

REPLACE INTO `{dbprefix}module` VALUES(1, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'news', 1, 0, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(2, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'book', 1, 1, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(3, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'demo', 0, 0, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(4, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'down', 1, 0, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(5, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'fang', 1, 0, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(6, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'photo', 1, 0, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(7, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'special', 1, 0, 1, '', 0, 0);
REPLACE INTO `{dbprefix}module` VALUES(8, '{"1":{"use":1,"html":0,"theme":"default","domain":"","template":"default"}}', 'video', 1, 1, 1, '', 0, 0);

DROP TABLE IF EXISTS `{dbprefix}module_form`;
CREATE TABLE IF NOT EXISTS `{dbprefix}module_form` (
  `id` smallint(5) unsigned NOT NULL,
  `module` varchar(50) NOT NULL COMMENT '模块目录',
  `name` varchar(50) NOT NULL COMMENT '表单名称',
  `table` varchar(50) NOT NULL COMMENT '表单表名称',
  `disabled` tinyint(1) unsigned NOT NULL COMMENT '是否禁用',
  `permission` text NOT NULL COMMENT '会员权限',
  `setting` text NOT NULL COMMENT '表单配置'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表单表';

DROP TABLE IF EXISTS `{dbprefix}site`;
CREATE TABLE IF NOT EXISTS `{dbprefix}site` (
  `id` smallint(5) unsigned NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '站点名称',
  `domain` varchar(50) NOT NULL COMMENT '站点域名',
  `setting` text NOT NULL COMMENT '站点配置'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='站点表';

REPLACE INTO `{dbprefix}site` VALUES(1, 'POSCMS', '{site_url}', '{"SITE_CLOSE":"0","SITE_CLOSE_MSG":"\\u7f51\\u7ad9\\u5347\\u7ea7\\u4e2d....","SITE_NAME":"POSCMS","SITE_TIME_FORMAT":"Y-m-d H:i","SITE_LANGUAGE":"zh-cn","SITE_THEME":"default","SITE_TEMPLATE":"default","SITE_TIMEZONE":"8","SITE_DOMAINS":"","SITE_REWRITE":"0","SITE_WWW":"","SITE_MOBILE":"","SITE_SEOJOIN":"_","SITE_TITLE":"POSCMS\\u514d\\u8d39\\u7248","SITE_KEYWORDS":"","SITE_DESCRIPTION":"","SITE_IMAGE_WATERMARK":"0","SITE_IMAGE_VRTALIGN":"top","SITE_IMAGE_HORALIGN":"left","SITE_IMAGE_VRTOFFSET":"","SITE_IMAGE_HOROFFSET":"","SITE_IMAGE_TYPE":"0","SITE_IMAGE_OVERLAY":"default.png","SITE_IMAGE_OPACITY":"","SITE_IMAGE_FONT":"default.ttf","SITE_IMAGE_COLOR":"","SITE_IMAGE_SIZE":"","SITE_IMAGE_TEXT":"","image":{"1":{"width":"","height":""},"2":{"width":"","height":""},"3":{"width":"","height":""},"4":{"width":"","height":""},"5":{"width":"","height":""},"6":{"width":"","height":""},"7":{"width":"","height":""},"8":{"width":"","height":""},"9":{"width":"","height":""}},"SITE_DOMAIN":"{site_url}","SITE_NAVIGATOR":"\\u6d4b\\u8bd5,\\u9996\\u9875\\u5e7b\\u706f,\\u9996\\u9875\\u5934\\u6761,\\u5e95\\u90e8\\u5bfc\\u822a,\\u53cb\\u60c5\\u94fe\\u63a5,,,,,","SITE_IMAGE_CONTENT":0}');

DROP TABLE IF EXISTS `{dbprefix}urlrule`;
CREATE TABLE IF NOT EXISTS `{dbprefix}urlrule` (
  `id` smallint(5) unsigned NOT NULL,
  `type` tinyint(1) unsigned NOT NULL COMMENT '规则类型',
  `name` varchar(50) NOT NULL COMMENT '规则名称',
  `value` text NOT NULL COMMENT '详细规则'
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='URL规则表';

REPLACE INTO `{dbprefix}urlrule` VALUES(1, 0, '单页测试规则', 'a:52:{s:4:\\"page\\";s:14:\\"page-{id}.html\\";s:9:\\"page_page\\";s:21:\\"page-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(2, 0, '单页测试规则（用于模块）', 'a:52:{s:4:\\"page\\";s:21:\\"module-page-{id}.html\\";s:9:\\"page_page\\";s:28:\\"module-page-{id}-{page}.html\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(3, 1, '独立模块默认规则', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:14:\\"{modname}.html\\";s:4:\\"list\\";s:29:\\"{modname}-list-{dirname}.html\\";s:9:\\"list_page\\";s:36:\\"{modname}-list-{dirname}-{page}.html\\";s:4:\\"show\\";s:24:\\"{modname}-show-{id}.html\\";s:9:\\"show_page\\";s:31:\\"{modname}-show-{id}-{page}.html\\";s:6:\\"extend\\";s:24:\\"{modname}-read-{id}.html\\";s:11:\\"extend_page\\";s:31:\\"{modname}-read-{id}-{page}.html\\";s:3:\\"tag\\";s:24:\\"{modname}-tag-{tag}.html\\";s:8:\\"tag_page\\";s:31:\\"{modname}-tag-{tag}-{page}.html\\";s:6:\\"search\\";s:21:\\"{modname}/search.html\\";s:11:\\"search_page\\";s:29:\\"{modname}/search-{param}.html\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(4, 2, '共享模块测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:24:\\"{modname}-tag-{tag}.html\\";s:14:\\"share_tag_page\\";s:31:\\"{modname}-tag-{tag}-{page}.html\\";s:12:\\"share_search\\";s:21:\\"{modname}/search.html\\";s:17:\\"share_search_page\\";s:29:\\"{modname}/search/{param}.html\\";s:10:\\"share_list\\";s:10:\\"{dirname}/\\";s:15:\\"share_list_page\\";s:26:\\"{dirname}/page/{page}.html\\";s:10:\\"share_show\\";s:24:\\"{dirname}/show/{id}.html\\";s:15:\\"share_show_page\\";s:36:\\"{dirname}/show/{id}/page/{page}.html\\";s:12:\\"share_extend\\";s:24:\\"{dirname}/read/{id}.html\\";s:17:\\"share_extend_page\\";s:36:\\"{dirname}/read/{id}/page/{page}.html\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(5, 3, '共享栏目规则测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:24:\\"html/{dirname}-list.html\\";s:15:\\"share_list_page\\";s:31:\\"html/{dirname}-list-{page}.html\\";s:10:\\"share_show\\";s:29:\\"html/{dirname}-show-{id}.html\\";s:15:\\"share_show_page\\";s:36:\\"html/{dirname}-show-{id}-{page}.html\\";s:12:\\"share_extend\\";s:31:\\"html/{dirname}-extend-{id}.html\\";s:17:\\"share_extend_page\\";s:38:\\"html/{dirname}-extend-{id}-{page}.html\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(6, 4, '站点URL测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:11:\\"search.html\\";s:17:\\"share_search_page\\";s:19:\\"search/{param}.html\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:7:\\"so.html\\";s:14:\\"so_search_page\\";s:15:\\"so-{param}.html\\";s:7:\\"sitemap\\";s:12:\\"sitemap.html\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:0:\\"\\";s:10:\\"member_reg\\";s:0:\\"\\";s:12:\\"member_login\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(7, 5, '空间黄页测试地址', 'a:50:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:7:\\"hy.html\\";s:12:\\"space_search\\";s:14:\\"hy-search.html\\";s:17:\\"space_search_page\\";s:22:\\"hy-search-{param}.html\\";s:5:\\"uhome\\";s:12:\\"u-{uid}.html\\";s:5:\\"ulist\\";s:22:\\"u-{uid}-list-{id}.html\\";s:10:\\"ulist_page\\";s:29:\\"u-{uid}-list-{id}-{page}.html\\";s:5:\\"ushow\\";s:28:\\"u-{uid}-show-{mid}-{id}.html\\";s:10:\\"ushow_page\\";s:35:\\"u-{uid}-show-{mid}-{id}-{page}.html\\";s:8:\\"sns_show\\";s:26:\\"u-{uid}-sns-show-{id}.html\\";s:9:\\"sns_topic\\";s:27:\\"u-{uid}-sns-topic-{id}.html\\";s:14:\\"sns_topic_page\\";s:34:\\"u-{uid}-sns-topic-{id}-{page}.html\\";s:3:\\"sns\\";s:23:\\"u-{uid}-sns-{name}.html\\";s:8:\\"sns_page\\";s:30:\\"u-{uid}-sns-{name}-{page}.html\\";s:12:\\"ulist_domain\\";s:16:\\"u-list-{id}.html\\";s:17:\\"ulist_domain_page\\";s:23:\\"u-list-{id}-{page}.html\\";s:12:\\"ushow_domain\\";s:22:\\"u-show-{mid}-{id}.html\\";s:17:\\"ushow_domain_page\\";s:29:\\"u-show-{mid}-{id}-{page}.html\\";s:15:\\"sns_show_domain\\";s:20:\\"u-sns-show-{id}.html\\";s:16:\\"sns_topic_domain\\";s:21:\\"u-sns-topic-{id}.html\\";s:21:\\"sns_topic_domain_page\\";s:28:\\"u-sns-topic-{id}-{page}.html\\";s:10:\\"sns_domain\\";s:22:\\"u-sns-{name}-{id}.html\\";s:15:\\"sns_domain_page\\";s:29:\\"u-sns-{name}-{id}-{page}.html\\";s:6:\\"member\\";s:0:\\"\\";s:7:\\"catjoin\\";s:1:\\"/\\";}');
REPLACE INTO `{dbprefix}urlrule` VALUES(8, 6, '会员部分测试', 'a:52:{s:4:\\"page\\";s:0:\\"\\";s:9:\\"page_page\\";s:0:\\"\\";s:6:\\"module\\";s:0:\\"\\";s:4:\\"list\\";s:0:\\"\\";s:9:\\"list_page\\";s:0:\\"\\";s:4:\\"show\\";s:0:\\"\\";s:9:\\"show_page\\";s:0:\\"\\";s:6:\\"extend\\";s:0:\\"\\";s:11:\\"extend_page\\";s:0:\\"\\";s:3:\\"tag\\";s:0:\\"\\";s:8:\\"tag_page\\";s:0:\\"\\";s:6:\\"search\\";s:0:\\"\\";s:11:\\"search_page\\";s:0:\\"\\";s:9:\\"share_tag\\";s:0:\\"\\";s:14:\\"share_tag_page\\";s:0:\\"\\";s:12:\\"share_search\\";s:0:\\"\\";s:17:\\"share_search_page\\";s:0:\\"\\";s:10:\\"share_list\\";s:0:\\"\\";s:15:\\"share_list_page\\";s:0:\\"\\";s:10:\\"share_show\\";s:0:\\"\\";s:15:\\"share_show_page\\";s:0:\\"\\";s:12:\\"share_extend\\";s:0:\\"\\";s:17:\\"share_extend_page\\";s:0:\\"\\";s:9:\\"so_search\\";s:0:\\"\\";s:14:\\"so_search_page\\";s:0:\\"\\";s:7:\\"sitemap\\";s:0:\\"\\";s:5:\\"space\\";s:0:\\"\\";s:12:\\"space_search\\";s:0:\\"\\";s:17:\\"space_search_page\\";s:0:\\"\\";s:5:\\"uhome\\";s:0:\\"\\";s:5:\\"ulist\\";s:0:\\"\\";s:10:\\"ulist_page\\";s:0:\\"\\";s:5:\\"ushow\\";s:0:\\"\\";s:10:\\"ushow_page\\";s:0:\\"\\";s:8:\\"sns_show\\";s:0:\\"\\";s:9:\\"sns_topic\\";s:0:\\"\\";s:14:\\"sns_topic_page\\";s:0:\\"\\";s:3:\\"sns\\";s:0:\\"\\";s:8:\\"sns_page\\";s:0:\\"\\";s:12:\\"ulist_domain\\";s:0:\\"\\";s:17:\\"ulist_domain_page\\";s:0:\\"\\";s:12:\\"ushow_domain\\";s:0:\\"\\";s:17:\\"ushow_domain_page\\";s:0:\\"\\";s:15:\\"sns_show_domain\\";s:0:\\"\\";s:16:\\"sns_topic_domain\\";s:0:\\"\\";s:21:\\"sns_topic_domain_page\\";s:0:\\"\\";s:10:\\"sns_domain\\";s:0:\\"\\";s:15:\\"sns_domain_page\\";s:0:\\"\\";s:6:\\"member\\";s:11:\\"member.html\\";s:10:\\"member_reg\\";s:13:\\"register.html\\";s:12:\\"member_login\\";s:10:\\"login.html\\";s:7:\\"catjoin\\";s:0:\\"\\";}');

DROP TABLE IF EXISTS `{dbprefix}var`;
CREATE TABLE IF NOT EXISTS `{dbprefix}var` (
  `id` int(10) NOT NULL COMMENT 'Id',
  `name` varchar(100) NOT NULL COMMENT '变量描述名称',
  `cname` varchar(100) NOT NULL COMMENT '变量名称',
  `type` tinyint(2) NOT NULL COMMENT '变量类型',
  `value` text NOT NULL COMMENT '变量值'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='自定义变量表';


ALTER TABLE `{dbprefix}1_block`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

ALTER TABLE `{dbprefix}1_book`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `status` (`status`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `hits` (`hits`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_book_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_book_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_book_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_book_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_book_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_book_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_book_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_book_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_extend`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `hits` (`hits`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_book_extend_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`eid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_book_extend_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_extend_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_book_extend_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_book_extend_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_book_extend_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`);

ALTER TABLE `{dbprefix}1_book_extend_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_book_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_book_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_book_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_book_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_book_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_book_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_demo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `status` (`status`),
  ADD KEY `hits` (`hits`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_demo_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_demo_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_demo_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_demo_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_demo_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_demo_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_demo_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_demo_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_demo_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_demo_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_demo_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_demo_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_demo_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_demo_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_demo_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_demo_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_demo_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_demo_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_down`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `status` (`status`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `hits` (`hits`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_down_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_down_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_down_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_down_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_down_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_down_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_down_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_down_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_down_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_down_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_down_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_down_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_down_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_down_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_down_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_down_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_down_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_down_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_fang`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `status` (`status`),
  ADD KEY `hits` (`hits`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`),
  ADD KEY `zujin` (`zujin`),
  ADD KEY `area` (`area`);

ALTER TABLE `{dbprefix}1_fang_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_fang_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_fang_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_fang_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_fang_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_fang_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_fang_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_fang_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_fang_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_fang_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_fang_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_fang_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_fang_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_fang_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_fang_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_fang_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_fang_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_fang_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_form`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `table` (`table`);

ALTER TABLE `{dbprefix}1_navigator`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list` (`id`,`type`,`show`,`displayorder`),
  ADD KEY `mark` (`mark`),
  ADD KEY `extend` (`extend`),
  ADD KEY `pid` (`pid`);

ALTER TABLE `{dbprefix}1_news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `status` (`status`),
  ADD KEY `hits` (`hits`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_news_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_news_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_news_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_news_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_news_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_news_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_news_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_news_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_news_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_news_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_news_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_news_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_news_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_news_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_news_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_news_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_news_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_news_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_page`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`module`),
  ADD KEY `pid` (`pid`),
  ADD KEY `show` (`show`),
  ADD KEY `displayorder` (`displayorder`);

ALTER TABLE `{dbprefix}1_photo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `status` (`status`),
  ADD KEY `hits` (`hits`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_photo_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_photo_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_photo_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_photo_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_photo_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_photo_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_photo_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_photo_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_photo_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_photo_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_photo_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_photo_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_photo_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_photo_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_photo_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_photo_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_photo_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_photo_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_remote`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `{dbprefix}1_share_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`),
  ADD KEY `tid` (`tid`),
  ADD KEY `show` (`show`),
  ADD KEY `dirname` (`dirname`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_share_extend_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

ALTER TABLE `{dbprefix}1_share_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mid` (`mid`);

ALTER TABLE `{dbprefix}1_special`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `status` (`status`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `comments` (`comments`),
  ADD KEY `hits` (`hits`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_special_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_special_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_special_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_special_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_special_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_special_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_special_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_special_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_special_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_special_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_special_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_special_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_special_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_special_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_special_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_special_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_special_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_special_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_video`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`,`updatetime`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `status` (`status`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `hits` (`hits`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_video_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_video_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `show` (`show`),
  ADD KEY `module` (`pid`,`displayorder`,`id`);

ALTER TABLE `{dbprefix}1_video_category_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_video_category_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_video_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_video_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_video_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_video_draft`
  ADD PRIMARY KEY (`id`),
  ADD KEY `eid` (`eid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_extend`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `comments` (`comments`),
  ADD KEY `favorites` (`favorites`),
  ADD KEY `hits` (`hits`),
  ADD KEY `displayorder` (`displayorder`,`updatetime`);

ALTER TABLE `{dbprefix}1_video_extend_buy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`,`eid`,`uid`,`inputtime`);

ALTER TABLE `{dbprefix}1_video_extend_comment_data_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `reply` (`reply`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `status` (`status`),
  ADD KEY `aa` (`cid`,`status`,`inputtime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_extend_comment_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `support` (`support`),
  ADD KEY `oppose` (`oppose`),
  ADD KEY `comments` (`comments`),
  ADD KEY `avgsort` (`avgsort`),
  ADD KEY `tableid` (`tableid`);

ALTER TABLE `{dbprefix}1_video_extend_comment_my`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `comments` (`comments`);

ALTER TABLE `{dbprefix}1_video_extend_data_0`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_video_extend_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`);

ALTER TABLE `{dbprefix}1_video_extend_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}1_video_favorite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `eid` (`eid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_flag`
  ADD KEY `flag` (`flag`,`id`,`uid`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_video_hits`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `day_hits` (`day_hits`),
  ADD KEY `week_hits` (`week_hits`),
  ADD KEY `month_hits` (`month_hits`),
  ADD KEY `year_hits` (`year_hits`);

ALTER TABLE `{dbprefix}1_video_html`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `rid` (`rid`),
  ADD KEY `cid` (`cid`),
  ADD KEY `type` (`type`),
  ADD KEY `catid` (`catid`);

ALTER TABLE `{dbprefix}1_video_index`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_search`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `catid` (`catid`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_search_index`
  ADD KEY `id` (`id`),
  ADD KEY `cid` (`cid`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}1_video_tag`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `letter` (`code`,`hits`);

ALTER TABLE `{dbprefix}1_video_verify`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `catid` (`catid`),
  ADD KEY `status` (`status`),
  ADD KEY `inputtime` (`inputtime`),
  ADD KEY `backuid` (`backuid`);

ALTER TABLE `{dbprefix}admin`
  ADD PRIMARY KEY (`uid`);

ALTER TABLE `{dbprefix}admin_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `loginip` (`loginip`),
  ADD KEY `logintime` (`logintime`);

ALTER TABLE `{dbprefix}admin_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list` (`pid`),
  ADD KEY `displayorder` (`displayorder`),
  ADD KEY `mark` (`mark`),
  ADD KEY `hidden` (`hidden`),
  ADD KEY `uri` (`uri`);

ALTER TABLE `{dbprefix}admin_notice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uri` (`uri`),
  ADD KEY `status` (`status`),
  ADD KEY `to_uid` (`to_uid`),
  ADD KEY `to_rid` (`to_rid`),
  ADD KEY `updatetime` (`updatetime`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}admin_role`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `{dbprefix}admin_verify`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `{dbprefix}application`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dirname` (`dirname`);

ALTER TABLE `{dbprefix}attachment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `author` (`author`),
  ADD KEY `relatedtid` (`related`),
  ADD KEY `fileext` (`fileext`),
  ADD KEY `filemd5` (`filemd5`),
  ADD KEY `siteid` (`siteid`);

ALTER TABLE `{dbprefix}attachment_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_8`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_9`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}attachment_unused`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `author` (`author`);

ALTER TABLE `{dbprefix}comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

ALTER TABLE `{dbprefix}controller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}cron_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`),
  ADD KEY `status` (`status`);

ALTER TABLE `{dbprefix}downservers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `displayorder` (`displayorder`);

ALTER TABLE `{dbprefix}field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list` (`relatedid`,`disabled`,`issystem`);

ALTER TABLE `{dbprefix}linkage`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `code` (`code`),
  ADD KEY `module` (`id`);

ALTER TABLE `{dbprefix}linkage_data_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cname` (`cname`),
  ADD KEY `hidden` (`hidden`),
  ADD KEY `list` (`site`,`displayorder`);

ALTER TABLE `{dbprefix}mail_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status` (`status`),
  ADD KEY `updatetime` (`updatetime`);

ALTER TABLE `{dbprefix}mail_smtp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `displayorder` (`displayorder`);

ALTER TABLE `{dbprefix}member`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `username` (`username`),
  ADD KEY `email` (`email`),
  ADD KEY `groupid` (`groupid`),
  ADD KEY `adminid` (`adminid`),
  ADD KEY `phone` (`phone`);

ALTER TABLE `{dbprefix}member_address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`,`default`);

ALTER TABLE `{dbprefix}member_data`
  ADD PRIMARY KEY (`uid`);

ALTER TABLE `{dbprefix}member_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `displayorder` (`displayorder`);

ALTER TABLE `{dbprefix}member_level`
  ADD PRIMARY KEY (`id`),
  ADD KEY `experience` (`experience`),
  ADD KEY `groupid` (`groupid`);

ALTER TABLE `{dbprefix}member_login`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `loginip` (`loginip`),
  ADD KEY `logintime` (`logintime`);

ALTER TABLE `{dbprefix}member_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `list` (`pid`),
  ADD KEY `displayorder` (`displayorder`),
  ADD KEY `mark` (`mark`),
  ADD KEY `hidden` (`hidden`),
  ADD KEY `uri` (`uri`);

ALTER TABLE `{dbprefix}member_new_notice`
  ADD PRIMARY KEY (`uid`);

ALTER TABLE `{dbprefix}member_notice_0`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_1`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_2`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_3`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_4`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_5`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_6`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_7`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_8`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_notice_9`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnew` (`isnew`),
  ADD KEY `type` (`type`,`uid`);

ALTER TABLE `{dbprefix}member_oauth`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`);

ALTER TABLE `{dbprefix}member_online`
  ADD PRIMARY KEY (`uid`),
  ADD KEY `time` (`time`);

ALTER TABLE `{dbprefix}member_paylog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `order` (`order`),
  ADD KEY `status` (`status`);

ALTER TABLE `{dbprefix}member_scorelog`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `type` (`type`),
  ADD KEY `mark` (`mark`),
  ADD KEY `inputtime` (`inputtime`);

ALTER TABLE `{dbprefix}member_setting`
  ADD PRIMARY KEY (`name`);

ALTER TABLE `{dbprefix}module`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dirname` (`dirname`),
  ADD KEY `displayorder` (`displayorder`);

ALTER TABLE `{dbprefix}module_form`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table` (`table`);

ALTER TABLE `{dbprefix}site`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `{dbprefix}urlrule`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type` (`type`);

ALTER TABLE `{dbprefix}var`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `{dbprefix}1_block`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_book`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `{dbprefix}1_book_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_book_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_book_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_book_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_book_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_book_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_book_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_book_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_book_extend_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_book_extend_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_book_extend_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_book_extend_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_book_extend_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `{dbprefix}1_book_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_book_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_book_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `{dbprefix}1_book_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_demo`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=207;
ALTER TABLE `{dbprefix}1_demo_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_demo_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_demo_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_demo_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_demo_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_demo_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_demo_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_demo_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_demo_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_demo_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_demo_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_demo_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `{dbprefix}1_down`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
ALTER TABLE `{dbprefix}1_down_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_down_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_down_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_down_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_down_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_down_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_down_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_down_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_down_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_down_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_down_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
ALTER TABLE `{dbprefix}1_down_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_fang`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
ALTER TABLE `{dbprefix}1_fang_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_fang_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_fang_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_fang_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_fang_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_fang_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_fang_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_fang_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_fang_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_fang_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_fang_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_fang_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_form`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_navigator`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
ALTER TABLE `{dbprefix}1_news`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=207;
ALTER TABLE `{dbprefix}1_news_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_news_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_news_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_news_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_news_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_news_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_news_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_news_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_news_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_news_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_news_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
ALTER TABLE `{dbprefix}1_news_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
ALTER TABLE `{dbprefix}1_page`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_photo_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_photo_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_photo_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_photo_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_photo_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_photo_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_remote`
  MODIFY `id` tinyint(2) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_share_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
ALTER TABLE `{dbprefix}1_share_extend_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `{dbprefix}1_share_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
ALTER TABLE `{dbprefix}1_special`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}1_special_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_special_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_special_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_special_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_special_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_special_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_special_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_special_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_special_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_special_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_special_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_special_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_category`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_category_data`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_category_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_video_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_draft`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_extend_buy`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_extend_comment_data_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID';
ALTER TABLE `{dbprefix}1_video_extend_comment_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_extend_comment_my`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_extend_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_favorite`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}1_video_html`
  MODIFY `id` bigint(18) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_index`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}1_video_tag`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}admin`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}admin_login`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}admin_menu`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=121;
ALTER TABLE `{dbprefix}admin_notice`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id';
ALTER TABLE `{dbprefix}admin_role`
  MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
ALTER TABLE `{dbprefix}admin_verify`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}application`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}attachment`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}comment`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}controller`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}cron_queue`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}downservers`
  MODIFY `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}field`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=103;
ALTER TABLE `{dbprefix}linkage`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}linkage_data_1`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
ALTER TABLE `{dbprefix}mail_queue`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}mail_smtp`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}member_address`
  MODIFY `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_data`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_group`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
ALTER TABLE `{dbprefix}member_level`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
ALTER TABLE `{dbprefix}member_login`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_menu`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=127;
ALTER TABLE `{dbprefix}member_notice_0`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_1`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_2`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_3`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_4`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_5`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_6`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_7`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_8`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_notice_9`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_oauth`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_online`
  MODIFY `uid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}member_paylog`
  MODIFY `id` bigint(15) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}member_scorelog`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}module`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
ALTER TABLE `{dbprefix}module_form`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
ALTER TABLE `{dbprefix}site`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
ALTER TABLE `{dbprefix}urlrule`
  MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
ALTER TABLE `{dbprefix}var`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'Id';