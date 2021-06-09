#事务
/*

概念：由一条或多条sql语句组成，要么都成功，要么都失败

特性：ACID

	原子性
	一致性
	隔离性
	持久性


分类：

隐式事务：没有明显的开启和结束标记
	比如dml语句的insert、update、delete语句本身就是一条事务
	
	insert into stuinfo values(1,'john','男','ert@dd.com',12);
	
显式事务：具有明显的开启和结束标记

	一般由多条sql语句组成，必须具有明显的开启和结束标记
	
	
	步骤：
	取消隐式事务自动开启的功能
	
	1、开启事务
	2、编写事务需要的sql语句（1条或多条）
		insert into stuinfo values(1,'john','男','ert@dd.com',12);
		insert into stuinfo values(1,'john','男','ert@dd.com',12);
	3、结束事务
*/





SHOW VARIABLES LIKE '%auto%'

#演示事务的使用步骤

#1、取消事务自动开启
SET autocommit = 0;

#2、开启事务
START TRANSACTION;

#3、编写事务的sql语句

#将张三丰的钱-5000
UPDATE stuinfo SET balance=balance-5000 WHERE stuid = 1;

#将灭绝的钱+5000
UPDATE stuinfo SET balance=balance+5000 WHERE stuid = 2;


#4、结束事务

#提交
#commit;

#回滚
ROLLBACK;



SELECT * FROM stuinfo;








