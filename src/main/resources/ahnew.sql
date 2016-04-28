/*
Navicat MySQL Data Transfer

Source Server         : loclahost
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : ahnew

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-04-28 17:42:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LABEL` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `SORT` int(11) DEFAULT NULL,
  `REMARK` varchar(255) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('1', '正常', '0', 'user', '用户状态', '1', null, null);
INSERT INTO `dict` VALUES ('2', '禁用', '1', 'user', '用户状态', '2', null, null);
INSERT INTO `dict` VALUES ('4', '普通用户', '0', 'user', '用户类型', null, null, null);
INSERT INTO `dict` VALUES ('5', '会员用户', '1', 'user', '用户类型', null, null, null);

-- ----------------------------
-- Table structure for fitwear_app
-- ----------------------------
DROP TABLE IF EXISTS `fitwear_app`;
CREATE TABLE `fitwear_app` (
  `id` bigint(20) DEFAULT NULL,
  `appname` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `developer` varchar(255) DEFAULT NULL,
  `vername` varchar(255) DEFAULT NULL,
  `vercode` varchar(255) DEFAULT NULL,
  `summary` varchar(500) DEFAULT NULL,
  `descript` varchar(1000) DEFAULT NULL,
  `logo` varchar(500) DEFAULT NULL,
  `imgs` varchar(1000) DEFAULT NULL,
  `m_apk` varchar(500) DEFAULT NULL,
  `f_apk` varchar(500) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `operater` varchar(255) DEFAULT NULL,
  `isdel` int(2) DEFAULT NULL,
  `sortorder` varchar(255) DEFAULT NULL,
  `m_apk_size` varchar(255) DEFAULT NULL,
  `f_apk_size` varchar(255) DEFAULT NULL,
  `packagename` varchar(255) DEFAULT NULL,
  `magentlist` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fitwear_app
-- ----------------------------
INSERT INTO `fitwear_app` VALUES ('18', '白武士表盘', '5', 'null', '1', '1.8', 'WatchMaster是一个表盘设计师群，他们的目的是以其无与伦比的设计质量来提升智能手表的审美标准', 'WatchMaster是一个表盘设计师群，他们的目的是以其无与伦比的设计质量来提升智能手表的审美标准', 'http://image.ticwear.com/appstore/5e4d3f0cab5fb04ab07ceb9db9886300,', 'http://s.927114.com/upfile/8/1.png,http://s.927114.com/upfile/8/2.png,http://s.927114.com/upfile/8/3.png,http://s.927114.com/upfile/8/4.png,http://s.927114.com/upfile/8/5.png,http://s.927114.com/upfile/8/6.png,', 'http://res.appstore.ticwear.com/dd.watchdesigner.whiteknight_1.8.apk,', 'http://res.appstore.ticwear.com/dd.watchdesigner.whiteknight_10_wear.apk,', null, 'operate', '0', '18', '0', '0', 'dd.watchdesigner.whiteknight', null);
INSERT INTO `fitwear_app` VALUES ('24', '亲密360', '4', 'null', '1.2.3', '2', '亲密360—最有爱的定位软件', '亲密360—最有爱的定位软件。随时看到亲友位置并拥有最贴心的及时好友动态提醒功能，让手机定位功能变得与众不同1', 'http://s.927114.com/upfile/23/wear_360.png,', 'null', 'http://s.927114.com/upfile/2/xmiao_circle_phone.apk,', 'http://s.927114.com/upfile/2/xmiao_circle_wear.apk,', null, 'operate', '0', '24', '024941796,', '01733779,', 'com.xmiao.circle', null);
INSERT INTO `fitwear_app` VALUES ('30', '模拟放屁', '4', 'null', '1.1.2', '1', '把你的手机和智能手表变成遥控放屁坐垫', '把你的手机和智能手表变成遥控放屁坐垫', 'http://s.927114.com/upfile/29/wear_whoopee.png,', 'null', 'http://s.927114.com/upfile/2/whoopeewear_phone.apk,', 'http://s.927114.com/upfile/2/whoopeewear_wear.apk,', null, 'operate', '0', '30', '8481381,', '1795975,', 'com.nordeck.whoopeewear', null);
INSERT INTO `fitwear_app` VALUES ('33', '优雅表盘', '5', 'null', '3.4', '1', '这个表盘优雅和经典结合Android Wear现代功能', '这个表盘优雅和经典结合Android Wear现代功能', 'http://s.927114.com/upfile/32/wear_andpercent.png,', 'null', 'http://s.927114.com/upfile/2/andpercent_phone.apk,', 'http://s.927114.com/upfile/2/andpercent_wear.apk,', null, 'operate', '0', '33', '5506173,', '2467503,', 'com.andpercent.apps.digitalwatch', null);
INSERT INTO `fitwear_app` VALUES ('35', 'WatchMaker', '5', 'null', '3.8.1', '1', '一款表盘软件，可以自己设计表盘', '一款表盘软件，可以自己设计表盘', 'http://s.927114.com/upfile/34/wear_WatchMaker.png,', 'null', 'http://s.927114.com/upfile/2/watchFrenzy_phone.apk,', 'http://s.927114.com/upfile/2/watchFrenzy_wear.apk,', null, 'operate', '0', '35', '16772313,', '5846356,', 'slide.watchFrenzy', null);
INSERT INTO `fitwear_app` VALUES ('36', '速度表盘', '5', 'null', '1.0.5', '1', '“速度”表盘将你的Android Wear手表成为运动时间机器。', '“速度”表盘将你的Android Wear手表成为运动时间机器。', 'http://s.927114.com/upfile/35/wear_speedometer.png,', 'null', 'http://s.927114.com/upfile/2/speedometer_phone.apk,', 'http://s.927114.com/upfile/2/speedometer_wear.apk,', null, 'operate', '0', '36', '8277944,', '3454318,', 'co.smartwatchface.watch.face.speedometer.android.wear', null);
INSERT INTO `fitwear_app` VALUES ('37', 'Runner表盘', '5', 'null', '1.8', '1', '新的电子Runner表盘有适合Android 5 Wear的心率显示器，步数计算器和定制的颜色', '新的电子Runner表盘有适合Android 5 Wear的心率显示器，步数计算器和定制的颜色', 'http://s.927114.com/upfile/36/wear_runner.png,', 'null', 'http://s.927114.com/upfile/2/runner_phone.apk,', 'http://s.927114.com/upfile/2/runner_wear.apk,', null, 'operate', '0', '37', '4356791,', '2578334,', 'com.watch.richface.runner', null);
INSERT INTO `fitwear_app` VALUES ('38', 'Escape表盘', '5', 'null', '1.1.2', '1', 'Android Wear上你首选的户外伴侣。运动起来，通过自带的Android Wear计步器来跟踪您的脚步。指南针会在野外为你指路。', 'Android Wear上你首选的户外伴侣。运动起来，通过自带的Android Wear计步器来跟踪您的脚步。指南针会在野外为你指路。', 'http://s.927114.com/upfile/37/wear_escape.png,', 'null', 'http://s.927114.com/upfile/2/escape_phone.apk,', 'http://s.927114.com/upfile/2/escape_wear.apk,', null, 'operate', '0', '38', '6948450,', '3031572,', 'escape.watch.face', null);
INSERT INTO `fitwear_app` VALUES ('41', '静音震动控制', '7', 'null', '2.2', '1', '看电影的时候不想你的手机意外的响铃？开会的时候忘记关闭手机的音量和振动？使用Rintone控制器就可以让你快速的在手表上设置手机的静音振动状态', '看电影的时候不想你的手机意外的响铃？开会的时候忘记关闭手机的音量和振动？使用Rintone控制器就可以让你快速的在手表上设置手机的静音振动状态', 'http://s.927114.com/upfile/40/wear_ringremote.png,', 'null', 'http://s.927114.com/upfile/2/ringremote_phone.apk,', 'http://s.927114.com/upfile/2/ringremote_wear.apk,', null, 'operate', '0', '41', '5681698,', '1973884,', 'com.businessslacks.ringremote', null);
INSERT INTO `fitwear_app` VALUES ('43', '手表大师', '7', 'null', '1.7', '1', '智能手表必备APP，手表加速再加速', '智能手表必备APP，手表加速再加速', 'http://s.927114.com/upfile/42/wear_master.png,', 'null', 'http://s.927114.com/upfile/2/master_phone.apk,', 'http://s.927114.com/upfile/2/master_wear.apk,', null, 'operate', '0', '43', '8034820,', '3002169,', 'com.wearelf.master', null);
INSERT INTO `fitwear_app` VALUES ('45', '搜狗地图', '7,14', 'null', '6.6.1', '1', '搜狗地图-路况最准，最省时间的免费语音导航', '搜狗地图-路况最准，最省时间的免费语音导航', 'http://s.927114.com/upfile/44/wear_sogoumap.png,', 'null', 'http://s.927114.com/upfile/2/sogoumap_phone.apk,', 'http://s.927114.com/upfile/2/sogoumap_wear.apk,', null, 'operate', '0', '-1', '27817509,', '2098302,', 'com.sogou.map.android.maps', null);
INSERT INTO `fitwear_app` VALUES ('46', '随口记', '7', 'null', '1.19', '1', '毕业设计开的语音记账坑，手机端使用百度语音引擎，手表端使用出门问问语音引擎', '毕业设计开的语音记账坑，手机端使用百度语音引擎，手表端使用出门问问语音引擎', 'http://s.927114.com/upfile/45/wear_moneycharge.png,', 'null', 'http://s.927114.com/upfile/2/moneycharge_phone.apk,', 'http://s.927114.com/upfile/2/moneycharge_wear.apk,', null, 'operate', '0', '46', '8471121,', '1165960,', 'com.cwp.cmoneycharge', null);
INSERT INTO `fitwear_app` VALUES ('49', 'Familonet家庭网络', '4', 'null', '1.22', '1', '最可靠的自动通知，当您的家人到达学校、工作地或家里时', '最可靠的自动通知，当您的家人到达学校、工作地或家里时', 'http://s.927114.com/upfile/48/wear_Familonet.png,', 'null', 'http://s.927114.com/upfile/2/familo_phone.apk,', 'http://s.927114.com/upfile/2/familo_wear.apk,', null, 'operate', '0', '49', '9815807,', '1445163,', 'net.familo.android', null);
INSERT INTO `fitwear_app` VALUES ('50', '帮你选择', '4', 'null', '1', '1', '如果你犹豫不决，选择困难你是否应该去睡觉或保持整晚看着视频，吃饭比萨饼或汉堡之间进行选择，选择困难症的药来了', '如果你犹豫不决，选择困难你是否应该去睡觉或保持整晚看着视频，吃饭比萨饼或汉堡之间进行选择，选择困难症的药来了', 'http://s.927114.com/upfile/49/wear_help_choose.png,', 'null', 'http://s.927114.com/upfile/2/decidr_phone.apk,', 'http://s.927114.com/upfile/2/decidr_wear.apk,', null, 'operate', '0', '50', '2674937,', '1804370,', 'com.pxstudios.decidr', null);
INSERT INTO `fitwear_app` VALUES ('51', '2048', '9,14', 'null', '1.3', '1', '2048现在可以在智能手表上玩啦', '2048现在可以在智能手表上玩啦', 'http://s.927114.com/upfile/50/wear_2048.png,', 'null', 'http://s.927114.com/upfile/2/game2048_phone.apk,', 'http://s.927114.com/upfile/2/game2048_wear.apk,', null, 'operate', '0', '51', '2912616,', '1961044,', 'org.scoutant.game2048', null);
INSERT INTO `fitwear_app` VALUES ('52', '旋转啤酒瓶', '9', 'null', '2.0.1', '1', '一款转酒瓶游戏', '一款转酒瓶游戏', 'http://s.927114.com/upfile/51/wear_bottlespinner.png,', 'null', 'http://s.927114.com/upfile/2/wearbottlespinner_phone.apk,', 'http://s.927114.com/upfile/2/wearbottlespinner_wear.apk,', null, 'operate', '0', '52', '3488388,', '1905716,', 'eliseo.wearbottlespinner.wear', null);
INSERT INTO `fitwear_app` VALUES ('53', '跳跃赛车', '9', 'null', '1.02', '1', '跳跃赛车是一款动作冒险游戏的磨损从典型的驾驶游戏不同。它提供了一个经验十足的高速追逐，跳跃技巧以及大量杀伤性', '跳跃赛车是一款动作冒险游戏的磨损从典型的驾驶游戏不同。它提供了一个经验十足的高速追逐，跳跃技巧以及大量杀伤性', 'http://s.927114.com/upfile/52/wear_teensystudios.png,', 'null', 'http://s.927114.com/upfile/2/teensystudios_phone.apk,', 'http://s.927114.com/upfile/2/teensystudios_wear.apk,', null, 'operate', '0', '53', '12972566,', '10391199,', 'com.teensystudios.carhop', null);
INSERT INTO `fitwear_app` VALUES ('54', '城市快跑', '9', 'null', '1.4', '1', '城市快跑是一个永无止境的赛跑者的游戏。你需要时间仔细在大厦之间跳跃，看看你可以走多远', '城市快跑是一个永无止境的赛跑者的游戏。你需要时间仔细在大厦之间跳跃，看看你可以走多远', 'http://s.927114.com/upfile/53/wear_skyscraperjumper.png,', 'null', 'http://s.927114.com/upfile/2/skyscraperjumper_phone.apk,', 'http://s.927114.com/upfile/2/skyscraperjumper_wear.apk,', null, 'operate', '0', '54', '13733888,', '11181634,', 'com.teensygames.skyscraperjumper', null);
INSERT INTO `fitwear_app` VALUES ('28', '飞扬的小鸟', '4,14', 'null', '1.3', '1', '本游戏是著名的《Flappy Bird》游戏的克隆实现，并做了一些改进。', '本游戏是著名的《Flappy Bird》游戏的克隆实现，并做了一些改进。', 'http://s.927114.com/upfile/27/wear_flappywear.png,', 'null', 'http://s.927114.com/upfile/2/flappywear_phone.apk,', 'http://s.927114.com/upfile/2/flappywear_wear.apk,', null, 'operate', '0', '0', '2839633,', '1913168,', 'com.appslight.flappywear', null);
INSERT INTO `fitwear_app` VALUES ('29', '喝水助手', '13', 'null', '1', '1', '用于每日提醒和跟踪你的饮水指标', '《让我湿润 Wear Hydrate Me》是个简单的Android Wear应用，可以用于每日提醒和跟踪你的饮水指标', 'http://s.927114.com/upfile/28/wear_hydrateme.png,', 'null', 'http://s.927114.com/upfile/2/hydrateme_phone.apk,', 'http://s.927114.com/upfile/2/hydrateme_wear.apk,', null, 'operate', '0', '29', '6757283,', '1720909,', 'com.aeustech.hydrateme', null);
INSERT INTO `fitwear_app` VALUES ('31', '小黄人表盘', '5', 'null', '1.0.6', '1', '环球影视团队带给你“卑鄙的我”的特许经营以及即将到来的电影“卑鄙的我”，将为您带来一个卑鄙的带手表的新方法', '环球影视团队带给你“卑鄙的我”的特许经营以及即将到来的电影“卑鄙的我”，将为您带来一个卑鄙的带手表的新方法', 'http://s.927114.com/upfile/30/wear_despicable.png,', 'null', 'http://s.927114.com/upfile/2/despicable_phone.apk,', 'http://s.927114.com/upfile/2/despicable_wear.apk,', null, 'operate', '0', '0', '10673465,', '8109772,', 'co.touchlab.wear.despicable.watch', null);
INSERT INTO `fitwear_app` VALUES ('32', '天气表盘', '5', 'null', '1.2.1', '1', '您的Andr??oid Wear设备上的最好的天气表盘', '您的Andr??oid Wear设备上的最好的天气表盘', 'http://s.927114.com/upfile/31/wear_weather.png,', 'null', 'http://s.927114.com/upfile/2/weather_phone.apk,', 'http://s.927114.com/upfile/2/weather_wear.apk,', null, 'operate', '0', '32', '3884163,', '1851399,', 'com.pizzaentertainment.weatherwatchface', null);
INSERT INTO `fitwear_app` VALUES ('263', '圣诞夜景', '5', '北京数字天域', '1', '1', '是一款以城市夜景为背景，驯鹿为秒针的圣诞表盘  ', '是一款以城市夜景为背景，驯鹿为秒针的圣诞表盘', 'http://s.927114.com/upfile/241/city_night_preview_circular.png,', null, 'http://s.927114.com/upfile/241/christmas_night_mobile-release.apk,', 'http://s.927114.com/upfile/241/christmas_night_wear-release.apk,', null, null, '0', '263', '3614733,', '1101122,', 'com.fitwear.christmasnight', null);
INSERT INTO `fitwear_app` VALUES ('118', '太空穿梭表盘', '5', 'null', '1.2', '1', '面对大众的功能性表盘。漫长的等待终于结束了，此表盘使用官方安卓手表表盘API。希望您享受这款趣味十足的表盘。', '注意：请确认您的手表运行的是基于Android Wear 5.0的智能手表操作系统。目前更新已经开启但可能需要几天时间。感谢您的耐心等候。我最初设计了Moto360的插图。之后我便应邀制作了面对大众的功能性表盘。漫长的等待终于结束了，此表盘使用官方安卓手表表盘API。希望您享受这款趣味十足的表盘。产品特点：支持方形与圆形手表。支持省电模式。', 'http://image.ticwear.com/appstore/571213bbd7cc3797e7577b01c5e1eba3', 'null', 'http://res.appstore.ticwear.com/net.genggao.spaceandtime_1.2.apk', 'http://res.appstore.ticwear.com/net.genggao.spaceandtime_3_wear.apk', null, 'operate', '0', null, '2655639', '1645454', 'net.genggao.spaceandtime', null);
INSERT INTO `fitwear_app` VALUES ('57', '太空侵略者Invaders', '9', 'null', '1.6.6', '1', '如果你喜欢太空侵略者（Space Invaders），你一定会喜欢手表版的太空侵略者！', '如果你喜欢太空侵略者（Space Invaders），你一定会喜欢手表版的太空侵略者！', 'http://s.927114.com/upfile/56/wear_invaders.png,', 'null', 'http://s.927114.com/upfile/2/invaders_phone.apk,', 'http://s.927114.com/upfile/2/invaders_wear.apk,', null, 'operate', '0', '57', '7981237,', '4139398,', 'com.virtualgs.invaders', null);
INSERT INTO `fitwear_app` VALUES ('58', '井字棋', '9', 'null', '1.2', '1', '井字游戏', '井字游戏', 'http://s.927114.com/upfile/57/wear_tictactoewear.png,', 'null', 'http://s.927114.com/upfile/2/tictactoewear_phone.apk,', 'http://s.927114.com/upfile/2/tictactoewear_wear.apk,', null, 'operate', '0', '59', '16403619,', '8044935,', 'com.dolcegames.tictactoewear', null);
INSERT INTO `fitwear_app` VALUES ('60', '咕咚', '13', 'null', '5.7.0', '1', '用咕咚，你可以：记录运动轨迹：基于GPS定位技术和独有算法，精确追踪运动轨迹；实时监测时速、配速、消耗卡路里及更多运动数据', '用咕咚，你可以：记录运动轨迹：基于GPS定位技术和独有算法，精确追踪运动轨迹；实时监测时速、配速、消耗卡路里及更多运动数据', 'http://s.927114.com/upfile/59/wear_codoon.png,', 'null', 'http://s.927114.com/upfile/2/codoon_phone.apk,', 'http://s.927114.com/upfile/2/codoon_wear.apk,', null, 'operate', '0', '0', '27807980,', '1514508,', 'com.codoon.gps', null);
INSERT INTO `fitwear_app` VALUES ('61', '健身教练', '13', 'null', '1.4.9', '1', '健身追踪器数你重复使用智能手表的运动传感器', '健身追踪器数你重复使用智能手表的运动传感器', 'http://s.927114.com/upfile/60/wear_vimo.png,', 'null', 'http://s.927114.com/upfile/2/vimo_phone.apk,', 'http://s.927114.com/upfile/2/vimo_wear.apk,', null, 'operate', '0', '61', '5841060,', '2070747,', 'vimo.co.seven', null);
INSERT INTO `fitwear_app` VALUES ('62', '步伐', '13,14', 'null', '1.1.2', '1', '跑步时听听音乐，非常有利于释放运动的痛楚，听好音乐时更是如此', '跑步时听听音乐，非常有利于释放运动的痛楚，听好音乐时更是如此', 'http://s.927114.com/upfile/61/wear_rockya.png,', 'null', 'http://s.927114.com/upfile/2/rockya_phone.apk,', 'http://s.927114.com/upfile/2/rockya_wear.apk,', null, 'operate', '0', '60', '11753878,', '1878055,', 'com.tankery.app.rockya', null);
INSERT INTO `fitwear_app` VALUES ('63', '定时器', '13', 'null', '1.1', '1', '简单直观的间隔计时器为智能手表使用', '简单直观的间隔计时器为智能手表使用', 'http://s.927114.com/upfile/62/wear_wearintervaltimer.png,', 'null', 'http://s.927114.com/upfile/2/wearintervaltimer_phone.apk,', 'http://s.927114.com/upfile/2/wearintervaltimer_wear.apk,', null, 'operate', '0', '63', '3952367,', '2109021,', 'wearablesoftware.wearintervaltimer', null);
INSERT INTO `fitwear_app` VALUES ('66', '紧急呼救', '13', 'null', '2.6', '1', 'Now SahAya is linked to POLICE DEPARTMENT IN BANGALORE, INDIA - IF YOU ARE IN BANGALORE, INDIA DOWNLOAD BCP SahAya', 'Now SahAya is linked to POLICE DEPARTMENT IN BANGALORE, INDIA - IF YOU ARE IN BANGALORE, INDIA DOWNLOAD BCP SahAya', 'http://s.927114.com/upfile/65/wear_SahAya.png,', 'null', 'http://s.927114.com/upfile/2/SahAya_phone.apk,', 'http://s.927114.com/upfile/2/SahAya_wear.apk,', null, 'operate', '0', '66', '4143707,', '1756400,', 'com.ssn.SahAya', null);
INSERT INTO `fitwear_app` VALUES ('67', '戒烟助手', '13', 'null', '1.0.4', '1', '戒烟？ 太好了，这就是你需要的', '戒烟？ 太好了，这就是你需要的', 'http://s.927114.com/upfile/66/wear_smoking.png,', 'null', 'http://s.927114.com/upfile/2/wearsmoking_phone.apk,', 'http://s.927114.com/upfile/2/wearsmoking_wear.apk,', null, 'operate', '0', '67', '2605904,', '1770873,', 'org.chrjs.wearsmoking', null);
INSERT INTO `fitwear_app` VALUES ('68', '我的食谱', '13', 'null', '2.3.6', '1', '跟踪，分析和保持控制糖尿病', '跟踪，分析和保持控制糖尿病', 'http://s.927114.com/upfile/67/wear_mydiabetes.png,', 'null', 'http://s.927114.com/upfile/2/mydiabetes_phone.apk,', 'http://s.927114.com/upfile/2/mydiabetes_wear.apk,', null, 'operate', '0', '53', '7600722,', '1501820,', 'com.mydiabetes', null);
INSERT INTO `fitwear_app` VALUES ('121', 'Roto 360表盘', '5', 'null', '1', '1', '这是你的智能手表上的一款美丽的旋转表盘。在表盘上展示分钟数解决了一个简单的问题，我们把时针和分针放在一起，但保留了经典的模拟手表的外观。', 'Roto 360现在完全兼容LG G Watch R手表。这是你的智能手表上的一款美丽的旋转表盘。在表盘上展示分钟数解决了一个简单的问题，我们把时针和分针放在一起，但保留了经典的模拟手表的外观。要选择表盘，长按住你的智能手表的屏幕。展示日期，日期和时间都可以。有2款主题 - 黑暗和光亮。需要Android Wear智能手表，适用于：? 摩托360 ? 三星Gear Live ? LG G Watch R - LG G Watch ? 华硕Zen Watch ? 索尼的SmartWatch 3。也看看我们的其他表盘：Tymometer Time, Tuner。由Gaurav Singh和Krishna Prajapati制作', 'http://image.ticwear.com/appstore/1485816e3df80f76aa7666e22cb2b003', 'null', 'http://res.appstore.ticwear.com/com.roto360_1.0.apk', 'http://res.appstore.ticwear.com/com.roto360_1_wear.apk', null, 'operate', '0', '0', '2644489', '2150713', 'com.roto360', null);
INSERT INTO `fitwear_app` VALUES ('122', 'Krona表盘', '5', 'null', '1.2.7', '1', '终极天气预报多屏幕表盘', '终极天气预报多屏幕表盘', 'http://image.ticwear.com/appstore/dacf1e915703454d57956fad2c46784d', 'null', 'http://res.appstore.ticwear.com/net.marscity.sunlight_1.2.7.apk', 'http://res.appstore.ticwear.com/net.marscity.sunlight_21_wear.apk', null, 'operate', '0', '122', '6842900', '2525088', 'net.marscity.sunlight', null);
INSERT INTO `fitwear_app` VALUES ('123', 'V08表盘', '5', 'null', '5.4.3', '1', 'V08定制表盘Moto 360产品特点：来自出色的设计师的全功能表盘——<br>显示当地时间与世界时间（等同于祖鲁时间或格林威治标准时间）', 'V08定制表盘Moto 360产品特点：来自出色的设计师的全功能表盘——<br>显示当地时间与世界时间（等同于祖鲁时间或格林威治标准时间）', 'http://image.ticwear.com/appstore/9377366e12bb09c700c4ce3ef2123024', 'null', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv08_5.4.3.apk', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv08_20141113_wear.apk', null, 'operate', '0', '123', '6301146', '2669022', 'net.ddroid.aw.watchface.mv08', null);
INSERT INTO `fitwear_app` VALUES ('124', 'Stealth360表盘', '5', 'null', '0.0.3.0', '1', 'Stealth360表盘是一个具有颜色特质的非常干净简约的表盘。设计使您的智能手表简约而不失精致。', 'Stealth360表盘是一个具有颜色特质的非常干净简约的表盘。设计使您的智能手表简约而不失精致。', 'http://image.ticwear.com/appstore/968f78e6974303f0ed3aee89ef72b4f3', 'null', 'http://res.appstore.ticwear.com/com.flyingrhinocmg.watchface_stealth360_0.0.3.0.apk', 'http://res.appstore.ticwear.com/com.flyingrhinocmg.watchface_stealth360_300_wear.apk', null, 'operate', '0', '124', '2241536', '2419808', 'com.flyingrhinocmg.watchface_stealth360', null);
INSERT INTO `fitwear_app` VALUES ('125', 'V03表盘', '5', 'null', '5.0.0', '1', '定制手表表面V03适用于Moto 360（Android Wear）。', '定制手表表面V03适用于Moto 360（Android Wear）。', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv03_5.0.0.apk', 'null', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv03_5.0.0.apk', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv03_20141027_wear.apk', null, 'operate', '0', '125', '4358153', '1852330', 'net.ddroid.aw.watchface.mv03', null);
INSERT INTO `fitwear_app` VALUES ('126', 'YSAR表盘', '5', 'null', '1.1', '1', 'YSAR表盘为多数有名望的，习惯于佩戴高端手表的人群量身打造。', 'YSAR表盘为多数有名望的，习惯于佩戴高端手表的人群量身打造。', 'http://image.ticwear.com/appstore/92f71196e270ec028a2de007eaeb574e', 'null', 'http://res.appstore.ticwear.com/com.atlantica_1.1.apk', 'http://res.appstore.ticwear.com/com.atlantica_2_wear.apk', null, 'operate', '0', '126', '14141481', '12246298', 'com.atlantica', null);
INSERT INTO `fitwear_app` VALUES ('127', 'A45表盘', '5', 'null', '5.0.0', '1', '摩托360（Android Wear）的定制表盘。功能 - 您可以从5种颜色中选择一个做背景色', '摩托360（Android Wear）的定制表盘。功能 - 您可以从5种颜色中选择一个做背景色', 'http://image.ticwear.com/appstore/025eefc2df7361205c108cd66a544dc1', 'null', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.ma45_5.0.0.apk', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.ma45_20141027_wear.apk', null, 'operate', '0', '127', '4281608', '1777718', 'net.ddroid.aw.watchface.ma45', null);
INSERT INTO `fitwear_app` VALUES ('128', 'CoolCircle表盘', '5', 'null', '1.1', '1', '酷圆表盘Android 5版（圆形和方形）由RichFace watches开发。', '酷圆表盘Android 5版（圆形和方形）由RichFace watches开发。', 'http://image.ticwear.com/appstore/7c84342ade0b357a81c8be4337acb235', 'null', 'http://res.appstore.ticwear.com/com.watch.richface.coolcircle_1.1.apk', 'http://res.appstore.ticwear.com/com.watch.richface.coolcircle_2_wear.apk', null, 'operate', '0', '128', '4133345', '2409454', 'com.watch.richface.coolcircle', null);
INSERT INTO `fitwear_app` VALUES ('115', '手表名片', '7', 'Fuq', '2.0.1', '201', '在手表上展示你的名片给别人。', '生成自己的二维码电子名片。<br />你的朋友可以通过扫描你手表上的二维码方便快捷的把你的联系方式加到他的通讯录中。<br />只要同步一次名片，就可以脱离手机使用，无后台，不耗电。<br />有好的意见或反馈BUG请在评论中回复或者发送邮件到471989525@qq.com', 'http://image.ticwear.com/appstore/162e570459d198c7b437bd07e3904244', '手表名片', 'http://res.appstore.ticwear.com/com.fuq.watchcard_201.apk', ' ddfapk', null, 'operate', '0', '115', '2975469', '0', 'com.appfour.wearbrowser', null);
INSERT INTO `fitwear_app` VALUES ('116', 'Ticker表盘', '5', 'null', '1.0.1', '1', 'Ticker是一款高度拟物型的表盘，它可以显示您每日的步数、当地的天气等信息，还可以通过手机端的APP按需设置。', 'Ticker是一款高度拟物型的表盘，它可以显示您每日的步数、当地的天气等信息，还可以通过手机端的APP按需设置。', 'http://image.ticwear.com/appstore/84782bb4c6e079b578d8cc99b2407bf5', 'null', 'http://res.appstore.ticwear.com/com.magicwatchface.ticker_1.0.1.apk', 'http://res.appstore.ticwear.com/com.magicwatchface.ticker_2_wear.apk', null, 'operate', '0', '116', '5137867', '2511083', 'com.magicwatchface.ticker', null);
INSERT INTO `fitwear_app` VALUES ('117', 'Skymaster飞行员', '5', 'null', '1.1.1', '1', '在航空领域的首创期，很多飞行员都需要手表协助导航。这些航空手表需要清晰度高，准确度高，稳定性强，同时特别是在飞行员卷起外衣袖子的时候。', '在航空领域的首创期，很多飞行员都需要手表协助导航。这些航空手表需要清晰度高，准确度高，稳定性强，同时特别是在飞行员卷起外衣袖子的时候。这款Android Wear指针式手表表盘（原来被称作飞行员）结合了航空手表与现代智能手表的功能。<br><br>定制的产品特点：图标的自定义<br>表盘特点：<br>★飞行员手表具备非常高的可读性<br>★电量指示器<br>★日期与星期<br>★天气情况<br>★先进且豪华的设计－天气信息由http://openweathermap.org 提供<br>更多的表盘信息－请访问我们Android Wear商店中的豪华表盘集锦http://goo.gl/QOsOu4 －同时，如果您希望在我们的集锦中加入更多表盘，请联系我们。', 'http://image.ticwear.com/appstore/4f9db378c6185b345e97c910d41b0b20', 'null', 'http://res.appstore.ticwear.com/co.smartwatchface.watch.face.aviator.android.wear_1.1.1.apk', 'http://res.appstore.ticwear.com/co.smartwatchface.watch.face.aviator.android.wear_20_wear.apk', null, 'operate', '0', '117', '8347380', '3499081', 'co.smartwatchface.watch.face.aviator.android.wear', null);
INSERT INTO `fitwear_app` VALUES ('262', '出行精灵', '7', 'lina', '1', '1', '这个表盘优雅和经典结合Android Wear现代功能', '这个表盘优雅和经典结合Android Wear现代功能', 'http://image.ticwear.com/appstore/636719501a7040c7e2bce05830ecab94', 'null', 'http://s.927114.com/upfile/241/jingling.apk,', 'http://s.927114.com/upfile/241/jingling.apk,', null, 'operate', '0', '0', '4518174,', '4518174,', 'com.mapelf', 'W150,5123JW');
INSERT INTO `fitwear_app` VALUES ('103', '间谍相机', '7', 'Art Watchface', '1.0.7', '107', '使你的手机摄像头画面显示在智能手表上！', '<p>你的手机屏幕将保持黑色（如睡眠模式），这样就可以谨慎地激活你的手机摄像头与你的穿戴式设备，并在手表上观看现场视频。您还可以远程拍摄照片。远程设置闪光灯模式（如果闪光灯时，您可以将其设置回关闭）。从你的卧室发生了什么事，现在在街上监视，保持对孩子的监视，检查你的浴室是不是溢出。', 'http://image.ticwear.com/appstore/35589009be58198715a2143bdcab21b1', '间谍相机', 'http://res.appstore.ticwear.com/com.artwatchface.wearcameraremote_1.0.7_mms.apk', 'http://res.appstore.ticwear.com/com.artwatchface.wearcameraremote_107_wear.apk', null, 'operate', '0', null, '2853026,', '2853026,', 'com.artwatchface.wearcameraremote', null);
INSERT INTO `fitwear_app` VALUES ('104', '京东', '7', '京东', '4.3.1', '20440', '客户端首单满79元送79元', '【掌上京东 实惠轻松 2亿用户购物首选客户端】<br />1、新人特权：客户端新人首单满79元送79元大礼包<br />2、专享特权：每天多款客户端专享价商品<br />3、闪电到货：京东自营商品211限时达<br />  <br />【产品简介】<br />京东（Android版）是专门为Android平台手机用户推出的一款移动购物和生活消费类软件，具有商品搜索/浏览、商品购买、在线支付、订单速查、手机晒单/评价、返修退换货等功能，为您打造简单、快乐的生活体验。<br /> <br />【特色功能】<br />1、抢便宜：特有明星级抢购栏目-掌上秒杀、专享活动、预售爆品、限时特卖，手快有，手慢无！<br />2、购品位：大牌闪购、发现好货、好店铺，“购”出时尚品位，你值得拥有！<br />3、搜欢喜：想买什么，就搜什么，超快的搜索速度等你来体验，还支持语音搜索哦！<br />4、乐生活：一站式搞定生活需求，充值、彩票、电影票、机票、门票、酒店预定应有尽有，还有京东小金库理财产品，让你轻松赚钱！<br />5、爱发现：独创故事频道，分享买手们的故事；更有逛逛、热门活动，京东小编吐血编辑值得买的好物推荐！<br />有问题，让我来帮您解决！就叫我雷锋吧！记得给5星好评哦，么么哒~<br />', 'http://image.ticwear.com/appstore/fc04703a73ba3331590f6012b61b6e6e', '京东', 'http://res.appstore.ticwear.com/com.jingdong.app.mall_4.3.1.apk', ' ddfapk', null, null, '0', '106', '24111563', '0', 'co.smartwatchface.modern.classics.android.wear.face', null);
INSERT INTO `fitwear_app` VALUES ('65', '超级闹钟', '13', 'null', '1.31', '1', '一款多功能的小闹钟在智能手表上显示', '一款多功能的小闹钟在智能手表上显示', 'http://s.927114.com/upfile/64/wear_alarmclockextended.png,', 'null', 'http://s.927114.com/upfile/2/alarmclockextended_phone.apk,', 'http://s.927114.com/upfile/2/alarmclockextended_wear.apk,', null, 'operate', '0', '65', '2638008,', '1827880,', 'com.jxt.alarmclockextended', null);
INSERT INTO `fitwear_app` VALUES ('87', '必应扭腕搜索', '7', 'Microsoft Corporation', '3.4', '30002746', '摇动你的手机或者旋转你的手腕，以语音搜索网页！', '<P>微软Bing搜索带来的拥有最强大的语音功能的网络搜索，一个简单的手腕姿势即可开启搜索。随着手腕一抖，扭矩醒来，等待你的语音命令。你的手表问什么答案就在这里。扭矩使用状态的最先进的微软先进的语音和手势识别技术与冰供电网络搜索，它提供了一个真正独特的体验。例如问题是： - 什么是天气怎么样在伦敦？什么是纽约的温度是多少？ （全球天气） - 附近的任何印度餐厅？当地修鞋？ （本地商务搜索） - 海鹰队得分？ （最新体育） - 什么是8615％？什么是75倍46？ （通过语音计算器） - 巴黎现在是几点？ （世界时钟） - 苹果的估价？IBM的估价？ （最新的美国股票价格信息） - 意大利的首都？如何岁，是谷歌CEO？如何高大的姚明？ （简单QNA在手腕上） - 达25？美国808航班状态？中国国航127？ （飞行状态） - 如何在洛杉矶的交通？当地的交通？ （您所在地区目前的交通地图） - 来自微软的任何消息？ （网络搜索，从表可以打开您的手机上）...你可以扭动和启动应用程序在你的手表或继续按“B”button.Please注意，这个应用程序随时随地搜索需要一个智能手表工作，目前只支持美国英语。了解更多microsoft.com/garage。通过下载这个程序，你接受所有的条款和本使用条款提供http://windows.microsoft.com/en-us/windows/microsoft-services-agreement条件和本声明可访问：http://windows.microsoft.com/en-us/windows/microsoft-services-agreement and this Privacy Statement available athttp://go.microsoft.com/fwlink/?LinkId=517534</P>', 'http://image.ticwear.com/appstore/ac882eacf4f091cb84c04f482c29bfdb', '必应扭腕搜索', 'http://res.appstore.ticwear.com/com.microsoft.bing.torque_30002746.apk', 'http://res.appstore.ticwear.com/com.microsoft.bing.torque_30002746_wear.apk', null, 'operate', '0', '87', '17296832', '7325354', 'com.microsoft.bing.torque', null);
INSERT INTO `fitwear_app` VALUES ('88', '扬声器控制', '7', 'Bright Owusu-Amankwaa', '4.6', '37', '很忙或者懒得听来电?当你收到一个来电或拨出一个电话,在手表上可以控制手机扬声器的音量', '<p>很忙或者懒得听来电?<br/>当你收到一个来电或拨出一个电话,在手表上可以控制手机扬声器的音量。<br/>这款应用程序可以让你保持工作状态,比如做饭、开车或者只是呆在坐在沙发上,而不必起床拿起电话。<br/> 3个选项:<br/> 1)只问第一次——当电话被接听或者当一个电话,一个选项是显示在你的手表上时同时打开扬声器。<br/> 2)话筒打开——所有传入/传出调用将自动打开扬声器。<br/> 3)话筒关闭——禁用话筒。', 'http://image.ticwear.com/appstore/ba2c543fea8538e86a77ec50249c73e7', '扬声器控制', 'http://res.appstore.ticwear.com/wearableloudspeaker.com.wearableloudspeaker_37.apk', 'http://res.appstore.ticwear.com/wearableloudspeaker.com.wearableloudspeaker_37_wear.apk', null, 'operate', '0', '0', '3300559', '1825163', 'wearableloudspeaker.com.wearableloudspeaker', null);
INSERT INTO `fitwear_app` VALUES ('108', '同步音译', '7', '徐铭', '1.3', '2', 'Android手表端的语音识别翻译app，支持中、英、韩的互相转换。', 'Android手表端的语音识别翻译app，支持中文、英文、韩文的互相转换，简单上手，易于操作。', 'http://image.ticwear.com/appstore/a464634663d53e8a5456fa714071d764', '同步音译', 'http://res.appstore.ticwear.com/com.xuming.tictranslator_1.3.apk', 'ddfapk', null, null, '0', '108', '6310299', '0', 'com.xuming.tictranslator', null);
INSERT INTO `fitwear_app` VALUES ('89', '追踪仪', '7', 'Luigi Notaro', '2.1.1', '9', '聪明的办法来管理你的智能手表应用程序！', '<p>在您的手机上安装一个应用程序可以很容易地了解发生了什么：你已经得到通知和确认屏幕。在手表上却不行：在手机上安装应用程序后，你只需要等待神奇的事情发生，打开和关闭开始...菜单，直到顿悟发生使名单上的新图标。 </p> <p>现在不一样了！追踪仪会让你得到你每次安装，删除或更新的应用程序的通知。</p> <p>★特点</p> <p>？物质激励/#materiholo</p> <p>？获取每次安装，删除或更新您的SmartWatch一个应用程序时的通知。</p> <p>？打开掌上电脑配套应用程序，以让每一个第三方的应用程序安装在您手表上的列表</p> <p>？塔上的应用程序列表的行直来直去的相对设置的屏幕和管理应用程序;拉列表刷新</p> <p>？打开掌上电脑配套的应用程序开启/关闭通知卡特定事件：全新安装，升级，清除</p> <p>请注意：必须启动，一旦它的安装佩戴跟踪器的应用程序上的手表。它需要的只是一个时间的第一个安装后。</p> <p>英</p> <p>★约WAT用户</p> <p>？精辟简单？</p> <p>？这样一个简单的想法，但这样有用吗？</p> <p>？究竟是什么智能需要的？</p> <p>？工程完全简单的应用程序，完美的作品，非常有用的？</p> <p>★精选？对</p>', 'http://image.ticwear.com/appstore/0f14e6ab38dd2bfe04bb2ace52715405', '追踪仪', 'http://res.appstore.ticwear.com/it.purplepixel.wearappstracker_9.apk', 'http://res.appstore.ticwear.com/it.purplepixel.wearappstracker_9_wear.apk', null, 'operate', '0', '89', '4555169', '2790726', 'it.purplepixel.wearappstracker', null);
INSERT INTO `fitwear_app` VALUES ('90', '课程表', '7', 'Nohus', '1.7.3', '37', '探索的最新课程时间表。', '<P>探索的最新课程时间表。</p> <p>在您的手机和你的手表</p> <p>通过新的标签通知您：</p><P>？当前课程和剩余的时间; ）</p> <p>？你隔壁班和房间号的名称，</p> <p>？剩下的时间，直到你开始上课和休息结束。</p> <p>时间表选项卡显示每周安排的每一天，在那里你不仅可以阅读你的课程的名称，也开始和结束时间和教室号</p> <p>该应用程序允许您编辑，保存和一个简单的方法分享您的时间表和朋友。</p> <p>您可以输入更多的时间表和在他们之间切换，并为您的每一个时间表你可以改变课程，休息时间或一天开始时间的默认持续时间。</p> <p>您也可以从一个日历，像谷歌日历导入您的日程安排。</p> <p>英</p>', 'http://image.ticwear.com/appstore/a5f57846352eb21d9882fdeafa8ddf62', '课程表', 'http://res.appstore.ticwear.com/eu.nohus.classtime_37.apk', 'http://res.appstore.ticwear.com/eu.nohus.classtime_37_wear.apk', null, 'operate', '0', '0', '5922181', '2538419', 'eu.nohus.classtime', null);
INSERT INTO `fitwear_app` VALUES ('106', '远程相机', '13', 'Dheera Venkatraman', '2.1', '12', 'Camera是一款安卓手表穿戴相机应用，可远程控制手机。;', 'Wear Camera是一款安卓手表穿戴相机应用，可远程控制手机。 <br />【基本信息】 <br />作者：来自互联网 <br />更新时间：2014-11-15 <br />版本：1.3 <br />系统：Android 4.1.x以上 <br />语言：其他 <br />', 'http://image.ticwear.com/appstore/1e724944f02fe3532534e50fba807243', '远程相机', 'http://res.appstore.ticwear.com/net.dheera.wearcamera_2.1.apk', ' ddfapk', null, null, '0', '106', '2574971', '0', 'net.dheera.wearcamera', null);
INSERT INTO `fitwear_app` VALUES ('107', '任务管理器', '13', 'Wearable Software', '1.1', '4', '一款任务管理器！', '<p style=line-height:20px><span style=font-family:宋体;color:#333333>第一个任务管理器。它可以让你在手表上看到当前有哪些任务在运行。</span></p><p><br /></p>', 'http://image.ticwear.com/appstore/5473611de17fd4feff452bfc29bf790a', '任务管理器', 'http://res.appstore.ticwear.com/rocketstartups.weartaskmanager_1.1.apk', 'http://res.appstore.ticwear.com/rocketstartups.weartaskmanager_1.1_wear.apk', null, 'operate', '0', '107', '3591297', '1853098', 'rocketstartups.weartaskmanager', null);
INSERT INTO `fitwear_app` VALUES ('138', 'A38表盘', '5', 'null', '5.5.1', 'null', '专门适用于Moto 360的定制表盘', '专门适用于Moto 360的定制表盘', 'http://image.ticwear.com/appstore/93729f7fd55d02e18d8e6e568acc7378', 'null', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.ma38_5.5.1.apk', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.ma38_20150102_wear.apk', null, 'operate', '0', '138', '5617191', '1970426', 'net.ddroid.aw.watchface.ma38', null);
INSERT INTO `fitwear_app` VALUES ('139', 'Raw Vegan Blonde表盘', '5', 'null', '1.0.7', '1', '用Amber Locke精心打造的“蔬菜艺术”主题设计来风格化你的表盘 - 设计灵感来自天然食品的美感。', '用Amber Locke精心打造的“蔬菜艺术”主题设计来风格化你的表盘 - 设计灵感来自天然食品的美感。', 'http://image.ticwear.com/appstore/c3078d56d8c1152148a5d1214ee64974', 'null', 'http://res.appstore.ticwear.com/com.amba.watchface_1.0.7.apk', 'http://res.appstore.ticwear.com/com.amba.watchface_8_wear.apk', null, 'operate', '0', '139', '7880713', '5156029', 'com.amba.watchface', null);
INSERT INTO `fitwear_app` VALUES ('140', '春天系列表盘', '5', 'null', '1503171713', '1', 'WatchMaster是一组凭借自身出色的设计才能提升智能手表的审美水平的设计师团队。我们的版本很简单：去创造用户对于智能手表的需求', 'WatchMaster是一组凭借自身出色的设计才能提升智能手表的审美水平的设计师团队。我们的版本很简单：去创造用户对于智能手表的需求', 'http://image.ticwear.com/appstore/b72d2dd8a22667a3e80c9a23c3a3e4ce', 'null', 'http://res.appstore.ticwear.com/dd.watchdesigner.springtime_WatchApp3_1503171713.apk', 'http://res.appstore.ticwear.com/dd.watchdesigner.springtime_1503171713_wear.apk', null, 'operate', '0', '140', '5194931', '2542141', 'dd.watchdesigner.springtime', null);
INSERT INTO `fitwear_app` VALUES ('141', 'Spotlight表盘', '5', 'null', '1', '1', 'Spotlight表盘基于以下的动画效果而制作。下一版本将支持个性化设置', 'Spotlight表盘基于以下的动画效果而制作。下一版本将支持个性化设置', 'http://image.ticwear.com/appstore/925d65995d3c73ab540bdc71ad6e1f9a', 'null', 'http://res.appstore.ticwear.com/com.maize.spotlight_1.0.apk', 'http://res.appstore.ticwear.com/com.maize.spotlight_1_wear.apk', null, 'operate', '0', '141', '3171653', '1766876', 'com.maize.spotlight', null);
INSERT INTO `fitwear_app` VALUES ('142', 'BE@RBRICK表盘', '5', 'null', '1.2', '1', '这款表盘点亮了熟悉的“@符号”，成为一个俏皮亮丽设计。', '这款表盘点亮了熟悉的“@符号”，成为一个俏皮亮丽设计。BE@RBRICK曾与各种各样的艺术家，品牌，公司，人物等等合作，并在“Art Toy”界内获得了众多粉丝。', 'http://image.ticwear.com/appstore/049f3b7a6f1013bc078d1e338eec0b91', 'null', 'http://res.appstore.ticwear.com/wearable.android.breel.com.medicom_1.2_mms.apk', 'http://res.appstore.ticwear.com/wearable.android.breel.com.medicom_3_wear.apk', null, 'operate', '0', '142', '8650185', '3682707', 'wearable.android.breel.com.medicom', null);
INSERT INTO `fitwear_app` VALUES ('143', '表盘集锦', '5', 'null', '1.4', '1', '此应用与第一个SAMSUNG GEAR, 和 GEAR 2不匹配/! 一个Android Wear表盘新集合。设计，经典，随意，此集合每天都在壮大', '此应用与第一个SAMSUNG GEAR, 和 GEAR 2不匹配/! 一个Android Wear表盘新集合。设计，经典，随意，此集合每天都在壮大', 'http://image.ticwear.com/appstore/406878278f4d9a0f17dbd41b068c7105', 'null', 'http://res.appstore.ticwear.com/com.vuxia.wearFaceCollection_1.4.apk', 'http://res.appstore.ticwear.com/com.vuxia.wearFaceCollection_11_wear.apk', null, 'operate', '0', '143', '27694855', '8226951', 'com.vuxia.wearFaceCollection', null);
INSERT INTO `fitwear_app` VALUES ('144', 'Turbine表盘', '5', 'null', '1.4', '1', 'Android Wear时尚炫酷的Turbine表盘。请确认您的手表正在运行Android Wear 5.0 。支持圆形与方形手表。', 'Android Wear时尚炫酷的Turbine表盘。请确认您的手表正在运行Android Wear 5.0 。支持圆形与方形手表。', 'http://image.ticwear.com/appstore/db48ee5662ada46482f79f0217e6ad38', 'null', 'http://res.appstore.ticwear.com/com.watch.richface.turbine_1.4.apk', 'http://res.appstore.ticwear.com/com.watch.richface.turbine_5_wear.apk', null, 'operate', '0', '144', '5575282', '3655530', 'com.watch.richface.turbine', null);
INSERT INTO `fitwear_app` VALUES ('145', '轨道表盘', '5', 'null', '2', '1', '这是一款真正吸引眼球的表盘。 既可以再圆形手表如Moto360上运行, 也可以在方形手表上运行。', '这是一款真正吸引眼球的表盘。 既可以再圆形手表如Moto360上运行, 也可以在方形手表上运行。这款表盘支持省电的屏幕半亮模式。', 'http://image.ticwear.com/appstore/09a7879514ea36bdb65dcb0c6447a9ca', 'null', 'http://res.appstore.ticwear.com/co.smartwatchface.orbits.android.wear.face_2.0.apk', 'http://res.appstore.ticwear.com/co.smartwatchface.orbits.android.wear.face_10_wear.apk', null, 'operate', '0', '145', '6062686', '1809484', 'co.smartwatchface.orbits.android.wear.face', null);
INSERT INTO `fitwear_app` VALUES ('147', 'Timr表盘', '5', 'null', '1.1.1', '1', 'timr表盘是一个免费的，极简的表盘，它的设计与谷歌的Material Design风格相协调。每秒的移动都是通过平稳且生动的模型进行的。', 'Android Wear的timr表盘是一个免费的，极简的表盘，它的设计与谷歌的Material Design风格相协调。每秒的移动都是通过平稳且生动的模型进行的。', 'http://image.ticwear.com/appstore/4c2281885b6a3680650133925e438ab3', 'null', 'http://res.appstore.ticwear.com/com.timrface_1.1.1.apk', 'http://res.appstore.ticwear.com/com.timrface_3_wear.apk', null, 'operate', '0', '147', '4803842', '2002919', 'com.timrface', null);
INSERT INTO `fitwear_app` VALUES ('175', 'Disk表盘', '5', 'null', '1.4', '1', 'Disk表盘是一个Android Wear5现代3D指针式表盘。', 'Disk表盘是一个Android Wear5现代3D指针式表盘。', 'http://image.ticwear.com/appstore/f224d1f7efaa529f8d65954945c4a33c', 'null', 'http://res.appstore.ticwear.com/com.watch.richface.disk_1.4.apk', 'http://res.appstore.ticwear.com/com.watch.richface.disk_5_wear.apk', null, 'operate', '0', '175', '4154999', '2291784', 'com.watch.richface.disk', null);
INSERT INTO `fitwear_app` VALUES ('176', '电话', '7', 'null', '1.3', '1', '手表电话是您的Android Wear智能手表所遗失的部分。', '手表电话是您的Android Wear智能手表所遗失的部分。没有此功能，您只能应答或忽视来电（也可以用录音回复）', 'http://image.ticwear.com/appstore/79e3f26c40c4351d03f9d54f5aae1238', 'null', 'http://res.appstore.ticwear.com/com.mohammadag.wearphone_1.3.apk', 'http://res.appstore.ticwear.com/com.mohammadag.wearphone_4_wear.apk', null, 'operate', '0', '176', '2764447', '1846379', 'com.mohammadag.wearphone', null);
INSERT INTO `fitwear_app` VALUES ('181', '超级指南针', '7,14', 'null', '1.3', '1', 'CompassX为幸存者，户外运动者，徒步路行者，登山爱好者，骑行爱好者，野营爱好者以及飞行员而设计。', 'CompassX为幸存者，户外运动者，徒步路行者，登山爱好者，骑行爱好者，野营爱好者以及飞行员而设计。', 'http://image.ticwear.com/appstore/7551a2a1a33be624d19de8bd8433c6a6', 'null', 'http://res.appstore.ticwear.com/jack.campbell.messive.compass_1.3.apk', 'http://res.appstore.ticwear.com/jack.campbell.messive.compass_3_wear.apk', null, 'operate', '0', '181', '4047791', '1879580', 'jack.campbell.messive.compass', 'MOTO360,W150,5123JW');
INSERT INTO `fitwear_app` VALUES ('185', '寻找我的手机', '7', 'null', '1.5.1', '1', '当安卓手表远离手机之后，可以自动锁定手机；当手机离开手表太远，手表会自动报警。从此再也不会遗忘手机啦。', '当安卓手表远离手机之后，可以自动锁定手机；当手机离开手表太远，手表会自动报警。从此再也不会遗忘手机啦。', 'http://image.ticwear.com/appstore/7ae490a2cc1f1419fb376281edb88a67', 'null', 'http://res.appstore.ticwear.com/co.vimo.findmyphone_1.5.1.apk', 'http://res.appstore.ticwear.com/co.vimo.findmyphone_10_wear.apk', null, 'operate', '0', '185', '3930043', '2373367', 'co.vimo.findmyphone', null);
INSERT INTO `fitwear_app` VALUES ('361', 'Asparagus', '7', null, '1', '1', 'Asparagus', 'Asparagus', 'http://s.927114.com/upfile/279/ic_launcher.png,', null, 'http://s.927114.com/upfile/279/Asparagus.apk,', 'http://s.927114.com/upfile/279/android_wear_micro_apk.apk,', null, null, '0', '361', '7636936,', '1839658,', 'cz.kinst.jakub.asparagus', null);
INSERT INTO `fitwear_app` VALUES ('191', '伪装来电', '7', 'null', '1.0.2', '1', '想体面地摆脱尴尬、无聊或永无止境的对话？现在你的手表就可以帮助你摆脱这样的尴尬处境！', '想体面地摆脱尴尬、无聊或永无止境的对话？现在你的手表就可以帮助你摆脱这样的尴尬处境！无需把手机从口袋里拿出来，在其他人不知情的情况下伪造来电', 'http://image.ticwear.com/appstore/0814bcaca315c14dba6671bcb11e97cb', 'null', 'http://res.appstore.ticwear.com/com.androidwear.callfaker.callfaker_1.0.2.apk', 'http://res.appstore.ticwear.com/com.androidwear.callfaker.callfaker_3_wear.apk', null, 'operate', '0', '191', '3200109', '1754311', 'com.androidwear.callfaker.callfaker', null);
INSERT INTO `fitwear_app` VALUES ('192', '简易计算器', '7', 'null', '1.0.2', '1', '一个手表上使用的方便的计算器。', '一个手表上使用的方便的计算器。', 'http://image.ticwear.com/appstore/ab3816e6b5dd17ab59a911c5da640d9f', 'null', 'http://res.appstore.ticwear.com/com.everystripe.calculator_1.0.2.apk', 'http://res.appstore.ticwear.com/com.everystripe.calculator_3_wear.apk', null, 'operate', '0', '192', '4272696', '1775584', 'com.everystripe.calculator', null);
INSERT INTO `fitwear_app` VALUES ('148', '27合一表盘', '5', 'null', '1.15.0', '1', '在支持的手机或智能手表上随意挑选27款不同的表盘', '在支持的手机或智能手表上随意挑选27款不同的表盘', 'http://image.ticwear.com/appstore/9826f6527fdee8d1da511f12e55a4da7', 'null', 'http://res.appstore.ticwear.com/de.huwig.watchfaces_1.15.0.apk', 'http://res.appstore.ticwear.com/de.huwig.watchfaces_23_wear.apk', null, 'operate', '0', '148', '5120120', '2611525', 'de.huwig.watchfaces', null);
INSERT INTO `fitwear_app` VALUES ('149', '精致表盘', '5', 'null', '1.1', '1', '简约，经典和豪华为Android Wear定制的表盘, 可以显示无线网络状态，网络信号状态和手机电量', '简约，经典和豪华为Android Wear定制的表盘, 可以显示无线网络状态，网络信号状态和手机电量', 'http://image.ticwear.com/appstore/e6b121e8ee5fa9ca27a0d5b1799b362c', 'null', 'http://res.appstore.ticwear.com/com.ji.status.watchfacefree_1.1.apk', 'http://res.appstore.ticwear.com/com.ji.status.watchfacefree_2_wear.apk', null, 'operate', '0', '149', '2827437', '1950456', 'com.ji.status.watchfacefree', null);
INSERT INTO `fitwear_app` VALUES ('150', '保时捷表盘', '5', 'null', '1.0.7', '1', '受到标志性的保时捷传统与创新的美学的启发，它的时尚和简约的设计随着赛车赛季的比赛时间而变化，与世界各地的保时捷爱好者们同步。', '受到标志性的保时捷传统与创新的美学的启发，它的时尚和简约的设计随着赛车赛季的比赛时间而变化，与世界各地的保时捷爱好者们同步。', 'http://image.ticwear.com/appstore/6de5a5de34211a4a20b12fd4b72eff8a', 'null', 'http://res.appstore.ticwear.com/com.porsche.watchface_1.0.7.apk', 'http://res.appstore.ticwear.com/com.porsche.watchface_8_wear.apk', null, 'operate', '0', '150', '5753977', '3258811', 'com.porsche.watchface', null);
INSERT INTO `fitwear_app` VALUES ('152', '英文时间', '5', 'null', '1.6.1', '1', '这种独特的手表脱颖而出。画面充满字幕，但只有那些需要亮起来，向您展示的时间', '这种独特的手表脱颖而出。画面充满字幕，但只有那些需要亮起来，向您展示的时间', 'http://image.ticwear.com/appstore/b594a5bac00a3091f106d2767e99a741', 'null', 'http://res.appstore.ticwear.com/znickq.me.flashclock_1.6.1.apk', 'http://res.appstore.ticwear.com/znickq.me.flashclock_8_wear.apk', null, 'operate', '0', '152', '3488761', '1281410', 'znickq.me.flashclock', null);
INSERT INTO `fitwear_app` VALUES ('153', '黑魔法表盘', '5', 'null', '1.0.1', '1', '黑暗魔法 - 用于Android Wear手表的黑暗的哥特式表盘，如三星Gear Live，摩托罗拉Moto 360和LG G Watch。它魔力的起源是神秘和秘密的。', '黑暗魔法 - 用于Android Wear手表的黑暗的哥特式表盘，如三星Gear Live，摩托罗拉Moto 360和LG G Watch。它魔力的起源是神秘和秘密的。', 'http://image.ticwear.com/appstore/06e5b599d903ecb8173dcdd9ae9525d3', 'null', 'http://res.appstore.ticwear.com/com.chuckleone.chuck.darkmagica_1.0.1.apk', 'http://res.appstore.ticwear.com/com.chuckleone.chuck.darkmagica_2_wear.apk', null, 'operate', '0', '153', '5308239', '1802094', 'com.chuckleone.chuck.darkmagica', null);
INSERT INTO `fitwear_app` VALUES ('154', 'Scuba潜水表盘', '5', 'null', '1.0.1', '1', '这款表盘是专为在低光情况下最优的可读性而设计。水肺潜水表盘将你的Andr??oid Wear智能手表变成成一个运动型潜水表。', '这款表盘是专为在低光情况下最优的可读性而设计。水肺潜水表盘将你的Andr??oid Wear智能手表变成成一个运动型潜水表。', 'http://image.ticwear.com/appstore/0b75036c0279983b21780cf7d3433bea', 'null', 'http://res.appstore.ticwear.com/co.smartwatchface.scuba.diver.watch.face.android.wear_1.0.1_mms.apk', 'http://res.appstore.ticwear.com/co.smartwatchface.scuba.diver.watch.face.android.wear_12_wear.apk', null, 'operate', '0', '154', '6994192', '3049292', 'co.smartwatchface.scuba.diver.watch.face.android.wear', null);
INSERT INTO `fitwear_app` VALUES ('155', 'Shadow Clock表盘', '5', 'null', '1.1', '1', '排版和设计师Craig Ward的独特表盘采用阴影，光线和色调以及定制设计的数字来揭示时间。', '排版和设计师Craig Ward的独特表盘采用阴影，光线和色调以及定制设计的数字来揭示时间。', 'http://image.ticwear.com/appstore/eb0e0beab258348be6f52c740a527c0a', 'null', 'http://res.appstore.ticwear.com/wearable.android.breel.com.sundialshadowv1_1.1.apk', 'http://res.appstore.ticwear.com/wearable.android.breel.com.sundialshadowv1_2_wear.apk', null, 'operate', '0', '155', '9144858', '2390196', 'wearable.android.breel.com.sundialshadowv1', null);
INSERT INTO `fitwear_app` VALUES ('156', 'Xogram表盘', '5', 'null', '1.1', '1', '这款表盘将Hugh Turvey独特的透视图像，以美丽的，抽象的万花筒的形式带到了你的手表上。Hugh Turvey对日常的以及不同寻常的东西创建出透视艺术', '这款表盘将Hugh Turvey独特的透视图像，以美丽的，抽象的万花筒的形式带到了你的手表上。Hugh Turvey对日常的以及不同寻常的东西创建出透视艺术', 'http://image.ticwear.com/appstore/2c18d83f5ea6cf5e3832743c95f36bed', 'null', 'http://res.appstore.ticwear.com/wearable.android.breel.com.kaleidoscope_1.1.apk', 'http://res.appstore.ticwear.com/wearable.android.breel.com.kaleidoscope_2_wear.apk', null, 'operate', '0', '156', '13668081', '5079857', 'wearable.android.breel.com.kaleidoscope', null);
INSERT INTO `fitwear_app` VALUES ('157', '霓虹蓝表盘', '5', 'null', '1.1', '1', '如果你正在寻找一个新的，漂亮的主题，来个性化您的SmartWatch, 不用再找了，因为你是在正确的地方！我们的应用程序的喜欢漂亮表盘来装点自己手表', '如果你正在寻找一个新的，漂亮的主题，来个性化您的SmartWatch, 不用再找了，因为你是在正确的地方！我们的应用程序的喜欢漂亮表盘来装点自己手表', 'http://image.ticwear.com/appstore/c35eea7a3a79d84c9741b95007436140', 'null', 'http://res.appstore.ticwear.com/com.watchfacebytme.blueneonwearface_1.1.apk', 'http://res.appstore.ticwear.com/com.watchfacebytme.blueneonwearface_2_wear.apk', null, 'operate', '0', '157', '4900341', '2293185', 'com.watchfacebytme.blueneonwearface', null);
INSERT INTO `fitwear_app` VALUES ('158', 'Un Petit Monde表盘', '5', 'null', '1.0.7', '1', 'The Un Petit Monde（小世界）表盘将摩西的独特的视觉风格转变成了一系列日常的时光流转。', 'The Un Petit Monde（小世界）表盘将摩西的独特的视觉风格转变成了一系列日常的时光流转。将微型玩具人物与真实世界的环境结合起来，摩西创建了开放式结局的惊人的场景。', 'http://image.ticwear.com/appstore/654075ec2fb34ce2b2043f99920b881b', 'null', 'http://res.appstore.ticwear.com/net.unpetitmonde.miniadventure.watchface_1.0.7_mms.apk', 'http://res.appstore.ticwear.com/net.unpetitmonde.miniadventure.watchface_8_wear.apk', null, 'operate', '0', '158', '11188356', '7983457', 'net.unpetitmonde.miniadventure.watchface', null);
INSERT INTO `fitwear_app` VALUES ('159', '神奇表盘Tricolor', '5', 'null', '1.0.1', '1', '神奇的表盘！', '然后上帝说：“让这里有光吧，”这里就有了光。上帝看到光是好的，然后他便将光从黑暗中分离出来。上帝称光为“白天”，称黑暗为“夜晚”。然后便有了晚上和早上', 'http://image.ticwear.com/appstore/d93a881a5801059180e6d6a4fa9feb8e', 'null', 'http://res.appstore.ticwear.com/com.magicwatchface.tricolor_1.0.1.apk', 'http://res.appstore.ticwear.com/com.magicwatchface.tricolor_2_wear.apk', null, 'operate', '0', '159', '5074290', '2489741', 'com.magicwatchface.tricolor', null);
INSERT INTO `fitwear_app` VALUES ('160', '设计风格表盘', '5', 'null', '1', '1', '为您的Android Wear手表获得最棒的设计。您会发现Android Wear“表盘设计”是为您的手表打造的一系列最好的设计。', '为您的Android Wear手表获得最棒的设计。您会发现Android Wear“表盘设计”是为您的手表打造的一系列最好的设计。', 'http://image.ticwear.com/appstore/01e203a986c06b251f47f7eadbec70a5', 'null', 'http://res.appstore.ticwear.com/wearablesoftware.wearwatchfaces_1.0.apk', 'http://res.appstore.ticwear.com/wearablesoftware.wearwatchfaces_5_wear.apk', null, 'operate', '0', '160', '8429011', '7165697', 'wearablesoftware.wearwatchfaces', null);
INSERT INTO `fitwear_app` VALUES ('161', 'Nexus Q表盘', '5', 'null', '1.4.1', '1', '灵感来自于Nexus Q.这个表盘只显示24小时格式', '灵感来自于Nexus Q.这个表盘只显示24小时格式', 'http://image.ticwear.com/appstore/bb36f29735833a8ca82fecb26fa08f8d', 'null', 'http://res.appstore.ticwear.com/qwf.ammarptn.com.qwf_1.4.1.apk', 'http://res.appstore.ticwear.com/qwf.ammarptn.com.qwf_6_wear.apk', null, 'operate', '0', '161', '4854519', '2419860', 'qwf.ammarptn.com.qwf', null);
INSERT INTO `fitwear_app` VALUES ('162', 'LG G专属表盘', '5', 'null', '1.1', '1', '专门为LG GWR而打造的精美表盘，瞬间让你的手腕逼格提升的利器！', '专门为LG GWR而打造的精美表盘，瞬间让你的手腕逼格提升的利器！', 'http://image.ticwear.com/appstore/e326d6542689c26ca9c620f29f2823b7', 'null', 'http://res.appstore.ticwear.com/com.watchfacebytme.watchfaceforlggwatch_1.1.apk', 'http://res.appstore.ticwear.com/com.watchfacebytme.watchfaceforlggwatch_2_wear.apk', null, 'operate', '0', '162', '4885015', '2275092', 'com.watchfacebytme.watchfaceforlggwatch', null);
INSERT INTO `fitwear_app` VALUES ('163', '虚空表盘', '5', 'null', '1.0.1', '1', '用您手腕上一个真正独特专属的表盘来打动您周围的朋友。', '用您手腕上一个真正独特专属的表盘来打动您周围的朋友。独特的功能：适合方形、圆形和三角形屏幕；在夜间和白天的最佳显示；出色的可读性；', 'http://image.ticwear.com/appstore/41df68eb38836b17145b6507effc305b', 'null', 'http://res.appstore.ticwear.com/org.quet.android.wear.watchface.voidness_1.0.1.apk', 'http://res.appstore.ticwear.com/org.quet.android.wear.watchface.voidness_101_wear.apk', null, 'operate', '0', '163', '302136', '217984', 'org.quet.android.wear.watchface.voidness', null);
INSERT INTO `fitwear_app` VALUES ('164', 'Minimal表盘', '5', 'null', 'null', 'null', 'Minimal是一款模拟式的极简主义表盘，它要做的就是一块手表所应该做的：告诉您时间！', 'Minimal是一款模拟式的极简主义表盘，它要做的就是一块手表所应该做的：告诉您时间！', 'http://image.ticwear.com/appstore/f99919e907def5e2a6508ade1338c04d', 'null', 'http://res.appstore.ticwear.com/co.zahaby.momo.minimal_1.0.apk', 'http://res.appstore.ticwear.com/co.zahaby.momo.minimal_1_wear.apk', null, 'operate', '0', '164', '3373432', '1891082', 'co.zahaby.momo.minimal', null);
INSERT INTO `fitwear_app` VALUES ('194', '文件管理器', '7', 'null', '1', '1', '智能手表上的第一个文件管理器。整个系统的文件系统轻松浏览。打开并查看文件内容迅速通过触摸相应的文件图标。', '智能手表上的第一个文件管理器。整个系统的文件系统轻松浏览。打开并查看文件内容迅速通过触摸相应的文件图标。', 'http://image.ticwear.com/appstore/d9e68b0b40e00e0d002a76fabe526452', 'null', 'http://res.appstore.ticwear.com/rocketstartups.wearfilemanager_1.0_mms.apk', 'http://res.appstore.ticwear.com/rocketstartups.wearfilemanager_1_wear.apk', null, 'operate', '0', '194', '3137120', '1835501', 'rocketstartups.wearfilemanager', null);
INSERT INTO `fitwear_app` VALUES ('165', '状态表盘', '5', 'null', '1', '1', '为Android Wear手表设计的简约、经典、奢华的表盘??。可以显示无线网络状态、网络信号状态和手机剩余电量。', '为Android Wear手表设计的简约、经典、奢华的表盘??。可以显示无线网络状态、网络信号状态和手机剩余电量。', 'http://image.ticwear.com/appstore/4327011ab3c83d54e1e132582a2bffa6', 'null', 'http://res.appstore.ticwear.com/com.ji.status.watchface_1.0.apk', 'http://res.appstore.ticwear.com/com.ji.status.watchface_1_wear.apk', null, 'operate', '0', '165', '2635881', '1802181', 'com.ji.status.watchface', null);
INSERT INTO `fitwear_app` VALUES ('166', '模拟电视表盘', '5', 'null', '3.0.4', '1', '它就像您手腕上的一个小电视！你不需要再将表盘换来换去，因为它会自动停到这周的设置上。', '它就像您手腕上的一个小电视！你不需要再将表盘换来换去，因为它会自动停到这周的设置上。', 'http://image.ticwear.com/appstore/b84783e5f3080afdaa0bd95e559326fb', 'null', 'http://res.appstore.ticwear.com/com.littlelabs.littletv_3.0.4.apk', 'http://res.appstore.ticwear.com/com.littlelabs.littletv_62_wear.apk', null, 'operate', '0', '166', '33019078', '10935703', 'com.littlelabs.littletv', null);
INSERT INTO `fitwear_app` VALUES ('167', 'Matrix黑客帝国表盘', '5', 'null', '2.1', '1', '这是一个矩阵主题手表界面，展示不同的视觉感受。', '这是一个矩阵主题手表界面，展示不同的视觉感受。', 'http://image.ticwear.com/appstore/bf50475c4fa56b0ad83b0d3d953d4e84', 'null', 'http://res.appstore.ticwear.com/net.dheera.wearfacematrix_2.1.apk', 'http://res.appstore.ticwear.com/net.dheera.wearfacematrix_11_wear.apk', null, 'operate', '0', '167', '4383169', '2227593', 'net.dheera.wearfacematrix', null);
INSERT INTO `fitwear_app` VALUES ('168', '电量表盘', '5', 'null', '1.2.1', '1', '电池表盘，可以在手机上查看你的手表电量，简单而快捷。', '电池表盘，可以在手机上查看你的手表电量，简单而快捷。', 'http://image.ticwear.com/appstore/9567b6109e516e6e239d68e239c3e6bc', 'null', 'http://res.appstore.ticwear.com/kr.co.coretechnology.battery_1.2.1.apk', 'http://res.appstore.ticwear.com/kr.co.coretechnology.battery_25_wear.apk', null, 'operate', '0', '168', '4422056', '2523599', 'kr.co.coretechnology.battery', null);
INSERT INTO `fitwear_app` VALUES ('169', '表盘集锦', '5', 'null', '1.1.1', 'null', '一组新的Android Wear表盘！有免费的也有收费的。 奢侈手表的表盘将使你把传统手表留在家里。', '一组新的Android Wear表盘！有免费的也有收费的。 奢侈手表的表盘将使你把传统手表留在家里。', 'http://image.ticwear.com/appstore/4d8b6d131d4b95418a12bb86ea42ad97', 'null', 'http://res.appstore.ticwear.com/com.top.watchface_1.1.1.apk', 'http://res.appstore.ticwear.com/com.top.watchface_111_wear.apk', null, 'operate', '0', '169', '6186711', '2038377', 'com.top.watchface', null);
INSERT INTO `fitwear_app` VALUES ('170', 'LG G Watch表盘', '5', 'null', '1.1', '1', '非常美丽的表盘们，快来下载啊！如何适用我们的表盘？', '非常美丽的表盘们，快来下载啊！如何适用我们的表盘？', 'http://image.ticwear.com/appstore/80a5d2d1904ef6e5a0bbbb6c4acc7f98', 'null', 'http://res.appstore.ticwear.com/com.watchfacebytme.watchfaceforlggwatchr_1.1.apk', 'http://res.appstore.ticwear.com/com.watchfacebytme.watchfaceforlggwatchr_2_wear.apk', null, 'operate', '0', '170', '4849198', '2249229', 'com.watchfacebytme.watchfaceforlggwatchr', null);
INSERT INTO `fitwear_app` VALUES ('171', 'Chrono表盘', '5', 'null', '1.1.8', '1', 'Chrono表盘设计简洁但功能实用，混合和了数字式和模拟式表盘的优点。', 'Chrono表盘设计简洁但功能实用，混合和了数字式和模拟式表盘的优点。', 'http://image.ticwear.com/appstore/7b80b8efc75b6e262cfc86710ddf610f', 'null', 'http://res.appstore.ticwear.com/net.codejugglers.android.cjwatchface_1.1.8.apk', 'http://res.appstore.ticwear.com/net.codejugglers.android.cjwatchface_16_wear.apk', null, 'operate', '0', null, '4106859', '2548868', 'net.codejugglers.android.cjwatchface', null);
INSERT INTO `fitwear_app` VALUES ('173', 'Commando表盘', '5', 'null', '1.2', '1', 'Scoon Commando是Moto 360, 圆形的LG 手表和谷歌智能手表的最终硬表盘。方型版本也是被包括其中的。', 'Scoon Commando是Moto 360, 圆形的LG 手表和谷歌智能手表的最终硬表盘。方型版本也是被包括其中的。', 'http://image.ticwear.com/appstore/f86d276efdb244bcf5d0cde0b2b8e8a6', 'null', 'http://res.appstore.ticwear.com/com.scoonwear.commando_1.2.apk', 'http://res.appstore.ticwear.com/com.scoonwear.commando_3_wear.apk', null, 'operate', '0', '173', '10272115', '7152194', 'com.scoonwear.commando', null);
INSERT INTO `fitwear_app` VALUES ('174', 'Behance表盘', '5', 'null', '1', '1', '从Behance社区挑选艺术品作为表盘背景 - 5款独特的表盘：AG，经典，词组，脉搏和窗口 - 在你的Android设备上浏览全部的特色的艺术家', '从Behance社区挑选艺术品作为表盘背景 - 5款独特的表盘：AG，经典，词组，脉搏和窗口 - 在你的Android设备上浏览全部的特色的艺术家', 'http://image.ticwear.com/appstore/bcc6896ce57917caa6153e63bdaef30b', 'null', 'http://res.appstore.ticwear.com/com.behance.behancewatch_1.0.apk', 'http://res.appstore.ticwear.com/com.behance.behancewatch_11_wear.apk', null, 'operate', '0', '174', '8537895', '6040303', 'com.behance.behancewatch', null);
INSERT INTO `fitwear_app` VALUES ('129', 'A34表盘', '5', 'null', '5.5.1', '1', '专门适用于Moto 360的定制表盘', '专门适用于Moto 360的定制表盘。产品特点－出色的设计师为您设计的表盘。－时尚且风采出众的手表设计。出自专业设计师之手。', 'http://image.ticwear.com/appstore/969e223728d2d5f006f126c57b36b848', 'null', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.ma34_5.5.1.apk', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.ma34_20150102_wear.apk', null, 'operate', '0', '129', '5677006', '2041034', 'net.ddroid.aw.watchface.ma34', null);
INSERT INTO `fitwear_app` VALUES ('130', '自行车专属表盘', '5', 'null', '1.0.1.0', '1', '无论您是打算摧毁一些小路或轧过一些停机坪，专门表盘是将Android Wear定制成你的风格的最完美的方式。', '无论您是打算摧毁一些小路或轧过一些停机坪，专门表盘是将Android Wear定制成你的风格的最完美的方式。', 'http://image.ticwear.com/appstore/031622fd14d456f9029fb6fbda7c578a', 'null', 'http://res.appstore.ticwear.com/com.specialized.watchface_10100.apk', 'http://res.appstore.ticwear.com/com.specialized.watchface_10100_wear.apk', null, 'operate', '0', '130', '5177894', '2326935', 'com.specialized.watchface', null);
INSERT INTO `fitwear_app` VALUES ('132', '古典表盘', '5', 'null', '2.5.1', '1', '一个精心为Android Wear设计的表盘。 您能够在该表盘上设置两个不同的失去。 您还可以选择不同的手表主题', '一个精心为Android Wear设计的表盘。 您能够在该表盘上设置两个不同的失去。 您还可以选择不同的手表主题', 'http://image.ticwear.com/appstore/487b05102266445f0aee1cf299753f1e', 'null', 'http://res.appstore.ticwear.com/jp.collamo.wear.richwatchfaceconcrete_2.5.1.apk', 'http://res.appstore.ticwear.com/jp.collamo.wear.richwatchfaceconcrete_17_wear.apk', null, 'operate', '0', '132', '12670289', '4493934', 'jp.collamo.wear.richwatchfaceconcrete', null);
INSERT INTO `fitwear_app` VALUES ('133', '金色美人表盘', '5', 'null', '1.0.1', '1', '金色美人是你的Android Wear设备上的一个永恒的杰作。此表盘将您的Moto 360或任何其他智能手表变成一个高端的时间设备。', '金色美人是你的Android Wear设备上的一个永恒的杰作。此表盘将您的Moto 360或任何其他智能手表变成一个高端的时间设备。', 'http://image.ticwear.com/appstore/1990f3debc14d1b679d7691294296dbc', 'null', 'http://res.appstore.ticwear.com/gold.watch.face_1.0.1_mms.apk', 'http://res.appstore.ticwear.com/gold.watch.face_35_wear.apk', null, 'operate', '0', '133', '12117579', '6436881', 'gold.watch.face', null);
INSERT INTO `fitwear_app` VALUES ('134', '摩登时代表盘', '5', 'null', '1504101708', '1', 'WatchMaster是一组凭借自身出色的设计才能提升智能手表的审美水平的设计师团队', 'WatchMaster是一组凭借自身出色的设计才能提升智能手表的审美水平的设计师团队', 'http://image.ticwear.com/appstore/78a1de4ab37228c419c60644e9cb6802', 'null', 'http://res.appstore.ticwear.com/dd.watchdesigner.moderntimes_WatchApp1_1504101708.apk', 'http://res.appstore.ticwear.com/dd.watchdesigner.moderntimes_1504101708_wear.apk', null, 'operate', '0', '134', '4623140', '2016217', 'dd.watchdesigner.moderntimes', null);
INSERT INTO `fitwear_app` VALUES ('135', '月球表盘', '5', 'null', '2.1.0', 'null', '这是Android Wear的表盘.3种图案×2种颜色共6款表盘可供使用。 如何设置您的表盘？通过谷歌Play进行安装。', '这是Android Wear的表盘.3种图案×2种颜色共6款表盘可供使用。 如何设置您的表盘？通过谷歌Play进行安装。', 'http://image.ticwear.com/appstore/072bec87385440f75cdacb6320938331', 'null', 'http://res.appstore.ticwear.com/com.gp.android.watchface.project_2.1.0.apk', 'http://res.appstore.ticwear.com/com.gp.android.watchface.project_3_wear.apk', null, 'operate', '0', '135', '9728228', '3913368', 'com.gp.android.watchface.project', null);
INSERT INTO `fitwear_app` VALUES ('136', 'NAVI表盘', '5', 'null', '9', 'null', 'NAVI是一种Android Wear系统的现代指针式电子表，它的小细节会满足您在使用过程中的乐趣。未来的界面将会有很多设置与一个非常干净的外观。', 'NAVI是一种Android Wear系统的现代指针式电子表，它的小细节会满足您在使用过程中的乐趣。未来的界面将会有很多设置与一个非常干净的外观。', 'http://image.ticwear.com/appstore/332829ca93eaacf8421e392ef8d039d0', 'null', 'http://res.appstore.ticwear.com/com.thaphlash.watch.navi_9.0.apk', 'http://res.appstore.ticwear.com/com.thaphlash.watch.navi_9_wear.apk', null, 'operate', '0', '136', '8115103', '3750368', 'com.thaphlash.watch.navi', null);
INSERT INTO `fitwear_app` VALUES ('137', 'V05表盘', '5', 'null', '5.5.1', '1', 'V05定制表盘Moto 360（Android Wear）', 'V05定制表盘Moto 360（Android Wear）', 'http://image.ticwear.com/appstore/f7f8cd83c31a6aaf025a57c07c6890e1', 'null', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv05_5.5.1.apk', 'http://res.appstore.ticwear.com/net.ddroid.aw.watchface.mv05_20150102_wear.apk', null, 'operate', '0', '137', '5821592', '2152983', 'net.ddroid.aw.watchface.mv05', null);
INSERT INTO `fitwear_app` VALUES ('333', '机械日月表盘', '5', '北京数字天域', '1', '1', 'WatchMaster是一个表盘设计师群，他们的目的是以其无与伦比的设计质量来提升智能手表的审美标准。', 'WatchMaster是一个表盘设计师群，他们的目的是以其无与伦比的设计质量来提升智能手表的审美标准。', 'http://s.927114.com/upfile/256/白武士表盘.jpg,', 'null', 'http://s.927114.com/upfile/256/dd.watchdesigner.whiteknight_1.8.apk,', 'http://s.927114.com/upfile/256/dd.watchdesigner.whiteknight_10_wear.apk,', null, 'operate', '0', '0', '3940552,', '2207998,', 'com.fitwear.christmastree', 'MOTO360,W150');
INSERT INTO `fitwear_app` VALUES ('254', '手腕骰子', '9', 'null', '1.2-b5', '1', '非常好用的随机数生成器，可以用来掷骰子。', '非常好用的随机数生成器，可以用来掷骰子。点击屏幕开始掷骰子, 左右滑动可以换一个骰子。还可以用语音说命令哦', 'http://image.ticwear.com/appstore/2c586c78e9144b7ee9a7263b7a568b7a', 'null', 'http://res.appstore.ticwear.com/com.epsilon.n.weardice_1.2-b5.apk', 'http://res.appstore.ticwear.com/com.epsilon.n.weardice_15_wear.apk', null, 'operate', '0', '254', '5918677', '1905377', 'com.epsilon.n.weardice', null);
INSERT INTO `fitwear_app` VALUES ('255', '无限重复', '9', 'null', '1', '1', '要玩这个游戏，你必须有智能手表设备。你可以在任何时刻、任何地方在你的手腕上玩这个游戏', '要玩这个游戏，你必须有智能手表设备。你可以在任何时刻、任何地方在你的手腕上玩这个游戏', 'http://image.ticwear.com/appstore/eaf28684fd8eb5ebaad1f0c977cf44b5', 'null', 'http://res.appstore.ticwear.com/com.lluismontero.wear.repeat_1.0_mms.apk', 'http://res.appstore.ticwear.com/com.lluismontero.wear.repeat_7_wear.apk', null, 'operate', '0', '255', '3231208', '1814431', 'com.lluismontero.wear.repeat', null);
INSERT INTO `fitwear_app` VALUES ('256', '生活的轨迹', '9', null, '2', '1', 'LifeTracker is a simple app to keep track of life for Magic the Gathering and other CCG\'s. ', 'LifeTracker is a simple app to keep track of life for Magic the Gathering and other CCG\'s. ', 'http://image.ticwear.com/appstore/442455ddef73a3dcd33b07e8bd1c0c58', null, 'http://res.appstore.ticwear.com/com.lifetracker_2.0.apk', 'http://res.appstore.ticwear.com/com.lifetracker_20_wear.apk', null, null, '0', '256', '0', '0', 'com.lifetracker', null);
INSERT INTO `fitwear_app` VALUES ('257', '快乐运动', '13', 'null', '2.6.87', '1', '发现锻炼，减肥和自己的状态-达到你的目标的动力！', '发现锻炼，减肥和自己的状态-达到你的目标的动力！', 'http://image.ticwear.com/appstore/5e759c7f64f3e41db7ba5aa52ce75bde', 'null', 'http://res.appstore.ticwear.com/com.nexercise.client.android_2.6.87_mms.apk', 'http://res.appstore.ticwear.com/com.nexercise.client.android_106_wear.apk', null, 'operate', '0', '0', '11232338', '2446936', 'com.nexercise.client.android', 'W150,5123JW');
INSERT INTO `fitwear_app` VALUES ('258', '手表定时器', '13', 'null', '1', '1', '间隔定时器，间隔定时时间为你的智能手表提醒！', '间隔定时器，间隔定时时间为你的智能手表提醒！', 'http://image.ticwear.com/appstore/bba7e78123750ecd0f9e906fc4d055bd', 'null', 'http://res.appstore.ticwear.com/com.aeustech.wearintervaltimer_1.0_mms.apk', 'http://res.appstore.ticwear.com/com.aeustech.wearintervaltimer_7_wear.apk', null, 'operate', '0', null, '5664140', '2895040', 'com.aeustech.wearintervaltimer', null);
INSERT INTO `fitwear_app` VALUES ('259', 'FiThletics间歇运动计时', '13', 'null', '1.36', '1', '用手表来控制你的间歇运动训练。功能特点：设置运动的时间，重复频率，间隔长度之后倒计时', '用手表来控制你的间歇运动训练。功能特点：设置运动的时间，重复频率，间隔长度之后倒计时', 'http://image.ticwear.com/appstore/243492aacf7794838fc896f8ee6664d4', 'null', 'http://res.appstore.ticwear.com/vssnake.intervaltraining_1.36.apk', 'http://res.appstore.ticwear.com/vssnake.intervaltraining_8_wear.apk', null, 'operate', '0', '259', '4156464', '2447093', 'vssnake.intervaltraining', null);
INSERT INTO `fitwear_app` VALUES ('260', '三小时用餐提醒', '13', 'null', '1.4', '1', 'Every3将在饭点提醒您吃饭。每日三顿，身体健康，好处多多', 'Every3将在饭点提醒您吃饭。每日三顿，身体健康，好处多多', 'http://image.ticwear.com/appstore/50fc9dd5e8016470d82a3fc4ff062062', 'null', 'http://res.appstore.ticwear.com/com.benjano.every3_1.4.apk', 'http://res.appstore.ticwear.com/com.benjano.every3_23_wear.apk', null, 'operate', '0', '260', '4638087', '2107730', 'com.benjano.every3', null);
INSERT INTO `fitwear_app` VALUES ('265', '复活彩蛋', '5', '北京数字天域', '1', '1', '是一款以圣诞彩蛋为元素的，雪花为秒针的复古颜色表盘', '是一款以圣诞彩蛋为元素的，雪花为秒针的复古颜色表盘', 'http://s.927114.com/upfile/243/easter_egg_preview_circular.png,', null, 'http://s.927114.com/upfile/243/easter_egg_mobile-release.apk,', 'http://s.927114.com/upfile/243/easter_egg_wear-release.apk,', null, null, '0', '265', '3693491,', '1179887,', 'com.fitwear.easter_egg', null);
INSERT INTO `fitwear_app` VALUES ('266', '快乐圣诞', '5', '北京数字天域', '1', '1', '是一款圣诞老人元素的，胡子可以左右摆动的趣味表盘', '是一款圣诞老人元素的，胡子可以左右摆动的趣味表盘', 'http://s.927114.com/upfile/244/happy_christmas_preview_circular.png,', 'null', 'http://s.927114.com/upfile/244/happy_christmas_mobile-release.apk,', 'http://s.927114.com/upfile/244/happy_christmas_wear-release.apk,', null, 'operate', '0', '0', '3558470,', '1044852,', 'com.fitwear.happychristmas', 'W150');
INSERT INTO `fitwear_app` VALUES ('267', '星空驯鹿', '5', '北京数字天域', '1', '1', '是一款以驯鹿为背景，流星为秒针的圣诞表盘', '是一款以驯鹿为背景，流星为秒针的圣诞表盘', 'http://s.927114.com/upfile/245/reindeer_preview_circular.png,', null, 'http://s.927114.com/upfile/245/rein_deer_mobile-release.apk,', 'http://s.927114.com/upfile/245/rein_deer_wear-release.apk,', null, null, '0', '267', '3714152,', '1200552,', 'com.fitwear.reindeer', null);
INSERT INTO `fitwear_app` VALUES ('268', '圣诞老人', '5', '北京数字天域', '1', '1', '是一款以圣诞老人带滑雪镜、眼镜为数字时间的创意圣诞表盘', '是一款以圣诞老人带滑雪镜、眼镜为数字时间的创意圣诞表盘', 'http://s.927114.com/upfile/246/santa_claus_preview_circluar.png,', null, 'http://s.927114.com/upfile/246/santa_claus_mobile-release.apk,', 'http://s.927114.com/upfile/246/santa_claus_wear-release.apk,', null, null, '0', '268', '3705531,', '1191937,', 'com.fitwear.santa', null);
INSERT INTO `fitwear_app` VALUES ('269', 'The Hundreds表盘', '5', null, '1.1', '1', '把The Hundreds的生活方式带到你的新的Android可穿戴设备上，可从从品牌库里定制数十种图形的主题。', '把The Hundreds的生活方式带到你的新的Android可穿戴设备上，可从从品牌库里定制数十种图形的主题。', 'http://image.ticwear.com/appstore/f629f282a6bb068e95081d493ebaceef', null, 'http://res.appstore.ticwear.com/wearable.android.breel.com.thehundreds_1.1.apk', 'http://res.appstore.ticwear.com/wearable.android.breel.com.thehundreds_2_wear.apk', null, null, '0', '269', '15175003', '4815493', 'wearable.android.breel.com.thehundreds', null);
INSERT INTO `fitwear_app` VALUES ('270', '迷宫表盘', '5', null, '1.0.1', '1', '很多表都是非常相似的，不仅仅是形态和形状的——日晷、沙漏、流水钟、指针和数字表。但是很多时候，您也许想拥有一个独特的表盘来彰显个性', '很多表都是非常相似的，不仅仅是形态和形状的——日晷、沙漏、流水钟、指针和数字表。但是很多时候，您也许想拥有一个独特的表盘来彰显个性', 'http://image.ticwear.com/appstore/5f4a5ce2e0f29991d297822ad0357d3a', null, 'http://res.appstore.ticwear.com/com.zanyatocorp.illusionwatchface_1.0.1.apk', 'http://res.appstore.ticwear.com/com.zanyatocorp.illusionwatchface_2_wear.apk', null, null, '0', '270', '3205068', '1590757', 'com.zanyatocorp.illusionwatchface', null);
INSERT INTO `fitwear_app` VALUES ('271', 'Cover表盘', '5', null, '1.1', '1', 'Cover是一款极简主义表盘，仅显示你真正需要的信息。除了时间，它还可以显示电量，并以4种不同的颜色来区分不同点亮（绿色、黄色、橙色、红色）', 'Cover是一款极简主义表盘，仅显示你真正需要的信息。除了时间，它还可以显示电量，并以4种不同的颜色来区分不同点亮（绿色、黄色、橙色、红色）', 'http://image.ticwear.com/appstore/bedcf283ddd941964efdaef6e926a696', null, 'http://res.appstore.ticwear.com/co.zahaby.momo.myfirstwatchface_1.1.apk', 'http://res.appstore.ticwear.com/co.zahaby.momo.myfirstwatchface_2_wear.apk', null, null, '0', '271', '2895096', '1976642', 'co.zahaby.momo.myfirstwatchface', null);
INSERT INTO `fitwear_app` VALUES ('272', 'IO 2015表盘', '5', null, '1.0.1', '1', 'IO 2015 是一个基于Google IO 2015 Material Style的为Android Wear定制的表盘, 拥有非常酷的数字动画效果', 'IO 2015 是一个基于Google IO 2015 Material Style的为Android Wear定制的表盘, 拥有非常酷的数字动画效果', 'http://image.ticwear.com/appstore/44a6314b38560b861c643d4a58c55af9', null, 'http://res.appstore.ticwear.com/com.candl.watchface.io_1.0.1.apk', 'http://res.appstore.ticwear.com/com.candl.watchface.io_3_wear.apk', null, null, '0', '272', '1968451', '1346714', 'com.candl.watchface.io', null);
INSERT INTO `fitwear_app` VALUES ('273', '70年代表盘', '5', null, '1.1.2', '1', '70年代表盘将20世纪70年代的设计带到你的手腕上。下载这个时髦的免费的70年代表盘。', '70年代表盘将20世纪70年代的设计带到你的手腕上。下载这个时髦的免费的70年代表盘。', 'http://image.ticwear.com/appstore/b43d1c85178dbe6995bda049a807e494', null, 'http://res.appstore.ticwear.com/co.smartwatchface.seventies.watch.face.wear_1.1.2.apk', 'http://res.appstore.ticwear.com/co.smartwatchface.seventies.watch.face.wear_8_wear.apk', null, null, '0', '273', '6998439', '3324813', 'co.smartwatchface.seventies.watch.face.wear', null);
INSERT INTO `fitwear_app` VALUES ('274', '美妙表盘', '5', null, '1.1', '1', '本应用包含了为您腕表设计的一系列精美表盘。本应用当前仅为方形手表优化，针对圆形手表的优化即将上线。', '本应用包含了为您腕表设计的一系列精美表盘。本应用当前仅为方形手表优化，针对圆形手表的优化即将上线。', 'http://image.ticwear.com/appstore/9dae3c55b0a77413ef011c47e673245d', null, 'http://res.appstore.ticwear.com/com.desarrollodroide.beautifulwatchfaces_1.10.apk', 'http://res.appstore.ticwear.com/com.desarrollodroide.beautifulwatchfaces_4_wear.apk', null, null, '0', '274', '5799329', '3670492', 'com.desarrollodroide.beautifulwatchfaces', null);
INSERT INTO `fitwear_app` VALUES ('196', '手表灯', '7', 'null', '1.0.2', '1', 'Wear Light is a plugin for Tiny Flashlight and depends on it', 'Wear Light is a plugin for Tiny Flashlight and depends on it', 'http://image.ticwear.com/appstore/28ad2ba75b9244eccc1096d39d89e333', 'null', 'http://res.appstore.ticwear.com/com.devuni.flashlight.wearlight_1.0.2.apk', 'http://res.appstore.ticwear.com/com.devuni.flashlight.wearlight_3_wear.apk', null, 'operate', '0', '196', '364630', '104294', 'com.devuni.flashlight.wearlight', null);
INSERT INTO `fitwear_app` VALUES ('198', '手机设置', '7', 'null', '1', '1', '该应用提供了大量在手表上控制手机的功能.-打开WiFi, 打开Bluetooth, 打开WiFi热点, 打开移动数据, 自动转旋转开或关 - 自动同步开或关', '该应用提供了大量在手表上控制手机的功能.-打开WiFi, 打开Bluetooth, 打开WiFi热点, 打开移动数据, 自动转旋转开或关 - 自动同步开或关', 'http://image.ticwear.com/appstore/a986a926e0ad616ed7b0b286e57e88f4', 'null', 'http://res.appstore.ticwear.com/com.creativedigi.phonemanager_1.0.apk', 'http://res.appstore.ticwear.com/com.creativedigi.phonemanager_1_wear.apk', null, 'operate', '0', '198', '4203313', '2095453', 'com.creativedigi.phonemanager', null);
INSERT INTO `fitwear_app` VALUES ('206', '整点报时', '7', 'null', '1.2.8', '1', '怀念Pebble智能手表的整点报时？我也是！整点报时可以配置短振动小时的顶部，帮助您跟踪一提那时间的流逝. 只需要在您的手机上安装这个应用程序', '怀念Pebble智能手表的整点报时？我也是！整点报时可以配置短振动小时的顶部，帮助您跟踪一提那时间的流逝. 只需要在您的手机上安装这个应用程序', 'http://image.ticwear.com/appstore/ba184828262e81663f447675c6d30555', 'null', 'http://res.appstore.ticwear.com/com.t3hh4xx0r.hourlychime_1.2.8_mms.apk', 'http://res.appstore.ticwear.com/com.t3hh4xx0r.hourlychime_8_wear.apk', null, 'operate', '0', '206', '3318838', '1883650', 'com.t3hh4xx0r.hourlychime', null);
INSERT INTO `fitwear_app` VALUES ('207', '聚会助手', '7', 'null', '1.0.0', '1', '智能穿戴设备的时代已经到来，手表上只能看看时间是不是感觉太LOW啦？别担心，聚会助手让您在朋友聚会，或同事聚餐的时候更凸显您的高大上！', '智能穿戴设备的时代已经到来，手表上只能看看时间是不是感觉太LOW啦？别担心，聚会助手让您在朋友聚会，或同事聚餐的时候更凸显您的高大上！', 'http://image.ticwear.com/appstore/5420c92578c57f044e1040b476a75a11', 'null', 'http://res.appstore.ticwear.com/com.wear.liangyq_1.0.0.apk', 'http://res.appstore.ticwear.com/com.wear.liangyq_1_wear.apk', null, 'operate', '0', '207', '9038419', '3172693', 'com.wear.liangyq', null);
INSERT INTO `fitwear_app` VALUES ('208', '画笔', '7', 'null', '1.1.0', '1', 'Android Wear上很简单的绘图应用程序。您可以画任意的东西并且分享! 安装应用程序到和Android Wear配对的Android的手机', 'Android Wear上很简单的绘图应用程序。您可以画任意的东西并且分享! 安装应用程序到和Android Wear配对的Android的手机', 'http://image.ticwear.com/appstore/aace59021b340540d08bc8254bc0af0d', 'null', 'http://res.appstore.ticwear.com/com.polysfactory.drawwatch_1.1.0.apk', 'http://res.appstore.ticwear.com/com.polysfactory.drawwatch_110_wear.apk', null, 'operate', '0', '208', '2830494', '1916787', 'com.polysfactory.drawwatch', null);
INSERT INTO `fitwear_app` VALUES ('209', '音量控制器', '7', 'null', '1.3', '1', '在你的智能手表上调节手机音量。或控制移动应用程序通知控制。通知允许您控制您的可穿戴式的音量，而无需启动Android Wear应用程序', '在你的智能手表上调节手机音量。或控制移动应用程序通知控制。通知允许您控制您的可穿戴式的音量，而无需启动Android Wear应用程序', 'http://image.ticwear.com/appstore/51045c9439bddcb739b75d5b24e79b5c', 'null', 'http://res.appstore.ticwear.com/martynov.com.wearsound_1.3_mms.apk', 'http://res.appstore.ticwear.com/martynov.com.wearsound_4_wear.apk', null, 'operate', '0', '209', '2627565', '1794145', 'martynov.com.wearsound', null);
INSERT INTO `fitwear_app` VALUES ('211', '购物清单', '7', 'null', '3.0.3', '1', '一秒钟创建您的购物列表。一目了然，通知您哪些项目还需要进入购物车。多亏了自动分拣，购物是一件轻而易举的事', '一秒钟创建您的购物列表。一目了然，通知您哪些项目还需要进入购物车。多亏了自动分拣，购物是一件轻而易举的事', 'http://image.ticwear.com/appstore/129ec112daea413f3010f817f46f3364', 'null', 'http://res.appstore.ticwear.com/ch.publisheria.bring_48.apk', 'http://res.appstore.ticwear.com/ch.publisheria.bring_48_wear.apk', null, 'operate', '0', '211', '11218649', '3098834', 'ch.publisheria.bring', null);
INSERT INTO `fitwear_app` VALUES ('212', '动物声音', '7', 'null', '1.2', '1', '这款应用可以让你的智能手表成为一个手腕上的动物园，你可以听到各种动物的声音', '这款应用可以让你的智能手表成为一个手腕上的动物园，你可以听到各种动物的声音', 'http://image.ticwear.com/appstore/91f98c5a4cd2f247281592c3e412e9e8', 'null', 'http://res.appstore.ticwear.com/com.blukz.wear.animal.voices_1.2.apk', 'http://res.appstore.ticwear.com/com.blukz.wear.animal.voices_3_wear.apk', null, 'operate', '0', '212', '4286188', '1803850', 'com.blukz.wear.animal.voices', null);
INSERT INTO `fitwear_app` VALUES ('213', '手机播客订阅:BeyondPod Podcast Manager', '7', 'null', '4.1.27', '1', '播放来自世界各地数以千计的免费音视频播客！', '播放来自世界各地数以千计的免费音视频播客！', 'http://image.ticwear.com/appstore/3249ea8996262ca96efa437e1bf07ce2', 'null', 'http://res.appstore.ticwear.com/mobi.beyondpod_4.1.27.apk', 'http://res.appstore.ticwear.com/mobi.beyondpod_40127_wear.apk', null, 'operate', '0', '213', '8916120', '2730479', 'mobi.beyondpod', null);
INSERT INTO `fitwear_app` VALUES ('214', '吉他调谐器', '7', 'null', '1.0.3', '1', '简单的吉他调谐器，你可以轻松快速的调整你的吉他', '简单的吉他调谐器，你可以轻松快速的调整你的吉他', 'http://image.ticwear.com/appstore/ca35d2c7b344ff6123337c489d920c73', 'null', 'http://res.appstore.ticwear.com/com.kmshack.wear.guitartuner_1.0.3_mms.apk', 'http://res.appstore.ticwear.com/com.kmshack.wear.guitartuner_103_wear.apk', null, 'operate', '0', '214', '2550516', '1773337', 'com.kmshack.wear.guitartuner', null);
INSERT INTO `fitwear_app` VALUES ('215', '硬件大师', '7', 'null', '1.2', '1', '一个小应用程序为您的Android Wear设备提供内存和CPU使用率的信息。要切换到细节模式，请点击主屏幕上的一个图标', '一个小应用程序为您的Android Wear设备提供内存和CPU使用率的信息。要切换到细节模式，请点击主屏幕上的一个图标', 'http://image.ticwear.com/appstore/bfade15eb769f36834e3304a63691c13', 'null', 'http://res.appstore.ticwear.com/com.aheqab.memoryinfoforwear_1.2.apk', 'http://res.appstore.ticwear.com/com.aheqab.memoryinfoforwear_2_wear.apk', null, 'operate', '0', null, '3427192', '1874383', 'com.aheqab.memoryinfoforwear', null);
INSERT INTO `fitwear_app` VALUES ('216', '计数器', '7', 'null', '1', '2', 'Um util contador para seu rel&oacute;gio', 'Um util contador para seu rel&oacute;gio', 'http://image.ticwear.com/appstore/0709cfb804e0b0aecbcd06724741654c', 'null', 'http://res.appstore.ticwear.com/com.counterwear.counter_1.0.apk', 'http://res.appstore.ticwear.com/com.counterwear.counter_1_wear.apk', null, 'operate', '0', null, '2527664', '1732442', 'com.counterwear.counter', null);
INSERT INTO `fitwear_app` VALUES ('217', 'Slumber充电灭屏', '7', 'null', '1.2', '1', '您的Android Wear设备是不是经常亮着灯使您无法入睡？这个简单的应用程序在您充电时便将使您的设备黑屏，这使您在睡觉时避免过亮的灯光打扰您', '您的Android Wear设备是不是经常亮着灯使您无法入睡？这个简单的应用程序在您充电时便将使您的设备黑屏，这使您在睡觉时避免过亮的灯光打扰您', 'http://image.ticwear.com/appstore/5f8c0bfa01ae70e1cd529de73c5876db', 'null', 'http://res.appstore.ticwear.com/com.janderson.slumber_1.2.apk', 'http://res.appstore.ticwear.com/com.janderson.slumber_3_wear.apk', null, 'operate', '0', '217', '2563225', '1756724', 'com.janderson.slumber', null);
INSERT INTO `fitwear_app` VALUES ('220', '体感俄罗斯方块', '9', 'null', '1', '1', '使用手表来控制的俄罗斯方块游戏', '使用手表来控制的俄罗斯方块游戏', 'http://image.ticwear.com/appstore/c3e708fb8c2b1f431ecb1738d8347191', 'null', 'http://res.appstore.ticwear.com/com.mobvoi.knowledgegraph.wearcontroltetris_1.0.apk', 'http://res.appstore.ticwear.com/com.mobvoi.knowledgegraph.wearcontroltetris_1_wear.apk', null, 'operate', '0', '220', '15095082', '1114275', 'com.mobvoi.knowledgegraph.wearcontroltetris', null);
INSERT INTO `fitwear_app` VALUES ('221', '二十一点扑克牌', '9', 'null', '2.2', '1', '二十一点扑克牌', '二十一点扑克牌', 'http://image.ticwear.com/appstore/af281529ace9bb5c7fd92bb41f7fba1a', 'null', 'http://res.appstore.ticwear.com/com.dolcegames.blackjack_2.2_mms.apk', 'http://res.appstore.ticwear.com/com.dolcegames.blackjack_4_wear.apk', null, 'operate', '0', '221', '10002560', '7697579', 'com.dolcegames.blackjack', null);
INSERT INTO `fitwear_app` VALUES ('222', '超级足球', '9', 'null', '1.2.1', '1', '一款经典的顶足球游戏', '一款经典的顶足球游戏', 'http://image.ticwear.com/appstore/aac09322cfeeef6280e63f7008dead67', 'null', 'http://res.appstore.ticwear.com/com.hg.sps_football_wearable_1.2.1_mms.apk', 'http://res.appstore.ticwear.com/com.hg.sps_football_wearable_8_wear.apk', null, 'operate', '0', '222', '8295873', '5625435', 'com.hg.sps_football_wearable', null);
INSERT INTO `fitwear_app` VALUES ('224', '轨道迷宫', '9', 'null', '1.2.0', '1', '解决具有挑战性的和独特的100多个难题，通过障碍修筑铁路，炸弹，逃离在轨道上的海盗。', '解决具有挑战性的和独特的100多个难题，通过障碍修筑铁路，炸弹，逃离在轨道上的海盗。', 'http://image.ticwear.com/appstore/9030078ef4430dbc1c34d8ecaeb09d1b', 'null', 'http://res.appstore.ticwear.com/com.spookyhousestudios.railmaze.watch_1.2.0_mms.apk', 'http://res.appstore.ticwear.com/com.spookyhousestudios.railmaze.watch_10205_wear.apk', null, 'operate', '0', '224', '15275693', '14880871', 'com.spookyhousestudios.railmaze.watch', null);
INSERT INTO `fitwear_app` VALUES ('225', '黑白棋', '9', 'null', '1.0.1', '1', '经典的黑白棋策略游戏', '经典的黑白棋策略游戏', 'http://image.ticwear.com/appstore/9140ed4c26909e96718128246a97fd96', 'null', 'http://res.appstore.ticwear.com/org.quet.android.wear.reversi.free_1.0.1_mms.apk', 'http://res.appstore.ticwear.com/org.quet.android.wear.reversi.free_101_wear.apk', null, 'operate', '0', '225', '967010', '850263', 'org.quet.android.wear.reversi.free', null);
INSERT INTO `fitwear_app` VALUES ('227', '致命尖刺', '9', 'null', '1.04', '1', '在致命尖刺的这个游戏中，你的目标是简单地在墙壁的反弹多次，确保你不会触及尖峰死亡。', '在致命尖刺的这个游戏中，你的目标是简单地在墙壁的反弹多次，确保你不会触及尖峰死亡。', 'http://image.ticwear.com/appstore/521ff196eea1364b31d8a4bb13afe996', 'null', 'http://res.appstore.ticwear.com/com.teensystudios.deadlyspikes_5.apk', 'http://res.appstore.ticwear.com/com.teensystudios.deadlyspikes_5_wear.apk', null, 'operate', '0', '227', '13921986', '11479420', 'com.teensystudios.deadlyspikes', null);
INSERT INTO `fitwear_app` VALUES ('228', '聚会摇摇蛋', '9', 'null', '1', '1', '一款适用于酒吧、KTV等聚会场景下的智能手表小游戏，通过摇动手腕，即可让你的智能手表为你随机选择聚会小游戏', '一款适用于酒吧、KTV等聚会场景下的智能手表小游戏，通过摇动手腕，即可让你的智能手表为你随机选择聚会小游戏，当玩完游戏之后，同样通过摇动手腕，随机获取游戏惩罚，摇到什么就是什么，输了的人可不许赖账哦！紧张感，刺激感，惊喜感，都杠杠的！', 'http://image.ticwear.com/appstore/485f904e8ed773a8fb0c7d2df97a1643', 'null', 'http://res.appstore.ticwear.com/com.daijiale.wear.partyshaking_1.0.apk', 'http://res.appstore.ticwear.com/com.daijiale.wear.partyshaking_1_wear.apk', null, 'operate', '0', '228', '4593253', '3484167', 'com.daijiale.wear.partyshaking', null);
INSERT INTO `fitwear_app` VALUES ('229', '3D俄罗斯方块', '9', 'null', '1', '1', '免费的是最能手表游戏 - 一个拼图与战略游戏：一个全新的3D呈现复古经典的俄罗斯方块游戏', '免费的是最能手表游戏 - 一个拼图与战略游戏：一个全新的3D呈现复古经典的俄罗斯方块游戏', 'http://image.ticwear.com/appstore/f6e2f2d420415375c625db8308f15e81', 'null', 'http://res.appstore.ticwear.com/com.beyondinfinity.tetrocratewear_1.0_mms.apk', 'http://res.appstore.ticwear.com/com.beyondinfinity.tetrocratewear_1_wear.apk', null, 'operate', '0', '229', '565676', '220687', 'com.beyondinfinity.tetrocratewear', null);
INSERT INTO `fitwear_app` VALUES ('230', '记忆领地', '9', 'null', '1.01', '1', '这是一个经典的特征匹配游戏测试和提高你的记忆力和智商！', '这是一个经典的特征匹配游戏测试和提高你的记忆力和智商！', 'http://image.ticwear.com/appstore/e23817abda61c4a0b1d5565b877726a1', 'null', 'http://res.appstore.ticwear.com/com.teensystudios.memoryfeud_2.apk', 'http://res.appstore.ticwear.com/com.teensystudios.memoryfeud_2_wear.apk', null, 'operate', '0', '230', '12744206', '10587956', 'com.teensystudios.memoryfeud', null);
INSERT INTO `fitwear_app` VALUES ('231', '镭射战机', '9', 'null', '1.01', '1', '辐射战机专门为喜欢太空入侵类游戏的玩家量身制作。您需要驾驶战斗机保护家园不被外来入侵。', '注意：本游戏很容易上瘾！辐射战机专门为喜欢太空入侵类游戏的玩家量身制作。您需要驾驶战斗机保护家园不被外来入侵。', 'http://image.ticwear.com/appstore/4bda549a72ad1f76c1f268ed3f83913b', 'null', 'http://res.appstore.ticwear.com/com.teensystudios.radiantfighter_1.01_mms.apk', 'http://res.appstore.ticwear.com/com.teensystudios.radiantfighter_2_wear.apk', null, 'operate', '0', '231', '12458049', '10371592', 'com.teensystudios.radiantfighter', null);
INSERT INTO `fitwear_app` VALUES ('232', '老虎机', '9', 'null', '1.0.0', '1', '现在您可以在您的Android Wear上播放老虎机。不停地旋转老虎机，看您是否可以得到头奖！', '现在您可以在您的Android Wear上播放老虎机。不停地旋转老虎机，看您是否可以得到头奖！如果您用尽了里面所有的钱，只需要重新开始一局新的游戏', 'http://image.ticwear.com/appstore/2b01b939f063aabe072b3195d443644b', 'null', 'http://res.appstore.ticwear.com/com.valcourgames.watchslots.android_1.0.0.apk', 'http://res.appstore.ticwear.com/com.valcourgames.watchslots.android_1_wear.apk', null, 'operate', '0', '232', '8675933', '2788141', 'com.valcourgames.watchslots.android', null);
INSERT INTO `fitwear_app` VALUES ('233', '三拍乒乓', '9', 'null', '1.1.0', '1', '3个兵乓球球拍旋转。点击屏幕上的翻转旋转方向和周围反弹球。', '3个兵乓球球拍旋转。点击屏幕上的翻转旋转方向和周围反弹球。', 'http://image.ticwear.com/appstore/5bd66759fcd2ac5aaad657abf3583a3d', 'null', 'http://res.appstore.ticwear.com/com.spookyhousestudios.cyclopong.watch_1.1.0_mms.apk', 'http://res.appstore.ticwear.com/com.spookyhousestudios.cyclopong.watch_11050_wear.apk', null, 'operate', '0', '233', '6990080', '6607408', 'com.spookyhousestudios.cyclopong.watch', null);
INSERT INTO `fitwear_app` VALUES ('234', '投硬币', '9', 'null', '2', '1', '投硬币是一款智能手表应用，易于使用，方便您在手表设备上投掷硬币。启动应用，投掷硬币', '投硬币是一款智能手表应用，易于使用，方便您在手表设备上投掷硬币。启动应用，投掷硬币', 'http://image.ticwear.com/appstore/2263e86ba95a8ccdea674a1d5e2599d2', 'null', 'http://res.appstore.ticwear.com/cloudhead.watchcoinflip_2.apk', 'http://res.appstore.ticwear.com/cloudhead.watchcoinflip_2_wear.apk', null, 'operate', '0', '234', '2723443', '1840556', 'cloudhead.watchcoinflip', null);
INSERT INTO `fitwear_app` VALUES ('235', '乌龟之旅', '9', 'null', '1.3', '1', '开始和这个聪明的小乌龟一起冒险吧。小乌龟知道怎么游泳，但它需要你的指导，找到水下洞穴的出路。帮助其逃避野生动物的危险', '开始和这个聪明的小乌龟一起冒险吧。小乌龟知道怎么游泳，但它需要你的指导，找到水下洞穴的出路。帮助其逃避野生动物的危险', 'http://image.ticwear.com/appstore/81c727b70999ec917a35634f061b4043', 'null', 'http://res.appstore.ticwear.com/com.teensygames.turtlequest_4.apk', 'http://res.appstore.ticwear.com/com.teensygames.turtlequest_4_wear.apk', null, 'operate', '0', '235', '13768611', '11452430', 'com.teensygames.turtlequest', null);
INSERT INTO `fitwear_app` VALUES ('236', '记忆游戏', '9', 'null', '1.2', 'null', '一个经典又回来了。 智能手表出现在我们的生活。这场比赛完全适合在你的手腕进行。', '一个经典又回来了。 智能手表出现在我们的生活。这场比赛完全适合在你的手腕进行。', 'http://image.ticwear.com/appstore/915603261f6529b0bb5a61d3450caf58', 'null', 'http://res.appstore.ticwear.com/com.redwire.memoryforwear_6.apk', 'http://res.appstore.ticwear.com/com.redwire.memoryforwear_6_wear.apk', null, 'operate', '0', '236', '4297821', '2388913', 'com.redwire.memoryforwear', null);
INSERT INTO `fitwear_app` VALUES ('237', '海上运输线', '9', 'null', '1.0.6', '1', '你是潜伏在敌后执行秘密任务的潜艇队长。', '你是潜伏在敌后执行秘密任务的潜艇队长。', 'http://image.ticwear.com/appstore/7b61b2093ecf77c1241e0ed0d0e680bd', 'null', 'http://res.appstore.ticwear.com/com.spookyhousestudios.submarine.watch_1.0.6_mms.apk', 'http://res.appstore.ticwear.com/com.spookyhousestudios.submarine.watch_9839_wear.apk', null, 'operate', '0', '237', '11460589', '11071886', 'com.spookyhousestudios.submarine.watch', null);
INSERT INTO `fitwear_app` VALUES ('239', '伪装黑屏', '9', 'null', '1.02', '1', '这是一款Android Wear智能手表应用程序，可以让您通过触摸知道时间。它设计用于帮助视力受损人士，以及需要偷偷知道时间的人们。', '这是一款Android Wear智能手表应用程序，可以让您通过触摸知道时间。它设计用于帮助视力受损人士，以及需要偷偷知道时间的人们。', 'http://image.ticwear.com/appstore/159f2a4d82bca8ab8a72528498c5865e', 'null', 'http://res.appstore.ticwear.com/au.com.darkside.touchtime_1.02.apk', 'http://res.appstore.ticwear.com/au.com.darkside.touchtime_2_wear.apk', null, 'operate', '0', '239', '2843526', '1880490', 'au.com.darkside.touchtime', null);
INSERT INTO `fitwear_app` VALUES ('199', '九型人格测试', '7', 'null', '1', '1', '深度了解人格特征，了解每个型号与其他型号的特点，互动模式，圆润人与人之间的关系，营造更好的生活和工作。', '深度了解人格特征，了解每个型号与其他型号的特点，互动模式，圆润人与人之间的关系，营造更好的生活和工作。', 'http://image.ticwear.com/appstore/c8fee7219749fda65f34c65a72d3e95f', 'null', 'http://res.appstore.ticwear.com/com.zryf.attampt.enneagram_1.0.apk', 'http://res.appstore.ticwear.com/com.zryf.attampt.enneagram_1_wear.apk', null, 'operate', '0', '199', '8557148', '3126262', 'com.zryf.attampt.enneagram', null);
INSERT INTO `fitwear_app` VALUES ('200', '画板', '7', 'null', '1.0.2', '1', '画板是一个简单的绘画程序，专门为android wear方形和圆形设备设计。您可以随时随地随意画一切你想画的并分享到您的手机上。', '画板是一个简单的绘画程序，专门为android wear方形和圆形设备设计。您可以随时随地随意画一切你想画的并分享到您的手机上。', 'http://image.ticwear.com/appstore/06facfcc77125075bb9b3fb65a0e8236', 'null', 'http://res.appstore.ticwear.com/com.pandroidinc.drawwear_1.0.2.apk', 'http://res.appstore.ticwear.com/com.pandroidinc.drawwear_3_wear.apk', null, 'operate', '0', '200', '3698223', '1946416', 'com.pandroidinc.drawwear', null);
INSERT INTO `fitwear_app` VALUES ('201', 'Wear文件管理器', '7', 'null', '0.20150316a', '1', 'Wear文件管理器 可以瀏覽，諸如存儲在 AndroidWear 圖像和文本文件，是如果可用方便簡單的文件查看器。', 'Wear文件管理器 可以瀏覽，諸如存儲在 AndroidWear 圖像和文本文件，是如果可用方便簡單的文件查看器。', 'http://image.ticwear.com/appstore/3a76b76169f60d575cb84235d5eba11d', 'null', 'http://res.appstore.ticwear.com/me.rxt.axwearsimplefiler_6.apk', 'http://res.appstore.ticwear.com/me.rxt.axwearsimplefiler_6_wear.apk', null, 'operate', '0', '201', '4871421', '2765503', 'me.rxt.axwearsimplefiler', null);
INSERT INTO `fitwear_app` VALUES ('202', 'Showear锁屏', '7', 'null', '2.2.1', '1', 'Showear是Android Wea最可定制化的锁屏界面。', 'Showear是Android Wea最可定制化的锁屏界面。', 'http://image.ticwear.com/appstore/3471e118c86c3e92d02641314671a56d', 'null', 'http://res.appstore.ticwear.com/com.jdd.showear_2.2.1.apk', 'http://res.appstore.ticwear.com/com.jdd.showear_221_wear.apk', null, 'operate', '0', '202', '4176800', '2571721', 'com.jdd.showear', null);
INSERT INTO `fitwear_app` VALUES ('203', '图形计算器', '7', 'null', '1.16', '1', '这款简易的图形计算器的功能如下： -基本计算器功能 -科学计算器功能 -图形计算器功能 -支持双指缩放 -图片截屏 -支持平板电脑 -改进的用户交互功能', '这款简易的图形计算器的功能如下： -基本计算器功能 -科学计算器功能 -图形计算器功能 -支持双指缩放 -图片截屏 -支持平板电脑 -改进的用户交互功能', 'http://image.ticwear.com/appstore/2deb0a6d4c041d8bbc95f61e66c7b930', 'null', 'http://res.appstore.ticwear.com/com.herbertlaw_16.apk', 'http://res.appstore.ticwear.com/com.herbertlaw_16_wear.apk', null, 'operate', '0', '203', '3869485', '1930838', 'com.herbertlaw', null);
INSERT INTO `fitwear_app` VALUES ('218', '小黄人', '9', 'null', '1.1.0', '1', '在智能手表上体验可爱的小黄人。', '在智能手表上体验可爱的小黄人。可爱的，可爱的，黄色的卑鄙家伙我喜欢跑........不能停止运行', 'http://image.ticwear.com/appstore/e8a4a5c4195fbbd8f47f655a32c53263', 'null', 'http://res.appstore.ticwear.com/com.shortcode.minionmassacreandroidwear_1.1.0_mms.apk', 'http://res.appstore.ticwear.com/com.shortcode.minionmassacreandroidwear_3_wear.apk', null, 'operate', '0', '218', '10140166', '10015816', 'com.shortcode.minionmassacreandroidwear', null);
INSERT INTO `fitwear_app` VALUES ('219', '手表骰子', '9', 'null', '1.3', '1', '该应用程序模拟在手表上摇骰子.你只是要动摇你的手表滚动你的骰子', '该应用程序模拟在手表上摇骰子.你只是要动摇你的手表滚动你的骰子', 'http://image.ticwear.com/appstore/e825a1191e94588234b22f575e1b531e', 'null', 'http://res.appstore.ticwear.com/org.cyrilleguipie.rolldice_1.3_mms.apk', 'http://res.appstore.ticwear.com/org.cyrilleguipie.rolldice_4_wear.apk', null, 'operate', '0', '219', '2660420', '1790819', 'org.cyrilleguipie.rolldice', null);
INSERT INTO `fitwear_app` VALUES ('240', '狂野牛仔', '9', 'null', '1.0.6', '1', '欢迎到狂野小镇。我们有茶叶，蛋糕和大量子弹！射击土匪，保护美丽的女士们', '欢迎到狂野小镇。我们有茶叶，蛋糕和大量子弹！射击土匪，保护美丽的女士们', 'http://image.ticwear.com/appstore/deeefc8bfeb608d054bce802b5be08a2', 'null', 'http://res.appstore.ticwear.com/com.spookyhousestudios.saloon.watch_1.0.6_mms.apk', 'http://res.appstore.ticwear.com/com.spookyhousestudios.saloon.watch_9899_wear.apk', null, 'operate', '0', '240', '9903728', '9532741', 'com.spookyhousestudios.saloon.watch', null);
INSERT INTO `fitwear_app` VALUES ('241', '碰碰球', '9', 'null', '1.03', '1', '此程序是适用于运行Android Wear的智能手表的。请使用以下链接在您的手机或平板电脑上玩碰碰球游戏', '此程序是适用于运行Android Wear的智能手表的。请使用以下链接在您的手机或平板电脑上玩碰碰球游戏', 'http://image.ticwear.com/appstore/0fc4ead1939e25841285142472f59eaa', 'null', 'http://res.appstore.ticwear.com/com.jappetto.hitmiss.wear_1.03.apk', 'http://res.appstore.ticwear.com/com.jappetto.hitmiss.wear_3_wear.apk', null, 'operate', '0', '241', '10667763', '10430247', 'com.jappetto.hitmiss.wear', null);
INSERT INTO `fitwear_app` VALUES ('243', '随身骰子', '9', 'null', '1.1', '1', '您随身有没有骰子？你要玩游戏？下面来为您的智能手表的第一个骰子的应用程序。', '您随身有没有骰子？你要玩游戏？下面来为您的智能手表的第一个骰子的应用程序。这是简单，易用。现在免费下载。', 'http://image.ticwear.com/appstore/0c5ef93ad18e95eeb8c00b094828c846', 'null', 'http://res.appstore.ticwear.com/rocketstartups.weardiceroller_1.1_mms.apk', 'http://res.appstore.ticwear.com/rocketstartups.weardiceroller_2_wear.apk', null, 'operate', '0', '243', '3470358', '2148913', 'rocketstartups.weardiceroller', null);
INSERT INTO `fitwear_app` VALUES ('245', '火力镭射', '9', 'null', '1.1', '1', '垂直下降4块，清除他们，并且设置更高的目标！', '垂直下降4块，清除他们，并且设置更高的目标！即使在您Android Wear 装置的小触屏上，一个简单的敲击动作是您享受此款游戏的全部要求。', 'http://image.ticwear.com/appstore/ca55556a5641f4fd23f68b33a090827e', 'null', 'http://res.appstore.ticwear.com/sg.dreamrocket.gamewatch_1.1.apk', 'http://res.appstore.ticwear.com/sg.dreamrocket.gamewatch_13_wear.apk', null, 'operate', '0', '232', '29020810', '10570153', 'sg.dreamrocket.gamewatch', null);
INSERT INTO `fitwear_app` VALUES ('246', '青蛙过河', '9', 'null', '1.0.6', '1', '从一个睡莲跳到另一个睡莲，避免落入水中。易于学习，难以掌握', '从一个睡莲跳到另一个睡莲，避免落入水中。易于学习，难以掌握', 'http://image.ticwear.com/appstore/af787ce2561e4d47f94e3dd02f9e7c91', 'null', 'http://res.appstore.ticwear.com/com.spookyhousestudios.frogcommander2.watch_1.0.6_mms.apk', 'http://res.appstore.ticwear.com/com.spookyhousestudios.frogcommander2.watch_9871_wear.apk', null, 'operate', '0', '246', '11249090', '10867638', 'com.spookyhousestudios.frogcommander2.watch', null);
INSERT INTO `fitwear_app` VALUES ('247', '急速点击', '9', 'null', '1', '1', '一款丰富的泡泡龙游戏，有丰富的图形和独特的游戏模式', '一款丰富的泡泡龙游戏，有丰富的图形和独特的游戏模式', 'http://image.ticwear.com/appstore/fa15ec7cbba9d857f870a4ff9cfe7112', 'null', 'http://res.appstore.ticwear.com/com.madtinkergames.tapandzap_1.0_mms.apk', 'http://res.appstore.ticwear.com/com.madtinkergames.tapandzap_1_wear.apk', null, 'operate', '0', '247', '4606123', '2490714', 'com.madtinkergames.tapandzap', null);
INSERT INTO `fitwear_app` VALUES ('249', '动物园大逃亡', '9', 'null', '1.1.0', '1', '当心！野生动物逃离动物园！作为一名动物园管理员，你要记住大家谁逃脱，并让他们回来。', '当心！野生动物逃离动物园！作为一名动物园管理员，你要记住大家谁逃脱，并让他们回来。', 'http://image.ticwear.com/appstore/7239fd8502998584d6288cda4c47dea4', 'null', 'http://res.appstore.ticwear.com/com.spookyhousestudios.porter.watch_1.1.0_mms.apk', 'http://res.appstore.ticwear.com/com.spookyhousestudios.porter.watch_11051_wear.apk', null, 'operate', '0', '249', '8954142', '8579789', 'com.spookyhousestudios.porter.watch', null);
INSERT INTO `fitwear_app` VALUES ('250', '袋鼠冒险', '9', 'null', '1', '1', '袋鼠冒险是一个无尽的袋鼠跑步游戏。你需要在时间耗尽之前要快速获得尽可能多的点数', '袋鼠冒险是一个无尽的袋鼠跑步游戏。你需要在时间耗尽之前要快速获得尽可能多的点数', 'http://image.ticwear.com/appstore/9cfbb231e1cfe9073a5b394e82e5c07c', 'null', 'http://res.appstore.ticwear.com/com.teensystudios.roostapadventure_1.0_mms.apk', 'http://res.appstore.ticwear.com/com.teensystudios.roostapadventure_1_wear.apk', null, 'operate', '0', '250', '13132736', '10850032', 'com.teensystudios.roostapadventure', null);
INSERT INTO `fitwear_app` VALUES ('251', '数学游戏', '9', 'null', '1.1.2', '1', '一款简单的数学游戏,游戏会随机产生计算公式,玩家需要迅速做出反应', '一款简单的数学游戏,游戏会随机产生计算公式,玩家需要迅速做出反应', 'http://image.ticwear.com/appstore/d696682aeb612290dbab3e7d926445d6', 'null', 'http://res.appstore.ticwear.com/net.emersoft.mathit_1.1.2.apk', 'http://res.appstore.ticwear.com/net.emersoft.mathit_11_wear.apk', null, 'operate', '0', '0', '3560188', '1052992', 'net.emersoft.mathit', 'MOTO360,W150,5123JW');
INSERT INTO `fitwear_app` VALUES ('252', '桨球游戏', '9', 'null', '1.2', '1', '一个经典的桨球游戏<br/>现在你也可以在你的移动设备上玩儿', '一个经典的桨球游戏<br/>现在你也可以在你的移动设备上玩儿', 'http://image.ticwear.com/appstore/793f2a858085e82ab1a7f767e0113fdd', 'null', 'http://res.appstore.ticwear.com/martynov.com.paddlepro_1.2_mms.apk', 'http://res.appstore.ticwear.com/martynov.com.paddlepro_3_wear.apk', null, 'operate', '0', '252', '2561034', '1760961', 'martynov.com.paddlepro', null);
INSERT INTO `fitwear_app` VALUES ('253', '飞扬机器人', '9', 'null', '1.1', '1', '您的智能设备上的飞行机器人。实验游戏的灵感来自某个其他鸟的游戏。', '您的智能设备上的飞行机器人。实验游戏的灵感来自某个其他鸟的游戏。', 'http://image.ticwear.com/appstore/a6ecbc56037388fb8f49b6a46664691a', 'null', 'http://res.appstore.ticwear.com/at.maui.flopsydroid_1.1_mms.apk', 'http://res.appstore.ticwear.com/at.maui.flopsydroid_2_wear.apk', null, 'operate', '0', '253', '4210253', '2848372', 'at.maui.flopsydroid', null);
INSERT INTO `fitwear_app` VALUES ('292', '天空表盘', '5', null, '1.5.2', '1', '这是一款非常简洁的天空表盘，可以让你每次抬手看表的时候，都心胸宽阔，放松心情！', '这是一款非常简洁的天空表盘，可以让你每次抬手看表的时候，都心胸宽阔，放松心情！', 'http://image.ticwear.com/appstore/159de0911a056ee6a5e9e027d3d6a29e', null, 'http://res.appstore.ticwear.com/com.botty.skyclock_1.5.2.apk', 'http://res.appstore.ticwear.com/com.botty.skyclock_7_wear.apk', null, null, '0', '292', '4813771', '2830088', 'com.botty.skyclock', null);
INSERT INTO `fitwear_app` VALUES ('293', '心情表盘', '5', null, '0.2', '1', '本应用是Android Wear表盘应用。可以通过它藉由时钟来表达您的感情。', '本应用是Android Wear表盘应用。可以通过它藉由时钟来表达您的感情。', 'http://image.ticwear.com/appstore/e43277700cefa1f5a184742e231d39a3', null, 'http://res.appstore.ticwear.com/com.aggro.emoticonface_0.2.apk', 'http://res.appstore.ticwear.com/com.aggro.emoticonface_3_wear.apk', null, null, '0', '293', '3583801', '2387938', 'com.aggro.emoticonface', null);
INSERT INTO `fitwear_app` VALUES ('294', '巧克力风格表盘', '5', null, '1', '1', '巧克力/金块风格九宫格表盘，适配多款智能手表', '巧克力/金块风格九宫格表盘，适配多款智能手表', 'http://image.ticwear.com/appstore/9dd3bb25bd68cb923175fb64bafc9ad7', null, 'http://res.appstore.ticwear.com/com.watchfacebytme.watchfacefoandoidwea_1.0.apk', 'http://res.appstore.ticwear.com/com.watchfacebytme.watchfacefoandoidwea_1_wear.apk', null, null, '0', '294', '4776195', '2187815', 'com.watchfacebytme.watchfacefoandoidwea', null);
INSERT INTO `fitwear_app` VALUES ('295', '涂片表盘', '5', null, '1', '1', 'The Pieces 表盘可以以不同的方式读取时间', 'The Pieces 表盘可以以不同的方式读取时间', 'http://image.ticwear.com/appstore/334f829ba85925463f3fc3c15e90ad68', null, 'http://res.appstore.ticwear.com/com.huzu.watchface.geom.pieces_1.0.apk', 'http://res.appstore.ticwear.com/com.huzu.watchface.geom.pieces_3_wear.apk', null, null, '0', '295', '3065913', '1759079', 'com.huzu.watchface.geom.pieces', null);
INSERT INTO `fitwear_app` VALUES ('296', 'Tech表盘', '5', null, '1.1.0', '1', 'Android Wear 5.0表盘。通过安装本应用，您可以为您的Android Wear设备获得优美精致的表盘设计。', 'Android Wear 5.0表盘。通过安装本应用，您可以为您的Android Wear设备获得优美精致的表盘设计。', 'http://image.ticwear.com/appstore/49b383096ce156f2fbd61cdf8925b0cd', null, 'http://res.appstore.ticwear.com/com.techworkstudios.wear.android.techwear_1.1.0.apk', 'http://res.appstore.ticwear.com/com.techworkstudios.wear.android.techwear_3_wear.apk', null, null, '0', '296', '4712449', '2318432', 'com.techworkstudios.wear.android.techwear', null);
INSERT INTO `fitwear_app` VALUES ('297', '密探表盘', '5', null, '1.4.5', '1', '这个表盘是为安卓穿戴设备而设计，它不会在你的手机应用列表中显示。', '这个表盘是为安卓穿戴设备而设计，它不会在你的手机应用列表中显示。', 'http://image.ticwear.com/appstore/3157bd11b170b01dbc7b3a5af7a6dd61', null, 'http://res.appstore.ticwear.com/com.rmukapps.secretagent_1.4.5.apk', 'http://res.appstore.ticwear.com/com.rmukapps.secretagent_30_wear.apk', null, null, '0', '297', '3381170', '1744734', 'com.rmukapps.secretagent', null);
INSERT INTO `fitwear_app` VALUES ('298', '9elements表盘', '5', null, '1.0.3', '1', '9elements表盘是一个非常有想象力和有趣的表盘，你也许不是那么容易的看时间，但是你一定会爱上它的！', '9elements表盘是一个非常有想象力和有趣的表盘，你也许不是那么容易的看时间，但是你一定会爱上它的！', 'http://image.ticwear.com/appstore/92200163be3909b821eb3476ea6ee385', null, 'http://res.appstore.ticwear.com/com.ninelements.nineelementsonewatch_1.0.3.apk', 'http://res.appstore.ticwear.com/com.ninelements.nineelementsonewatch_4_wear.apk', null, null, '0', '298', '3103074', '1768547', 'com.ninelements.nineelementsonewatch', null);
INSERT INTO `fitwear_app` VALUES ('299', 'Flat表盘(方)', '5', null, '1.0.5', '1', '这款手表表盘的设计参加了摩托360 (Moto 360) 的表盘设计竞赛。 表盘在白天和夜间清晰可见也。 “睡眠”模式也可用。 目前仅有方形', '这款手表表盘的设计参加了摩托360 (Moto 360) 的表盘设计竞赛。 表盘在白天和夜间清晰可见也。 “睡眠”模式也可用。 目前仅有方形', 'http://image.ticwear.com/appstore/e9d7b409bbd06e2137f0c144a65e1f0c', null, 'http://res.appstore.ticwear.com/com.virtucone.flatwatch_1.0.5.apk', 'http://res.appstore.ticwear.com/com.virtucone.flatwatch_5_wear.apk', null, null, '0', '299', '3174673', '1729955', 'com.virtucone.flatwatch', null);
INSERT INTO `fitwear_app` VALUES ('300', '方格小工具', '5', null, '1.4', '1', '方格小工具是款手机插件，不仅可以装饰你的手机，还有一些其他的功能，添加小工具长按屏幕上', '方格小工具是款手机插件，不仅可以装饰你的手机，还有一些其他的功能，添加小工具长按屏幕上', 'http://image.ticwear.com/appstore/9b139301185f70e86c5b808206d31d3b', null, 'http://res.appstore.ticwear.com/com.xlythe.minecraftclock_1.4.apk', 'http://res.appstore.ticwear.com/com.xlythe.minecraftclock_5_wear.apk', null, null, '0', '300', '3125333', '1883470', 'com.xlythe.minecraftclock', null);
INSERT INTO `fitwear_app` VALUES ('301', '手表电筒', '7', null, '1', '1', '这个应用程序是专为Android Wear设计的，它不会在其它系统上工作。它让你在几秒之内点亮你的手表说明', '这个应用程序是专为Android Wear设计的，它不会在其它系统上工作。它让你在几秒之内点亮你的手表说明', 'http://image.ticwear.com/appstore/88f54a1554925dc93a924704681bdaea', null, 'http://res.appstore.ticwear.com/macosoftware.torchforwear_1.0.apk', 'http://res.appstore.ticwear.com/macosoftware.torchforwear_101_wear.apk', null, null, '0', '301', '3367963', '1880422', 'macosoftware.torchforwear', null);
INSERT INTO `fitwear_app` VALUES ('302', '电池 - Battery', '7', null, '3.2.2', '1', '电池是一款小巧、时尚、优雅的应用，能够帮助您关注您的安卓设备上的当前电池电量百分比情况，甚至可以当做省电装置使用。', '电池是一款小巧、时尚、优雅的应用，能够帮助您关注您的安卓设备上的当前电池电量百分比情况，甚至可以当做省电装置使用。', 'http://image.ticwear.com/appstore/e9e7b02470ff335a0a10fb4261ac7466', null, 'http://res.appstore.ticwear.com/com.macropinch.pearl_3.2.2.apk', 'http://res.appstore.ticwear.com/com.macropinch.pearl_130042_wear.apk', null, null, '0', '302', '2772362', '1052532', 'com.macropinch.pearl', null);
INSERT INTO `fitwear_app` VALUES ('303', '节拍器', '7', null, '14.10.6', '1', 'dMetronome是一个节拍器应用程序，在智能手表上运行', 'dMetronome是一个节拍器应用程序，在智能手表上运行', 'http://image.ticwear.com/appstore/1a043b1369ac2f949ac9d538b334b153', null, 'http://res.appstore.ticwear.com/com.digutsoft.metronome_14.10.6_mms.apk', 'http://res.appstore.ticwear.com/com.digutsoft.metronome_14106_wear.apk', null, null, '0', '303', '1479653', '1742480', 'com.digutsoft.metronome', null);
INSERT INTO `fitwear_app` VALUES ('304', '相机触发器', '7', null, '2.4.5', '1', '相机触发器是一种简单的运动检测应用。移动设备相机的快门（视频记录）将被触发在选定的屏幕区域，其中用户可以改变它的区域的位置和大小的物体的运动', '相机触发器是一种简单的运动检测应用。移动设备相机的快门（视频记录）将被触发在选定的屏幕区域，其中用户可以改变它的区域的位置和大小的物体的运动', 'http://image.ticwear.com/appstore/6221c8d8791d027f5877617124125dd1', null, 'http://res.appstore.ticwear.com/com.busywww.cameratrigger_35.apk', 'http://res.appstore.ticwear.com/com.busywww.cameratrigger_35_wear.apk', null, null, '0', '304', '5318453', '2058819', 'com.busywww.cameratrigger', null);
INSERT INTO `fitwear_app` VALUES ('305', '安卓设备信息', '7', null, '1.4', '1', '“设备信息”是一款显示Android设备上所支持/不支持的功能和它们行为的Android应用。', '“设备信息”是一款显示Android设备上所支持/不支持的功能和它们行为的Android应用。', 'http://image.ticwear.com/appstore/a52f6c42217e70238ca6a3e2383f2213', null, 'http://res.appstore.ticwear.com/com.phikod.deviceportinfo_1.4.apk', 'http://res.appstore.ticwear.com/com.phikod.deviceportinfo_6_wear.apk', null, null, '0', '305', '5333943', '2661134', 'com.phikod.deviceportinfo', null);
INSERT INTO `fitwear_app` VALUES ('306', '简单抛硬币', '7', null, '6.3.3', '1', '在没有硬币的时候，也可方便用来抛硬币的应用', '在没有硬币的时候，也可方便用来抛硬币的应用', 'http://image.ticwear.com/appstore/41ecafd0d8d32fa25fe7c9622c4d927a', null, 'http://res.appstore.ticwear.com/com.banasiak.coinflip_6.3.3.apk', 'http://res.appstore.ticwear.com/com.banasiak.coinflip_44_wear.apk', null, null, '0', '306', '2468378', '1409369', 'com.banasiak.coinflip', null);
INSERT INTO `fitwear_app` VALUES ('307', 'Unwin指南针', '7', null, '5.1', '1', '这是我第一个真正好看的指南针应用。教会自己关于Android中的传感器应用开发，只花了我一个小时左右', '这是我第一个真正好看的指南针应用。教会自己关于Android中的传感器应用开发，只花了我一个小时左右', 'http://image.ticwear.com/appstore/ae1054a10601272c3e1d43494dad1982', null, 'http://res.appstore.ticwear.com/com.unwin.compass.compass_5.1.apk', 'http://res.appstore.ticwear.com/com.unwin.compass.compass_8_wear.apk', null, null, '0', '307', '3645515', '1816670', 'com.unwin.compass.compass', null);
INSERT INTO `fitwear_app` VALUES ('309', '高级任务管理器', '7', null, '1', '1', '用来关闭手表上正在运行的app. 使用圆表和方表。*请注意* 有些被关闭的app可能会立刻重新启动', '用来关闭手表上正在运行的app. 使用圆表和方表。*请注意* 有些被关闭的app可能会立刻重新启动', 'http://image.ticwear.com/appstore/709944a26650349d41b02a00dc0eba78', null, 'http://res.appstore.ticwear.com/wear.taskman_1.2.apk', 'http://res.appstore.ticwear.com/wear.taskman_5_wear.apk', null, null, '0', '309', '3297821', '1878192', 'wear.taskman', null);
INSERT INTO `fitwear_app` VALUES ('310', '手表计数器', '7', null, '2.0.0', '1', 'Wear计数器是用于您Android Wear设备上一款简单的数字式计数器。现在可以翻扭来计数！', 'Wear计数器是用于您Android Wear设备上一款简单的数字式计数器。现在可以翻扭来计数！', 'http://image.ticwear.com/appstore/99cd2345d2dd9e436190d28147178fbe', null, 'http://res.appstore.ticwear.com/it.purplepixel.wearcounter_2.0.0.apk', 'http://res.appstore.ticwear.com/it.purplepixel.wearcounter_6_wear.apk', null, null, '0', '310', '2912425', '2135721', 'it.purplepixel.wearcounter', null);
INSERT INTO `fitwear_app` VALUES ('330', '为我计时', '7', null, '1.0.8', '1', '可以运行于Android手表，手机和平板的内部计时器。', '可以运行于Android手表，手机和平板的内部计时器。', 'http://image.ticwear.com/appstore/227752c4bfc1a5970c203ff02daa4261', null, 'http://res.appstore.ticwear.com/com.ryanchesla.paceme_1.0.8.apk', 'http://res.appstore.ticwear.com/com.ryanchesla.paceme_10_wear.apk', null, null, '0', '330', '3346706', '1938593', 'com.ryanchesla.paceme', null);
INSERT INTO `fitwear_app` VALUES ('331', 'LIFX控制器', '7', null, '2.3.1', '1', '反馈功能现在十分有用的诊断信息的电子邮件。', '反馈功能现在十分有用的诊断信息的电子邮件。', 'http://image.ticwear.com/appstore/ef69414ef724dbc57e2afb127564dfe6', null, 'http://res.appstore.ticwear.com/com.lifx.lifx_2444.apk', 'http://res.appstore.ticwear.com/com.lifx.lifx_2444_wear.apk', null, null, '0', '325', '11625221', '1463900', 'com.lifx.lifx', null);
INSERT INTO `fitwear_app` VALUES ('332', '快速小费', '7', null, '1.1.5', '1', '快速小费是一个小费计算器。你可能会问，＆QUOT;我为什么要下载呢？是什么让快速小费和所有其他尖端计算器在那里＆QUOT 不同', '快速小费是一个小费计算器。你可能会问，＆QUOT;我为什么要下载呢？是什么让快速小费和所有其他尖端计算器在那里＆QUOT 不同', 'http://image.ticwear.com/appstore/3be2f70dcc8db25cf327d639d86a61da', null, 'http://res.appstore.ticwear.com/com.webberrobots.fasttip_1.1.5_mms.apk', 'http://res.appstore.ticwear.com/com.webberrobots.fasttip_5_wear.apk', null, null, '0', '331', '3535789', '1994319', 'com.webberrobots.fasttip', null);
INSERT INTO `fitwear_app` VALUES ('312', '汇率计算器', '7', null, '1.4', '1', '您可以在您的Android wear手表或手持phone使用这个应用。这个应用程序是海外购物时用的汇率计算器。', '您可以在您的Android wear手表或手持phone使用这个应用。这个应用程序是海外购物时用的汇率计算器。', 'http://image.ticwear.com/appstore/6b41a9eec94713c8b4840691384470ac', null, 'http://res.appstore.ticwear.com/jp.watson.akira.exchangecalc_1.4.apk', 'http://res.appstore.ticwear.com/jp.watson.akira.exchangecalc_5_wear.apk', null, null, '0', '312', '4191144', '1950966', 'jp.watson.akira.exchangecalc', null);
INSERT INTO `fitwear_app` VALUES ('313', 'Tesla汽车遥控器', '7', null, '1.0.1', '1', 'Tesla Command for Android Wear是一款针对特斯拉电动车的Android Wear智能手表应用程序，可控制特斯拉汽车开/锁门、鸣喇叭、开/闭天窗。', 'Tesla Command for Android Wear是一款针对特斯拉电动车的Android Wear智能手表应用程序，可控制特斯拉汽车开/锁门、鸣喇叭、开/闭天窗。', 'http://image.ticwear.com/appstore/1569a05c27cd4bad38918977f595b0f8', null, 'http://res.appstore.ticwear.com/com.matthewpatience.teslawear_1.0.1.apk', 'http://res.appstore.ticwear.com/com.matthewpatience.teslawear_2_wear.apk', null, null, '0', '313', '2945142', '1755869', 'com.matthewpatience.teslawear', null);
INSERT INTO `fitwear_app` VALUES ('315', 'Hip Hop喇叭', '7', null, '1.2', '1', '这个应用程序添加了礼物给你的社交活动。还支持Android的手表与本机应用程序。只要按一下手表播放声音的电话', '这个应用程序添加了礼物给你的社交活动。还支持Android的手表与本机应用程序。只要按一下手表播放声音的电话', 'http://image.ticwear.com/appstore/85163e284c960d289fbd802c8a85f0b3', null, 'http://res.appstore.ticwear.com/com.kyleriedemann.hiphopairhorn_1.2_mms.apk', 'http://res.appstore.ticwear.com/com.kyleriedemann.hiphopairhorn_3_wear.apk', null, null, '0', '315', '3154893', '2044974', 'com.kyleriedemann.hiphopairhorn', null);
INSERT INTO `fitwear_app` VALUES ('316', '完美音调', '7', null, '2.3.0', '1', '完美音调是一个实用的应用程序。在它的核心，它是一个数字律管，让音乐家们开始排练，或一首歌曲之前，需要一个初始间距。', '完美音调是一个实用的应用程序。在它的核心，它是一个数字律管，让音乐家们开始排练，或一首歌曲之前，需要一个初始间距。', 'http://image.ticwear.com/appstore/00b17d83a9e357ebe61bcce44d49aed6', null, 'http://res.appstore.ticwear.com/depollsoft.pitchperfect_38.apk', 'http://res.appstore.ticwear.com/depollsoft.pitchperfect_38_wear.apk', null, null, '0', '316', '6109553', '2128654', 'depollsoft.pitchperfect', null);
INSERT INTO `fitwear_app` VALUES ('317', '彩虹火炬', '7', null, '1.1', '1', '彩虹火炬是非常有用的，易于使用的智能手表应用。刚开始的应用程序<br/>并点击屏幕改变不同的颜色灯光。', '彩虹火炬是非常有用的，易于使用的智能手表应用。刚开始的应用程序<br/>并点击屏幕改变不同的颜色灯光。', 'http://image.ticwear.com/appstore/370cb7494d84b11e9e30145a7d3145be', null, 'http://res.appstore.ticwear.com/com.jezz.wearlight_1.1_mms.apk', 'http://res.appstore.ticwear.com/com.jezz.wearlight_2_wear.apk', null, null, '0', '315', '2540170', '949138', 'com.jezz.wearlight', null);
INSERT INTO `fitwear_app` VALUES ('318', '计分器', '7', null, '1.0.2', '1', '打比赛时的计分神器，目前可支持三个玩家每人最高200分，向左滑动重置游戏，同时支持圆表和方表', '打比赛时的计分神器，目前可支持三个玩家每人最高200分，向左滑动重置游戏，同时支持圆表和方表', 'http://image.ticwear.com/appstore/7c1a2bf387e977bc79322c80614f2e18', null, 'http://res.appstore.ticwear.com/com.blackcj.scorekeeper_1.0.2.apk', 'http://res.appstore.ticwear.com/com.blackcj.scorekeeper_5_wear.apk', null, null, '0', '318', '4190331', '1903672', 'com.blackcj.scorekeeper', null);
INSERT INTO `fitwear_app` VALUES ('319', 'Nest温度控制器', '7', null, '1.6.576', '1', '可以控制安装在你家里的Nest温度控制器（需要安装Nest才能使用）', '可以控制安装在你家里的Nest温度控制器（需要安装Nest才能使用）', 'http://image.ticwear.com/appstore/0bff8eb189d6f191985046a9e9a04df4', null, 'http://res.appstore.ticwear.com/com.codemodlabs.temperature_1.6.576.apk', 'http://res.appstore.ticwear.com/com.codemodlabs.temperature_576_wear.apk', null, null, '0', '319', '5741657', '1811717', 'com.codemodlabs.temperature', null);
INSERT INTO `fitwear_app` VALUES ('320', 'MoveUp!多功能计时器', '7', null, '1.0.7', '1', 'MoveUp！多功能倒计时-- 可以独立于手机和蓝牙连接使用，拥有丰富的自定义功能，可以同时设置多个定时器。', 'MoveUp！多功能倒计时-- 可以独立于手机和蓝牙连接使用，拥有丰富的自定义功能，可以同时设置多个定时器。', 'http://image.ticwear.com/appstore/aebbb731e8ca22a9579436ed30c9669f', null, 'http://res.appstore.ticwear.com/pl.w9.moveupmultitimer_1.0.7.apk', 'http://res.appstore.ticwear.com/pl.w9.moveupmultitimer_6_wear.apk', null, null, '0', '320', '4121224', '1949720', 'pl.w9.moveupmultitimer', null);
INSERT INTO `fitwear_app` VALUES ('321', 'Hijri日历', '7', null, '1.0.1', null, '这是一个在android wear上显示伊斯兰日历的小应用程序', '这是一个在android wear上显示伊斯兰日历的小应用程序', 'http://image.ticwear.com/appstore/6fd7c0c68aba2060718dfdb128eab581', null, 'http://res.appstore.ticwear.com/com.alhazmy13.hijricalendar_1.0.1.apk', 'http://res.appstore.ticwear.com/com.alhazmy13.hijricalendar_4_wear.apk', null, null, '0', '321', '2647476', '2141036', 'com.alhazmy13.hijricalendar', null);
INSERT INTO `fitwear_app` VALUES ('322', '高级定时器', '7', null, '1.1', '1', '帮助你快速的在手表上设置一个定时器，软件会在后台运行，并不会打扰你的正常操作', '帮助你快速的在手表上设置一个定时器，软件会在后台运行，并不会打扰你的正常操作', 'http://image.ticwear.com/appstore/19b75a402b1544eb8139341931c83d8c', null, 'http://res.appstore.ticwear.com/wearablesoftware.weartimer_1.1.apk', 'http://res.appstore.ticwear.com/wearablesoftware.weartimer_3_wear.apk', null, null, '0', '322', '3555637', '2098817', 'wearablesoftware.weartimer', null);
INSERT INTO `fitwear_app` VALUES ('323', '应用钉子', '7', null, '1.02', '1', '这个应用可以帮你很容易地将一个手表应用钉在手表上，这样每次你一抬手，就能看到这个应用。你也可以很容易的把这个应用去掉', '这个应用可以帮你很容易地将一个手表应用钉在手表上，这样每次你一抬手，就能看到这个应用。你也可以很容易的把这个应用去掉', 'http://image.ticwear.com/appstore/5dab04e7feb158010b2da3663eb3a2b1', null, 'http://res.appstore.ticwear.com/com.trigonesoft.pinanapp_1.02.apk', 'http://res.appstore.ticwear.com/com.trigonesoft.pinanapp_102_wear.apk', null, null, '0', '322', '2662453', '1314766', 'com.trigonesoft.pinanapp', null);
INSERT INTO `fitwear_app` VALUES ('324', '电池监视器', '7', null, '1', '1', '我注意到当我的手机在房间里充电时，我无法从我的智能手表查看充电中的手机的百分比。这给我一个机会开始探索Android Wear APK', '我注意到当我的手机在房间里充电时，我无法从我的智能手表查看充电中的手机的百分比。这给我一个机会开始探索Android Wear APK', 'http://image.ticwear.com/appstore/3cdcc20fc2ca5708398bc80e145afc93', null, 'http://res.appstore.ticwear.com/jinaud.wearbatterywatcher_1.0.apk', 'http://res.appstore.ticwear.com/jinaud.wearbatterywatcher_1_wear.apk', null, null, '0', '324', '4374391', '2395648', 'jinaud.wearbatterywatcher', null);
INSERT INTO `fitwear_app` VALUES ('325', '鸡蛋定时器', '7', null, '1.1', '1', '煮蛋定时器，可以为软、中、硬三种程度的煮蛋设定不同的定时器。在煮蛋即将完成的的30秒之前，会发出通知并震动', '煮蛋定时器，可以为软、中、硬三种程度的煮蛋设定不同的定时器。在煮蛋即将完成的的30秒之前，会发出通知并震动', 'http://image.ticwear.com/appstore/2a177c2fd79907fd1c136bf6c61b662f', null, 'http://res.appstore.ticwear.com/com.ipsl.cookingtimer_1.1.apk', 'http://res.appstore.ticwear.com/com.ipsl.cookingtimer_6_wear.apk', null, null, '0', '325', '2672256', '1908825', 'com.ipsl.cookingtimer', null);
INSERT INTO `fitwear_app` VALUES ('327', '圣诞倒计时', '7', null, '1.0.6', '1', '圣诞节或新年倒计时; （你可以设置1几种日期：圣诞节，新年或者设置你的日期倒计时）', '圣诞节或新年倒计时; （你可以设置1几种日期：圣诞节，新年或者设置你的日期倒计时）', 'http://image.ticwear.com/appstore/6a1dbd37ed91aa131e5f05b1a2713a54', null, 'http://res.appstore.ticwear.com/com.mikhaylov.kolesov.plasticinechristmaswidgets_1.0.6_mms.apk', 'http://res.appstore.ticwear.com/com.mikhaylov.kolesov.plasticinechristmaswidgets_6_wear.apk', null, null, '0', '327', '3992740', '1910992', 'com.mikhaylov.kolesov.plasticinechristmaswidgets', null);
INSERT INTO `fitwear_app` VALUES ('328', '宝贝时间', '7', null, '1.0.3', '1', '防止熊孩子动你的手表，它保留在屏幕上，但在最低亮度设置，退出唯一方法就是刷两次，然后倒两次', '防止熊孩子动你的手表，它保留在屏幕上，但在最低亮度设置，退出唯一方法就是刷两次，然后倒两次', 'http://image.ticwear.com/appstore/ef22efa08da55b9a6e1459ce4cfc5c41', null, 'http://res.appstore.ticwear.com/com.yonisamlan.wearbabytime_1.0.3_mms.apk', 'http://res.appstore.ticwear.com/com.yonisamlan.wearbabytime_4_wear.apk', null, null, '0', '317', '1711766', '1299192', 'com.yonisamlan.wearbabytime', null);
INSERT INTO `fitwear_app` VALUES ('275', 'Timeless表盘', '5', null, '0.51', null, 'Timeless是用于您Android Wear设备上的一款干净、简洁、动画精美的表盘。酷炫的过渡效果和漂亮的壁纸会随时间而变化（壁纸可以被禁用），使这款表盘尤为独特', 'Timeless是用于您Android Wear设备上的一款干净、简洁、动画精美的表盘。酷炫的过渡效果和漂亮的壁纸会随时间而变化（壁纸可以被禁用），使这款表盘尤为独特', 'http://image.ticwear.com/appstore/979fae5ba0549b999d7ae16ad6313767', null, 'http://res.appstore.ticwear.com/de.frizzware.timeless_0.51.apk', 'http://res.appstore.ticwear.com/de.frizzware.timeless_6_wear.apk', null, null, '0', '275', '2904763', '2112496', 'de.frizzware.timeless', null);
INSERT INTO `fitwear_app` VALUES ('276', 'BCBGMAXAZRIA表盘', '5', null, '1.0.1', '1', 'BCBGMAXAZRIA，命名来源于巴黎俚语“bon chic, bon genre”，意思是“良好的作风，良好的态度”，推出了一些Android Wear设备上的定制表盘，是与CFDA和谷歌商店合作完成', 'BCBGMAXAZRIA，命名来源于巴黎俚语“bon chic, bon genre”，意思是“良好的作风，良好的态度”，推出了一些Android Wear设备上的定制表盘，是与CFDA和谷歌商店合作完成', 'http://image.ticwear.com/appstore/f81d348908ed9971266b29cb3b9b5aec', null, 'http://res.appstore.ticwear.com/com.ustwo.watchfaces.bcbg_1.0.1_mms.apk', 'http://res.appstore.ticwear.com/com.ustwo.watchfaces.bcbg_15_wear.apk', null, null, '0', '276', '4472065', '2373207', 'com.ustwo.watchfaces.bcbg', null);
INSERT INTO `fitwear_app` VALUES ('277', 'BRAVE表盘', '5', null, '0.5', '1', 'BRAVE Eve飞行员的终极表盘！ *在你闪亮的可穿戴设备上秀出你的BRAVE *我们都知道Eve是实实在在的，将时间从UTC时区改为你居住的时区。', 'BRAVE Eve飞行员的终极表盘！ *在你闪亮的可穿戴设备上秀出你的BRAVE *我们都知道Eve是实实在在的，将时间从UTC时区改为你居住的时区。', 'http://image.ticwear.com/appstore/e6c6d4730f51b49bda0247a7191c169d', null, 'http://res.appstore.ticwear.com/de.schoar.bravewatch_0.5.apk', 'http://res.appstore.ticwear.com/de.schoar.bravewatch_5_wear.apk', null, null, '0', '277', '4268716', '2088828', 'de.schoar.bravewatch', null);
INSERT INTO `fitwear_app` VALUES ('278', 'Nails By Mei表盘', '5', null, '1.0.7', '1', '改编自日本名人钉子艺术家梅川尻创建的手绘插图的动画创作', '改编自日本名人钉子艺术家梅川尻创建的手绘插图的动画创作（也称为“CiaoManhattan2012”）。一系列的12个独特的护身符为你的普通Android Wear手表增加了意想不到的，俏皮的风格', 'http://image.ticwear.com/appstore/3ca161602bf52a0db4df84676265aa94', null, ' http://res.appstore.ticwear.com/com.nailsbymei.watchface_1.0.7.apk', 'http://res.appstore.ticwear.com/com.nailsbymei.watchface_8_wear.apk', null, null, '0', '278', '9994178', '6971835', 'com.nailsbymei.watchface', null);
INSERT INTO `fitwear_app` VALUES ('279', 'Attack on Tsundere表盘', '5', null, '1.07', '1', '是什么让这个女孩琢磨？生活吗？爱情？家庭？也许这毁灭她的家乡的怪物？没有人知道......但我们知道，她知道这是什么时候。', '是什么让这个女孩琢磨？生活吗？爱情？家庭？也许这毁灭她的家乡的怪物？没有人知道......但我们知道，她知道这是什么时候。', 'http://image.ticwear.com/appstore/9cd71f80b4a06f40f55811145b60107c', null, 'http://res.appstore.ticwear.com/com.smoothiefactory.watchface3_1.07.apk', 'http://res.appstore.ticwear.com/com.smoothiefactory.watchface3_9_wear.apk', null, null, '0', '279', '3510536', '2166147', 'com.smoothiefactory.watchface3', null);
INSERT INTO `fitwear_app` VALUES ('280', 'PAC-MAN表盘', '5', null, '1.0.1', '1', '引领复古风潮&amp;您手腕上的高科技与形象的新PAC-MAN表盘。时间流逝的同时线上的吃豆小人正在吞噬能量小块，鬼魂和水果。手表从未如此有趣过。', '引领复古风潮&amp;您手腕上的高科技与形象的新PAC-MAN表盘。时间流逝的同时线上的吃豆小人正在吞噬能量小块，鬼魂和水果。手表从未如此有趣过。', 'http://image.ticwear.com/appstore/dfa79d4f2b34d724586176b74d830337', null, 'http://res.appstore.ticwear.com/com.bandainamcogames.pacmanwatchface_1.0.1.apk', 'http://res.appstore.ticwear.com/com.bandainamcogames.pacmanwatchface_7_wear.apk', null, null, '0', '280', '3446861', '1926484', 'com.bandainamcogames.pacmanwatchface', null);
INSERT INTO `fitwear_app` VALUES ('281', '霹雳游侠表盘', '5', null, '1.0.6', '1', '霹雳游侠版表盘来啦。* 目前仅支持 Android Wear 设备! (LG G Watch &amp; Samsung Gear Live)* 目前只支持12制式', '霹雳游侠版表盘来啦。* 目前仅支持 Android Wear 设备! (LG G Watch &amp; Samsung Gear Live)* 目前只支持12制式', 'http://image.ticwear.com/appstore/8ddbfed6bec061a04144f595d83a073c', null, 'http://res.appstore.ticwear.com/com.taccotap.watchface.knightrider_1.0.6.apk', 'http://res.appstore.ticwear.com/com.taccotap.watchface.knightrider_7_wear.apk', null, null, '0', '281', '2960454', '1971137', 'com.taccotap.watchface.knightrider', null);
INSERT INTO `fitwear_app` VALUES ('282', '极简表盘', '5', null, '1.1.4', '1', '一个智能手表上简单的表盘。可以通过手机，选择表盘上各组件的颜色。', '一个智能手表上简单的表盘。可以通过手机，选择表盘上各组件的颜色。', 'http://image.ticwear.com/appstore/4f35d4d4a1cc1484eec20df5219debe5', null, 'http://res.appstore.ticwear.com/com.ericpetzel.minimalistwatchface_1.1.4.apk', 'http://res.appstore.ticwear.com/com.ericpetzel.minimalistwatchface_8_wear.apk', null, null, '0', '282', '2591738', '1768166', 'com.ericpetzel.minimalistwatchface', null);
INSERT INTO `fitwear_app` VALUES ('283', 'Rebecca Minkoff表盘', '5', null, '1.0.4', '1', 'Rebecca Minkoff 的Android Wear表盘的现代、极简的设计是完全别致的，并且符合潮流的', 'Rebecca Minkoff 的Android Wear表盘的现代、极简的设计是完全别致的，并且符合潮流的', 'http://image.ticwear.com/appstore/926064a827f7e53267f3605a9d5ae0ba', null, 'http://res.appstore.ticwear.com/com.rebeccaminkoff.watchface_1.0.4.apk', 'http://res.appstore.ticwear.com/com.rebeccaminkoff.watchface_104_wear.apk', null, null, '0', '283', '4971922', '3131926', 'com.rebeccaminkoff.watchface', null);
INSERT INTO `fitwear_app` VALUES ('284', '复古LCD表盘', '5', null, '1.8.7', null, '回到90年代的液晶电子表风格，支持Moto360, LG G, LG GWR，三星 Gear Live, 索尼 SW3, 华硕 ZenWatch ', '回到90年代的液晶电子表风格，支持Moto360, LG G, LG GWR，三星 Gear Live, 索尼 SW3, 华硕 ZenWatch ', 'http://image.ticwear.com/appstore/a7b07f97c92161bdb3f897d2941c1232', null, 'http://res.appstore.ticwear.com/com.raimund.retrolcd_1.8.7.apk', 'http://res.appstore.ticwear.com/com.raimund.retrolcd_16_wear.apk', null, null, '0', '284', '5367995', '2044303', 'com.raimund.retrolcd', null);
INSERT INTO `fitwear_app` VALUES ('285', '数字表盘', '5', null, '1.0.1', '1', '这是一款复古的显示日期、时间和7段字体的Android Wear模拟数字表盘。', '这是一款复古的显示日期、时间和7段字体的Android Wear模拟数字表盘。', 'http://image.ticwear.com/appstore/773b80c5adcbc30749061c3e0ca3ae5c', null, 'http://res.appstore.ticwear.com/com.fernandofgallego.wear.digital_1.0.1.apk', 'http://res.appstore.ticwear.com/com.fernandofgallego.wear.digital_2_wear.apk', null, null, '0', '285', '3068622', '1756659', 'com.fernandofgallego.wear.digital', null);
INSERT INTO `fitwear_app` VALUES ('286', '星际旅行表盘', '5', null, '1.0.0', null, '这是为星际迷航迷们设计的表盘。没什么特别的，就是好看。我们支持方表和圆表。LCARS界面不能用于圆形的屏幕，但可以在方表上使用圆形布局', '这是为星际迷航迷们设计的表盘。没什么特别的，就是好看。我们支持方表和圆表。LCARS界面不能用于圆形的屏幕，但可以在方表上使用圆形布局', 'http://image.ticwear.com/appstore/c092ff4e237f4face28cf4008fae981d', null, 'http://res.appstore.ticwear.com/pl.nwg.dev.wear.lcars_1.0.0.apk', 'http://res.appstore.ticwear.com/pl.nwg.dev.wear.lcars_100_wear.apk', null, null, '0', '286', '3953322', '2367326', 'pl.nwg.dev.wear.lcars', null);
INSERT INTO `fitwear_app` VALUES ('287', 'WearFaces', '5', null, '1.29', '1', '从社区http://wearfaces.com/featured/下载表盘包。创造您的个性化表盘。 您能另外得到5个特别设计的表盘。', '从社区http://wearfaces.com/featured/下载表盘包。创造您的个性化表盘。 您能另外得到5个特别设计的表盘。', 'http://image.ticwear.com/appstore/ef200fa66437ff871dfed7a3c2007872', null, 'http://res.appstore.ticwear.com/wearfaces.uhrart.com.wearfaces_1.29.apk', 'http://res.appstore.ticwear.com/wearfaces.uhrart.com.wearfaces_129_wear.apk', null, null, '0', '287', '5412229', '2665398', 'wearfaces.uhrart.com.wearfaces', null);
INSERT INTO `fitwear_app` VALUES ('288', '经典Wear表盘', '5', null, '1.1.0', '1', '一款简洁的经典表盘', '一款简洁的经典表盘', 'http://image.ticwear.com/appstore/480e84c690729add30eed981335c3283', null, 'http://res.appstore.ticwear.com/hive.myfirstwearapp_1.1.0.apk', 'http://res.appstore.ticwear.com/hive.myfirstwearapp_2_wear.apk', null, null, '0', '288', '2616650', '1808574', 'hive.myfirstwearapp', null);
INSERT INTO `fitwear_app` VALUES ('289', 'Wear表盘', '5', null, '3.0.0', '1', 'Wear Watch Faces在手表上安装一个现实表盘的应用，为了显示您所需的手表face. 必须先启用自定义表盘', 'Wear Watch Faces在手表上安装一个现实表盘的应用，为了显示您所需的手表face. 必须先启用自定义表盘', 'http://image.ticwear.com/appstore/f8337974a4c8b0ba2c52e8fbf0619316', null, 'http://res.appstore.ticwear.com/com.immortaldevs.wearwatchfaces_3.0.0.apk', 'http://res.appstore.ticwear.com/com.immortaldevs.wearwatchfaces_24_wear.apk', null, null, '0', '289', '9103013', '3895427', 'com.immortaldevs.wearwatchfaces', null);
INSERT INTO `fitwear_app` VALUES ('290', '少即是多表盘', '5', null, '1.07', '1', '简单就是终极的复杂 - 达芬奇。 这款表盘只有数字时间和日期。 但是，你有100种字体可以选择。你可以自定义颜色，而且，绝对没有广告的打扰', '简单就是终极的复杂 - 达芬奇。 这款表盘只有数字时间和日期。 但是，你有100种字体可以选择。你可以自定义颜色，而且，绝对没有广告的打扰', 'http://image.ticwear.com/appstore/e43d8c811909675e323a2e2729bed1a8', null, 'http://res.appstore.ticwear.com/com.wondersoft.android.kisswatch_1.07.apk', 'http://res.appstore.ticwear.com/com.wondersoft.android.kisswatch_7_wear.apk', null, null, '0', '290', '5502040', '2362295', 'com.wondersoft.android.kisswatch', null);
INSERT INTO `fitwear_app` VALUES ('291', 'Tweening表盘', '5', null, '0.7', '1', '为智能手表设计的表盘应用，基于著名的Timely Clock应用的变换文字设计。', '为智能手表设计的表盘应用，基于著名的Timely Clock应用的变换文字设计。', 'http://image.ticwear.com/appstore/8085eaf2209833a15706b2dba9cfa1ca', null, 'http://res.appstore.ticwear.com/com.swizel.android.wear.tweening_0.7.apk', 'http://res.appstore.ticwear.com/com.swizel.android.wear.tweening_7_wear.apk', null, null, '0', '291', '2566229', '1760674', 'com.swizel.android.wear.tweening', null);

-- ----------------------------
-- Table structure for fitwear_magent
-- ----------------------------
DROP TABLE IF EXISTS `fitwear_magent`;
CREATE TABLE `fitwear_magent` (
  `mag_id` varchar(32) NOT NULL,
  `mag_name` varchar(80) DEFAULT NULL,
  `prud_id` varchar(32) DEFAULT NULL,
  `prud_name` varchar(40) DEFAULT NULL,
  `create_name` varchar(80) DEFAULT NULL,
  `create_time` varchar(40) DEFAULT NULL,
  `mag_code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fitwear_magent
-- ----------------------------
INSERT INTO `fitwear_magent` VALUES ('2', 'MOTO360_1', 'null', '联络公版', 'null', '2016-04-19 20:27:36', 'MOTO360');
INSERT INTO `fitwear_magent` VALUES ('3', 'LG W150', 'null', 'LG', 'null', '2016-04-19 20:31:04', 'W150');
INSERT INTO `fitwear_magent` VALUES ('4', '嘉伟XX型号', 'null', '嘉伟', 'null', '2016-04-19 20:31:46', '5123JW');
INSERT INTO `fitwear_magent` VALUES ('1', 'Sony SW3', 'null', 'Sony', 'null', '2016-04-19 20:31:46', 'SW3');
INSERT INTO `fitwear_magent` VALUES ('5', 'InWatch 海外', 'null', 'InWatch', 'null', '2016-04-19 20:32:39', 'HW');

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OPERATION_CODE` varchar(50) NOT NULL COMMENT '操作编码',
  `CREATER` varchar(20) DEFAULT NULL COMMENT '操作用户名称',
  `CREATE_DATE` datetime NOT NULL COMMENT '日志生成时间',
  `TYPE` int(11) DEFAULT NULL COMMENT '日志类型: 1：安全日志 2：表示操作日志',
  `OS` varchar(20) DEFAULT NULL,
  `BROWSER` varchar(20) DEFAULT NULL COMMENT '浏览器类型',
  `IP` varchar(20) DEFAULT NULL COMMENT 'IP地址',
  `MAC` varchar(20) DEFAULT NULL COMMENT '物理地址',
  `EXECUTE_TIME` int(11) DEFAULT NULL COMMENT '执行时间',
  `DESCRIPTION` varchar(500) DEFAULT NULL COMMENT '详细描述',
  `REQUEST_PARAM` varchar(500) DEFAULT NULL COMMENT '请求参数',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2267 DEFAULT CHARSET=utf8 COMMENT='日录资料表';

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('2259', '/system/user/update', 'admin', '2014-12-04 10:25:40', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '22', null, '{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb1234\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}');
INSERT INTO `log` VALUES ('2260', '/system/user/update', 'admin', '2014-12-04 10:26:14', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '9', null, '{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb12346\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}');
INSERT INTO `log` VALUES ('2261', '/system/user/update', 'admin', '2014-12-04 10:37:01', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '7', null, '{\"id\":[\"4\"],\"birthday\":[\"2014-4-2\"],\"phone\":[\"400\"],\"email\":[\"11@11.bee\"],\"name\":[\"bbb123466\"],\"gender\":[\"0\"],\"loginName\":[\"bbb222\"]}');
INSERT INTO `log` VALUES ('2262', '/system/role/update', 'admin', '2014-12-04 10:48:43', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '215', null, '{\"id\":[\"12\"],\"roleCode\":[\"guest212\"],\"sort\":[\"4\"],\"description\":[\"s\"],\"name\":[\"guest22\"]}');
INSERT INTO `log` VALUES ('2263', '/system/user/create', 'admin', '2014-12-05 11:55:03', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '305', null, '{\"id\":[\"\"],\"birthday\":[\"2014-12-05\"],\"confirmPassword\":[\"123456\"],\"phone\":[\"\"],\"email\":[\"\"],\"name\":[\"tyty\"],\"plainPassword\":[\"123456\"],\"gender\":[\"1\"],\"loginName\":[\"test\"]}');
INSERT INTO `log` VALUES ('2264', '/system/permission/create', 'admin', '2014-12-13 11:19:15', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '215', null, '{\"id\":[\"\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"定时任务管理，支持集群\"],\"name\":[\"定时任务管理\"],\"permCode\":[\"\"],\"pid\":[\"\"],\"type\":[\"F\"],\"url\":[\"system/scheuleJob\"]}');
INSERT INTO `log` VALUES ('2265', '/system/permission/update', 'admin', '2014-12-13 11:19:40', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '66', null, '{\"id\":[\"37\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"定时任务管理，支持集群\"],\"name\":[\"定时任务管理\"],\"permCode\":[\"\"],\"pid\":[\"15\"],\"type\":[\"F\"],\"url\":[\"system/scheuleJob\"]}');
INSERT INTO `log` VALUES ('2266', '/system/permission/update', 'admin', '2014-12-13 11:22:17', null, 'Windows 7', 'Firefox 3', '127.0.0.1', null, '186', null, '{\"id\":[\"37\"],\"icon\":[\"icon-hamburg-full-time\"],\"sort\":[\"\"],\"description\":[\"定时任务管理，支持集群\"],\"name\":[\"定时任务管理\"],\"permCode\":[\"\"],\"pid\":[\"15\"],\"type\":[\"F\"],\"url\":[\"system/scheduleJob\"]}');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PID` int(11) DEFAULT NULL COMMENT '父节点名称',
  `NAME` varchar(50) NOT NULL COMMENT '名称',
  `TYPE` varchar(20) DEFAULT NULL COMMENT '类型:菜单or功能',
  `SORT` int(11) DEFAULT NULL COMMENT '排序',
  `URL` varchar(255) DEFAULT NULL,
  `PERM_CODE` varchar(50) DEFAULT NULL COMMENT '菜单编码',
  `ICON` varchar(255) DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', null, '系统管理', 'F', '1', '', '', 'icon-standard-cog', '', '');
INSERT INTO `permission` VALUES ('2', '1', '角色管理', 'F', '3', 'system/role', '', 'icon-hamburg-my-account', 'closed', '');
INSERT INTO `permission` VALUES ('3', '1', '用户管理', 'F', '2', 'system/user', '', 'icon-hamburg-user', 'closed', '');
INSERT INTO `permission` VALUES ('4', '2', '添加', 'O', null, '', 'sys:role:add', '', '', '角色添加');
INSERT INTO `permission` VALUES ('5', '2', '删除', 'O', null, '', 'sys:role:delete', '', '', '角色删除');
INSERT INTO `permission` VALUES ('6', '2', '修改', 'O', null, '', 'sys:role:update', '', '', '角色修改');
INSERT INTO `permission` VALUES ('7', '3', '添加', 'O', null, '', 'sys:user:add', '', '', '用户添加');
INSERT INTO `permission` VALUES ('8', '3', '删除', 'O', null, '', 'sys:user:delete', '', '', '用户删除');
INSERT INTO `permission` VALUES ('12', '1', '权限管理', 'F', '5', 'system/permission', '', 'icon-hamburg-login', 'closed', '');
INSERT INTO `permission` VALUES ('14', '15', '数据源监控', 'F', '6', 'druid', '', 'icon-hamburg-database', '', '');
INSERT INTO `permission` VALUES ('15', null, '系统监控', 'F', '5', '', '', 'icon-hamburg-graphic', '', '');
INSERT INTO `permission` VALUES ('16', '3', '修改', 'O', null, '', 'sys:user:update', '', '', '用户修改');
INSERT INTO `permission` VALUES ('20', '15', '日志管理', 'F', '7', 'system/log', '', 'icon-hamburg-archives', '', '');
INSERT INTO `permission` VALUES ('25', '12', '添加', 'O', null, '', 'sys:perm:add', '', '', '菜单添加');
INSERT INTO `permission` VALUES ('26', '12', '修改', 'O', null, '', 'sys:perm:update', '', '', '菜单修改');
INSERT INTO `permission` VALUES ('27', '12', '删除', 'O', null, '', 'sys:perm:delete', '', '', '菜单删除');
INSERT INTO `permission` VALUES ('28', '2', '查看', 'O', null, '', 'sys:role:view', '', '', '角色查看');
INSERT INTO `permission` VALUES ('29', '3', '查看', 'O', null, '', 'sys:user:view', '', null, '用户查看');
INSERT INTO `permission` VALUES ('30', '12', '查看', 'O', null, '', 'sys:perm:view', '', null, '权限查看');
INSERT INTO `permission` VALUES ('31', '20', '删除', 'O', null, '', 'sys:log:delete', '', null, '删除日志');
INSERT INTO `permission` VALUES ('32', '20', '导出excel', 'O', null, '', 'sys:log:exportExcel', '', null, '导出日志excel');
INSERT INTO `permission` VALUES ('33', '3', '查看用户角色', 'O', null, '', 'sys:user:roleView', '', null, '查看用户角色');
INSERT INTO `permission` VALUES ('34', '2', '保存授权', 'O', null, '', 'sys:role:permUpd', '', null, '保存修改的角色权限');
INSERT INTO `permission` VALUES ('35', '3', '修改用户角色', 'O', null, '', 'sys:user:roleUpd', '', null, '修改用户拥有的角色');
INSERT INTO `permission` VALUES ('36', '2', '查看角色权限', 'O', null, '', 'sys:role:permView', '', null, '查看角色拥有的权限');
INSERT INTO `permission` VALUES ('37', '15', '定时任务管理', 'F', null, 'system/scheduleJob', '', 'icon-hamburg-full-time', null, '定时任务管理，支持集群');
INSERT INTO `permission` VALUES ('38', '15', 'cron表达式生成', 'F', null, 'system/scheduleJob/quartzCron', '', 'icon-hamburg-future', null, '');
INSERT INTO `permission` VALUES ('39', '1', '菜单管理', 'F', '4', 'system/permission/menu', '', 'icon-hamburg-old-versions', null, '');
INSERT INTO `permission` VALUES ('40', '1', '字典管理', 'F', '6', 'system/dict', null, 'icon-hamburg-address', null, '数据字典管理');
INSERT INTO `permission` VALUES ('45', '39', '修改', 'O', null, '', 'sys:perm:update', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('58', '39', '添加', 'O', null, '', 'sys:perm:add', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('59', '39', '删除', 'O', null, '', 'sys:perm:delte', null, null, '菜单管理');
INSERT INTO `permission` VALUES ('61', '40', '添加', 'O', null, '', 'sys:dict:add', null, null, '字典管理');
INSERT INTO `permission` VALUES ('62', '40', '删除', 'O', null, '', 'sys:dict:delete', null, null, '字典管理');
INSERT INTO `permission` VALUES ('63', '40', '修改', 'O', null, '', 'sys:dict:update', null, null, '字典管理');
INSERT INTO `permission` VALUES ('68', '20', '查看', 'O', null, '', 'sys:log:view', null, null, '查看日志');
INSERT INTO `permission` VALUES ('69', '40', '查看', 'O', null, '', 'sys:dict:view', null, null, '字典管理');
INSERT INTO `permission` VALUES ('70', '39', '查看', 'O', null, '', 'sys:perm:menu:view', null, null, '菜单管理');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `BLOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `CALENDAR_NAME` varchar(200) NOT NULL,
  `CALENDAR` blob NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`CALENDAR_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `CRON_EXPRESSION` varchar(200) NOT NULL,
  `TIME_ZONE_ID` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('scheduler', 'test1', 'testgroup', '0/5 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `ENTRY_ID` varchar(95) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `FIRED_TIME` bigint(13) NOT NULL,
  `SCHED_TIME` bigint(13) NOT NULL,
  `PRIORITY` int(11) NOT NULL,
  `STATE` varchar(16) NOT NULL,
  `JOB_NAME` varchar(200) DEFAULT NULL,
  `JOB_GROUP` varchar(200) DEFAULT NULL,
  `IS_NONCONCURRENT` varchar(1) DEFAULT NULL,
  `REQUESTS_RECOVERY` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`ENTRY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `JOB_CLASS_NAME` varchar(250) NOT NULL,
  `IS_DURABLE` varchar(1) NOT NULL,
  `IS_NONCONCURRENT` varchar(1) NOT NULL,
  `IS_UPDATE_DATA` varchar(1) NOT NULL,
  `REQUESTS_RECOVERY` varchar(1) NOT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('scheduler', 'test1', 'testgroup', null, 'com.tianyu.jty.system.service.TaskA', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000B7363686564756C654A6F6273720028636F6D2E7469616E79752E6A74792E73797374656D2E656E746974792E5363686564756C654A6F6200000000000000010200064C0009636C6173734E616D657400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000B6465736372697074696F6E71007E00094C000567726F757071007E00094C00046E616D6571007E00094C000673746174757371007E00097870740023636F6D2E7469616E79752E6A74792E73797374656D2E736572766963652E5461736B4174000D302F35202A202A202A202A203F707400097465737467726F75707400057465737431740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `LOCK_NAME` varchar(40) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`LOCK_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('scheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `INSTANCE_NAME` varchar(200) NOT NULL,
  `LAST_CHECKIN_TIME` bigint(13) NOT NULL,
  `CHECKIN_INTERVAL` bigint(13) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`INSTANCE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('scheduler', 'tianyu-pc1421376050869', '1421382311627', '15000');

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `REPEAT_COUNT` bigint(7) NOT NULL,
  `REPEAT_INTERVAL` bigint(12) NOT NULL,
  `TIMES_TRIGGERED` bigint(10) NOT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `STR_PROP_1` varchar(512) DEFAULT NULL,
  `STR_PROP_2` varchar(512) DEFAULT NULL,
  `STR_PROP_3` varchar(512) DEFAULT NULL,
  `INT_PROP_1` int(11) DEFAULT NULL,
  `INT_PROP_2` int(11) DEFAULT NULL,
  `LONG_PROP_1` bigint(20) DEFAULT NULL,
  `LONG_PROP_2` bigint(20) DEFAULT NULL,
  `DEC_PROP_1` decimal(13,4) DEFAULT NULL,
  `DEC_PROP_2` decimal(13,4) DEFAULT NULL,
  `BOOL_PROP_1` varchar(1) DEFAULT NULL,
  `BOOL_PROP_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`) REFERENCES `qrtz_triggers` (`SCHED_NAME`, `TRIGGER_NAME`, `TRIGGER_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `SCHED_NAME` varchar(120) NOT NULL,
  `TRIGGER_NAME` varchar(200) NOT NULL,
  `TRIGGER_GROUP` varchar(200) NOT NULL,
  `JOB_NAME` varchar(200) NOT NULL,
  `JOB_GROUP` varchar(200) NOT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  `NEXT_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PREV_FIRE_TIME` bigint(13) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `TRIGGER_STATE` varchar(16) NOT NULL,
  `TRIGGER_TYPE` varchar(8) NOT NULL,
  `START_TIME` bigint(13) NOT NULL,
  `END_TIME` bigint(13) DEFAULT NULL,
  `CALENDAR_NAME` varchar(200) DEFAULT NULL,
  `MISFIRE_INSTR` smallint(2) DEFAULT NULL,
  `JOB_DATA` blob,
  PRIMARY KEY (`SCHED_NAME`,`TRIGGER_NAME`,`TRIGGER_GROUP`),
  KEY `SCHED_NAME` (`SCHED_NAME`,`JOB_NAME`,`JOB_GROUP`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`) REFERENCES `qrtz_job_details` (`SCHED_NAME`, `JOB_NAME`, `JOB_GROUP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('scheduler', 'test1', 'testgroup', 'test1', 'testgroup', null, '1421206460000', '1421206455000', '5', 'PAUSED', 'CRON', '1421206412000', '0', null, '0', '');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(20) NOT NULL,
  `ROLE_CODE` varchar(20) NOT NULL,
  `DESCRIPTION` text,
  `SORT` smallint(6) DEFAULT NULL,
  `DEL_FLAG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'admin', 'admin', 'admin', '2', null);
INSERT INTO `role` VALUES ('5', 'guest', 'guest', 'guest', '3', null);
INSERT INTO `role` VALUES ('13', 'superadmin', 'superadmin', '超级管理员', '1', null);

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROLE_ID` int(11) DEFAULT NULL,
  `PERMISSION_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ROLE_PER_REFERENCE_PERMISSI` (`PERMISSION_ID`) USING BTREE,
  KEY `FK_ROLE_PER_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  CONSTRAINT `role_permission_ibfk_1` FOREIGN KEY (`PERMISSION_ID`) REFERENCES `permission` (`ID`),
  CONSTRAINT `role_permission_ibfk_2` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=241 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1', '2');
INSERT INTO `role_permission` VALUES ('2', '1', '1');
INSERT INTO `role_permission` VALUES ('28', '5', '1');
INSERT INTO `role_permission` VALUES ('61', '13', '1');
INSERT INTO `role_permission` VALUES ('62', '13', '3');
INSERT INTO `role_permission` VALUES ('63', '13', '16');
INSERT INTO `role_permission` VALUES ('64', '13', '7');
INSERT INTO `role_permission` VALUES ('65', '13', '2');
INSERT INTO `role_permission` VALUES ('66', '13', '4');
INSERT INTO `role_permission` VALUES ('67', '13', '5');
INSERT INTO `role_permission` VALUES ('68', '13', '6');
INSERT INTO `role_permission` VALUES ('69', '13', '12');
INSERT INTO `role_permission` VALUES ('70', '13', '25');
INSERT INTO `role_permission` VALUES ('71', '13', '26');
INSERT INTO `role_permission` VALUES ('72', '13', '27');
INSERT INTO `role_permission` VALUES ('74', '13', '15');
INSERT INTO `role_permission` VALUES ('75', '13', '14');
INSERT INTO `role_permission` VALUES ('76', '13', '20');
INSERT INTO `role_permission` VALUES ('77', '13', '8');
INSERT INTO `role_permission` VALUES ('81', '1', '3');
INSERT INTO `role_permission` VALUES ('88', '1', '12');
INSERT INTO `role_permission` VALUES ('93', '1', '15');
INSERT INTO `role_permission` VALUES ('94', '1', '14');
INSERT INTO `role_permission` VALUES ('95', '1', '20');
INSERT INTO `role_permission` VALUES ('118', '1', '28');
INSERT INTO `role_permission` VALUES ('120', '1', '30');
INSERT INTO `role_permission` VALUES ('121', '1', '31');
INSERT INTO `role_permission` VALUES ('125', '1', '33');
INSERT INTO `role_permission` VALUES ('126', '1', '36');
INSERT INTO `role_permission` VALUES ('127', '1', '35');
INSERT INTO `role_permission` VALUES ('129', '1', '34');
INSERT INTO `role_permission` VALUES ('130', '1', '32');
INSERT INTO `role_permission` VALUES ('133', '5', '15');
INSERT INTO `role_permission` VALUES ('135', '1', '37');
INSERT INTO `role_permission` VALUES ('142', '1', '38');
INSERT INTO `role_permission` VALUES ('145', '1', '40');
INSERT INTO `role_permission` VALUES ('147', '1', '29');
INSERT INTO `role_permission` VALUES ('151', '1', '61');
INSERT INTO `role_permission` VALUES ('152', '1', '62');
INSERT INTO `role_permission` VALUES ('153', '1', '63');
INSERT INTO `role_permission` VALUES ('162', '5', '39');
INSERT INTO `role_permission` VALUES ('164', '5', '58');
INSERT INTO `role_permission` VALUES ('176', '5', '40');
INSERT INTO `role_permission` VALUES ('177', '1', '39');
INSERT INTO `role_permission` VALUES ('178', '1', '58');
INSERT INTO `role_permission` VALUES ('179', '1', '59');
INSERT INTO `role_permission` VALUES ('183', '1', '4');
INSERT INTO `role_permission` VALUES ('184', '1', '6');
INSERT INTO `role_permission` VALUES ('185', '1', '26');
INSERT INTO `role_permission` VALUES ('186', '1', '27');
INSERT INTO `role_permission` VALUES ('187', '1', '5');
INSERT INTO `role_permission` VALUES ('189', '1', '25');
INSERT INTO `role_permission` VALUES ('190', '1', '45');
INSERT INTO `role_permission` VALUES ('191', '1', '7');
INSERT INTO `role_permission` VALUES ('192', '1', '8');
INSERT INTO `role_permission` VALUES ('193', '1', '16');
INSERT INTO `role_permission` VALUES ('194', '13', '28');
INSERT INTO `role_permission` VALUES ('195', '13', '34');
INSERT INTO `role_permission` VALUES ('196', '13', '36');
INSERT INTO `role_permission` VALUES ('197', '13', '29');
INSERT INTO `role_permission` VALUES ('198', '13', '33');
INSERT INTO `role_permission` VALUES ('199', '13', '35');
INSERT INTO `role_permission` VALUES ('200', '13', '30');
INSERT INTO `role_permission` VALUES ('201', '13', '39');
INSERT INTO `role_permission` VALUES ('202', '13', '45');
INSERT INTO `role_permission` VALUES ('203', '13', '58');
INSERT INTO `role_permission` VALUES ('204', '13', '59');
INSERT INTO `role_permission` VALUES ('205', '13', '40');
INSERT INTO `role_permission` VALUES ('206', '13', '61');
INSERT INTO `role_permission` VALUES ('207', '13', '62');
INSERT INTO `role_permission` VALUES ('208', '13', '63');
INSERT INTO `role_permission` VALUES ('209', '13', '31');
INSERT INTO `role_permission` VALUES ('210', '13', '32');
INSERT INTO `role_permission` VALUES ('211', '13', '37');
INSERT INTO `role_permission` VALUES ('212', '13', '38');
INSERT INTO `role_permission` VALUES ('213', '1', '69');
INSERT INTO `role_permission` VALUES ('215', '5', '69');
INSERT INTO `role_permission` VALUES ('216', '5', '20');
INSERT INTO `role_permission` VALUES ('219', '5', '68');
INSERT INTO `role_permission` VALUES ('220', '5', '38');
INSERT INTO `role_permission` VALUES ('221', '1', '70');
INSERT INTO `role_permission` VALUES ('222', '5', '70');
INSERT INTO `role_permission` VALUES ('223', '5', '3');
INSERT INTO `role_permission` VALUES ('227', '5', '29');
INSERT INTO `role_permission` VALUES ('228', '5', '33');
INSERT INTO `role_permission` VALUES ('229', '5', '35');
INSERT INTO `role_permission` VALUES ('231', '5', '2');
INSERT INTO `role_permission` VALUES ('234', '5', '28');
INSERT INTO `role_permission` VALUES ('235', '5', '45');
INSERT INTO `role_permission` VALUES ('236', '5', '59');
INSERT INTO `role_permission` VALUES ('239', '5', '36');
INSERT INTO `role_permission` VALUES ('240', '1', '68');

-- ----------------------------
-- Table structure for sc_category
-- ----------------------------
DROP TABLE IF EXISTS `sc_category`;
CREATE TABLE `sc_category` (
  `id` bigint(20) DEFAULT NULL,
  `catename` varchar(255) DEFAULT NULL,
  `cateflag` varchar(255) DEFAULT NULL,
  `parantid` varchar(255) DEFAULT NULL,
  `isdel` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sc_category
-- ----------------------------
INSERT INTO `sc_category` VALUES ('4', '社交', null, '0', '0');
INSERT INTO `sc_category` VALUES ('5', '表盘', null, '0', '0');
INSERT INTO `sc_category` VALUES ('7', '工具', null, '0', '0');
INSERT INTO `sc_category` VALUES ('9', '游戏', null, '0', '0');
INSERT INTO `sc_category` VALUES ('13', '健康', null, '0', '0');
INSERT INTO `sc_category` VALUES ('14', '推荐', null, '0', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGIN_NAME` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `PASSWORD` varchar(255) NOT NULL,
  `SALT` varchar(255) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `GENDER` smallint(6) DEFAULT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `ICON` varchar(500) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `STATE` char(1) DEFAULT NULL,
  `DESCRIPTION` text,
  `LOGIN_COUNT` int(11) DEFAULT NULL,
  `PREVIOUS_VISIT` datetime DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `DEL_FLAG` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin', '159ae5f48f14e89f3f9f54dc995f1f276d472b54', '3d06a5c14d010804', '2014-03-16 22:44:39', '1', '779205344@qq.com', '123456789', 'aaa', '2014-03-20 14:38:57', '0', null, '129', '2015-01-16 10:22:19', '2015-01-16 10:24:21', null);
INSERT INTO `user` VALUES ('3', 'tianyu', 'tiany', '1e8df4b59b3a3ab452ed1707ad3cb1a8e63a0630', 'bb2aa40007ad1238', '2014-04-02 00:00:00', '0', '', '300', '', '2014-04-02 11:49:13', '0', null, null, null, null, null);
INSERT INTO `user` VALUES ('5', 'test', 'tyty11', 'dc6d230074477c8d736bfe0205260e9320565aa6', '94886d7223c80850', '2014-12-05 00:00:00', '1', '', '', null, '2014-12-05 11:55:03', '1', 'ss', '1', null, '2014-12-14 00:09:27', null);
INSERT INTO `user` VALUES ('6', 'superadmin', '超级管理员', 'df894ac0dd60772f22b5d67fe5d8b04fb4c9188d', '97efb48ee6adff63', '2015-01-15 00:00:00', '1', '779205344@qq.com', '13721035120', null, '2015-01-15 15:55:37', null, '超级管理员', null, null, null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `ROLE_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_USER_ROL_REFERENCE_ROLE` (`ROLE_ID`) USING BTREE,
  KEY `FK_USER_ROL_REFERENCE_USERS` (`USER_ID`) USING BTREE,
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`ROLE_ID`) REFERENCES `role` (`ID`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('19', '3', '5');
INSERT INTO `user_role` VALUES ('32', '5', '5');
INSERT INTO `user_role` VALUES ('35', '6', '13');
INSERT INTO `user_role` VALUES ('36', '6', '1');
