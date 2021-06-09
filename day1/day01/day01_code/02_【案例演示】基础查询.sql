#1. 下面的语句是否可以执行成功
SELECT last_name , job_id , salary AS sal
FROM employees;





#2. 下面的语句是否可以执行成功
SELECT * FROM employees;


#3. 找出下面语句中的错误
SELECT employee_id , last_name,
salary * 12 "ANNUAL SALARY"
FROM employees;

#4. 显示表 departments 的结构，并查询其中的全部数据

DESC departments;
SHOW COLUMNS FROM departments;

SELECT * FROM departments;


#5. 显示出表 employees 中的全部 job_id（不能重复）

SELECT DISTINCT job_id FROM employees;

#6. 显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT
SELECT CONCAT(employee_id,',',first_name,',',last_name,',',salary,',',IFNULL(commission_pct,''))  AS "OUT_PUT"
FROM employees;

#ifnull(表达式1，表达式2)
/*
表达式1：可能为null的字段或表达式
表达式2：如果表达式1为null，则最终结果显示的值

功能：如果表达式1为null，则显示表达式2，否则显示表达式1

*/

SELECT commission_pct,IFNULL(commission_pct,'空') FROM employees;









