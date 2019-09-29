/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : db_blog

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2019-09-29 16:32:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_blog`
-- ----------------------------
DROP TABLE IF EXISTS `t_blog`;
CREATE TABLE `t_blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `summary` varchar(400) DEFAULT NULL COMMENT '摘要',
  `releaseDate` datetime DEFAULT NULL COMMENT '发表时间',
  `clickHit` int(11) DEFAULT NULL COMMENT '点击数',
  `replayHit` int(11) DEFAULT NULL COMMENT '评论数',
  `content` text COMMENT '内容',
  `typeId` int(11) DEFAULT NULL COMMENT '所属博客类型',
  `keyWord` varchar(200) DEFAULT NULL COMMENT '关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blog
-- ----------------------------
INSERT INTO `t_blog` VALUES ('2', '我的第一篇blog', '3.4 压缩，解压命令Linux 压缩，解压命令Linux压缩包：     *.tar  打包  大小不会压缩                            *.tar.gz    打包并压缩文件大小 压缩：(参数顺序不变)tar – zcvf  压缩包的名字.tar.gz  需要压缩的内容例如： t', '2019-09-28 21:07:47', '1', '0', '<h2>3.4 压缩，解压命令</h2><p>Linux 压缩，解压命令</p><p>Linux压缩包：&nbsp;&nbsp;&nbsp;&nbsp; *.tar&nbsp; 打包 &nbsp;大小不会压缩</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *.tar.gz&nbsp;&nbsp;&nbsp; 打包并压缩文件大小</p><p>&nbsp;</p><p>压缩：(参数顺序不变)</p><p>tar – zcvf&nbsp; 压缩包的名字.tar.gz&nbsp; 需要压缩的内容</p><p>例如： tar -zcvf hehe.tar.gz&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;将目前目录下所有的内容进行打包压缩,文件名为hehe.tar.gz</p><p>&nbsp;</p><p>解压：（参数顺序不变）</p><p>&nbsp;&nbsp;tar -zxvf&nbsp; 需要解压的压缩包&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 解压到当前目录</p><p>&nbsp;tar -zxvf&nbsp; 需要解压的压缩包 &nbsp;-C 指定压缩路径 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;解压到指定路径</p><p>&nbsp;</p><p>需求： &nbsp;需要把/root/t5/hehe.tar.gz&nbsp; 压缩包解压到指定目录中&nbsp; 指定目录/root/t5/t5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p><p>位置：/root/t5</p><p>命令： tar -zxvf hehe.tar.gz -C /root/t5/t5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 绝对路径</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Tar -zxvf hehe.tar.gz -C t5 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 相对路径</p><p>&nbsp;</p><p><img src=\"/Blog/static/userImages/20190928/1569676016327052505.jpg\" title=\"1569676016327052505.jpg\" alt=\"SubstandardFullSizeRender.jpg\"/><img src=\"http://img.baidu.com/hi/jx2/j_0003.gif\"/></p>', '1', '');

-- ----------------------------
-- Table structure for `t_blogger`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogger`;
CREATE TABLE `t_blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userName` varchar(50) DEFAULT NULL COMMENT '登陆名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `profile` text COMMENT '个人信息',
  `nickName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `sign` varchar(100) DEFAULT NULL COMMENT '个性签名',
  `imageName` varchar(100) DEFAULT NULL COMMENT '头像地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='博主';

-- ----------------------------
-- Records of t_blogger
-- ----------------------------
INSERT INTO `t_blogger` VALUES ('1', 'admin', '6d8ec72ff4e1f92aee2271eebf38a84b', null, null, null, null);

-- ----------------------------
-- Table structure for `t_blogtype`
-- ----------------------------
DROP TABLE IF EXISTS `t_blogtype`;
CREATE TABLE `t_blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `typeName` varchar(100) DEFAULT NULL COMMENT '类型名称',
  `orderNo` int(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_blogtype
-- ----------------------------
INSERT INTO `t_blogtype` VALUES ('1', 'java', '1');
INSERT INTO `t_blogtype` VALUES ('2', '数据结构', '2');
INSERT INTO `t_blogtype` VALUES ('3', '算法', '3');

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userIP` varchar(50) DEFAULT NULL COMMENT '评论者IP',
  `blogId` int(11) DEFAULT NULL COMMENT '被评论博客主键',
  `content` varchar(1000) DEFAULT NULL COMMENT '评论内容',
  `commentDate` datetime DEFAULT NULL COMMENT '评论时间',
  `state` int(11) DEFAULT NULL COMMENT '评论状态：0未审核1审核通过2审核未通过',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_link`
-- ----------------------------
DROP TABLE IF EXISTS `t_link`;
CREATE TABLE `t_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `linkName` varchar(100) DEFAULT NULL COMMENT '网站名称',
  `linkUrl` varchar(500) DEFAULT NULL COMMENT '网站地址',
  `orderNo` varchar(11) DEFAULT NULL COMMENT '序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';

-- ----------------------------
-- Records of t_link
-- ----------------------------
