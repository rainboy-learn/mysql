# 本单元目标

## 一、为什么要学习数据库

1.持久化数据

2.方便检索

3.存储大量数据

4.共享、安全

5.通过组合分析，获取新的数据





## 二、数据库的相关概念      

​		**DBMS、DB、SQL**

DB:database数据库，存储一系列有组织数据的容器

DBMS：Database Management System数据库管理系统，使用DBMS管理和维护DB

SQL：StructureQueryLanguage结构化查询语言，程序员用于和DBMS通信的语言



## 三、数据库存储数据的特点

1、数据先放在表中，表再放在库中

2、一个库可以有多张表，每张表都有自己的唯一标识名

3、一张表的设计，类似于java中”类"的设计

​      表中的字段的设计，类似于属性的设计

​      表中的单条记录，类似于一个对象

​      表中的所有的记录，类似于对象的集合



​     orm ：object relation mapping 对象关系映射



## 四、初始MySQL

### 1、MySQL产品的介绍        

MySQL 前身属于瑞典的一家公司AB，2008年被sun公司收购，2009年sun被oracle公司收购。



特点：

① 体积小、安装较方便

②开源、免费

③性能高、稳定性好

④兼容性好



### 2、MySQL产品的安装          ★      

基于C/S架构的DBMS，需要安装服务端和客户端

www.oracle.com

MySQL5.5

###  

### 3、MySQL服务的启动和停止     ★

方式一：图形化

右击——计算机管理——服务——MySQL服务



方式二：通过管理员身份运行dos

net start 服务名

net stop 服务名





### 4、MySQL服务的登录和退出     ★    

###   

**方式一：通过dos命令**

mysql -h主机名 -P端口号 -u用户名 -p密码

**注意：**

如果是本机，则-h主机名  可以省略

如果端口号是3306，则-P端口号可以省略

**方式二：通过图形化界面客户端**

通过sqlyog，直接输入用户名、密码等连接进去即可





### 5、MySQL的常见命令和语法规范      

**①常见命令**

show databases             显示当前连接下所有数据库

show tables                    显示当前库中所有表

show tables from 库名  显示指定库中所有表

show  columns from 表名    显示指定表中所有列

use 库名                             打开/使用指定库



**②语法规范**

不区分大小写

每条命令结尾建议用分号

注释：

#单行注释

-- 单行注释

/*多行注释*/











## 五、DQL语言的学习   ★              

DQL:Data Query Language  数据查询语言

select



### 1、基础查询        ★          



语法：

select 查询列表 from 表名;

特点：

①查询结果集是一个虚拟表

②查询列表可以是单个字段、多个字段、常量、表达式、函数，可以是以上的组合

引申1：起别名

select 字段名  as  "别名" from 表名;

select 字段名 " 别名" from 表名;

引申2：+的作用

作用：加法运算

- 如果两个操作数都是数值型，则直接做加法运算

- 如果其中一个为非数值型，则将强值转换成数值型，如果转换失败，则当做0

'123'+4====》127

‘abc’+4====》 4

- 如果其中一个为null，则结果直接为null

引申3：去重

select distinct department_id from employees;

引申4：补充函数

select version();

select database();

select user();

select ifnull(字段名,表达式);

select concat(字符1，字符2,字符3);

select length(字符/字段);获取字节长度

### 

### 2、条件查询  	   ★



**语法：**

select 查询列表 

from 表名

where 筛选条件;



**特点：**

筛选条件的分类：

①按条件表达式筛选

关系运算符：>=   <   <=   >    <>   =

 

②按逻辑表达式筛选

逻辑运算符：and   or   not





③模糊查询

like:一般和通配符搭配使用

​     _ 任意单个字符

​    % 任意多个字符

between and：一般用于判断某字段是否在指定的区间

​		a between 10 and  100

in：一般用于判断某字段是否在指定的列表

​		a  in(10,30,50)



is null:判断null值

​	

### 3、排序查询  	   ★				

**语法：**

select  查询列表

from 表名

where 筛选条件

order by 排序列表 ;

**特点：**

①排序列表可以是 单个字段、多个字段、函数、表达式、别名、列的索引，以及以上的组合

②升序，通过asc

​    降序，通过desc

### 4、常见函数        ★               

说明：sql中的函数分为单行函数和分组函数

调用语法：select 函数名(实参列表);

1》字符函数

concat(str1,str2,..):拼接字符

substr(str,pos):截取从pos开始的所有字符，   起始索引从1开始

substr(str,pos,len):截取len个从pos开始的字符，起始索引从1开始

length(str):获取字节个数

char_length(str):获取字符个数

upper(str):变大写

lower(str):变小写

trim(【substr from】str):去前后指定字符，默认是去空格

left(str,len):从左边截取指定len个数的 字符

right(str,len):从右边截取指定len个数的 字符

lpad(str,substr,len):左填充

rpad(str,substr,len)：右填充

strcmp(str1,str2):比较两个字符的大小

instr(str,substr):获取substr在str中第一次出现的索引

2》数学函数

ceil(x):向上取整

floor(x):向下取整

round(x,d):四舍五入

mod(x,y):取模/取余

truncate(x,d):截断，保留小数点后d位

abs(x):求绝对值



3》日期函数

now():获取当前日期——时间

curtime():只有时间

curdate():只有日期

date_format(date,格式):格式日期为字符

str_to_date(str,格式):将字符转换成日期

datediff(date1,date2):获取两个日期之间的天数差

year(date)

month(date)

...



**4》流程控制函数**

①if(条件，表达式1，表达式2)：如果条件成立，返回表达式1，否则返回表达式2

②case 表达式

when 值1 then 结果1

when 值2 then 结果2

...

else 结果n

end

**③**

**case** 

when 条件1 then 结果1

when 条件2 then 结果2

...

else 结果n

end





### 5、分组函数        ★        

sum求和

avg平均

max最大

min最小

count个数



特点：

1》实参的字段的类型，sum和avg只支持数值型，其他三个可以支持任意类型

2》这五个函数都忽略null值

3》count可以支持以下参数

count(字段)：查询该字段非空值 的个数

count(*) ：查询结果集的行数

count(1)：查询结果集的行数

4》分组函数可以和distinct搭配使用，实现去重的统计

select count(distinct 字段) from 表;



###       

### 6、分组查询		   ★			

**语法：**

select 分组函数,分组的字段

from 表名

where 分组前的筛选条件

group by 分组列表

having 分组后的筛选条件

order by 排序列表;

**特点：**

1》分组列表可以是单个字段、多个字段

2》筛选条件分为两类

​				**筛选的基表		使用的关键字		位置**

分组前筛选	    原始表			where				group by前面



分组后筛选           分组后的结果集	having				group by后面



### 7、连接查询	 	★			

说明：当查询中涉及到了多个字段，则需要通过多表连接

笛卡尔乘积：

​	出现原因：没有有效的连接条件

​	解决办法：添加有效的连接条件

--------------------------SQL92语法------------------------

语法：

**select 查询列表**   ①

**from 表1 别名,表2 别名,... **②

**where 连接条件** ③

**and 筛选条件**④

group by 分组列表⑤

having 分组后筛选⑥

order by 排序列表;⑦



**执行顺序：**

②③④⑤⑥①⑦

--------------------------SQL99语法------------------------

**1》内连接**

语法：

select 查询列表    ①

from 表1 别名②

【inner】 join 表2 别名 on 连接条件  ③

【inner】 join 表3 别名 on 连接条件

where 筛选条件  ④

group by 分组列表⑤

having 分组后的筛选⑥

order by 排序列表⑦



**执行顺序：**

②③④⑤⑥①⑦





### 8、子查询       √                  

### 9、分页查询       ★              

### 10、union联合查询	√			

## 六、DML语言的学习    ★             

### 1、插入语句						

### 2、修改语句						

### 3、删除语句						

## 七、DDL语言的学习  

### 1、库和表的管理	 √				

### 2、常见数据类型介绍  √          

### 3、常见约束  	  √			

## 八、TCL语言的学习

### 	事务和事务处理         