------bai1-------------
------cau a------------
create user sinhvien02 IDENTIFIED BY sv02;
create user sinhvien03 IDENTIFIED BY sv03;
create user sinhvien04 IDENTIFIED BY sv04;
create user sinhvien05 IDENTIFIED BY sv05;
create user sinhvien06 IDENTIFIED BY sv06;
create user sinhvien07 IDENTIFIED BY sv07;
create user sinhvien08 IDENTIFIED BY sv08;
create user sinhvien09 IDENTIFIED BY sv09;
create user sinhvien10 IDENTIFIED BY sv10;
create user sinhvien11 IDENTIFIED BY sv11;
create user sinhvien12 IDENTIFIED BY sv12;
create user sinhvien13 IDENTIFIED BY sv13;
create user sinhvien14 IDENTIFIED BY sv14;
create user sinhvien15 IDENTIFIED BY sv15;
create user sinhvien16 IDENTIFIED BY sv16;
create user sinhvien17 IDENTIFIED BY sv17;
create user sinhvien18 IDENTIFIED BY sv18;
create user sinhvien19 IDENTIFIED BY sv19;
create user sinhvien20 IDENTIFIED BY sv20;

-----------cau b--------------


CREATE ROLE Role_QUANTRI;

create ROLE Role_NGUOIDUNG;


GRANT CONNECT , resource,oem_monitor, dba to Role_QUANTRI;

GRANT CONNECT , resource,oem_monitor to Role_NGUOIDUNG;




--------------cau c------------------

grant Role_NGUOIDUNG to sinhvien11;
grant Role_NGUOIDUNG to sinhvien12;
grant Role_NGUOIDUNG to sinhvien13;
grant Role_NGUOIDUNG to sinhvien14;
grant Role_NGUOIDUNG to sinhvien15;
grant Role_NGUOIDUNG to sinhvien16;
grant Role_NGUOIDUNG to sinhvien17;
grant Role_NGUOIDUNG to sinhvien18;
grant Role_NGUOIDUNG to sinhvien19;
grant Role_NGUOIDUNG to sinhvien20;

grant Role_QUANTRI to sinhvien01,sinhvien02,sinhvien03,sinhvien04,sinhvien05,sinhvien06,sinhvien07,sinhvien08,sinhvien09,sinhvien10;

select * from dba_sys_privs;

select * from DBA_ROLE_PRIVS
where UPPER(GRANTEE) like '%SINHVIEN03%';


select * from dba_sys_privs where grantee='Role_QUANTRI';

select * from dba_role_privs where grantee='ROLE_NGUOIDUNG';
--------------------------------------------------------

select * from s_customer;


--------------bai 2------------------


---------cau1---------
select ID , name from s_customer 
order  BY ID desc;

-----------cau2------------
select * from s_emp;

SELECT last_name , first_name from s_emp
where ID=23;




----------cau3-----------

select last_name , first_name ,dept_id from s_emp
where s_emp.dept_id =50;


select last_name , first_name ,dept_id from s_emp
where s_emp.dept_id =10;

select  last_name || '_' || first_name as Employees
from s_emp; 


----------------cau 4----------------

select * from s_emp
where first_name   like '%s%';

select * from s_emp
where last_name   like '%s%';

---------------cau 5------------

select  emp.userid, emp.start_date
from    s_emp emp
where   emp.start_date between to_date('14/5/1990','dd/mm/yyyy') and to_date('26/5/1991','dd/mm/yyyy');




----------------cau 6----------------

select last_name , first_name ,salary from s_emp 
where SALARY BETWEEN 1000 and 2000;


-------------cau 7--------------

select  emp.first_name||' '||emp.last_name as Employee_Name, emp.salary as Mounthly_Salary
from    s_emp emp
where   emp.salary > 1350 and emp.dept_id in (31,42,50);



----------cau 8-------------

SELECT last_name ,start_date 
from s_emp
where start_date like '%91%';


---------------cau 9----------------

select  emp.id, emp.first_name||' '||emp.last_name as Employee_Name, emp.salary
from    s_emp emp
where   emp.commission_pct = 15;



-------cau 10-----------

select  last_name, start_date, to_char(next_day(add_months(start_date, 6),'MONDAY'),'fmDdspth "of" MONTH, YYYY')
from    s_emp;

------cau 11-----------


select  name
from    s_product
where   lower(name) like '%ski%';


------------cau 12-------------

select  last_name, start_date, to_char(next_day(add_months(start_date, 6),'MONDAY'),'fmDdspth "of" MONTH, YYYY')
from    s_emp;


--------------cau 13----------


select  count(distinct manager_id)
from    s_emp
where   manager_id is not null;



--------------cau 14--------------

select  max(total) Hightest, min(total) Lowest
from    s_ord;



-------------cau 15-----------


select  pro.id, pro.name, ite.quantity as ORDERED
from    s_item ite join s_product pro on ite.product_id = pro.id
where   ite.ord_id = 101;



------------cau 16-------------

select  cus.id, cus.name, ord.id
from    s_customer cus left join s_ord ord on cus.id = ord.customer_id
order by cus.id;


-------------cau 17-------------


select  ord.customer_id, ite.product_id, ite.quantity
from    s_item ite join s_ord ord on ite.ord_id = ord.id
where   ord.total > 100000;


------------cau 18---------------

select  emp.id, emp.first_name||' '||emp.last_name as Employee_Name
from    s_emp emp
where   emp.id not in ( select distinct emp1.manager_id
                        from    s_emp emp1
                        where   emp1.manager_id is not null)
order by emp.id;



---------cau 19--------------

select  name
from    s_product
where   name like 'Pro%'
order by name;


-----------cau 20-------------


select  name, short_desc
from    s_product
where   short_desc like '%bicycle%';


---------cau 21---------------


select  short_desc
from    s_product;


------------cau 22-----------


select  first_name||' '||last_name||'('||title||')' Cau_22
from    s_emp;



-------------cau 23-------------

select  distinct manager_id, count(manager_id) number_emp
from    s_emp
where   manager_id is not null
group by manager_id;



------------cau 24-----------------


select  distinct manager_id, count(manager_id) number_emp
from    s_emp
where   manager_id is not null
group by manager_id
having  count(manager_id) > 2;


-------------cau 25-------------

select  distinct manager_id, count(manager_id) number_emp
from    s_emp
where   manager_id is not null
group by manager_id;


--------------cau 26-------------


select  cus.name, count(ord.id) number_order
from    s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name;


-----------cau 27--------------


select  cus.name, count(ord.id) number_order
from    s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name
order by count(ord.id) desc
fetch first 1 row only;


------------------cau 28--------------


select  cus.name
from    s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name
order by sum(ord.total) desc
fetch first 1 row only;



-------------cau 29-----------------


select  emp.first_name, emp.last_name, emp.start_date
from    s_emp emp
where   emp.dept_id in (select  emp1.dept_id
                        from    s_emp emp1
                        where   emp1.first_name like '%Ben%');



-------------cau 31----------------

select  last_name, first_name, userid
from    s_emp
where   salary > (  select  avg(emp.salary)
                    from    s_emp emp);



-------------cau 32------------


select  last_name, first_name, userid
from    s_emp
where   lower(last_name) like '%l%' and
        salary > (  select  avg(emp.salary)
                    from    s_emp emp);



-------------cau 33---------------

select  *
from    s_customer
where   id not in ( select  customer_id
                    from    s_ord);













