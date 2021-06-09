/*
补充：设置自增长列

1、自增长列要求必须设置在一个键上，比如主键或唯一键
2、自增长列要求数据类型为数值型
3、一个表至多有一个自增长列

*/

CREATE TABLE gradeinfo(
	gradeID INT PRIMARY KEY AUTO_INCREMENT,
	gradeName VARCHAR(20)
);

SELECT * FROM gradeinfo;

INSERT INTO gradeinfo VALUES(NULL,'一年级'),(NULL,'2年级'),(NULL,'3年级');


INSERT INTO gradeinfo(gradename)VALUES('一年级'),('2年级'),('3年级');
