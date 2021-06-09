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



















