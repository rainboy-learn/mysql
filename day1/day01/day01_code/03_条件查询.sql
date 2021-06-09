#进阶二：条件查询
/*
语法：

select 查询列表
from  表名
where 筛选条件;


执行顺序：
①from子句
②where子句
③select子句


select last_name,first_name from employees where salary>20000;


特点：

1、按关系表达式筛选

关系运算符：>   <    >=   <=     =       <>     
              补充：也可以使用!=,但不建议
2、按逻辑表达式筛选

逻辑运算符：and    or   not
	      补充：也可以使用&&  ||   !  ，但不建议
3、模糊查询

like
in
between and

is null



          

*/
#一、按关系表达式筛选
#案例1：查询部门编号不是100的员工信息
SELECT *
FROM employees
WHERE department_id <> 100;


#案例2：查询工资<15000的姓名、工资
SELECT last_name,salary
FROM employees
WHERE salary<15000;


#二、按逻辑表达式筛选

#案例1：查询部门编号不是 50-100之间员工姓名、部门编号、邮箱
#方式1：
SELECT last_name,department_id,email
FROM employees
WHERE department_id <50 OR department_id>100;

#方式2：


SELECT last_name,department_id,email
FROM employees
WHERE NOT(department_id>=50 AND department_id<=100);



#案例2：查询奖金率>0.03 或者 员工编号在60-110之间的员工信息
SELECT *
FROM employees
WHERE commission_pct>0.03 OR (employee_id >=60 AND employee_id<=110);


#三、模糊查询

#1、like

/*
功能：一般和通配符搭配使用，对字符型数据进行部分匹配查询
常见的通配符：
_ 任意单个字符
% 任意多个字符,支持0-多个
like/not like 
*/

#案例1：查询姓名中包含字符a的员工信息
SELECT *
FROM employees
WHERE last_name LIKE '%a%';

#案例2：查询姓名中包含最后一个字符为e的员工信息
SELECT *
FROM employees
WHERE last_name LIKE '%e';

#案例3：查询姓名中包含第一个字符为e的员工信息
SELECT *
FROM employees
WHERE last_name LIKE 'e%';

#案例4：查询姓名中包含第三个字符为x的员工信息
SELECT *
FROM employees
WHERE last_name LIKE '__x%';

#案例5：查询姓名中包含第二个字符为_的员工信息
SELECT *
FROM employees
WHERE last_name LIKE '_\_%';

SELECT *
FROM employees
WHERE last_name LIKE '_$_%' ESCAPE '$';


#2、in
/*
功能：查询某字段的值是否属于指定的列表之内

a  in(常量值1,常量值2,常量值3,...)
a not in(常量值1,常量值2,常量值3,...)

in/not in
*/

#案例1：查询部门编号是30/50/90的员工名、部门编号


#方式1：
SELECT last_name,department_id
FROM employees
WHERE department_id IN(30,50,90);

#方式2：

SELECT last_name,department_id
FROM employees
WHERE department_id = 30
OR department_id = 50
OR department_id = 90;


#案例2：查询工种编号不是SH_CLERK或IT_PROG的员工信息
#方式1：
SELECT *
FROM employees
WHERE job_id NOT IN('SH_CLERK','IT_PROG');

#方式2：
SELECT *
FROM employees
WHERE NOT(job_id ='SH_CLERK'
OR job_id = 'IT_PROG');


#3、between and

/*
功能：判断某个字段的值是否介于xx之间

between and/not between and

*/


#案例1：查询部门编号是30-90之间的部门编号、员工姓名

#方式1：
SELECT department_id,last_name
FROM employees
WHERE department_id BETWEEN 30 AND 90;

#方式2：

SELECT department_id,last_name
FROM employees
WHERE department_id>=30 AND department_id<=90;


#案例2：查询年薪不是100000-200000之间的员工姓名、工资、年薪

SELECT last_name,salary,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
WHERE salary*12*(1+IFNULL(commission_pct,0))<100000 OR salary*12*(1+IFNULL(commission_pct,0))>200000;



SELECT last_name,salary,salary*12*(1+IFNULL(commission_pct,0)) 年薪
FROM employees
WHERE salary*12*(1+IFNULL(commission_pct,0)) NOT BETWEEN 100000 AND 200000;



#4、is null/is not null

#案例1：查询没有奖金的员工信息
SELECT *
FROM employees
WHERE commission_pct IS NULL;



#案例2：查询有奖金的员工信息
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;


SELECT *
FROM employees
WHERE salary IS 10000;

#----------------对比------------------------------------

=		只能判断普通的内容

IS              只能判断NULL值

<=>             安全等于，既能判断普通内容，又能判断NULL值




SELECT *
FROM employees
WHERE salary <=> 10000;

SELECT *
FROM employees
WHERE commission_pct <=> NULL;


