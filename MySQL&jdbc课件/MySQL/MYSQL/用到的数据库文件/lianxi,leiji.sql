SELECT LENGTH('hello,郭襄');
2.获取字节长度
SELECT SUBSTR('张三丰爱上了郭襄',1,3);
3.获取字符长度
SELECT CHAR_LENGTH('hello,郭襄');
4.substring 截取字符串
/*注意：起始索引从1开始！！！
substr(str,起始索引，截取字符长度)
substr（str，起始索引）
*/
SELECT SUBSTR('张三丰爱上了郭襄',1,3);
SELECT SUBSTR('张三丰爱上了郭襄',7);

5，INSTR获取子符第一次出现的索引
SELECT INSTR('三打白骨精aaa白骨精bb白骨精','白骨精');
SELECT INSTR('三打白骨精aaa白骨精bb白骨精','白骨精');

6。TRIM去前后指定的子符，默认是去空格
SELECT TRIM(' 虚 竹  ')AS a;
SELECT TRIM('x' FROM 'xxxxx虚xxx竹xxxxxxxxxx')AS a;
7.lpad/RPAD 左填充/右填充
SELECT LPAD('木婉清',10,'a');
SELECT RPAD('木婉清',6,'a');
8.upper/LOWER 变大写/变小写
#案例：查询员工表的姓名，要求格式：姓首字符大写，其他字符小写，名所有字符大写，且姓和名之间用_分割，最后其别名“OUTPUT”																						
SELECT UPPER(SUBSTR(first_name,1,1)),first_name FROM employees;
SELECT LOWER(SUBSTR(firat_name,2)),first_name FROM employees;
SELECT UPPER(last_name)FROM employees;

SELECT CONCAT(UPPER(SUBSTR(first_name,1,1)),LOWER(SUBSTR(first_name,2)),'_',UPPER(last_name))"output" 
FROM employees;
10、LEFT/RIGHT  截取子串
SELECT LEFT('鸠摩智',1);
SELECT RIGHT('鸠摩智',1);
#二、数学函数

1、ABS 绝对值
SELECT ABS(-2.4);
2、CEIL 向上取整  返回>=该参数的最小整数
SELECT CEIL(-1.09);
SELECT CEIL(0.09);
SELECT CEIL(1.00);

3、FLOOR 向下取整，返回<=该参数的最大整数
SELECT FLOOR(-1.09);
SELECT FLOOR(0.09);
SELECT FLOOR(1.00);

4、ROUND 四舍五入
SELECT ROUND(1.8712345);
SELECT ROUND(1.8712345,2);

5、TRUNCATE 截断

SELECT TRUNCATE(1.8712345,1);

6、MOD 取余

SELECT MOD(-10,3);
a%b = a-(INT)a/b*b
-10%3 = -10 - (-10)/3*3   = -1

SELECT -10%3;
SELECT 10%3;
SELECT -10%-3;
SELECT 10%-3;

#三、日期函数
1、NOW
SELECT NOW();

2、CURDATE

SELECT CURDATE();

3、CURTIME
SELECT CURTIME();


4、DATEDIFF
SELECT DATEDIFF('2019-7-18','2019-7-13');

5、DATE_FORMAT

SELECT DATE_FORMAT('1998-7-16','%Y年%M月%d日 %H小时%i分钟%s秒') 出生日期;


SELECT DATE_FORMAT(hiredate,'%Y年%M月%d日 %H小时%i分钟%s秒')入职日期 
FROM employees;



6、STR_TO_DATE 按指定格式解析字符串为日期类型
SELECT * FROM employees
WHERE hiredate<STR_TO_DATE('3/15 1998','%m/%d %Y');

#四、流程控制函数


1、IF函数

SELECT IF(100>9,'好','坏');


#需求：如果有奖金，则显示最终奖金，如果没有，则显示0
SELECT IF(commission_pct IS NULL,0,salary*12*commission_pct)  奖金,commission_pct
FROM employees;



2、CASE函数

①情况1 ：类似于switch语句，可以实现等值判断
CASE 表达式
WHEN 值1 THEN 结果1
WHEN 值2 THEN 结果2
...
ELSE 结果n
END


案例：
部门编号是30，工资显示为2倍
部门编号是50，工资显示为3倍
部门编号是60，工资显示为4倍
否则不变

显示 部门编号，新工资，旧工资

SELECT department_id,salary,
CASE department_id
WHEN 30 THEN salary*2
WHEN 50 THEN salary*3
WHEN 60 THEN salary*4
ELSE salary
END  newSalary
FROM employees;


②情况2：类似于多重IF语句，实现区间判断
CASE 
WHEN 条件1 THEN 结果1
WHEN 条件2 THEN 结果2
...

ELSE 结果n

END



案例：如果工资>20000,显示级别A
      工资>15000,显示级别B
      工资>10000,显示级别C
      否则，显示D
      
 SELECT salary,
 CASE 
 WHEN salary>20000 THEN 'A'
 WHEN salary>15000 THEN 'B'
 WHEN salary>10000 THEN 'C'
 ELSE 'D'
 END
 AS  a
 FROM employees;   


#案例1 ：查询员工信息表中，所有员工的工资和、工资平均值、最低工资、最高工资、有工资的个数

SELECT SUM(salary),AVG(salary),MIN(salary),MAX(salary),COUNT(salary) FROM employees;

SELECT SUM(salary),AVG(salary),MIN(salary),MAX(salary),COUNT(salary) FROM employees;


#案例2：添加筛选条件
 #①查询emp表中记录数：
SELECT 
  COUNT(employee_id) 
FROM
  employees ;



#②查询emp表中有佣金的人数：
	
	SELECT COUNT(salary) FROM employees;
	


	
	
	#③查询emp表中月薪大于2500的人数：
	SELECT COUNT(salary) FROM employees WHERE salary>2500;
	
	#④查询有领导的人数：
	SELECT COUNT(manager_id) FROM employees;
	
#count的补充介绍★


#1、统计结果集的行数，推荐使用count(*)
	
SELECT COUNT(*) FROM employees;
SELECT COUNT(*) FROM employees WHERE department_id = 30;


SELECT COUNT(1) FROM employees;
SELECT COUNT(1) FROM employees WHERE department_id = 30;


#2、搭配distinct实现去重的统计

#需求：查询有员工的部门个数

SELECT COUNT(DISTINCT department_id) FROM employees;


#思考：每个部门的总工资、平均工资？

SELECT SUM(salary)  FROM employees WHERE department_id = 30;
SELECT SUM(salary)  FROM employees WHERE department_id = 50;


SELECT SUM(salary) ,department_id
FROM employees
GROUP BY department_id;

#1）简单的分组
#案例1：查询每个工种的员工平均工资
SELECT AVG(salary),job_id
FROM employees
GROUP BY job_id;

SELECT AVG(salary),job_id
FROM employees
GROUP BY job_id;

SELECT AVG(salary),job_id
FROM employees
GROUP BY job_id;

#进阶6：分组查询
/*
语法：

select 查询列表
from 表名
where 筛选条件
group by 分组列表
having 分组后筛选
order by 排序列表;

执行顺序：
①from子句
②where子句
③group by 子句
④having子句
⑤select子句
⑥order by子句






特点：
①查询列表往往是  分组函数和被分组的字段 ★
②分组查询中的筛选分为两类
			筛选的基表	使用的关键词		位置
分组前筛选		原始表		where			group by 的前面																																						

分组后筛选		分组后的结果集  having			group by的后面

where——group by ——hav ing

问题：分组函数做条件只可能放在having后面！！！

*/

#1）简单的分组
#案例1：查询每个工种的员工平均工资

SELECT AVG(salary),job_id
FROM employees
GROUP BY job_id;

#案例2：查询每个领导的手下人数

SELECT COUNT(*),manager_id
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id;




#2）可以实现分组前的筛选
#案例1：查询邮箱中包含a字符的 每个部门的最高工资
SELECT MAX(salary) 最高工资,department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;


#案例2：查询每个领导手下有奖金的员工的平均工资
SELECT AVG(salary) 平均工资,manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;




#3）可以实现分组后的筛选
#案例1：查询哪个部门的员工个数>5
#分析1：查询每个部门的员工个数
SELECT COUNT(*) 员工个数,department_id
FROM employees
GROUP BY department_id

#分析2：在刚才的结果基础上，筛选哪个部门的员工个数>5

SELECT COUNT(*) 员工个数,department_id
FROM employees

GROUP BY department_id
HAVING  COUNT(*)>5;


#案例2：每个工种有奖金的员工的最高工资>12000的工种编号和最高工资

SELECT job_id,MAX(salary)
FROM employees
WHERE commission_pct  IS NOT NULL
GROUP BY job_id
HAVING MAX(salary)>12000;


#案例3：领导编号>102的    每个领导手下的最低工资大于5000的最低工资
#分析1：查询每个领导手下员工的最低工资
SELECT MIN(salary) 最低工资,manager_id
FROM employees
GROUP BY manager_id;

#分析2：筛选刚才1的结果
SELECT MIN(salary) 最低工资,manager_id
FROM employees
WHERE manager_id>102
GROUP BY manager_id
HAVING MIN(salary)>5000 ;




#4）可以实现排序
#案例：查询没有奖金的员工的最高工资>6000的工种编号和最高工资,按最高工资升序
#分析1：按工种分组，查询每个工种有奖金的员工的最高工资
SELECT MAX(salary) 最高工资,job_id
FROM employees
WHERE commission_pct IS  NULL
GROUP BY job_id


#分析2：筛选刚才的结果，看哪个最高工资>6000
SELECT MAX(salary) 最高工资,job_id
FROM employees
WHERE commission_pct IS  NULL
GROUP BY job_id
HAVING MAX(salary)>6000


#分析3：按最高工资升序
SELECT MAX(salary) 最高工资,job_id
FROM employees
WHERE commission_pct IS  NULL
GROUP BY job_id
HAVING MAX(salary)>6000
ORDER BY MAX(salary) ASC;


#5）按多个字段分组
#案例：查询每个工种每个部门的最低工资,并按最低工资降序
#提示：工种和部门都一样，才是一组

工种	部门  工资
1	10	10000
1       20      2000
2	20
3       20
1       10
2       30
2       20


SELECT MIN(salary) 最低工资,job_id,department_id
FROM employees
GROUP BY job_id,department_id;





#进阶6：连接查询
/*
说明：又称多表查询，当查询语句涉及到的字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行

	发生原因：没有有效的连接条件
	如何避免：添加有效的连接条件

分类：

	按年代分类：
	1、sql92标准:仅仅支持内连接
		内连接：
			等值连接
			非等值连接
			自连接
	2、sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接
	
	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接
		
		交叉连接


*/
#引入案例
#查询女神名和对应的男神名
SELECT * FROM beauty;

SELECT * FROM boys;


SELECT NAME,boyName FROM boys,beauty
WHERE beauty.boyfriend_id= boys.id;

#---------------------------------sql92标准------------------
#一、内连接
/*
语法:
select 查询列表
from 表1 别名,表2 别名
where 连接条件
and 筛选条件
group by 分组列表
having 分组后筛选
order by 排序列表

执行顺序：

1、from子句
2、where子句
3、and子句
4、group by子句
5、having子句
6、select子句
7、order by子句




*/


#一）等值连接
/*

① 多表等值连接的结果为多表的交集部分
②n表连接，至少需要n-1个连接条件
③ 多表的顺序没有要求
④一般需要为表起别名
⑤可以搭配前面介绍的所有子句使用，比如排序、分组、筛选


*/



#案例1：查询女神名和对应的男神名
SELECT NAME,boyName 
FROM boys,beauty
WHERE beauty.boyfriend_id= boys.id;

#案例2：查询员工名和对应的部门名

SELECT last_name,department_name
FROM employees,departments
WHERE employees.`department_id`=departments.`department_id`;



#2、为表起别名
/*
①提高语句的简洁度
②区分多个重名的字段

注意：如果为表起了别名，则查询的字段就不能使用原来的表名去限定

*/
#查询员工名、工种号、工种名

SELECT e.last_name,e.job_id,j.job_title
FROM employees  e,jobs j
WHERE e.`job_id`=j.`job_id`;


#3、两个表的顺序是否可以调换

#查询员工名、工种号、工种名

SELECT e.last_name,e.job_id,j.job_title
FROM jobs j,employees e
WHERE e.`job_id`=j.`job_id`;


#4、可以加筛选


#案例：查询有奖金的员工名、部门名

SELECT last_name,department_name,commission_pct

FROM employees e,departments d
WHERE e.`department_id`=d.`department_id`
AND e.`commission_pct` IS NOT NULL;

#案例2：查询城市名中第二个字符为o的部门名和城市名

SELECT department_name,city
FROM departments d,locations l
WHERE d.`location_id` = l.`location_id`
AND city LIKE '_o%';

#5、可以加分组


#案例1：查询每个城市的部门个数

SELECT COUNT(*) 个数,city
FROM departments d,locations l
WHERE d.`location_id`=l.`location_id`
GROUP BY city;


#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name,d.`manager_id`,MIN(salary)
FROM departments d,employees e
WHERE d.`department_id`=e.`department_id`
AND commission_pct IS NOT NULL
GROUP BY department_name,d.`manager_id`;
#6、可以加排序


#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序

SELECT job_title,COUNT(*)
FROM employees e,jobs j
WHERE e.`job_id`=j.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;




#7、可以实现三表连接？

#案例：查询员工名、部门名和所在的城市

SELECT last_name,department_name,city
FROM employees e,departments d,locations l
WHERE e.`department_id`=d.`department_id`
AND d.`location_id`=l.`location_id`
AND city LIKE 's%'

ORDER BY department_name DESC;



#二）非等值连接


#案例1：查询员工的工资和工资级别


SELECT salary,grade_level
FROM employees e,job_grades g
WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`
AND g.`grade_level`='A';

/*
select salary,employee_id from employees;
select * from job_grades;
CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  int,
 highest_sal int);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

*/




#三）自连接



#案例：查询 员工名和上级的名称

SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
FROM employees e,employees m
WHERE e.`manager_id`=m.`employee_id`;



#------------------------SQL99语法
#一、内连接
语法：

SELECT 查询列表
FROM 表名1 别名
【INNER】 JOIN  表名2 别名
ON 连接条件
WHERE 筛选条件
GROUP BY 分组列表
HAVING 分组后筛选
ORDER BY 排序列表;


SQL92和SQL99的区别：

	SQL99，使用JOIN关键字代替了之前的逗号，并且将连接条件和筛选条件进行了分离，提高阅读性！！！



#一）等值连接
#①简单连接
#案例：查询员工名和部门名

SELECT last_name,department_name
FROM departments d 
 JOIN  employees e 
ON e.department_id =d.department_id;



#②添加筛选条件
#案例1：查询部门编号>100的部门名和所在的城市名
SELECT department_name,city
FROM departments d
JOIN locations l
ON d.`location_id` = l.`location_id`
WHERE d.`department_id`>100;


#③添加分组+筛选
#案例1：查询每个城市的部门个数

SELECT COUNT(*) 部门个数,l.`city`
FROM departments d
JOIN locations l
ON d.`location_id`=l.`location_id`
GROUP BY l.`city`;




#④添加分组+筛选+排序
#案例1：查询部门中员工个数>10的部门名，并按员工个数降序

SELECT COUNT(*) 员工个数,d.department_name
FROM employees e
JOIN departments d
ON e.`department_id`=d.`department_id`
GROUP BY d.`department_id`
HAVING 员工个数>10
ORDER BY 员工个数 DESC;







#二）非等值连接

#案例：查询部门编号在10-90之间的员工的工资级别，并按级别进行分组
SELECT * FROM sal_grade;


SELECT COUNT(*) 个数,grade
FROM employees e
JOIN sal_grade g
ON e.`salary` BETWEEN g.`min_salary` AND g.`max_salary`
WHERE e.`department_id` BETWEEN 10 AND 90
GROUP BY g.grade;




#三）自连接

#案例：查询员工名和对应的领导名

SELECT e.`last_name`,m.`last_name`
FROM employees e
JOIN employees m
ON e.`manager_id`=m.`employee_id`;



#二、外连接
说明：查询结果为主表中所有的记录，如姑婆从标有匹配项，则为显示匹配项，则显示 NULL 应用场景：一般用于查询主表中有但从表中没有的记录特点： 1 外连接分主从表，量表的顺寻不能任意调换 2 做链接的话， 
LEFT JOIN 左边为主表有连接的话， 
RIGHT JOIN 右边为朱标语法 
  SELECT 
    查询列表 
  FROM
    表 1 别名 LEFT | 
    RIGHT OUTER JOIN 表 2 别名 
      ON 联接条件 
  WHERE 筛选条件 USE girls 
  #案例1：查询所有女神的记录以及对象的男神名，如果没有对应的男神名
  
  左连接
  SELECT b.*,bo*
  FROM beauty b
  LEFT JOIN boys bo ON b.`boyfriend_id`=bo.`id`
  WHERE bo.`id` IS NULL;
  
  #有链接
  
   SELECT b.*,NAME*
  FROM beauty b
  LEFT JOIN boys bo ON b.`boyfriend_id`=bo.`id`
  WHERE bo.`id` IS NULL;
  

  
  DAY 3
01 USE myemployees;

#1. 查询公司员工工资的最大值，最小值，平均值，总和
SELECT MAX(salary),MIN(salary),AVG(salary),SUM(salary)
FROM employees;


#2. 查询员工表中的最大入职时间和最小入职时间的相差天数 （DIFFRENCE）

SELECT DATEDIFF(MAX(hiredate),MIN(hiredate)) DIFFRENCE
FROM employees;


#3. 查询部门编号为 90 的员工个数

SELECT COUNT(*) 员工个数
FROM employees
WHERE department_id = 90;

02案例讲解，连接查询
#1. 显示所有员工的姓名，部门号和部门名称。
SELECT e.last_name,d.department_id,d.department_name
FROM employees e
JOIN departments d ON e.`department_id`=d.`department_id`;




#2. 查询 90 号部门员工的 job_id 和 90 号部门的 location_id
SELECT e.`job_id`,d.`location_id`
FROM employees e
JOIN departments d ON e.`department_id`=d.`department_id`
WHERE e.`department_id`=90;


#3. 选择所有有奖金的员工的
#last_name , department_name , location_id , city

SELECT last_name , department_name , location_id , city
FROM employees e
JOIN departments d ON e.`department_id` = d.`department_id`
JOIN locations l ON d.`location_id` = l.`location_id`
WHERE e.`commission_pct` IS NOT NULL;


#4. 选择city在Toronto工作的员工的
#last_name , job_id , department_id , department_name

SELECT last_name , job_id , department_id , department_name
FROM employees e
JOIN departments d ON e.`department_id` = d.`department_id`
JOIN locations l ON d.`location_id` = l.`location_id`
WHERE city = 'Toronto';




#5.查询每个工种、每个部门的部门名、工种名和最低工资

SELECT j.`job_title`,d.`department_name`,MIN(salary) 最低工资
FROM employees e
JOIN departments d ON e.`department_id`=d.`department_id`
JOIN jobs j ON e.`job_id`=j.`job_id`
GROUP BY j.`job_id`,d.`department_id`;


#6.查询每个国家下的部门个数大于 2 的国家编号

SELECT l.`country_id`,COUNT(*) 部门个数
FROM departments d
JOIN locations l ON d.`location_id`=l.`location_id`
GROUP BY l.`country_id`
HAVING 部门个数>2;

#7、选择指定员工的姓名，员工号，以及他的管理者的姓名和员工号，结果类似于下面的格
式 #employees Emp# manager  Mgr#
#kochhar   101   king    100
SELECT 
    e.last_name employees,
    e.employee_id "Emp#",
    m.last_name manager,
    m.employee_id  "Mgr#"
FROM
    employees m 
JOIN employees e 
ON e.manager_id = m.employee_id ;


03连接查询
#进阶6：连接查询
/*
说明：又称多表查询，当查询语句涉及到的字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象：表1 有m行，表2有n行，结果=m*n行

	发生原因：没有有效的连接条件
	如何避免：添加有效的连接条件

分类：

	按年代分类：
	1、sql92标准:仅仅支持内连接
		内连接：
			等值连接
			非等值连接
			自连接
	2、sql99标准【推荐】：支持内连接+外连接（左外和右外）+交叉连接
	
	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接
		
		交叉连接


*/
#引入案例
#查询女神名和对应的男神名
SELECT * FROM beauty;

SELECT * FROM boys;


SELECT NAME,boyName FROM boys,beauty
WHERE beauty.boyfriend_id= boys.id;

#---------------------------------sql92标准------------------
#一、内连接
/*
语法:
select 查询列表
from 表1 别名,表2 别名
where 连接条件
and 筛选条件
group by 分组列表
having 分组后筛选
order by 排序列表

执行顺序：

1、from子句
2、where子句
3、and子句
4、group by子句
5、having子句
6、select子句
7、order by子句




*/


#一）等值连接
/*

① 多表等值连接的结果为多表的交集部分
②n表连接，至少需要n-1个连接条件
③ 多表的顺序没有要求
④一般需要为表起别名
⑤可以搭配前面介绍的所有子句使用，比如排序、分组、筛选


*/



#案例1：查询女神名和对应的男神名
SELECT NAME,boyName 
FROM boys,beauty
WHERE beauty.boyfriend_id= boys.id;

#案例2：查询员工名和对应的部门名

SELECT last_name,department_name
FROM employees,departments
WHERE employees.`department_id`=departments.`department_id`;



#2、为表起别名
/*
①提高语句的简洁度
②区分多个重名的字段

注意：如果为表起了别名，则查询的字段就不能使用原来的表名去限定

*/
#查询员工名、工种号、工种名

SELECT e.last_name,e.job_id,j.job_title
FROM employees  e,jobs j
WHERE e.`job_id`=j.`job_id`;


#3、两个表的顺序是否可以调换

#查询员工名、工种号、工种名

SELECT e.last_name,e.job_id,j.job_title
FROM jobs j,employees e
WHERE e.`job_id`=j.`job_id`;


#4、可以加筛选


#案例：查询有奖金的员工名、部门名

SELECT last_name,department_name,commission_pct

FROM employees e,departments d
WHERE e.`department_id`=d.`department_id`
AND e.`commission_pct` IS NOT NULL;

#案例2：查询城市名中第二个字符为o的部门名和城市名

SELECT department_name,city
FROM departments d,locations l
WHERE d.`location_id` = l.`location_id`
AND city LIKE '_o%';

#5、可以加分组


#案例1：查询每个城市的部门个数

SELECT COUNT(*) 个数,city
FROM departments d,locations l
WHERE d.`location_id`=l.`location_id`
GROUP BY city;


#案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name,d.`manager_id`,MIN(salary)
FROM departments d,employees e
WHERE d.`department_id`=e.`department_id`
AND commission_pct IS NOT NULL
GROUP BY department_name,d.`manager_id`;
#6、可以加排序


#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序

SELECT job_title,COUNT(*)
FROM employees e,jobs j
WHERE e.`job_id`=j.`job_id`
GROUP BY job_title
ORDER BY COUNT(*) DESC;




#7、可以实现三表连接？

#案例：查询员工名、部门名和所在的城市

SELECT last_name,department_name,city
FROM employees e,departments d,locations l
WHERE e.`department_id`=d.`department_id`
AND d.`location_id`=l.`location_id`
AND city LIKE 's%'

ORDER BY department_name DESC;



#二）非等值连接


#案例1：查询员工的工资和工资级别


SELECT salary,grade_level
FROM employees e,job_grades g
WHERE salary BETWEEN g.`lowest_sal` AND g.`highest_sal`
AND g.`grade_level`='A';

/*
select salary,employee_id from employees;
select * from job_grades;
CREATE TABLE job_grades
(grade_level VARCHAR(3),
 lowest_sal  int,
 highest_sal int);

INSERT INTO job_grades
VALUES ('A', 1000, 2999);

INSERT INTO job_grades
VALUES ('B', 3000, 5999);

INSERT INTO job_grades
VALUES('C', 6000, 9999);

INSERT INTO job_grades
VALUES('D', 10000, 14999);

INSERT INTO job_grades
VALUES('E', 15000, 24999);

INSERT INTO job_grades
VALUES('F', 25000, 40000);

*/




#三）自连接



#案例：查询 员工名和上级的名称

SELECT e.employee_id,e.last_name,m.employee_id,m.last_name
FROM employees e,employees m
WHERE e.`manager_id`=m.`employee_id`;



#------------------------SQL99语法
#一、内连接
语法：

SELECT 查询列表
FROM 表名1 别名
【INNER】 JOIN  表名2 别名
ON 连接条件
WHERE 筛选条件
GROUP BY 分组列表
HAVING 分组后筛选
ORDER BY 排序列表;


SQL92和SQL99的区别：

	SQL99，使用JOIN关键字代替了之前的逗号，并且将连接条件和筛选条件进行了分离，提高阅读性！！！



#一）等值连接
#①简单连接
#案例：查询员工名和部门名

SELECT last_name,department_name
FROM departments d 
 JOIN  employees e 
ON e.department_id =d.department_id;



#②添加筛选条件
#案例1：查询部门编号>100的部门名和所在的城市名
SELECT department_name,city
FROM departments d
JOIN locations l
ON d.`location_id` = l.`location_id`
WHERE d.`department_id`>100;


#③添加分组+筛选
#案例1：查询每个城市的部门个数

SELECT COUNT(*) 部门个数,l.`city`
FROM departments d
JOIN locations l
ON d.`location_id`=l.`location_id`
GROUP BY l.`city`;




#④添加分组+筛选+排序
#案例1：查询部门中员工个数>10的部门名，并按员工个数降序

SELECT COUNT(*) 员工个数,d.department_name
FROM employees e
JOIN departments d
ON e.`department_id`=d.`department_id`
GROUP BY d.`department_id`
HAVING 员工个数>10
ORDER BY 员工个数 DESC;







#二）非等值连接

#案例：查询部门编号在10-90之间的员工的工资级别，并按级别进行分组
SELECT * FROM sal_grade;


SELECT COUNT(*) 个数,grade
FROM employees e
JOIN sal_grade g
ON e.`salary` BETWEEN g.`min_salary` AND g.`max_salary`
WHERE e.`department_id` BETWEEN 10 AND 90
GROUP BY g.grade;




#三）自连接

#案例：查询员工名和对应的领导名

SELECT e.`last_name`,m.`last_name`
FROM employees e
JOIN employees m
ON e.`manager_id`=m.`employee_id`;



#二、外连接

/*

说明：查询结果为主表中所有的记录，如果从表有匹配项，则显示匹配项；如果从表没有匹配项，则显示null

应用场景：一般用于查询主表中有但从表没有的记录

特点：

1、外连接分主从表，两表的顺序不能任意调换
2、左连接的话，left join左边为主表
   右连接的话，right join右边为主表
   

语法：

select 查询列表
from 表1 别名
left|right|full 【outer】 join 表2 别名
on 连接条件
where 筛选条件;

*/
USE girls;
#案例1：查询所有女神记录，以及对应的男神名，如果没有对应的男神，则显示为null

#左连接
SELECT b.*,bo.*
FROM beauty b
LEFT JOIN boys bo ON b.`boyfriend_id` = bo.`id`;

#右连接
SELECT b.*,bo.*
FROM boys bo
RIGHT JOIN  beauty b ON b.`boyfriend_id` = bo.`id`;







#案例2：查哪个女神没有男朋友

#左连接
SELECT b.`name`
FROM beauty b
LEFT JOIN boys bo ON b.`boyfriend_id` = bo.`id`
WHERE bo.`id`  IS NULL;

#右连接
SELECT b.*,bo.*
FROM boys bo
RIGHT JOIN  beauty b ON b.`boyfriend_id` = bo.`id`
WHERE bo.`id`  IS NULL;


#案例3：查询哪个部门没有员工，并显示其部门编号和部门名

SELECT COUNT(*) 部门个数
FROM departments d
LEFT JOIN employees e ON d.`department_id` = e.`department_id`
WHERE e.`employee_id` IS NULL;



04sql99语法下的外连接
#一、查询编号>3 的女神的男朋友信息，如果有则列出详细，如果没有，用 null 填充
4   小红     大飞
5   小白     大黄
6   小绿     NULL



SELECT b.id,b.name,bo.*
FROM beauty b
LEFT JOIN boys bo ON b.boyfriend_id = bo.id
WHERE b.id>3;



#二、查询哪个城市没有部门

SELECT l.city
FROM departments d
RIGHT JOIN locations l ON l.location_id = d.location_id
WHERE d.`department_id` IS NULL;


#三、查询部门名为 SAL 或 IT 的员工信息

SELECT d.*,e.*
FROM departments d
LEFT JOIN employees e ON d.`department_id` = e.`department_id`
WHERE d.`department_name` = 'SAL' OR d.`department_name`='IT';



05子查询
#子查询
/*
说明：当一个查询语句中又嵌套了另一个完整的select语句，则被嵌套的select语句称为子查询或内查询
外面的select语句称为主查询或外查询。


分类：

按子查询出现的位置进行分类：

1、select后面
	要求：子查询的结果为单行单列（标量子查询）
2、from后面
	要求：子查询的结果可以为多行多列
3、where或having后面 ★
	要求：子查询的结果必须为单列
		单行子查询
		多行子查询
4、exists后面
	要求：子查询结果必须为单列（相关子查询）
	
特点：
	1、子查询放在条件中，要求必须放在条件的右侧
	2、子查询一般放在小括号中
	3、子查询的执行优先于主查询
	4、单行子查询对应了 单行操作符：> < >= <= = <>
	   多行子查询对应了 多行操作符：any/some  all in   



*/
#一、放在where或having后面
#一）单行子查询

#案例1：谁的工资比 Abel 高?


#①查询Abel的工资
SELECT salary
FROM employees
WHERE last_name  = 'Abel'
#②查询salary>①的员工信息
SELECT last_name,salary
FROM employees
WHERE salary>(
	SELECT salary
	FROM employees
	WHERE last_name  <> 'Abel'

);

#案例2：返回job_id与141号员工相同，salary比143号员工多的员工姓名，job_id 和工资
#①查询141号员工的job_id
SELECT job_id
FROM employees
WHERE employee_id = 141

#②查询143号员工的salary

SELECT salary
FROM employees
WHERE employee_id = 143

#③查询job_id=① and salary>②的信息
SELECT last_name,job_id,salary
FROM employees
WHERE job_id = (
	SELECT job_id
	FROM employees
	WHERE employee_id = 141
) AND salary>(

	SELECT salary
	FROM employees
	WHERE employee_id = 143

);



#案例3：返回公司工资最少的员工的last_name,job_id和salary

#①查询最低工资
SELECT MIN(salary)
FROM employees

#②查询salary=①的员工的last_name,job_id和salary
SELECT last_name,job_id,salary
FROM employees
WHERE salary=(
	SELECT MIN(salary)
	FROM employees

);

#案例4：查询最低工资大于50号部门最低工资的部门id和其最低工资

#①查询50号部门的最低工资
SELECT MIN(salary)
FROM employees
WHERE department_id = 50


#②查询各部门的最低工资，筛选看哪个部门的最低工资>①

SELECT MIN(salary),department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary)>(

	SELECT MIN(salary)
	FROM employees
	WHERE department_id = 50
);


#二）多行子查询
/*

in:判断某字段是否在指定列表内  
x in(10,30,50)


any/some:判断某字段的值是否满足其中任意一个

x>any(10,30,50)
x>min()

x=any(10,30,50)
x in(10,30,50)


all:判断某字段的值是否满足里面所有的

x >all(10,30,50)
x >max()

*/


#案例1：返回location_id是1400或1700的部门中的所有员工姓名

#①查询location_id是1400或1700的部门
SELECT department_id
FROM departments
WHERE location_id IN(1400,1700)


#②查询department_id = ①的姓名
SELECT last_name
FROM employees
WHERE department_id IN(
	SELECT DISTINCT department_id
	FROM departments
	WHERE location_id IN(1400,1700)

);



#题目：返回其它部门中比job_id为‘IT_PROG’部门任一工资低的员工的员工号、姓名、job_id 以及salary

#①查询job_id为‘IT_PROG’部门的工资
SELECT DISTINCT salary
FROM employees
WHERE job_id = 'IT_PROG'


#②查询其他部门的工资<任意一个①的结果

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary<ANY(

	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'


);



等价于

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary<(

	SELECT MAX(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'


);




#案例3：返回其它部门中比job_id为‘IT_PROG’部门所有工资都低的员工 的员工号、姓名、job_id 以及salary

#①查询job_id为‘IT_PROG’部门的工资
SELECT DISTINCT salary
FROM employees
WHERE job_id = 'IT_PROG'


#②查询其他部门的工资<所有①的结果

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary<ALL(

	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'


);



等价于

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary<(

	SELECT MIN(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'


);


#二、放在select后面

#案例；查询部门编号是50的员工个数

SELECT 
(
	SELECT COUNT(*)
	FROM employees
	WHERE department_id = 50
)  个数;


#三、放在from后面

#案例：查询每个部门的平均工资的工资级别
#①查询每个部门的平均工资

SELECT AVG(salary),department_id
FROM employees
GROUP BY department_id



#②将①和sal_grade两表连接查询

SELECT dep_ag.department_id,dep_ag.ag,g.grade
FROM sal_grade g
JOIN (

	SELECT AVG(salary) ag,department_id
	FROM employees
	GROUP BY department_id

) dep_ag ON dep_ag.ag BETWEEN g.min_salary AND g.max_salary;


#四、放在exists后面



#案例1 ：查询有无名字叫“张三丰”的员工信息
SELECT EXISTS(
	SELECT * 
	FROM employees
	WHERE last_name = 'Abel'

) 有无Abel;


#案例2：查询没有女朋友的男神信息

USE girls;

SELECT bo.*
FROM boys bo
WHERE bo.`id` NOT IN(
	SELECT boyfriend_id
	FROM beauty b
)



SELECT bo.*
FROM boys bo
WHERE NOT EXISTS(
	SELECT boyfriend_id
	FROM beauty b
	WHERE bo.id = b.boyfriend_id
);


06案例讲解（子查询）
#1. 查询和 Zlotkey 相同部门的员工姓名和工资

#①查询Zlotkey的部门编号
SELECT department_id
FROM employees
WHERE last_name = 'Zlotkey'

#②查询department_id = ①的员工姓名和工资
SELECT last_name,salary
FROM employees
WHERE department_id = (
	SELECT department_id
	FROM employees
	WHERE last_name = 'Zlotkey'


);


#2. 查询工资比公司平均工资高的员工的员工号，姓名和工资。

#①查询平均工资
SELECT AVG(salary)
FROM employees

#②查询salary>①的信息
SELECT employee_id,last_name,salary
FROM employees
WHERE salary>(
	SELECT AVG(salary)
	FROM employees
);

#进阶8：分页查询
/*
应用场景：当页面上的数据，一页显示不全，则需要分页显示

分页查询的sql命令请求数据库服务器——>服务器响应查询到的多条数据——>前台页面



语法：

select 查询列表
from 表1 别名
join 表2 别名
on 连接条件
where 筛选条件
group by 分组
having 分组后筛选
order by 排序列表
limit 起始条目索引,显示的条目数

执行顺序：

1》from子句
2》join子句
3》on子句
4》where子句
5》group by子句
6》having子句
7》select子句
8》order by子句
9》limit子句


特点：
①起始条目索引如果不写，默认是0
②limit后面支持两个参数
参数1：显示的起始条目索引
参数2：条目数

公式：

假如要显示的页数是page，每页显示的条目数为size

select *
from employees
limit (page-1)*size,size;

page	size=10
1                       limit 0,10
2			limit 10,10
3			limit 20,10
4			limit 30,10


*/





#案例1：查询员工信息表的前5条
SELECT * FROM employees LIMIT 0,5;
#完全等价于
SELECT * FROM employees LIMIT 5;

#案例2：查询有奖金的，且工资较高的第11名到第20名
SELECT 
    * 
FROM
    employees 
WHERE commission_pct IS NOT NULL 
ORDER BY salary DESC
LIMIT 10,10 ;


#练习：查询年薪最高的前10名

SELECT last_name,salary,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
ORDER BY 年薪 DESC
LIMIT 0,10;

#进阶8：分页查询
/*
应用场景：当页面上的数据，一页显示不全，则需要分页显示

分页查询的sql命令请求数据库服务器——>服务器响应查询到的多条数据——>前台页面



语法：

select 查询列表
from 表1 别名
join 表2 别名
on 连接条件
where 筛选条件
group by 分组
having 分组后筛选
order by 排序列表
limit 起始条目索引,显示的条目数

执行顺序：

1》from子句
2》join子句
3》on子句
4》where子句
5》group by子句
6》having子句
7》select子句
8》order by子句
9》limit子句


特点：
①起始条目索引如果不写，默认是0
②limit后面支持两个参数
参数1：显示的起始条目索引
参数2：条目数

公式：

假如要显示的页数是page，每页显示的条目数为size

select *
from employees
limit (page-1)*size,size;

page	size=10
1                       limit 0,10
2			limit 10,10
3			limit 20,10
4			limit 30,10


*/





#案例1：查询员工信息表的前5条
SELECT * FROM employees LIMIT 0,5;
#完全等价于
SELECT * FROM employees LIMIT 5;

#案例2：查询有奖金的，且工资较高的第11名到第20名
SELECT 
    * 
FROM
    employees 
WHERE commission_pct IS NOT NULL 
ORDER BY salary DESC
LIMIT 10,10 ;


#进阶9：联合查询
/*
说明：当查询结果来自于多张表，但多张表之间没有关联，这个时候往往使用联合查询，也称为union查询

语法：
select 查询列表 from 表1  where 筛选条件  
	union
select 查询列表 from 表2  where 筛选条件  


特点：

1、多条待联合的查询语句的查询列数必须一致，查询类型、字段意义最好一致
2、union实现去重查询
   union all 实现全部查询，包含重复项
*/

#案例：查询所有国家的年龄>20岁的用户信息

SELECT * FROM usa WHERE uage >20 UNION
SELECT * FROM chinese WHERE age >20 ;


#案例2：查询所有国家的用户姓名和年龄

SELECT uname,uage FROM usa
UNION
SELECT age,`name` FROM chinese;


#案例3：union自动去重/union all 可以支持重复项


SELECT 1,'范冰冰' 
UNION ALL
SELECT 1,'范冰冰' 
UNION  ALL
SELECT 1,'范冰冰' 
UNION  ALL
SELECT 1,'范冰冰' ;



#DDL语言
/*
说明：Data Define Language数据定义语言,用于对数据库和表的管理和操作



*/

#---------------------------库的管理------------------------√

#一、创建数据库
CREATE DATABASE stuDB;
CREATE DATABASE IF NOT EXISTS stuDB;


#二、删除数据库

DROP DATABASE stuDB;

DROP DATABASE IF EXISTS stuDB;





#---------------------------表的管理------------------------


#一、创建表 ★
语法：
CREATE TABLE [IF NOT EXISTS] 表名(
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】,
	字段名  字段类型  【字段约束】
	

);


案例：没有添加约束


CREATE TABLE IF NOT EXISTS stuinfo(
	stuid INT ,
	stuname VARCHAR(20),
	stugender CHAR(1),
	email VARCHAR(20),
	borndate DATETIME

);


案例：添加约束
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE IF NOT EXISTS stuinfo(
	stuid INT PRIMARY KEY,#添加了主键约束
	stuname VARCHAR(20) UNIQUE NOT NULL,#添加了唯一约束+非空
	stugender CHAR(1) DEFAULT '男',#添加了默认约束
	email VARCHAR(20) NOT NULL,
	age INT CHECK( age BETWEEN 0 AND 100),#添加了检查约束，mysql不支持
	majorid INT,
	CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major(id)#添加了外键约束

);






#一）数据类型：

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


#二）常见约束
说明：用于限制表中字段的数据的，从而进一步保证数据表的数据是一致的、准确的、可靠的！

NOT NULL 非空：用于限制该字段为必填项
DEFAULT 默认：用于限制该字段没有显式插入值，则直接显式默认值
PRIMARY KEY 主键：用于限制该字段值不能重复，设置为主键列的字段默认不能为空
	一个表只能有一个主键，当然可以是组合主键
	
UNIQUE 唯一：用于限制该字段值不能重复
		字段是否可以为空		一个表可以有几个
		
	主键	×				1个
	唯一    √				n个
CHECK检查：用于限制该字段值必须满足指定条件
	CHECK(age BETWEEN 1 AND 100)
	
	
FOREIGN KEY 外键:用于限制两个表的关系,要求外键列的值必须来自于主表的关联列
	要求：
	①主表的关联列和从表的关联列的类型必须一致，意思一样，名称无要求
	②主表的关联列要求必须是主键
	
	





#二、修改表[了解]

语法：ALTER TABLE 表名 ADD|MODIFY|CHANGE|DROP COLUMN 字段名 字段类型 【字段约束】;

#1.修改表名

ALTER TABLE stuinfo RENAME TO students;


#2.添加字段
ALTER TABLE students ADD COLUMN borndate TIMESTAMP NOT NULL;

DESC students;


#3.修改字段名

ALTER TABLE students CHANGE COLUMN borndate birthday DATETIME NULL;




#4.修改字段类型


ALTER TABLE students MODIFY COLUMN birthday TIMESTAMP ;


#5.删除字段

ALTER TABLE students DROP COLUMN birthday;

DESC students;



#三、删除表 √

DROP TABLE IF EXISTS students;


#四、复制表√


#仅仅复制表的结构

CREATE TABLE newTable2 LIKE major;

#复制表的结构+数据

CREATE TABLE newTable3 SELECT * FROM girls.`beauty`;


#案例：复制employees表中的last_name,department_id,salary字段到新表 emp表，但不复制数据

CREATE TABLE emp 
SELECT last_name,department_id,salary 
FROM myemployees.`employees`
WHERE 1=2;





















































































 

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  SELECT last_name , department_name , location_id , city
FROM employees e
JOIN departments d ON e.`department_id` = d.`department_id`
JOIN locations l ON d.`location_id` = l.`location_id`
WHERE e.`commission_pct` IS NOT NULL;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
     