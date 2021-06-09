#3. 查询各部门中工资比本部门平均工资高的员工的员工号, 姓名和工资

#①查询各部门的平均工资
SELECT department_id,AVG(salary) ag
FROM employees
GROUP BY department_id

#②将①结果和employees表连接查询

SELECT employee_id,last_name,salary
FROM employees e
JOIN  (
	SELECT department_id,AVG(salary) ag
	FROM employees
	GROUP BY department_id

) dep_ag ON e.department_id = dep_ag.department_id
WHERE e.salary>dep_ag.ag;


#4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名

#①查询姓名中包含字母 u 的员工的部门编号
SELECT DISTINCT department_id
FROM employees
WHERE last_name LIKE '%u%'

#②查询部门号是①的员工号和姓名
SELECT employee_id,last_name
FROM employees
WHERE department_id IN(
	SELECT DISTINCT department_id
	FROM employees
	WHERE last_name LIKE '%u%'

);



#6. 查询管理者是 King 的员工姓名和工资


#①查询管理者是king的编号
SELECT employee_id
FROM employees
WHERE last_name  = 'k_ing'

#②查询哪个员工的领导编号是①
SELECT last_name,salary
FROM employees
WHERE manager_id  IN(
	SELECT employee_id
	FROM employees
	WHERE last_name  = 'k_ing'
);
#3. 查询平均工资最低的部门信息和该部门的平均工资

#①查询各部门的平均工资
SELECT AVG(salary) ag,department_id
FROM employees
GROUP BY department_id



#②查询哪个部门的平均工资最低
SELECT AVG(salary) ag,department_id
FROM employees
GROUP BY department_id
ORDER BY ag 
LIMIT 1

#③连接②和departments表

SELECT d.*,dep_ag.ag
FROM departments d
JOIN (

	SELECT AVG(salary) ag,department_id
	FROM employees
	GROUP BY department_id
	ORDER BY ag 
	LIMIT 1

) dep_ag ON d.department_id = dep_ag.department_id



#7. 各个部门中 最高工资中最低的那个部门的 最低工资是多少
#①查询各部门的最高工资
SELECT MAX(salary) mx,department_id
FROM employees
GROUP BY department_id

#②查询各部门的最高工资最低的那个部门
SELECT department_id
FROM employees
GROUP BY department_id
ORDER BY MAX(salary) 
LIMIT 1


#③查询部门编号是②的部门的最低工资
SELECT MIN(salary),department_id
FROM employees
WHERE department_id = (
	SELECT department_id
	FROM employees
	GROUP BY department_id
	ORDER BY MAX(salary) 
	LIMIT 1

);




























