#测试1-基本SQL-SELECT语句
#1. 下面的语句是否可以执行成功 （true）
SELECT 
  last_name,
  job_id,
  salary AS sal 
FROM
  employees ;

  
#2. 下面的语句是否可以执行成功 （true）
SELECT 
  * 
FROM
  employees ;

  
#3. 找出下面语句中的错误 (false last_name，)
SELECT 
  employee_id,
  last_name,
  salary * 12 “ ANNUAL SALARY ” 
FROM
  employees ;

 
4. 显示表 departments 的结构，并查询其中的全部数据 
DESC departments;
SHOW COLUMNS FROM departments;

5. 显示出表 employees 中的全部 job_id （不能重复） 
SELECT DISTINCT 
  job_id 
FROM
  employees ;

 
6. 显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT 
SELECT 
  CONCAT(
    employee_id,
    ',',
    first_name,
    ',',
    last_name,
    ',',
    salary,
    ',',
    IFNULL(commission_pct, ',')
  ) AS "out_put" 
FROM
  employees ;

#测试2-过滤数据
1. 查询工资大于 12000 的员工姓名和工资 
SELECT 
  last_name,
  salary 
FROM
  employees 
WHERE salary > 12000 ;

2. 查询员工号为 176 的员工的姓名和部门号和年薪 
SELECT 
  last_name,
  department_id,
  salary * 12 * (1+ IFNULL(commission_pct, 0)) 年薪 
FROM
  employees 
WHERE employee_id = 176 ;

										
3. 选择工资不在 5000 到 12000 的员工的姓名和工资 
SELECT 
  last_name,
  salary 
FROM
  employees 
WHERE salary NOT BETWEEN 5000 
  AND 12000 ;

4. 选择在 20 或 50 号部门工作的员工姓名和部门号 
SELECT 
  last_name,
  department_id 
FROM
  employees 
WHERE department_id IN (20, 50) ;

 
5. 选择公司中没有管理者的员工姓名及 job_id 
SELECT 
  last_name,
  job_id 
FROM
  employees 
WHERE manager_id IS NULL ;

6. 选择公司中有奖金的员工姓名，工资和奖金级别 
SELECT 
  last_name,
  salary,
  commission_pct 
FROM
  employees 
WHERE commission_pct IS NOT NULL ;

7. 选择员工姓名的第三个字母是 a 的员工姓名 
SELECT 
  last_name 
FROM
  employees 
WHERE last_name LIKE '__a%' ;

8. 选择姓名中有字母 a 和 e 的员工姓名 
SELECT 
  last_name 
FROM
  employees 
WHERE last_name LIKE '%a%' 
  AND last_name LIKE '%e%' ;

9. 显示出表 employees 表中 first_name 以 'e' 结尾的员工信息 
SELECT * 
FROM
  employees 
WHERE first_name LIKE '%e' ;

10. 显示出表 employees 部门编号在 80-100 之间的姓名、职位 
SELECT 
  last_name,
  job_id 
FROM
  employees 
WHERE department_id BETWEEN 80 
  AND 100 ;


11. 显示出表 employees 的 manager_id 是 100,101,110 的员工姓名、职位 
SELECT 
  last_name,
  job_id 
FROM
  employees 
WHERE manager_id IN (100, 101, 110) ;

 
#测试-排序数据
1. 查询员工的姓名和部门号和年薪，按年薪降序按姓名升序 
SELECT 
  last_name,
 salary * 12 * (1+ IFNULL(commission_pct, 0)) 年薪 
  department_id 
FROM
  employees 
ORDER BY   年薪  ASC,
  last_name DESC ;

2. 选择工资不在 8000 到 17000 的员工的姓名和工资，按工资降序 
SELECT last_name,salary
FROM employees
WHERE salary NOT BETWEEN 8000 AND 12000
ORDER BY  salary DESC;

3. 查询邮箱中包含 e 的员工信息，并先按邮箱的字节数降序，再按部门号升序 
SELECT *
FROM employees
WHERE email LIKE '%e%' 
ORDER BY LENGTH (email) DESC, department_id ASC;
#不会啦 T0T~~~






