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

