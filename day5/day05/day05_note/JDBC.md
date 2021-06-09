# 本单元目标

### 	1、介绍什么是JDBC

### 	

​		JDBC:Java Database Connectivity java和数据库的连接技术，sun公司推出的一套java应用程序访问数据库的技术规范。

​              规范：抽象类或接口

​            



### 	2、JDBC的好处

### 	3、通过简单案例演示JDBC的使用步骤 【了解】

###         4、介绍JDBC的相关API ★

### 	  

​		DriverManager驱动管理类

​			registDriver(Driver对象)：注册驱动，不推荐使用

​			getConnection(url,user,pwd):获取连接

​		**Connection 连接对象接口**

​                      createStatement():生成命令对象

  		     prepareStatement(sql):生成预编译命令对象

​		**Statement命令对象接口**

​		        executeUpdate(sql):执行增删改语句，返回受影响的行数

​			executeQuery(sql):执行查询语句，返回结果集

​			execute(sql):执行任意sql语句，返回boolean

​		**PreparedStatement预编译命令对象接口**

​			 executeUpdate():执行增删改语句，返回受影响的行数

​			executeQuery():执行查询语句，返回结果集

​			execute():执行任意sql语句，返回boolean

 			setXX(占位符索引，占位符的值)：设置对应索引的占位符的值，类型为XX类型

​			setObject(占位符索引，占位符的值)：设置对应索引的占位符的值，类型为Object类型



​		**ResultSet结果集对象接口**

​			next():下移一行，返回当前行是否有值

​			previous（）：上移一行，返回当前行是否有值

​                        getXX(列索引|列名|别名):返回对应列的值，接收类型为XX

​			getObject(列索引|列名|别名):返回对应列的值，接收类型为Object





### 	5、PreparedStatement和Statement的区别 ★

### 	6、封装JDBCUtils类，用与获取连接和关闭连接

### 	7、批处理

### 	8、演示事务

### 	9、Druid德鲁伊连接池的使用

### 	10、DBUtils开源框架的学习

### 	11、封装DAO【应用】

​	
​	
