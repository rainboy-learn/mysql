#DML★
/*
DML(Data Manipulation Language)数据操纵语言：insert update delete
对表中的数据的增删改
*/

#一、数据 的插入

/*

语法：
插入单行：
	insert into 表名(字段名1,字段名2 ,...) values (值1，值2,...);
插入多行：
	insert into 表名(字段名1,字段名2 ,...) values
	 (值1，值2,...),(值1，值2,...),(值1，值2,...);

特点：

①字段和值列表一一对应
包含类型、约束等必须匹配

②数值型的值，不用单引号
非数值型的值，必须使用单引号

③字段顺序无要求

*/
SELECT * FROM stuinfo;

#案例1：要求字段和值列表一一对应，且遵循类型和约束的限制
INSERT INTO stuinfo(stuid,stuname,stugender,email,age,majorid)
VALUES(1,'吴倩','男','wuqian@qq.com',12,1); 


INSERT INTO stuinfo(stuid,stuname,stugender,email,age,majorid)
VALUES(6,'李宗盛2','女','wuqian@qq.com',45,2); 

#案例2：可以为空字段如何插入

#方案1：字段名和值都不写
INSERT INTO stuinfo(stuid,stuname,email,majorid)
VALUES(5,'齐鱼','qiqin@qq.com',2); 


#方案1：字段名写上，值使用null

INSERT INTO stuinfo(stuid,stuname,email,age,majorid)
VALUES(5,'齐鱼','qiqin@qq.com',NULL,2); 

SELECT * FROM stuinfo;


#案例3：默认字段如何插入

#方案1：字段名写上，值使用default
INSERT INTO stuinfo(stuid,stuname,email,stugender,majorid)
VALUES(7,'齐小鱼','qiqin@qq.com',DEFAULT,2); 

#方案2：字段名和值都不写

INSERT INTO stuinfo(stuid,stuname,email,majorid)
VALUES(7,'齐小鱼','qiqin@qq.com',2); 


#案例4：可以省略字段列表，默认所有字段
INSERT INTO stuinfo VALUES(8,'林忆莲','女','lin@126.com',12,3);


INSERT INTO stuinfo VALUES(NULL,'小黄','男','dd@12.com',12,3);



SELECT * FROM stuinfo;

#二、数据 的修改

/*
语法：
update 表名 set 字段名 = 新值,字段名=新值,...
where 筛选条件;


*/


#案例1：修改年龄<20的专业编号为3号，且邮箱更改为 xx@qq.com


UPDATE stuinfo SET majorid = 3,email='xx@qq.com'
WHERE age<20;


#三、数据 的删除
/*

方式1：delete语句

	语法：delete from 表名 where 筛选条件;
方式2：truncate语句
	语法：truncate table 表名;

*/

#案例1：删除姓李所有信息

DELETE FROM stuinfo WHERE stuname LIKE '李%';

#案例2：删除表中所有数据
TRUNCATE TABLE stuinfo ;


#【面试题】delete和truncate的区别

1.delete可以添加WHERE条件
  TRUNCATE不能添加WHERE条件，一次性清除所有数据
2.truncate的效率较高
3.如果删除带自增长列的表，
  使用DELETE删除后，重新插入数据，记录从断点处开始
  使用TRUNCATE删除后，重新插入数据，记录从1开始
  
  SELECT * FROM gradeinfo;

  TRUNCATE TABLE gradeinfo;
  
  INSERT INTO gradeinfo(gradename)VALUES('一年级'),('2年级'),('3年级');
  
4.delete 删除数据，会返回受影响的行数
  TRUNCATE删除数据，不返回受影响的行数
  
5.delete删除数据，可以支持事务回滚
  TRUNCATE删除数据，不支持事务回滚
  














