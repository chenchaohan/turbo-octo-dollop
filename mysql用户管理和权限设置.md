# [centos7下mysql 用户管理和权限设置](https://www.cnblogs.com/dwdw/p/9934898.html)

**1.进入mysql命令行，输入root及密码**
**[root@localhost ~]# mysql -u root -p**
**Enter password:**
**Welcome to the MySQL monitor. Commands end with ; or \g.**
**Your MySQL connection id is 19**
**Server version: 5.7.22 MySQL Community Server (GPL)**

**Copyright (c) 2000, 2018, Oracle and/or its affiliates. All rights reserved.**

**Oracle is a registered trademark of Oracle Corporation and/or its**
**affiliates. Other names may be trademarks of their respective**
**owners.**

**Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.**

**mysql>**

**2.用户管理及权限设置**
**// 管理用户**
**mysql> use mysql;**
**Reading table information for completion of table and column names**
**You can turn off this feature to get a quicker startup with -A**

**Database changed**

**//查询用户**
**mysql> select host,user from user;**
**+-----------+---------------+**
**| host | user |**
**+-----------+---------------+**
**| % | root |**
**| % | test |**
**| localhost | mysql.session |**
**| localhost | mysql.sys |**
**| localhost | root |**
**+-----------+---------------+**
**5 rows in set (0.00 sec)**

**//创建用户（用户：admin，密码:123456）**
**mysql> create user admin identified by '123456';**
**Query OK, 0 rows affected (0.00 sec)**

**// 删除用户admin**
**mysql> drop user admin;**
**Query OK, 0 rows affected (0.00 sec)**

**// 重新创建用户（用户：admins，密码:123456）**
**mysql> create user admins identified by '123456';**
**Query OK, 0 rows affected (0.00 sec)**

**mysql> select host, user from user;**
**+-----------+---------------+**
**| host | user |**
**+-----------+---------------+**
**| % | admins |**
**| % | root |**
**| % | test |**
**| localhost | mysql.session |**
**| localhost | mysql.sys |**
**| localhost | root |**
**+-----------+---------------+**
**6 rows in set (0.00 sec)**

**// 查看用户admins的权限**
**mysql> show grants for admins;**
**+------------------------------------+**
**| Grants for admins@% |**
**+------------------------------------+**
**| GRANT USAGE ON \*.\* TO 'admins'@'%' |**
**+------------------------------------+**
**1 row in set (0.00 sec)**

**// 赋予权限（给用户admins，授予数据库test的查询权限）**
**mysql> grant select on test.\* to admins;**
**Query OK, 0 rows affected (0.00 sec)**

**// 查看用户admins的权限**
**mysql> show grants for admins;**
**+------------------------------------------+**
**| Grants for admins@% |**
**+------------------------------------------+**
**| GRANT USAGE ON \*.\* TO 'admins'@'%' |**
**| GRANT SELECT ON `test`.\* TO 'admins'@'%' |**
**+------------------------------------------+**
**2 rows in set (0.00 sec)**

**// 收回权限（对用户admins，收回数据库test的查询权限）**
**mysql> revoke select on test.\* from admins;**
**Query OK, 0 rows affected (0.01 sec)**

**// 查看用户admins的权限**
**mysql> show grants for admins;**
**+------------------------------------+**
**| Grants for admins@% |**
**+------------------------------------+**
**| GRANT USAGE ON \*.\* TO 'admins'@'%' |**
**+------------------------------------+**
**1 row in set (0.00 sec)**

**// 赋予权限（给用户admins，授予数据库test的查询、更新、删除、插入等权限）**
**mysql> grant select, update, delete, insert on test.\* to admins;**
**Query OK, 0 rows affected (0.00 sec)**

**// 查看用户admins的权限**
**mysql> show grants for admins;**
**+------------------------------------------------------------------+**
**| Grants for admins@% |**
**+------------------------------------------------------------------+**
**| GRANT USAGE ON \*.\* TO 'admins'@'%' |**
**| GRANT SELECT, INSERT, UPDATE, DELETE ON `test`.\* TO 'admins'@'%' |**
**+------------------------------------------------------------------+**
**2 rows in set (0.01 sec)**

**// 赋予权限（给用户admins，授予数据库test的新建表、删除表或删除数据库等权限）**
**mysql> grant create,drop on test.\* to admins;**
**Query OK, 0 rows affected (0.00 sec)**

**// 查看用户admins的权限**
**mysql> show grants for admins;**
**+--------------------------------------------------------------------------------+**
**| Grants for admins@% |**
**+--------------------------------------------------------------------------------+**
**| GRANT USAGE ON \*.\* TO 'admins'@'%' |**
**| GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON `test`.\* TO 'admins'@'%' |**
**+--------------------------------------------------------------------------------+**
**2 rows in set (0.00 sec)**

**// 刷新权限（使设置的权限生效）**
**mysql> flush privileges;**
**Query OK, 0 rows affected (0.00 sec)**




**// 查看root的权限**
**mysql> show grants for root;**
**+-------------------------------------------+**
**| Grants for root@% |**
**+-------------------------------------------+**
**| GRANT ALL PRIVILEGES ON \*.\* TO 'root'@'%' |**
**+-------------------------------------------+**
**1 row in set (0.00 sec)**