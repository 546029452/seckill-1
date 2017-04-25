-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE seckill;

-- 使用数据库
USE seckill;

-- 创建秒杀库存表
CREATE TABLE seckill(
`seckill_id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '商品库存id',
`name` VARCHAR(120) NOT NULL COMMENT '商品名称',
`number` INT NOT NULL COMMENT '库存数量',
`start_time` TIMESTAMP NOT NULL COMMENT '秒杀开启时间',
`end_time` TIMESTAMP NOT NULL COMMENT '秒杀结束时间',
`create_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
PRIMARY KEY (seckill_id),
KEY idx_start_time(start_time),
KEY idx_end_time(end_time),
KEY idx_create_time(create_time)
)ENGINE=INNODB AUTO_INCREMENT=1000 DEFAULT CHARSET=utf8 COMMENT='秒杀库存表';

-- 初始化数据
INSERT INTO seckill(NAME,number,start_time,end_time)
VALUES ('1000元秒杀IPAD',100,'2017-04-07','2017-04-07'),
 ('100元秒杀IPADMIN',300,'2017-04-07','2017-04-07'),
 ('2000元秒杀IPADPRO',400,'2017-04-07','2017-04-07'),
 ('3000元秒杀Iphone',500,'2017-04-07','2017-04-07');
 
-- 验证数据是否插入
SELECT * FROM seckill

-- 秒杀成功明细表
-- 用户登录相关的信息
CREATE TABLE success_seckill(
 `seckill_id` BIGINT NOT NULL COMMENT '秒杀商品id',
 `user_phone` BIGINT NOT NULL COMMENT '用户手机号',
 `state` TINYINT NOT NULL COMMENT '标志：-1：无效 0：成功 1：已付款 2：已发货',
 `create_time` TIMESTAMP NOT NULL COMMENT '创建时间',
 PRIMARY KEY (seckill_id,user_phone),/*联合主键*/
 KEY idx_create_time(create_time)
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='秒杀成功明细表'

SELECT * FROM success_seckill
 