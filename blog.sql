/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : blog

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2019-12-01 17:02:43
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `jianjie` varchar(500) NOT NULL,
  `content` varchar(20000) NOT NULL,
  `time` datetime NOT NULL,
  `img` varchar(500) CHARACTER SET latin1 NOT NULL,
  `type` int(11) NOT NULL,
  `tui` int(11) NOT NULL,
  `clicknum` int(11) NOT NULL,
  `zan` int(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  CONSTRAINT `blog_ibfk_1` FOREIGN KEY (`type`) REFERENCES `blogtype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', '为什么说10月24日是程序员的节日？', '创立“程序员节”最早是来自俄文《计算机世界》（《Компьютерра》）出版社的主编德米特里·门德列留科（Дмитрий Мендрелюк）在1996年7月15日的想法，当时计划将节日命名为“计算机用户节”，定在每年9月份的第一个星期五，称之为“纯净的星期五', '创立“程序员节”最早是来自俄文《计算机世界》（《Компьютерра》）出版社的主编德米特里·门德列留科（Дмитрий Мендрелюк）在1996年7月15日的想法，当时计划将节日命名为“计算机用户节”，定在每年9月份的第一个星期五，称之为“纯净的星期五”（Чистая Пятница，按照当事人之一的说法，这样命名是为了刺激那些计算机病毒制造者）。\r\n说到程序员节的来历，这要归功于一名在并行技术网页设计公司工作的职工——伦丁·巴尔特。2002年，他收集签名向俄罗斯联邦政府请愿，请求将这一天定为程序员节。2009年7月24日，俄罗斯联邦通信与大众传媒部提出了新的节日安排方案，设立程序员节。9月11日，俄罗斯总统梅德韦杰夫签署了这个法案，也就成为了俄罗斯的一个官方节日。这一行动在5天内得到了9800个投票支持。', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h1.jpg', '1', '1', '10', '239');
INSERT INTO `blog` VALUES ('2', '个人网站做好了，百度不收录怎么办？来，看看他们怎么做的。', '不管你是学前端的还是后端的，作为一个程序员，做一个自己的博客，那是必然的。咱们的圈子就这么大，想让更多的人了解你，看看你的技术多牛逼，扔一个博客地址就行了。\r\n\r\n大多数人在没有', '不管你是学前端的还是后端的，作为一个程序员，做一个自己的博客，那是必然的。咱们的圈子就这么大，想让更多的人了解你，看看你的技术多牛逼，扔一个博客地址就行了。\r\n\r\n大多数人在没有搭建好博客之前，看到别人的博客做得那么绚丽，内容那么丰富，心里啊就想着自己也要弄个博客玩儿，不求排名，自娱自乐。可是越往后，你越会发现，自己一个人观赏那不够，于是就想让更多的人搜到你自己的博客。又开始琢磨怎么优化，天天在百度site看收录没有，七天，绝对熬不过七天，九成的人就会崩溃，而且对博客的热度开始慢慢减少，有些甚至破罐子破摔了，本来坚持原创的，后来伪原创，再后来直接转别人的，再再后来就干脆懒得打理网站了。', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h2.jpg', '3', '1', '2', '1');
INSERT INTO `blog` VALUES ('3', '个人博客，属于我的小世界！', '个人博客，用来做什么？我刚开始就把它当做一个我吐槽心情的地方，也就相当于一个网络记事本，写上一些关于自己生活工作中的小情小事，也会放上一些照片，音乐。每天工作回家后就能访问自己的网站，一边听着音乐，一边写写文章。', '本文很长，记录了我博客建站初到现在的过程，还有我从毕业到现在的一个状态，感谢您的阅读，如果你还是学生，也许你能从此文中，找到我们曾经相似的地方。如果你已经工作，有自己的博客，我想，你并没有忘记当初建立个人博客的初衷吧！\r\n\r\n我的个人博客已经建站有8年的时间了，对它的热爱，一直都是只增未减。回想大学读书的那几年，那会儿非常流行QQ空间，我们寝室的室友还经常邀约去学校的网吧做自己的空间。系里有个男生，空间做得非常漂亮，什么悬浮，开场动画，音乐播放器，我们女生羡慕得不得了。还邀约他跟我们一起去通宵弄空间，网上可以找到很多免费的flash资源，还有音乐，那也是第一次接触js，知道在浏览器输入一个地址，修改一下数据，就能调用一些背景出来。然后把自己QQ空间弄得漂漂亮亮的，经常邀约室友来互踩。我记得08年地震，第二天晚上，我们寝室的几个人还淡定的在寝室装扮空间呢！', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h3.jpg', '5', '1', '5', '0');
INSERT INTO `blog` VALUES ('4', '安静地做一个爱设计的女子', '自从入了这行，很多人跟我说可以做网络教程，我也有考虑，但最终没有实现，因为我觉得在这个教程泛滥的时代，直接做一套免费的原创个人博客模板更为实在。每当看到自己喜欢的配色图片', '自从入了这行，很多人跟我说可以做网络教程，我也有考虑，但最终没有实现，因为我觉得在这个教程泛滥的时代，直接做一套免费的原创个人博客模板更为实在。每当看到自己喜欢的配色图片或者布局，惊艳的js或者css3效果的时候，就有了做模板的冲动。', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h1.jpg', '1', '1', '7', '1');
INSERT INTO `blog` VALUES ('5', '双十一，阿里云特惠活动，快来领券啦', '一折的产品，有没有看错，咱来看看，到底是哪些一折，想买空间吗？算了吧，服务器的价钱都比空间便宜呢，那肯定买服务器啊，咱来看看阿里云一折的服务器哪些好', '一折的产品，有没有看错，咱来看看，到底是哪些一折，想买空间吗？算了吧，服务器的价钱都比空间便宜呢，那肯定买服务器啊，咱来看看阿里云一折的服务器哪些好核2G云服务器1年，原价821.00/1年，现在呢，新用户参团的话，￥199.00/1年。很多小伙伴担心续费贵，其实只要你网站搬迁不麻烦，那就没关系的，因为明年，后年，还会有双十一活动，所以不用担心啦。\r\n\r\n要问哪个团购人数最多，来，看这个，我也参团其中了，虽然团长不是我，但我就喜欢人多热闹啊，目前已经接近3000人群了\r\n\r\n点下面的链接，参团吧。', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h2.jpg', '2', '1', '1', '2');
INSERT INTO `blog` VALUES ('6', '第二届 优秀个人博客模板比赛参选活动', '只要你是在校大学生，不管你是新生，还是即将毕业，不管你是前端菜鸟，还是前端大神，只要你会html，这里将会是你展示才能的大平台。', '大家还记得第一届模板比赛活动，评选的优秀站长窦耀宇吗？也许你不记得他名字，但一定对他的设计《柠檬绿兔小白》还有印象，他的作品得到了很多朋友的好评。本次活动，只要你是在校大学生，不管你是新生，还是即将毕业，不管你是前端菜鸟，还是前端大神，只要你会html，这里将会是你展示才能的大平台。交友？找工作？你需要给自己设计一个个人博客，行动起来吧，我就说一句，敢不敢来得瑟一下！', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h3.jpg', '3', '1', '0', '0');
INSERT INTO `blog` VALUES ('7', '即便是坑，我也想要拉你入伙！', '对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无非就是学会html和css，先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》，如果你还不知道如何着手，请仔细阅读....7天的时间，入门是没有问题的，当然，如果你用心的话！', '之前谈《女程序员职业生涯该如何发展？》其实，女程序员的职业生涯相对于男程序员来说是很短暂的。就目前我来说，从事这行都已有五年时间，当觉得自己在一个瓶颈阶段无法突破自己的时候，出现了html5和css3，新的技术研究，可以重拾当初学习的激情和兴趣，于是又坚持至今....\r\n\r\n个人博客也是动力之一，博客从一年前的每天访问IP不到60人升到了如今每天将近400个IP，跳出率也由60%缩短到了30%。博客模板也换了n个版本，也结交了很多朋友，一次次的更新和进步还有网友的支持才换来今天的成绩...\r\n\r\n对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无非就是学会html和css，先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》，如果你还不知道如何着手，请仔细阅读....7天的时间，入门是没有问题的，当然，如果你用心的话！\r\n\r\n即便是坑，我也想要拉你入伙！even the pit , and i also want to pull your occupation !\r\n\r\n前两天有网友跟我聊天，谈到互联网的前景，他很迷茫，要不要继续坚持下去，我说“如果是我，我在这一行肯定干不了多久，毕竟，我的人生规划，就是以后相夫教子。”我劝他，如果自己在这一行这么迷茫堪忧下去，只会耽误自己的时间，趁着年轻，重新找自己喜欢的工作和行业，并且坚持下去....\r\n\r\n表妹刚刚毕业，之前选专业的时候，就是冲着学html去的，结果几年时间下来，学的是维护...女孩子学这个，确实有点儿让人崩溃，这下又得走我的老路了，还是得自己学习。我不强迫她一定要学习html和css。如果她不感兴趣，是不能勉强的。就像找工作和对象一样，需要不断的摸索，才能找到自己的喜欢的....', '2018-11-08 00:00:00', 'http://localhost:8100/centerblogimage/h1.jpg', '4', '1', '0', '4');
INSERT INTO `blog` VALUES ('23', '地方撒打算', '的萨达十大', '<p>用实例：</p>\r\n<p><img src=\"http://static.runoob.com/images/runoob-logo.png\" alt=\"RUNOOB 图标\" /></p>\r\n<p><img src=\"http://static.runoob.com/images/runoob-logo.png\" alt=\"RUNOOB 图标\" title=\"RUNOOB\" /></p>', '2019-12-01 16:47:29', '/centerblogimage/xV4cHgYdbrqrjwrnjLZlXzog.jpg', '1', '0', '0', '0');
INSERT INTO `blog` VALUES ('24', 'vue', 'vue简介', '<h3 id=\"\">实现效果</h3>\r\n<p><img src=\"https://img-blog.csdnimg.cn/20191119221135629.gif\" alt=\"在这里插入图片描述\" /></p>\r\n<h3 id=\"-1\">长知识</h3>\r\n<p>学了忘，忘了学！</p>\r\n<ol>\r\n<li>端口修改：</li>\r\n</ol>\r\n<blockquote>\r\n  <p>??直接写端口不能识别\r\n  <img src=\"https://img-blog.csdnimg.cn/20191116133316190.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyNzAxOTk5,size_16,color_FFFFFF,t_70\" alt=\"在这里插入图片描述\" />\r\n  还可以在index.js中直接修改\r\n  <code>can be overwritten by process.env.PORT, if port is in use, a free one will be determined</code>\r\n  可以被process.env.PORT覆盖，如果端口正在使用，则将确定空闲端口<img src=\"https://img-blog.csdnimg.cn/20191116140557637.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3FxXzQyNzAxOTk5,size_16,color_FFFFFF,t_70\" alt=\"在这里插入图片描述\" /></p>\r\n  <ol start=\"2\">\r\n  <li>==fieldset== 元素可将表单内的相关元素分组。</li>\r\n  </ol>\r\n  <p><code>&lt;fieldset&gt;</code> 标签将表单内容的一部分打包，生成一组相关表单的字段。</p>\r\n  <p>当一组表单元素放到 <code>&lt;fieldset&gt;</code> 标签内时，浏览器会以特殊方式来显示它们，它们可能有特殊的边界、3D效果，或者甚至可创建一个子表单来处理这些元素。</p>\r\n  <p><code>&lt;fieldset&gt;</code> 标签没有必需的或唯一的属性。</p>\r\n  <p><code>&lt;legend&gt;</code> 标签为 fieldset 元素定义标题。</p>\r\n  <ol start=\"3\">\r\n  <li>在给表单元素绑定checked属性时忘了使用v-bind绑定，结果没有拿到变量的值，全部默认选中。不会随变量变化动态修改</li>\r\n  </ol>\r\n</blockquote>', '2019-12-01 16:53:14', '/centerblogimage/LCVRCCYIfWT2fp2yH9pj38um.jpg', '1', '0', '0', '2');

-- ----------------------------
-- Table structure for blogtype
-- ----------------------------
DROP TABLE IF EXISTS `blogtype`;
CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blogtype
-- ----------------------------
INSERT INTO `blogtype` VALUES ('1', '个人博客');
INSERT INTO `blogtype` VALUES ('2', 'CSS3|HTML5');
INSERT INTO `blogtype` VALUES ('3', '网站建设');
INSERT INTO `blogtype` VALUES ('4', '推荐工具');
INSERT INTO `blogtype` VALUES ('5', '设计心得');

-- ----------------------------
-- Table structure for msg
-- ----------------------------
DROP TABLE IF EXISTS `msg`;
CREATE TABLE `msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `face` varchar(255) NOT NULL,
  `content` varchar(500) NOT NULL,
  `times` datetime NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of msg
-- ----------------------------
INSERT INTO `msg` VALUES ('1', '112', 'http://localhost:8100/userface/tx3.jpg', '321', '2019-12-01 00:00:00', '0');
INSERT INTO `msg` VALUES ('2', '毛豆', 'http://localhost:8100/userface/tx5.jpg', '很快就等你死定了考三科', '2019-12-01 11:23:49', '1');

-- ----------------------------
-- Table structure for onemenu
-- ----------------------------
DROP TABLE IF EXISTS `onemenu`;
CREATE TABLE `onemenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of onemenu
-- ----------------------------
INSERT INTO `onemenu` VALUES ('1', '首页', '/');
INSERT INTO `onemenu` VALUES ('2', '个人博客', '/geren');
INSERT INTO `onemenu` VALUES ('3', '网站制作', '/wangzhan');
INSERT INTO `onemenu` VALUES ('4', '设计心得', '/sheji');
INSERT INTO `onemenu` VALUES ('5', '关于我', '/about');
INSERT INTO `onemenu` VALUES ('6', '时间轴', '/time');
INSERT INTO `onemenu` VALUES ('7', '博客导航', '/dao');
INSERT INTO `onemenu` VALUES ('8', '留言', '/liu');

-- ----------------------------
-- Table structure for send
-- ----------------------------
DROP TABLE IF EXISTS `send`;
CREATE TABLE `send` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msgid` int(11) NOT NULL,
  `msg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `msgid` (`msgid`),
  CONSTRAINT `send_ibfk_1` FOREIGN KEY (`msgid`) REFERENCES `msg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send
-- ----------------------------
INSERT INTO `send` VALUES ('1', '2', '你换个字行不？');
INSERT INTO `send` VALUES ('2', '2', '部分科技的社保卡');

-- ----------------------------
-- Table structure for twomenu
-- ----------------------------
DROP TABLE IF EXISTS `twomenu`;
CREATE TABLE `twomenu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `foreignid` int(11) NOT NULL,
  `action` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `foreignid` (`foreignid`),
  CONSTRAINT `twomenu_ibfk_1` FOREIGN KEY (`foreignid`) REFERENCES `onemenu` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of twomenu
-- ----------------------------
INSERT INTO `twomenu` VALUES ('1', '网站建设', '3', '/jianshe');
INSERT INTO `twomenu` VALUES ('2', '推荐工具', '3', '/gongju');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `job` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `QQ` varchar(255) NOT NULL,
  `face` varchar(255) NOT NULL,
  `txt` varchar(255) NOT NULL,
  `dubai` varchar(255) NOT NULL,
  `userid` varchar(255) NOT NULL,
  `userpwd` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'DanceSmile | 即步非烟', 'Web前端设计师、网页设计', '陕西-西安市', 'dancesmiling@qq.com', '毛豆', '男', '18', '321213213213', '1121176958', 'http://localhost:8100/face/avatar.jpg', '一个80后草根女站长！Web前端设计师、网页设计师。\r\n\r\n欢迎您，来到我的个人博客，你，我生命中一个重要的过客，我们之所以是过客，因为你未曾会为我停留。', '我叫杨青青，我是一个80后草根女站长！09年入行。我一直潜心研究网页前端技术，一边工作一边积累经验，分享一些个人博客模板，以及网站优化等心得。我入行早，大家也亲切的叫我“青姐”。我的个人博客搜索“个人博客”、“博客”，一直都靠前。最有意思的是，我有三年的时间没有去更新它，依然排在前面。虽然期间有很多的不容易，但是我都没有放弃过。选了这一行 ，就深深的喜欢上它。我喜欢一句话“冥冥中该来则来，无处可逃”。我喜欢上了前端设计，喜欢坐在电脑前敲代码，喜欢跟一堆程序员聊天。这辈子，我也逃不出去了，深深的陷了进来。', 'admin', '12345');
