SET NAMES UTF8;
DROP DATABASE IF EXISTS yuki;
CREATE DATABASE yuki CHARSET=UTF8;
USE yuki;
CREATE TABLE yuki_user(
	uid INT PRIMARY KEY AUTO_INCREMENT,
	uname VARCHAR(32) NOT NULL DEFAULT '',
	upwd VARCHAR(32) NOT NULL DEFAULT '',
	email VARCHAR(128) NOT NULL DEFAULT '',
	phone VARCHAR(16) NOT NULL DEFAULT '',
	address VARCHAR(256) NOT NULL DEFAULT ''
);
CREATE TABLE yuki_product_family(
	fid INT PRIMARY KEY AUTO_INCREMENT, #大区块
	fname VARCHAR(16) NOT NULL DEFAULT '',	#大区块名
	f_ico VARCHAR(128) NOT NULL DEFAULT '',	#大区块ico
	f_pic VARCHAR(128) NOT NULL DEFAULT ''   #大区块板块图
);

CREATE TABLE yuki_product_list(
	plid INT PRIMARY KEY AUTO_INCREMENT, #小区块
	fid INT, #大区块
	plname VARCHAR(16) NOT NULL DEFAULT '',		#小区块名
	pl_ico VARCHAR(128) NOT NULL DEFAULT '',	#小区块ico
	FOREIGN KEY(fid) REFERENCES yuki_product_family(fid)
);
CREATE TABLE yuki_good_family(
	gfid INT PRIMARY KEY AUTO_INCREMENT,
	plid INT,
	fid INT,
	FOREIGN KEY(plid) REFERENCES yuki_product_list(plid),
	FOREIGN KEY(fid) REFERENCES yuki_product_family(fid)
);
#产品
CREATE TABLE yuki_good_list(
	gid INT PRIMARY KEY AUTO_INCREMENT, #产品自身编号
	gfid INT,
	title VARCHAR(128) NOT NULL DEFAULT '',
	intro VARCHAR(256) NOT NULL DEFAULT '',
	g_spec1 VARCHAR(128) NOT NULL DEFAULT '',		#产品款式/型号/尺码
	g_spec2 VARCHAR(128) NOT NULL DEFAULT'',	#产品款式/型号/尺码
	f_price DECIMAL(9,2),	#原价
	d_price DECIMAL(9,2),	#打折价
	promise VARCHAR(512) NOT NULL DEFAULT '',	#承诺服务
	salse VARCHAR(128) NOT NULL DEFAULT '',	#促销描述
	isSalse INT,	#是否促销
	stock INT,	#库存
	sold INT,	#已售商品数量
	shelves INT, 	#是否上架
	g_pic VARCHAR(128),
	detail VARCHAR(1024) NOT NULL DEFAULT '',	#详情图片 
	FOREIGN KEY(gfid) REFERENCES yuki_good_family(gfid)
);
#产品图片
CREATE TABLE yuki_good_pic(
	pid INT PRIMARY KEY AUTO_INCREMENT,	#图片编号
	gfid INT,	#图片属于的产品编号
	src VARCHAR(256) NOT NULL DEFAULT '',	#路径
	FOREIGN KEY(gfid) REFERENCES yuki_good_list(gfid)
);
#购物车
CREATE TABLE yuki_cart(
	cid INT PRIMARY KEY AUTO_INCREMENT,	#订单号
	uid INT,	#订单对应用户
	gid INT,	#订单产品
	quantity INT,	#产品数量
	spec1 VARCHAR(32) NOT NULL DEFAULT '',
	spec2 VARCHAR(32) NOT NULL DEFAULT '',
	address VARCHAR(256) NOT NULL DEFAULT '',
	isChecked INT DEFAULT 0, 	#是否已结算
	FOREIGN KEY(uid) REFERENCES yuki_user(uid),
	FOREIGN KEY(gid) REFERENCES yuki_good_list(gid)
);
#轮播推荐
CREATE TABLE yuki_carousel(
	crid INT PRIMARY KEY AUTO_INCREMENT,
	src VARCHAR(128) NOT NULL DEFAULT '',
	href  VARCHAR(128) NOT NULL DEFAULT ''
);
#插入yuki_user数据
INSERT INTO yuki_user(uid,uname,upwd,email,phone,address) VALUES(NULL,'xiaodong','123456','xd@123.com',13111111111,'广州市越秀区');
INSERT INTO yuki_user(uid,uname,upwd,email,phone,address) VALUES(NULL,'xiaonan','123456','xd@123.com',13111111111,'广州市越秀区');
INSERT INTO yuki_user(uid,uname,upwd,email,phone,address) VALUES(NULL,'xiaoxi','123456','xd@123.com',13111111111,'广州市越秀区');
INSERT INTO yuki_user(uid,uname,upwd,email,phone,address) VALUES(NULL,'xiaobei','123456','xd@123.com',13111111111,'广州市越秀区');
#插入yuki_product_family数据
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'YUKI原创','img/index/yukiicon_20170913175147344903.png','');
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'3C数码','img/index/yukiicon_20170612172626803265.png','img/index/product/product_block/3c.jpg');
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'品质生活','img/index/yukiicon_20170612172611544857.png','img/index/product/product_block/life.jpg');
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'文具耗材','img/index/yukiicon_20170612173024022014.png','img/index/product/product_block/stationery.jpg');
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'服鞋箱包','img/index/yukiicon_20170612172554218421.png','img/index/product/product_block/clothing.jpg');
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'家用电器','img/index/yukiicon_20170612172605250450.png','img/index/product/product_block/accessories.jpg');
INSERT INTO yuki_product_family(fid,fname,f_ico,f_pic) VALUES(NULL,'影视周边','img/index/yukiicon_20170612172632149881.png','img/index/product/product_block/model.jpg');

#插入 yuki_product_list数据
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,1,'数码','img/index/aside/yukiicon_20171017163728899339.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,1,'服装','img/index/aside/yukiicon_20170915124812149262.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,1,'日用百货','img/index/aside/yukiicon_20170915125131027647.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,1,'文具用品','img/index/aside/yukiicon_20170915125146321223.png');

INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'手机','img/index/aside/yukiicon_20170613164645080960.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'手机壳','img/index/aside/yukiicon_20171017124957985466.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'手机配件','img/index/aside/yukiicon_20170613164619985427.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'移动电源','img/index/aside/yukiicon_20170621171243896112.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'U盘','img/index/aside/yukiicon_20170621171259534971.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'键盘鼠标','img/index/aside/yukiicon_20171017125723367770.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'音响耳机','img/index/aside/yukiicon_20171017125503071321.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'路由器','img/index/aside/yukiicon_20170913122548856117.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'手表','img/index/aside/yukiicon_20171016145835283784.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,2,'智能产品','img/index/aside/yukiicon_20170627101822577930.png');

INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'面部护肤','img/index/aside/yukiicon_20180111140417061756.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'洗发护发','img/index/aside/yukiicon_20180111141116320196.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'身体护肤','img/index/aside/yukiicon_20180111141148113517.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'香水彩妆','img/index/aside/yukiicon_20180111141208059810.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'口腔护理','img/index/aside/yukiicon_20180111141228429190.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'个护纸品','img/index/aside/yukiicon_20180111141558823798.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'洗浴用品','img/index/aside/yukiicon_20170621172849481539.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'海报挂画','img/index/aside/yukiicon_20170621152457912734.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'床上用品','img/index/aside/yukiicon_20170621152546918146.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'厨房用品','img/index/aside/yukiicon_20170621152249594861.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'毛绒玩具','img/index/aside/yukiicon_20170613164452633940.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'清洁用品','img/index/aside/yukiicon_20171016163628090822.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'雨伞雨具','img/index/aside/yukiicon_20170621172808639566.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'摆件挂饰','img/index/aside/yukiicon_20170621152239084808.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,3,'生活其他','img/index/aside/yukiicon_20171016151128663914.png');

INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'笔','img/index/aside/yukiicon_20170621144141432932.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'本子','img/index/aside/yukiicon_20170613164504054890.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'书签','img/index/aside/yukiicon_20170621153043201111.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'贴纸','img/index/aside/yukiicon_20170621152816211264.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'胶带','img/index/aside/yukiicon_20170621152901770262.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'便利贴','img/index/aside/yukiicon_20170621153032551497.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'笔袋笔筒','img/index/aside/yukiicon_20170621152808528972.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'文件夹/文件袋','img/index/aside/yukiicon_20170613164539781202.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,4,'文具其他','img/index/aside/yukiicon_20171017100153758145.png');

INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'上衣','img/index/aside/yukiicon_20170621171842015435.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'裤子','img/index/aside/yukiicon_20171017094902811464.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'裙子','img/index/aside/yukiicon_20170621174220671123.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'套装','img/index/aside/yukiicon_20170621150645221069.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'鞋子','img/index/aside/yukiicon_20171017101902455779.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'箱包','img/index/aside/yukiicon_20171017101601839846.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'服装配饰','img/index/aside/yukiicon_20171016174805163649.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,5,'其他','img/index/aside/yukiicon_20171017101009586930.png');

INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'灯','img/index/aside/yukiicon_20171017130614188536.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'剃须刀','img/index/aside/yukiicon_20171016173700693226.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'吹风机','img/index/aside/yukiicon_20171016174415901183.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'电饭煲','img/index/aside/yukiicon_20171017093443735743.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'加湿器','img/index/aside/yukiicon_20171017112704772161.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'榨汁机','img/index/aside/yukiicon_20171017112017426511.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'咖啡机','img/index/aside/yukiicon_20171017112251972726.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'电热水瓶','img/index/aside/yukiicon_20171017094329416688.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'卷/直发器','img/index/aside/yukiicon_20171017091503834185.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'空气净化器','img/index/aside/yukiicon_20171017112515587279.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,6,'家电其他','img/index/aside/yukiicon_20171017123836507175.png');

INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'办公文具','img/index/aside/yukiicon_20171018092128790039.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'上衣/下装','img/index/aside/yukiicon_20171017143021068612.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'裙子/外套','img/index/aside/yukiicon_20171017145009771433.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'COSPLAY','img/index/aside/yukiicon_20171017153210419664.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'居家宅品','img/index/aside/yukiicon_20171017153713529640.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'配件包包','img/index/aside/yukiicon_20171018092509518000.png');
INSERT INTO yuki_product_list(plid,fid,plname,pl_ico) VALUES(NULL,7,'数码周边','img/index/aside/yukiicon_20171017154806992206.png');

#插入产品family数据
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,1,1);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,2,1);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,3,1);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,4,1);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,5,2);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,6,2);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,7,2);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,8,2);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,9,2);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,10,2);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,15,3);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,16,3);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,17,3);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,18,3);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,19,3);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,20,3);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,30,4);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,31,4);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,32,4);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,33,4);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,34,4);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,35,4);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,39,5);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,40,5);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,41,5);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,42,5);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,43,5);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,44,5);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,47,6);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,48,6);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,49,6);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,50,6);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,51,6);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,52,6);

INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,58,7);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,59,7);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,60,7);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,61,7);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,62,7);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,63,7);
INSERT INTO yuki_good_family(gfid,plid,fid) VALUES(NULL,63,7);
#插入产品数据
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,1,'Yuki动漫原创软萌超现实主义安卓手机壳','','李清照渔家傲','oppo r9(10)|oppo r9s(0)|vivo x7(25)|华为 mate9(10)|华为 p9(20)|小米 note2(1)|红米note4(1)',
28.00,26.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,67,233,1,'img/detail/gooddetailimg_20170612141435396515.jpeg','img/detail/upload_20170206122303600026.jpeg|img/detail/upload_20170206122319333581.jpeg|img/detail/upload_20170206122342157980.jpeg|img/detail/upload_20170206122406308641.jpeg|img/detail/upload_20170206122417777703.jpeg|img/detail/upload_20170206122429508726.jpeg|img/detail/upload_20170206122634091919.jpeg|img/detail/upload_20170206122649968694.jpeg|img/detail/upload_20170206122749008236.jpeg|img/detail/upload_20170206122804901385.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,1,'Yuki动漫原创软萌超现实主义安卓手机壳','','每天都要元气满满','oppo r9(10)|oppo r9s(0)|vivo x7(25)|华为 mate9(18)|华为 p9(10)|小米 note2(10)|红米note4(3)',
28.00,26.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,76,233,1,'img/detail/gooddetailimg_20170612141435396515.jpeg','img/detail/upload_20170206122303600026.jpeg|img/detail/upload_20170206122319333581.jpeg|img/detail/upload_20170206122342157980.jpeg|img/detail/upload_20170206122406308641.jpeg|img/detail/upload_20170206122417777703.jpeg|img/detail/upload_20170206122429508726.jpeg|img/detail/upload_20170206122634091919.jpeg|img/detail/upload_20170206122649968694.jpeg|img/detail/upload_20170206122749008236.jpeg|img/detail/upload_20170206122804901385.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,1,'Yuki动漫原创软萌超现实主义安卓手机壳','','时尚招财进宝','oppo r9(0)|oppo r9s(0)|vivo x7(5)|华为 mate9(8)|华为 p9(3)|小米 note2(0)|红米note4(0)',
28.00,26.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,16,233,1,'img/detail/gooddetailimg_20170612141435396515.jpeg','img/detail/upload_20170206122303600026.jpeg|img/detail/upload_20170206122319333581.jpeg|img/detail/upload_20170206122342157980.jpeg|img/detail/upload_20170206122406308641.jpeg|img/detail/upload_20170206122417777703.jpeg|img/detail/upload_20170206122429508726.jpeg|img/detail/upload_20170206122634091919.jpeg|img/detail/upload_20170206122649968694.jpeg|img/detail/upload_20170206122749008236.jpeg|img/detail/upload_20170206122804901385.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,1,'Yuki动漫原创软萌超现实主义安卓手机壳','','萌萌哒YUKI','oppo r9(10)|oppo r9s(0)|vivo x7(15)|华为 mate9(38)|华为 p9(30)|小米 note2(1)|红米note4(2)',
28.00,26.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,96,233,1,'img/detail/gooddetailimg_20170612141435396515.jpeg','img/detail/upload_20170206122303600026.jpeg|img/detail/upload_20170206122319333581.jpeg|img/detail/upload_20170206122342157980.jpeg|img/detail/upload_20170206122406308641.jpeg|img/detail/upload_20170206122417777703.jpeg|img/detail/upload_20170206122429508726.jpeg|img/detail/upload_20170206122634091919.jpeg|img/detail/upload_20170206122649968694.jpeg|img/detail/upload_20170206122749008236.jpeg|img/detail/upload_20170206122804901385.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,1,'Yuki动漫原创软萌超现实主义安卓手机壳','','超现实视觉艺术爆炸','oppo r9(0)|oppo r9s(0)|vivo x7(5)|华为 mate9(1)|华为 p9(0)|小米 note2(0)|红米note4(0)',
28.00,26.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,6,233,1,'img/detail/gooddetailimg_20170612141435396515.jpeg','img/detail/upload_20170206122303600026.jpeg|img/detail/upload_20170206122319333581.jpeg|img/detail/upload_20170206122342157980.jpeg|img/detail/upload_20170206122406308641.jpeg|img/detail/upload_20170206122417777703.jpeg|img/detail/upload_20170206122429508726.jpeg|img/detail/upload_20170206122634091919.jpeg|img/detail/upload_20170206122649968694.jpeg|img/detail/upload_20170206122749008236.jpeg|img/detail/upload_20170206122804901385.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,2,'Yuki原创T恤保卫星球男女卡通情侣','','元气字母款','男款S(8)|男款M(6)|男款L(0)|男款XL(0)|男款2XL(0)|男款3XL(0)|女款S(32)|女款M(21)|女款L(10)',
38.00,36.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,77,163,1,'img/detail/gooddetailimg_20171026123111272328.jpeg','img/detail/goodinfo_20170823154625673367.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,2,'Yuki原创T恤保卫星球男女卡通情侣','','保卫星球款','男款S(28)|男款M(6)|男款L(7)|男款XL(4)|男款2XL(0)|男款3XL(0)|女款S(32)|女款M(21)|女款L(10)',
38.00,36.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,108,163,1,'img/detail/gooddetailimg_20171026123111272328.jpeg','img/detail/goodinfo_20170823154625673367.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,3,'Yuki原创 涛涛熊伞遮阳伞太阳伞三折伞黑胶防晒小黑伞晴雨伞','Yuki 原创淘淘熊 遮阳遮雨 三折伞黑胶防晒小黑伞晴雨伞 可爱实用','','有包装(50)|无包装(0)',
48.00,46.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,50,360,1,'img/detail/gooddetailimg_20170831162436391562.jpeg','img/detail/goodinfo_20170831162541680033.jpeg|img/detail/goodinfo_20170831162547178438.jpeg|img/detail/goodinfo_20170831162550635539.jpeg|img/detail/goodinfo_20170831162555874544.jpeg|img/detail/goodinfo_20170831162558142481.jpeg|img/detail/goodinfo_20170831162604432920.jpeg|img/detail/goodinfo_20170831162609841897.jpeg|img/detail/goodinfo_20170831162613259384.jpeg|img/detail/goodinfo_20170831162617735563.jpeg|img/detail/goodinfo_20170831162620433944.jpeg|img/detail/goodinfo_20180209105637618200.png');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,4,'泡芙小姐动漫周边Q版精美旅行箱墙壁电脑卡通动漫贴纸','20个图案不重复，少女粉红系贴纸预售了，现在下单，3月9日开始发货哦~','Q版贴纸','',
38.00,36.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',1,178,360,1,'img/detail/gooddetailimg_20180316155801409292.jpeg','img/detail/goodinfo_20180209105625618610.png|img/detail/goodinfo_20180209105628279871.png|img/detail/goodinfo_20180209105630127525.png|img/detail/goodinfo_20180209105632047161.png|img/detail/goodinfo_20180209105635841717.png|img/detail/goodinfo_20180209105635841717.png');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,5,'Apple/苹果 12 英寸 MacBook','','灰色','低配(100)|高配(50)',
8499.00,8499.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,150,82,1,'img/detail/gooddetailimg_20170606150447035031.jpeg','img/detail/goodinfo_20170606150819561108.jpeg|img/detail/goodinfo_20170606150822028729.jpeg|img/detail/goodinfo_20170606150823475382.jpeg|img/detail/goodinfo_20170606150825987981.jpeg|img/detail/goodinfo_20170606150827989922.jpeg|img/detail/goodinfo_20170606150829358728.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,5,'Apple/苹果 12 英寸 MacBook','','玫瑰金','低配(100)|高配(50)',
8499.00,8499.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,150,82,1,'img/detail/gooddetailimg_20170606150447336810.jpeg','img/detail/goodinfo_20170606150819561108.jpeg|img/detail/goodinfo_20170606150822028729.jpeg|img/detail/goodinfo_20170606150823475382.jpeg|img/detail/goodinfo_20170606150825987981.jpeg|img/detail/goodinfo_20170606150827989922.jpeg|img/detail/goodinfo_20170606150829358728.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,5,'Apple/苹果 12 英寸 MacBook','','金色','低配(100)|高配(50)',
8499.00,8499.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,150,82,1,'img/detail/gooddetailimg_20170606150447076600.jpeg','img/detail/goodinfo_20170606150819561108.jpeg|img/detail/goodinfo_20170606150822028729.jpeg|img/detail/goodinfo_20170606150823475382.jpeg|img/detail/goodinfo_20170606150825987981.jpeg|img/detail/goodinfo_20170606150827989922.jpeg|img/detail/goodinfo_20170606150829358728.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,5,'Apple/苹果 12 英寸 MacBook','','银色','低配(100)|高配(50)',
8499.00,8499.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,150,82,1,'img/detail/gooddetailimg_20170606150447090147.jpeg','img/detail/goodinfo_20170606150819561108.jpeg|img/detail/goodinfo_20170606150822028729.jpeg|img/detail/goodinfo_20170606150823475382.jpeg|img/detail/goodinfo_20170606150825987981.jpeg|img/detail/goodinfo_20170606150827989922.jpeg|img/detail/goodinfo_20170606150829358728.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,6,'芬迪小怪兽小恶魔iphone7plus手机壳苹果6创意6s硅胶潮男ipone7','','黄色','6/6s(100)|6p/6sp(50)|7(50)|7s(100)',
25.00,24.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,182,1,'img/detail/gooddetailimg_20170615201504489775.jpeg','img/detail/goodinfo_20170615203155370456.jpeg|img/detail/goodinfo_20170615203159564739.jpeg|img/detail/goodinfo_20170615203203042557.jpeg|img/detail/goodinfo_20170615203209711191.jpeg|img/detail/goodinfo_20170615203212635449.jpeg|img/detail/goodinfo_20170615203215336373.jpeg|img/detail/goodinfo_20170615203224328440.jpeg|img/detail/goodinfo_20170615203227173432.jpeg|img/detail/goodinfo_20170615203229331019.jpeg|img/detail/goodinfo_20170615203235188856.jpeg|img/detail/goodinfo_20170615203238690040.jpeg|img/detail/goodinfo_20170615203242602794.jpeg|img/detail/goodinfo_20170615203245502749.jpeg|img/detail/goodinfo_20170615203248076262.jpeg|img/detail/goodinfo_20170615203252409543.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,6,'芬迪小怪兽小恶魔iphone7plus手机壳苹果6创意6s硅胶潮男ipone7','','蓝色','6/6s(100)|6p/6sp(50)|7(50)|7s(100)',
25.00,24.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,182,1,'img/detail/gooddetailimg_20170615201504852299.jpeg','img/detail/goodinfo_20170615203155370456.jpeg|img/detail/goodinfo_20170615203159564739.jpeg|img/detail/goodinfo_20170615203203042557.jpeg|img/detail/goodinfo_20170615203209711191.jpeg|img/detail/goodinfo_20170615203212635449.jpeg|img/detail/goodinfo_20170615203215336373.jpeg|img/detail/goodinfo_20170615203224328440.jpeg|img/detail/goodinfo_20170615203227173432.jpeg|img/detail/goodinfo_20170615203229331019.jpeg|img/detail/goodinfo_20170615203235188856.jpeg|img/detail/goodinfo_20170615203238690040.jpeg|img/detail/goodinfo_20170615203242602794.jpeg|img/detail/goodinfo_20170615203245502749.jpeg|img/detail/goodinfo_20170615203248076262.jpeg|img/detail/goodinfo_20170615203252409543.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,7,'铝合金手机支架可兼容ipad mini 懒人支架桌面充电底座','','标准支架','',
29.00,28.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,222,1,'img/detail/gooddetailimg_20170628124523024041.jpeg','img/detail/goodinfo_20170628124701543912.jpeg|img/detail/goodinfo_20170628124703154305.jpeg|img/detail/goodinfo_20170628124705853338.jpeg|img/detail/goodinfo_20170628124706975525.jpeg|img/detail/goodinfo_20170628124708239941.jpeg|img/detail/goodinfo_20170628124709524820.jpeg|img/detail/goodinfo_20170628124711882193.jpeg|img/detail/goodinfo_20170628124713478608.jpeg|img/detail/goodinfo_20170628124715812342.jpeg|img/detail/goodinfo_20170628124717311666.jpeg|img/detail/goodinfo_20170628124719885467.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,7,'铝合金手机支架可兼容ipad mini 懒人支架桌面充电底座','','贴力支架','',
29.00,28.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,222,1,'img/detail/gooddetailimg_20170628124523189736.jpeg','img/detail/goodinfo_20170628124701543912.jpeg|img/detail/goodinfo_20170628124703154305.jpeg|img/detail/goodinfo_20170628124705853338.jpeg|img/detail/goodinfo_20170628124706975525.jpeg|img/detail/goodinfo_20170628124708239941.jpeg|img/detail/goodinfo_20170628124709524820.jpeg|img/detail/goodinfo_20170628124711882193.jpeg|img/detail/goodinfo_20170628124713478608.jpeg|img/detail/goodinfo_20170628124715812342.jpeg|img/detail/goodinfo_20170628124717311666.jpeg|img/detail/goodinfo_20170628124719885467.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,8,'爱国者充电宝10000毫安可爱聚合物移动电源超薄便携苹果手机通用','','白色','',
79.00,76.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,222,1,'img/detail/gooddetailimg_20170616123217138776.jpeg','img/detail/goodinfo_20170616123404787421.jpeg|img/detail/goodinfo_20170616123406780171.jpeg|img/detail/goodinfo_20170616123411386552.jpeg|img/detail/goodinfo_20170616123412525006.jpeg|img/detail/goodinfo_20170616123414170809.jpeg|img/detail/goodinfo_20170616123416763966.jpeg|img/detail/goodinfo_20170616123419927426.jpeg|img/detail/goodinfo_20170616123421553112.jpeg|img/detail/goodinfo_20170616123423825905.jpeg|img/detail/goodinfo_20170616123425550815.jpeg|img/detail/goodinfo_20170616123427661794.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,8,'爱国者充电宝10000毫安可爱聚合物移动电源超薄便携苹果手机通用','','蓝色','',
79.00,76.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,222,1,'img/detail/gooddetailimg_20170616123217396123.jpeg','img/detail/goodinfo_20170616123404787421.jpeg|img/detail/goodinfo_20170616123406780171.jpeg|img/detail/goodinfo_20170616123411386552.jpeg|img/detail/goodinfo_20170616123412525006.jpeg|img/detail/goodinfo_20170616123414170809.jpeg|img/detail/goodinfo_20170616123416763966.jpeg|img/detail/goodinfo_20170616123419927426.jpeg|img/detail/goodinfo_20170616123421553112.jpeg|img/detail/goodinfo_20170616123423825905.jpeg|img/detail/goodinfo_20170616123425550815.jpeg|img/detail/goodinfo_20170616123427661794.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,8,'爱国者充电宝10000毫安可爱聚合物移动电源超薄便携苹果手机通用','','粉色','',
79.00,76.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,300,222,1,'img/detail/gooddetailimg_20170616123217799108.jpeg','img/detail/goodinfo_20170616123404787421.jpeg|img/detail/goodinfo_20170616123406780171.jpeg|img/detail/goodinfo_20170616123411386552.jpeg|img/detail/goodinfo_20170616123412525006.jpeg|img/detail/goodinfo_20170616123414170809.jpeg|img/detail/goodinfo_20170616123416763966.jpeg|img/detail/goodinfo_20170616123419927426.jpeg|img/detail/goodinfo_20170616123421553112.jpeg|img/detail/goodinfo_20170616123423825905.jpeg|img/detail/goodinfo_20170616123425550815.jpeg|img/detail/goodinfo_20170616123427661794.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,9,'酷铄(CZ73) USB3.0 金属U盘 32 64GB 读150MB/秒','','32G','',
80.00,76.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,110,222,1,'img/detail/gooddetailimg_20170616133445547113.jpeg','img/detail/goodinfo_20170616133715799380.jpeg|img/detail/goodinfo_20170616133717619147.jpeg|img/detail/goodinfo_20170616133719877587.jpeg|img/detail/goodinfo_20170616133720128666.jpeg|img/detail/goodinfo_20170616133722146086.jpeg|img/detail/goodinfo_20170616133723395616.jpeg|img/detail/goodinfo_20170616133725524983.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,9,'酷铄(CZ73) USB3.0 金属U盘 32 64GB 读150MB/秒','','64G','',
160.00,156.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,110,222,1,'img/detail/gooddetailimg_20170616133445547113.jpeg','img/detail/goodinfo_20170616133715799380.jpeg|img/detail/goodinfo_20170616133717619147.jpeg|img/detail/goodinfo_20170616133719877587.jpeg|img/detail/goodinfo_20170616133720128666.jpeg|img/detail/goodinfo_20170616133722146086.jpeg|img/detail/goodinfo_20170616133723395616.jpeg|img/detail/goodinfo_20170616133725524983.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,10,'Razer/雷蛇 炼狱蝰蛇CF/LOL/2013守望先锋精英版电竞有线游戏鼠标','','1800dpi','',
149.00,146.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170622141049351541.jpeg','img/detail/goodinfo_20170622142408523191.jpeg|img/detail/goodinfo_20170622142412247229.jpeg|img/detail/goodinfo_20170622142415903129.jpeg|img/detail/goodinfo_20170622142418463350.jpeg|img/detail/goodinfo_20170622142421063470.jpeg|img/detail/goodinfo_20170622142426261709.jpeg|img/detail/goodinfo_20170622142430693203.jpeg|img/detail/goodinfo_20170622142442274325.jpeg|img/detail/goodinfo_20170622142446364191.jpeg|img/detail/goodinfo_20170622142451545134.jpeg|img/detail/goodinfo_20170622142450547167.jpeg|img/detail/goodinfo_20170622142453396160.jpeg|img/detail/goodinfo_20170622142457818733.jpeg|img/detail/goodinfo_20170622142459260251.jpeg|img/detail/goodinfo_20170622142501677319.jpeg|img/detail/goodinfo_20170622142503942796.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,10,'Razer/雷蛇 炼狱蝰蛇CF/LOL/2013守望先锋精英版电竞有线游戏鼠标','','1800dpi白色版','',
149.00,146.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170622141049910765.jpeg','img/detail/goodinfo_20170622142408523191.jpeg|img/detail/goodinfo_20170622142412247229.jpeg|img/detail/goodinfo_20170622142415903129.jpeg|img/detail/goodinfo_20170622142418463350.jpeg|img/detail/goodinfo_20170622142421063470.jpeg|img/detail/goodinfo_20170622142426261709.jpeg|img/detail/goodinfo_20170622142430693203.jpeg|img/detail/goodinfo_20170622142442274325.jpeg|img/detail/goodinfo_20170622142446364191.jpeg|img/detail/goodinfo_20170622142451545134.jpeg|img/detail/goodinfo_20170622142450547167.jpeg|img/detail/goodinfo_20170622142453396160.jpeg|img/detail/goodinfo_20170622142457818733.jpeg|img/detail/goodinfo_20170622142459260251.jpeg|img/detail/goodinfo_20170622142501677319.jpeg|img/detail/goodinfo_20170622142503942796.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,10,'Razer/雷蛇 炼狱蝰蛇CF/LOL/2013守望先锋精英版电竞有线游戏鼠标','','2000dpi黑色版','',
149.00,146.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170622141050320048.jpeg','img/detail/goodinfo_20170622142408523191.jpeg|img/detail/goodinfo_20170622142412247229.jpeg|img/detail/goodinfo_20170622142415903129.jpeg|img/detail/goodinfo_20170622142418463350.jpeg|img/detail/goodinfo_20170622142421063470.jpeg|img/detail/goodinfo_20170622142426261709.jpeg|img/detail/goodinfo_20170622142430693203.jpeg|img/detail/goodinfo_20170622142442274325.jpeg|img/detail/goodinfo_20170622142446364191.jpeg|img/detail/goodinfo_20170622142451545134.jpeg|img/detail/goodinfo_20170622142450547167.jpeg|img/detail/goodinfo_20170622142453396160.jpeg|img/detail/goodinfo_20170622142457818733.jpeg|img/detail/goodinfo_20170622142459260251.jpeg|img/detail/goodinfo_20170622142501677319.jpeg|img/detail/goodinfo_20170622142503942796.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,11,'韩国Nature Republic自然共和国芦荟胶正品自然乐园淡化修复痘印补水保湿面霜面膜男女300ml','补水保湿，晒后呵护，蕴含芦荟原液精华，战痘补水，晒后呵护，秋冬补水
','300ml','',
41.00,40.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20180122110339914173.jpeg','img/detail/goodinfo_20180122110651361234.jpeg|img/detail/goodinfo_20180122110653932118.jpeg|img/detail/goodinfo_20180122110732097760.jpeg|img/detail/goodinfo_20180122110734420437.jpeg|img/detail/goodinfo_20180122110736661270.jpeg|img/detail/goodinfo_20180122110738305391.jpeg|img/detail/goodinfo_20180122110739690822.jpeg|img/detail/goodinfo_20180122110744456249.jpeg|img/detail/goodinfo_20180122110746815107.jpeg|img/detail/goodinfo_20180122110750361783.jpeg|img/detail/goodinfo_20180122110751298401.jpeg|img/detail/goodinfo_20180122110753813970.jpeg|img/detail/goodinfo_20180122110755209980.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,12,'日本资生堂不老林ADENOGEN防脱发原装进口包邮护发素220ml','日本原装进口防脱护发素，蕴含丰富精华。想要拥有令人羡慕的发质吗，那就试试资生堂的老牌产品不老林，*了让头发又黑又亮外，也能加快头发生长的速度洗后让头发更加的柔顺。有效清洁多余油脂。
','220ml','',
73.00,70.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20180209140546803133.jpeg','img/detail/goodinfo_20180209140910229851.jpeg|img/detail/goodinfo_20180209140913703136.jpeg|img/detail/goodinfo_20180209140916940298.jpeg|img/detail/goodinfo_20180209140918780460.jpeg|img/detail/goodinfo_20180209140921153593.jpeg|img/detail/goodinfo_20180209140923159873.jpeg|img/detail/goodinfo_20180209140925120850.jpeg|img/detail/goodinfo_20180209140928052011.jpeg|img/detail/goodinfo_20180209140930193232.jpeg|img/detail/goodinfo_20180209140932750750.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,13,'日本M-mark松山油脂身体乳无添加天然柚子精华滋润米糠保湿防干身体乳液300ml','无添加 温和无刺激 清爽保湿 柚子清香','柚子','',
118.00,115.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20180124140439340294.jpeg','img/detail/goodinfo_20180124140531961358.jpeg|img/detail/goodinfo_20180124140533297669.jpeg|img/detail/goodinfo_20180124140535858510.jpeg|img/detail/goodinfo_20180124140537970814.jpeg|img/detail/goodinfo_20180124140538902998.jpeg|img/detail/goodinfo_20180124140540311619.jpeg|img/detail/goodinfo_20180124140542450170.jpeg|img/detail/goodinfo_20180124140544010427.jpeg|img/detail/goodinfo_20180124140545315227.jpeg|img/detail/goodinfo_20180124140547648175.jpeg|img/detail/goodinfo_20180124140549714913.jpeg|img/detail/goodinfo_20180124140550009778.jpeg|img/detail/goodinfo_20180124140553998002.jpeg|img/detail/goodinfo_20180124140554749657.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,13,'日本M-mark松山油脂身体乳无添加天然柚子精华滋润米糠保湿防干身体乳液300ml','无添加 温和无刺激 清爽保湿 柚子清香','米糠','',
118.00,115.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20180124140439472091.jpeg','img/detail/goodinfo_20180124140531961358.jpeg|img/detail/goodinfo_20180124140533297669.jpeg|img/detail/goodinfo_20180124140535858510.jpeg|img/detail/goodinfo_20180124140537970814.jpeg|img/detail/goodinfo_20180124140538902998.jpeg|img/detail/goodinfo_20180124140540311619.jpeg|img/detail/goodinfo_20180124140542450170.jpeg|img/detail/goodinfo_20180124140544010427.jpeg|img/detail/goodinfo_20180124140545315227.jpeg|img/detail/goodinfo_20180124140547648175.jpeg|img/detail/goodinfo_20180124140549714913.jpeg|img/detail/goodinfo_20180124140550009778.jpeg|img/detail/goodinfo_20180124140553998002.jpeg|img/detail/goodinfo_20180124140554749657.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,14,'日本CANMAKE井田睫毛定型液睫毛雨衣卷翘持久防水汗滋养防晕脱妆定型透明黑色打底液','','01透明色','',
53.00,50.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20180123123716672059.jpeg','img/detail/goodinfo_20180123123922442981.jpeg|img/detail/goodinfo_20180123123923216653.jpeg|img/detail/goodinfo_20180123123925932636.jpeg|img/detail/goodinfo_20180123123927459881.jpeg|img/detail/goodinfo_20180123123928710650.jpeg|img/detail/goodinfo_20180123123930670608.jpeg|img/detail/goodinfo_20180123123932947439.jpeg|img/detail/goodinfo_20180123123934697002.jpeg|img/detail/goodinfo_20180123123936467577.jpeg|img/detail/goodinfo_20180123123937241641.jpeg|img/detail/goodinfo_20180123123939935757.jpeg|img/detail/goodinfo_20180123123941111051.jpeg|img/detail/goodinfo_20180123123943894792.jpeg|img/detail/goodinfo_20180123123944994462.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,14,'日本CANMAKE井田睫毛定型液睫毛雨衣卷翘持久防水汗滋养防晕脱妆定型透明黑色打底液','','02黑色','',
53.00,50.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20180123123716625204.jpeg','img/detail/goodinfo_20180123123922442981.jpeg|img/detail/goodinfo_20180123123923216653.jpeg|img/detail/goodinfo_20180123123925932636.jpeg|img/detail/goodinfo_20180123123927459881.jpeg|img/detail/goodinfo_20180123123928710650.jpeg|img/detail/goodinfo_20180123123930670608.jpeg|img/detail/goodinfo_20180123123932947439.jpeg|img/detail/goodinfo_20180123123934697002.jpeg|img/detail/goodinfo_20180123123936467577.jpeg|img/detail/goodinfo_20180123123937241641.jpeg|img/detail/goodinfo_20180123123939935757.jpeg|img/detail/goodinfo_20180123123941111051.jpeg|img/detail/goodinfo_20180123123943894792.jpeg|img/detail/goodinfo_20180123123944994462.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,15,'汉高施华蔻Theramed站立按压式牙膏银蓝绿100ml','特有成分可渗透至顽固性污渍内部分离污渍，使其更易刷除；柔和的摩擦剂配方，在带走污渍、光亮牙齿表面的同时不磨损牙齿表面。四款汉高牙膏，可解决牙龈出血、蛀牙、牙菌斑、牙齿敏感、口腔异味等口腔问题。
','蓝色','',
32.00,30.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171219093118492893.jpeg','img/detail/goodinfo_20171219093230470877.jpeg|img/detail/goodinfo_20171219093232789624.jpeg|img/detail/goodinfo_20171219093234690747.jpeg|img/detail/goodinfo_20171219093236515118.jpeg|img/detail/goodinfo_20171219093238770289.jpeg|img/detail/goodinfo_20171219093240819709.jpeg|img/detail/goodinfo_20171219093242544773.jpeg|img/detail/goodinfo_20171219093244968630.jpeg|img/detail/goodinfo_20171219093246497801.jpeg|img/detail/goodinfo_20171219093249705209.jpeg|img/detail/goodinfo_20171219093251843231.jpeg|img/detail/goodinfo_20171219093253280385.jpeg|img/detail/goodinfo_20171219093255779237.jpeg|img/detail/goodinfo_20171219093257429452.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,15,'汉高施华蔻Theramed站立按压式牙膏银蓝绿100ml','特有成分可渗透至顽固性污渍内部分离污渍，使其更易刷除；柔和的摩擦剂配方，在带走污渍、光亮牙齿表面的同时不磨损牙齿表面。四款汉高牙膏，可解决牙龈出血、蛀牙、牙菌斑、牙齿敏感、口腔异味等口腔问题。
','银色','',
32.00,30.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171219093123483660.jpeg','img/detail/goodinfo_20171219093230470877.jpeg|img/detail/goodinfo_20171219093232789624.jpeg|img/detail/goodinfo_20171219093234690747.jpeg|img/detail/goodinfo_20171219093236515118.jpeg|img/detail/goodinfo_20171219093238770289.jpeg|img/detail/goodinfo_20171219093240819709.jpeg|img/detail/goodinfo_20171219093242544773.jpeg|img/detail/goodinfo_20171219093244968630.jpeg|img/detail/goodinfo_20171219093246497801.jpeg|img/detail/goodinfo_20171219093249705209.jpeg|img/detail/goodinfo_20171219093251843231.jpeg|img/detail/goodinfo_20171219093253280385.jpeg|img/detail/goodinfo_20171219093255779237.jpeg|img/detail/goodinfo_20171219093257429452.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,15,'汉高施华蔻Theramed站立按压式牙膏银蓝绿100ml','特有成分可渗透至顽固性污渍内部分离污渍，使其更易刷除；柔和的摩擦剂配方，在带走污渍、光亮牙齿表面的同时不磨损牙齿表面。四款汉高牙膏，可解决牙龈出血、蛀牙、牙菌斑、牙齿敏感、口腔异味等口腔问题。
','绿色','',
32.00,30.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171219093118384867.jpeg','img/detail/goodinfo_20171219093230470877.jpeg|img/detail/goodinfo_20171219093232789624.jpeg|img/detail/goodinfo_20171219093234690747.jpeg|img/detail/goodinfo_20171219093236515118.jpeg|img/detail/goodinfo_20171219093238770289.jpeg|img/detail/goodinfo_20171219093240819709.jpeg|img/detail/goodinfo_20171219093242544773.jpeg|img/detail/goodinfo_20171219093244968630.jpeg|img/detail/goodinfo_20171219093246497801.jpeg|img/detail/goodinfo_20171219093249705209.jpeg|img/detail/goodinfo_20171219093251843231.jpeg|img/detail/goodinfo_20171219093253280385.jpeg|img/detail/goodinfo_20171219093255779237.jpeg|img/detail/goodinfo_20171219093257429452.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,16,'日本pitta mask明星鹿晗同款口罩防尘霾花粉柳絮PM2.5易呼吸透气可清洗男女儿童黑白色潮款','冬季雾霾天更多,建议亲们常备. 此款材质是真的特别，有点像海绵一样的质感，但**不会太闷），但舒适度是**没得说的，隔离各种脏东西也是轻而易举，弹性很好，男女皆宜。 水洗三次左右，一袋三枚， 一个口罩一次用多久自己决定哦
','黑色三牧装','',
43.00,42.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171212150233538347.jpeg','img/detail/goodinfo_20171023094517483853.jpeg|img/detail/goodinfo_20171023094521392085.jpeg|img/detail/goodinfo_20171023094524622189.jpeg|img/detail/goodinfo_20171023094527601552.jpeg|img/detail/goodinfo_20171023094530550474.jpeg|img/detail/goodinfo_20171023094533122523.jpeg|img/detail/goodinfo_20171023094537954179.jpeg|img/detail/goodinfo_20171023094540394704.jpeg|img/detail/goodinfo_20171023094543485798.jpeg|img/detail/goodinfo_20171023094546082150.jpeg|img/detail/goodinfo_20171023094549643447.jpeg|img/detail/goodinfo_20171023094552491140.jpeg|img/detail/goodinfo_20171023094555643844.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,17,'paper mate缤乐美四色圆珠笔多色笔彩色笔芯学生 0.7按动原子笔Q1','书写顺滑 4合1 0.7mm 多色',
'商务色','',
15.00,14.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171201124746539418.jpeg','img/detail/goodinfo_20171018163727725423.jpeg|img/detail/goodinfo_20171018163730063789.jpeg|img/detail/goodinfo_20171018163733788569.jpeg|img/detail/goodinfo_20171018163736825056.jpeg|img/detail/goodinfo_20171018163739957446.jpeg|img/detail/goodinfo_20171018163742064790.jpeg|img/detail/goodinfo_20171018163745165111.jpeg|img/detail/goodinfo_20171018163750291489.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,17,'paper mate缤乐美四色圆珠笔多色笔彩色笔芯学生 0.7按动原子笔Q1','书写顺滑 4合1 0.7mm 多色',
'休闲色','',
15.00,14.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171201124746394707.jpeg','img/detail/goodinfo_20171018163727725423.jpeg|img/detail/goodinfo_20171018163730063789.jpeg|img/detail/goodinfo_20171018163733788569.jpeg|img/detail/goodinfo_20171018163736825056.jpeg|img/detail/goodinfo_20171018163739957446.jpeg|img/detail/goodinfo_20171018163742064790.jpeg|img/detail/goodinfo_20171018163745165111.jpeg|img/detail/goodinfo_20171018163750291489.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,18,'日本进口 国誉Campus系列活页纸替芯 方格 笔记本文具活页芯','',
'A5','',
18.00,18.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620095721861962.jpeg','img/detail/goodinfo_20170620095858007969.jpeg|img/detail/goodinfo_20170620095900463094.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,18,'日本进口 国誉Campus系列活页纸替芯 方格 笔记本文具活页芯','',
'B5','',
19.00,19.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620095721861962.jpeg','img/detail/goodinfo_20170620095858007969.jpeg|img/detail/goodinfo_20170620095900463094.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,19,'卡通猫咪造型回形针金属书签','',
'花朵','',
3.00,3.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620140824412694.jpeg','img/detail/goodinfo_20170620141005282664.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,19,'卡通猫咪造型回形针金属书签','',
'卷尾猫','',
3.00,3.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620140824679881.jpeg','img/detail/goodinfo_20170620141005282664.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,19,'卡通猫咪造型回形针金属书签','',
'睡觉猫','',
3.00,3.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620140824054101.jpeg','img/detail/goodinfo_20170620141005282664.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,19,'卡通猫咪造型回形针金属书签','',
'小鸟','',
3.00,3.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620140824850745.jpeg','img/detail/goodinfo_20170620141005282664.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,19,'卡通猫咪造型回形针金属书签','',
'长尾猫','',
3.00,3.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620140824865946.jpeg','img/detail/goodinfo_20170620141005282664.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,20,'烫金数字字母手账贴纸 日记计划表DIY粘纸','',
'金色草写体','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620132451085652.jpeg','img/detail/goodinfo_20170620132811184813.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,20,'烫金数字字母手账贴纸 日记计划表DIY粘纸','',
'金色数字','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620132451315374.jpeg','img/detail/goodinfo_20170620132811184813.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,20,'烫金数字字母手账贴纸 日记计划表DIY粘纸','',
'银色印刷体','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620132452615233.jpeg','img/detail/goodinfo_20170620132811184813.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,20,'烫金数字字母手账贴纸 日记计划表DIY粘纸','',
'银色数字','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620132452678812.jpeg','img/detail/goodinfo_20170620132811184813.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,20,'烫金数字字母手账贴纸 日记计划表DIY粘纸','',
'银色草写体','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620132452454206.jpeg','img/detail/goodinfo_20170620132811184813.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,21,'创意和纸胶带','',
'森林协奏曲','',
21.00,20.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170612123212377515.jpeg','img/detail/upload_20170122152338896238.jpeg|img/detail/upload_20170122152515426855.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,21,'创意和纸胶带','',
'狂野西部','',
21.00,20.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170612123213108440.jpeg','img/detail/upload_20170122152338896238.jpeg|img/detail/upload_20170122152515426855.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,21,'创意和纸胶带','',
'美味甜甜圈','',
21.00,20.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170612123213582023.jpeg','img/detail/upload_20170122152338896238.jpeg|img/detail/upload_20170122152515426855.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,21,'创意和纸胶带','',
'韵之染','',
21.00,20.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170612123213836209.jpeg','img/detail/upload_20170122152338896238.jpeg|img/detail/upload_20170122152515426855.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,21,'创意和纸胶带','',
'风之语','',
21.00,20.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170612123212517513.jpeg','img/detail/upload_20170122152338896238.jpeg|img/detail/upload_20170122152515426855.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,22,'可爱猫咪留言记事N次贴 便利贴','',
'猫爪便利贴/白','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620142302810405.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,22,'可爱猫咪留言记事N次贴 便利贴','',
'猫爪便利贴/黄','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620142302815959.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,22,'可爱猫咪留言记事N次贴 便利贴','',
'猫爪便利贴/灰','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620142302002862.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,22,'可爱猫咪留言记事N次贴 便利贴','',
'猫爪便利贴/浅灰','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620142302755190.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,22,'可爱猫咪留言记事N次贴 便利贴','',
'猫爪便利贴/花','',
5.00,5.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170620142302492059.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,23,'2017春装新款女装森系乌云贴布宽松连帽卫衣 五分袖学生帽衫上衣','',
'藕色','',
68.00,68.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621105053382868.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,23,'2017春装新款女装森系乌云贴布宽松连帽卫衣 五分袖学生帽衫上衣','',
'白色','',
68.00,68.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621105053096239.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,24,'丝绸安全裤lolita南瓜裤夏宽松打底裤缎面短裤少女防走光灯笼裤','',
'白色','',
25.00,25.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621124653230458.jpeg','img/detail/goodinfo_20170621124816681703.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,25,'韩版宽松显瘦裙子2017新款少女学生日系软妹刺绣短袖连衣裙女夏','',
'粉色','',
49.00,48.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621103131115527.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,25,'韩版宽松显瘦裙子2017新款少女学生日系软妹刺绣短袖连衣裙女夏','',
'黑色','',
49.00,48.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621103131803526.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,26,'日系小清新水手服 女高校班服软妹JK制服 百褶裙学生套装','',
'薄荷粉短袖套装','',
88.00,88.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621125504339673.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,26,'日系小清新水手服 女高校班服软妹JK制服 百褶裙学生套装','',
'薄荷蓝短袖套装','',
88.00,88.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621125506162568.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,26,'日系小清新水手服 女高校班服软妹JK制服 百褶裙学生套装','',
'薄荷绿短袖套装','',
88.00,88.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621125510644513.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,27,'日系学院风制服鞋cos女圆头洛丽塔镂空小皮鞋蝴蝶结软妹子单鞋潮','',
'35','',
39.00,38.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170626201020129993.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,27,'日系学院风制服鞋cos女圆头洛丽塔镂空小皮鞋蝴蝶结软妹子单鞋潮','',
'36','',
39.00,38.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170626201020129993.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,27,'日系学院风制服鞋cos女圆头洛丽塔镂空小皮鞋蝴蝶结软妹子单鞋潮','',
'37','',
39.00,38.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170626201020129993.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,27,'日系学院风制服鞋cos女圆头洛丽塔镂空小皮鞋蝴蝶结软妹子单鞋潮','',
'38','',
39.00,38.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170626201020129993.jpeg','');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,27,'日系学院风制服鞋cos女圆头洛丽塔镂空小皮鞋蝴蝶结软妹子单鞋潮','',
'39','',
39.00,38.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170626201020129993.jpeg','');


INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,28,'垂耳兔单肩卡通零钱包毛绒 日系软妹包少女兔子斜挎包 动漫周边','',
'默认','',
28.00,28.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170626192631883043.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,29,'Emoi小鸟情感小夜灯H0040','',
'默认','',
129.00,125.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170612134839827111.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,30,'德国飞利浦电动剃须刀PT711/16','',
'默认','',
804.00,78.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171110172529662839.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,31,'德国进口Braun博朗吹风机HD350家用旅行迷你可折叠负离子防静电吹风机','',
'HD350','',
248.00,248.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171110174911600832.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,32,'CUCKOO福库 CRP-G1030MP智能电饭煲锅5L家用韩国原装进口3-10人','',
'PT711/16','',
1092.00,1049.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171110105343431926.jpeg','img/detail/goodinfo_20171110105652845766.jpeg|img/detail/goodinfo_20171110105654059973.jpeg|img/detail/goodinfo_20171110105658869234.jpeg|img/detail/goodinfo_20171110105700166012.jpeg|img/detail/goodinfo_20171110105703335466.jpeg|img/detail/goodinfo_20171110105705285125.jpeg|img/detail/goodinfo_20171110105708299221.jpeg|img/detail/goodinfo_20171110105710106884.jpeg|img/detail/goodinfo_20171110105713479807.jpeg|img/detail/goodinfo_20171110105715532227.jpeg|img/detail/goodinfo_20171110105717975983.jpeg|img/detail/goodinfo_20171110105719142668.jpeg|img/detail/goodinfo_20171110105722934380.jpeg|img/detail/goodinfo_20171110105724572374.jpeg|img/detail/goodinfo_20171110105740202896.jpeg|img/detail/goodinfo_20171110105744013968.jpeg|img/detail/goodinfo_20171110105746388916.jpeg|img/detail/goodinfo_20171110105748889808.jpeg|img/detail/goodinfo_20171110105752991553.jpeg|img/detail/goodinfo_20171110105757359967.jpeg|img/detail/goodinfo_20171110105801019037.jpeg|img/detail/goodinfo_20171110105804581007.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,33,'Remax小水仙加湿器usb迷你便携式办公室桌面静音可爱家用卧室喷雾','',
'默认','',
68.00,68.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170907115959356312.jpeg','img/detail/goodinfo_20170907120119796944.jpeg|img/detail/goodinfo_20170907120121972346.jpeg|img/detail/goodinfo_20170907120124260524.jpeg|img/detail/goodinfo_20170907120127436955.jpeg|img/detail/goodinfo_20170907120130121809.jpeg|img/detail/goodinfo_20170907120134115356.jpeg|img/detail/goodinfo_20170907120137739760.jpeg|img/detail/goodinfo_20170907120141116598.jpeg|img/detail/goodinfo_20170907120144841933.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,34,'韩国Hurom惠人原汁机150W果汁机榨汁机HL -RBF11','',
'HL -RBF11','',
2345.00,2299.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171110220515368005.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,35,'刀剑乱舞-ONLINE-和风文件夹 厚藤四郎 堀川国広 第二弹','厚藤四郎，刀剑乱舞中的短刀之一，可60级极化.堀川国广，刀剑乱舞中的胁差之一，2花，刀帐顺序99番',
'厚藤四郎','',
17.00,17.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171108093105314077.jpeg','img/detail/goodinfo_20171108093216988809.jpeg');
INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,35,'刀剑乱舞-ONLINE-和风文件夹 厚藤四郎 堀川国広 第二弹','厚藤四郎，刀剑乱舞中的短刀之一，可60级极化.堀川国广，刀剑乱舞中的胁差之一，2花，刀帐顺序99番',
'堀川国広','',
17.00,17.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20171108093105914482.jpeg','img/detail/goodinfo_20171108093216988809.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,36,'干物妹小埋披风披肩斗蓬仓鼠土间埋COS动漫周边外套空调毯','',
'默认','',
49.00,49.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621110955434268.jpeg','');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,37,'守望先锋DVA宋哈娜印象棒球服 动漫外套春秋女款棒球衫','',
'DVA棒球衫（仅外套）','',
99.00,99.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/goodinfo_20170621110137308368.jpeg','img/detail/goodinfo_20170621110137308368.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,38,'#游戏周边#刀剑乱舞-ONLINE-人物头饰cosplay配饰扎头绳大倶利伽羅','',
'大倶利伽羅','',
58.00,55.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/goodinfo_20171108132054425391.jpeg','img/detail/goodinfo_20171108132054425391.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,39,'咸鱼王周边毛绒挂件抱枕舰队collection舰娘游戏动漫小挂件公仔','',
'15cm小挂件','',
12.00,12.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/goodinfo_20170626193459907932.jpeg','img/detail/goodinfo_20170626193459907932.jpeg');

INSERT INTO yuki_good_list(gid,gfid,title,intro,g_spec1,g_spec2,f_price,d_price,promise,salse,isSalse,stock,sold,shelves,g_pic,detail)
VALUES(NULL,40,'二次元动漫周边新世纪福音战士EVA明日香同款猫耳棒球帽毛绒帽子','',
'明日香同款','',
22.00,22.00,'48小时快速退款|365天贴心服务','全场满98减8 满198减18',0,10,62,1,'img/detail/gooddetailimg_20170621155837534962.jpeg','img/detail/goodinfo_20170621155920824830.jpeg|img/detail/goodinfo_20170621155923195106.jpeg|img/detail/goodinfo_20170621155925946826.jpeg|img/detail/goodinfo_20170621155926803439.jpeg|img/detail/goodinfo_20170621155927525132.jpeg|img/detail/goodinfo_20170621155929887814.jpeg|img/detail/goodinfo_20170621155931509610.jpeg');



#插入产品图片数据
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,1,'img/detail/gooddetailimg_20170612141435054924.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,1,'img/detail/gooddetailimg_20170612141435076485.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,1,'img/detail/gooddetailimg_20170612141435305150.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,1,'img/detail/gooddetailimg_20170612141435396515.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,1,'img/detail/gooddetailimg_20170612141436446154.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,1,'img/detail/gooddetailimg_20170612141436546472.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,2,'img/detail/gooddetailimg_20170823154935509512.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,2,'img/detail/gooddetailimg_20170823160316076431.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,2,'img/detail/gooddetailimg_20170823160341392109.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,2,'img/detail/gooddetailimg_20170823160348693579.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,2,'img/detail/gooddetailimg_20171026123111272328.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162424124803.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162429467490.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162429926143.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162429932740.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162436304703.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162436391562.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,3,'img/detail/gooddetailimg_20170831162436911669.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,4,'img/detail/gooddetailimg_20180316155801409292.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,4,'img/detail/gooddetailimg_20180316155900959271.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,5,'img/detail/gooddetailimg_20170606150447035031.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,5,'img/detail/gooddetailimg_20170606150447076600.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,5,'img/detail/gooddetailimg_20170606150447090147.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,5,'img/detail/gooddetailimg_20170606150447336810.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,5,'img/detail/gooddetailimg_20170606150447823871.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615201504489775.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615201504852299.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615201504885119.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615201557716310.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615203006411812.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615203006461835.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615203006691791.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,6,'img/detail/gooddetailimg_20170615203006959047.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,7,'img/detail/gooddetailimg_20170628124523024041.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,7,'img/detail/gooddetailimg_20170628124523157728.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,7,'img/detail/gooddetailimg_20170628124523189736.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,7,'img/detail/gooddetailimg_20170628124523374796.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217048452.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217188324.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217547615.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217906400.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217138776.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217396123.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,8,'img/detail/gooddetailimg_20170616123217799108.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,9,'img/detail/gooddetailimg_20170616133445547113.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,9,'img/detail/gooddetailimg_20170616133445730516.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,9,'img/detail/gooddetailimg_20170616133454535263.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,10,'img/detail/gooddetailimg_20170622141038873413.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,10,'img/detail/gooddetailimg_20170622141049351541.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,10,'img/detail/gooddetailimg_20170622141049846303.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,10,'img/detail/gooddetailimg_20170622141049910765.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,10,'img/detail/gooddetailimg_20170622141050320048.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,11,'img/detail/gooddetailimg_20180122110339914173.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,11,'img/detail/gooddetailimg_20180122110341280170.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,11,'img/detail/gooddetailimg_20180122110344633175.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,12,'img/detail/gooddetailimg_20180209140546803133.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,13,'img/detail/gooddetailimg_20180124140439142121.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,13,'img/detail/gooddetailimg_20180124140439340294.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,13,'img/detail/gooddetailimg_20180124140439472091.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,14,'img/detail/gooddetailimg_20180123123712903241.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,14,'img/detail/gooddetailimg_20180123123716625204.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,14,'img/detail/gooddetailimg_20180123123716672059.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,15,'img/detail/gooddetailimg_20171219093118384867.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,15,'img/detail/gooddetailimg_20171219093118492893.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,15,'img/detail/gooddetailimg_20171219093123483660.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,15,'img/detail/gooddetailimg_20171219093118843893.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,15,'img/detail/gooddetailimg_20171219093123870173.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,16,'img/detail/gooddetailimg_20171023094207192033.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,16,'img/detail/gooddetailimg_20171023094207451970.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,16,'img/detail/gooddetailimg_20171212150232927677.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,16,'img/detail/gooddetailimg_20171212150233538347.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,16,'img/detail/gooddetailimg_20171212150233670524.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,16,'img/detail/gooddetailimg_20171212150234658242.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,17,'img/detail/gooddetailimg_20171201124746019227.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,17,'img/detail/gooddetailimg_20171201124746152422.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,17,'img/detail/gooddetailimg_20171201124746379814.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,17,'img/detail/gooddetailimg_20171201124746394707.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,17,'img/detail/gooddetailimg_20171201124746539418.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,17,'img/detail/gooddetailimg_20171201124747969106.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,18,'img/detail/gooddetailimg_20170620095721861962.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,18,'img/detail/gooddetailimg_20170620095721153417.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,19,'img/detail/gooddetailimg_20170620140824054101.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,19,'img/detail/gooddetailimg_20170620140824412694.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,19,'img/detail/gooddetailimg_20170620140824679881.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,19,'img/detail/gooddetailimg_20170620140824850745.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,19,'img/detail/gooddetailimg_20170620140824865946.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,20,'img/detail/gooddetailimg_20170620132451085652.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,20,'img/detail/gooddetailimg_20170620132451315374.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,20,'img/detail/gooddetailimg_20170620132452454206.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,20,'img/detail/gooddetailimg_20170620132452615233.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,20,'img/detail/gooddetailimg_20170620132452678812.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,21,'img/detail/gooddetailimg_20170612123213836209.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,21,'img/detail/gooddetailimg_20170612123212377515.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,21,'img/detail/gooddetailimg_20170612123212517513.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,21,'img/detail/gooddetailimg_20170612123212903474.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,21,'img/detail/gooddetailimg_20170612123213108440.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,21,'img/detail/gooddetailimg_20170612123213582023.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,22,'img/detail/gooddetailimg_20170620142302815959.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,22,'img/detail/gooddetailimg_20170620142302002862.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,22,'img/detail/gooddetailimg_20170620142302492059.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,22,'img/detail/gooddetailimg_20170620142302755190.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,22,'img/detail/gooddetailimg_20170620142302810405.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,23,'img/detail/gooddetailimg_20170621105053382868.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,23,'img/detail/gooddetailimg_20170621105053096239.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,24,'img/detail/gooddetailimg_20170621124653230458.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,25,'img/detail/gooddetailimg_20170621103131115527.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,25,'img/detail/gooddetailimg_20170621103131803526.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,26,'img/detail/gooddetailimg_20170621125504339673.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,26,'img/detail/gooddetailimg_20170621125506162568.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,26,'img/detail/gooddetailimg_20170621125510644513.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,27,'img/detail/gooddetailimg_20170626201020129993.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,28,'img/detail/gooddetailimg_20170626192631883043.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,29,'img/detail/gooddetailimg_20170612134839827111.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,29,'img/detail/gooddetailimg_20170612134839843540.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,30,'img/detail/gooddetailimg_20171110172529662839.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,31,'img/detail/gooddetailimg_20171110174911600832.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,32,'img/detail/gooddetailimg_20171110105343431926.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,33,'img/detail/gooddetailimg_20170907115959356312.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,34,'img/detail/gooddetailimg_20171110220515368005.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,35,'img/detail/gooddetailimg_20171108093101675662.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,35,'img/detail/gooddetailimg_20171108093105314077.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,35,'img/detail/gooddetailimg_20171108093105914482.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,36,'img/detail/gooddetailimg_20170621110955434268.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,36,'img/detail/gooddetailimg_20170621111010559747.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,36,'img/detail/gooddetailimg_20170621111010691154.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,37,'img/detail/gooddetailimg_20170621105956055247.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,37,'img/detail/gooddetailimg_20170621105957140069.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,37,'img/detail/gooddetailimg_20170621105957331513.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,37,'img/detail/goodinfo_20170621110137308368.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,38,'img/detail/goodinfo_20171108132054425391.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,39,'img/detail/goodinfo_20170626193459907932.jpeg');

INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,39,'img/detail/gooddetailimg_20170621155837096883.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,39,'img/detail/gooddetailimg_20170621155837534962.jpeg');
INSERT INTO yuki_good_pic(pid,gfid,src) VALUES(NULL,39,'img/detail/gooddetailimg_20170621155837920051.jpeg');
#插入购物车数据
INSERT INTO yuki_cart(cid,uid,gid,quantity,spec1,spec2,address,isChecked) VALUES(NULL,1,1,2,'李清照渔家傲','oppo r9','广东省广州市',0);
#插入轮播图数据
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20170929132840707485.jpeg','/');
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20171101142606559003.jpeg','/');
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20171115175805934373.jpeg','/');
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20171116143946573538.jpeg','/');
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20171122095621405513.jpeg','/');
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20180213114221159869.jpeg','/');
INSERT INTO yuki_carousel(crid,src,href) VALUES(NULL,'img/index/carousel/yukiwebbanner_20171116143925267116.jpeg','/');