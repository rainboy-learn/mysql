#DDL语言
/*
说明：Data Define Language数据定义语言,用于对数据库和表的管理和操作



*/

#---------------------------库的管理------------------------

#一、创建数据库
CREATE DATABASE stuDB;
CREATE DATABASE IF NOT EXISTS stuDB;


#二、删除数据库

DROP DATABASE stuDB;

DROP DATABASE IF EXISTS stuDB;





#---------------------------表的管理------------------------


#一、创建表 ★

数据类型：

1、整型
TINYINT SMALLINT  INT  BIGINT 

2、浮点型
FLOAT(m,n)
DOUBLE(m,n) 
DECIMAL(m,n)
m和n可选



3、字符型

CHAR(n):n可选
VARCHAR(n)：n必选
TEXT
n表示最多字符个数



4、日期型

DATE TIME  DATETIME TIMESTAMP


5、二进制型

BLOB 存储图片数据






语法：
CREATE TABLE [IF NOT EXISTS] 表名(
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】
	

);


案例：


CREATE TABLE IF NOT EXISTS stuinfo(
	stuid INT ,
	stuname VARCHAR(20),
	stugender CHAR(1),
	email VARCHAR(20),
	borndate DATETIME

);

DESC stuinfo;


#二、修改表

#三、删除表


#四、复制表













