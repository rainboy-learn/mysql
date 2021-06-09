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









