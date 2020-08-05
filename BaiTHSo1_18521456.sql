

---1 TAO CAU TRUY VAN THE HIEN TEN, MA KH. TEN CAC COT LA 
--TENKH, MAKH. SAP XEP KQ THEO THU TU MAKH GIAM DAN 
select cus.id, cus.name
from s_customer cus
order by cus.id desc; 


---4  Hien thi ten truy cap cua nhân viên 23
select emp.last_name 
from s_emp emp
where emp.id =23

---5 Hien thi ho, tên và mã phòng cua nhân viên trong phòng 10, 50 và sap theo
---thu tu cua tên. Noi 2 cot ho tên và dat tên cot moi là Employees.
select emp.last_name || ' ' || emp.first_name as Employees, emp.dept_id
from s_emp emp
where emp.dept_id = 10 or emp.dept_id=50
order by Employees;
--6  Hien thi tat ca nhung nhân viên có tên chua chu “S”
select emp.LAST_NAME
from s_emp emp
where emp.last_name like '%S%';
--- neu ho va ten thi dung ket noi alias emp.last_name || ' '|| emp.first_name
--- like '%S%' as Employee
select emp.last_name || ' '|| emp.first_name as Employee 
from s_emp emp
where emp.last_name ||' '|| emp.first_name like '%S%';


---7Hien thi tên truy nhap và ngày bat dau làm viec cua nhân viên trong khoang
--thoi gian tu 14/5/1990 den 26/5/1991

select emp.userid, emp.start_date 
from s_emp emp
where emp.start_date between to_date ('14/5/1990','dd/mm/yyyy') 
                    and to_date ('22/11/1991','dd/mm/yyyy');
---8 Viet câu truy van hien thi tên và muc luong cua tat ca các nhân viên nhan
---luong tu 1000 den 2000/tháng.
select emp.last_name, emp.salary
from s_emp emp
where emp.salary >= 1000 and emp.salary <= 2000;

---9  Lap danh sách tên và muc luong cua nhung nhân viên o phòng 31, 42, 50
---nhan muc luong trên 1350. dat tên cho cot tên là Emloyee Name và dat tên
---cho cot luong là Monthly Salary
select emp.last_name ||' '|| emp.first_name as EmployeeName, emp.salary 
as monthlySalary
from s_emp emp
where emp.dept_id in (31,42,50) and emp.salary >1350;

---10 Hien thi tên và ngày bat dau làm viec cua moi nhân viên duoc thuê trong
---nam 1991.
select emp.last_name, emp.start_date 
from s_emp emp
where extract(year from start_date) =1991;

---CAC LOAI HAM TRONG SQL
---11  Hien thi mã nhân viên, tên và muc luong duoc tang thêm 15%  
---commission la luong hoa hong
select emp.id, emp.last_name, emp.salary
from s_emp emp
where emp.commission_pct = 15;

---12 Hien thi ten cua moi nhân viên, ngày tuyen dung và ngày xem xét tang
---luong. Ngày xét tang luong theo qui dinh là vào ngày th? hai sau 6 tháng làm
---viec. dinh dang ngày xem xét theo kieu “Eighth of May 1992”
select emp.last_name, 
emp.start_date, to_char(next_day(add_months(start_date,6),'Monday'),
'fmDdspth "of" MONTH, YYYY')
from s_emp emp;
---13Hien thi ten tat ca san pham co chu “ski”
select pro.NAME
from s_product pro
where lower(pro.name) like '%ski%';  

---14 Voi moi nhân viên, hãy tính so tháng thâm niên cua nhân viên. sx
---ket qua tang dan theo tháng thâm niên và so tháng duoc làm tròn
select emp.last_name, round(months_between(sysdate,start_date))as months_worked
from s_emp emp
order by  months_between (sysdate,start_date);

---15  Cho biet có bao nhiêu nguoi quan lý.
select count(emp.manager_id)
from s_emp emp
where emp.manager_id is not null;

---16 Hien thi muc cao nhat và muc thap nhat cua don hàng trong bang S_ORD.
---dat tên các cot tuong ung là Hightest và Lowest
select max(total)as Hightest, min(total) as Lowest
from s_ord;
---17 Hien thi ten san pham, ma san pham, va so luong tung san pham trong 
---don dat hang co ma so 101 . Cot so luong duoc dat ten la ORDERED

select pro.name, pro.id, ite.quantity as ORDERED
from s_item ite join s_product pro on ite.product_id = pro.id 
where ite.ord_id=101;
---18 hien thi ma khach hang, ma don dat hang cua tat ca khach hang, ke ca 
--- khach hang chua dat hang. Sx danh sach theo ma khach hang
select cus.id, ord.id
from s_customer cus left join s_ord ord on cus.id = ord.customer_id
order by cus.id;
---19 Hien thi ma khach hang, ma san pham va so luong dat hang cua cac don 
---dat hang co tri gia tren 100.000
select ord.customer_id, item.item_id, item.quantity
from s_ord ord join s_item item on ord.id = item.ord_id
where ord.total > 100000;

---Bai tap mo rong
---20 Hien thi ho ten cua tat ca nhan vien khong la quan ly
select  emp.id,emp.last_name ||' '||emp.first_name as Name 
from s_emp emp 
where emp.id NOT IN   ( select emp1.manager_id 
                                from s_emp emp1 
                                where emp1.manager_id is not null )
order by emp.id;

---21 Hien thi theo thu tu abc tat ca nhung san pham co ten 
---bat dau voi tu Pro
select pro.name 
from s_product pro
where pro.name like 'Pro%'
order by pro.name;


---22 Hien thi ten san pham va mo ta ngan gon ( SHORT_DESC) cua
---san pham voi nhung san pham co mo ta ngan gon chua tu "bicycle"
select pro.name, pro.short_desc
from s_product pro
where pro.short_desc like '%bicycle%';




---23 Hien thi tat ca nhung SHORT_DESC
select short_desc
from s_product;

---24 Hien thi ten nhan vien va chuc vu trong ngoac don "( )" cua 
---tat ca cac nhan vien. Vi du: Nguyen Van Tam (Giam doc)
select first_name||' '||last_name ||'('||title||')' cau 24
from s_emp;

---Cac hang gom nhom
---25 Voi tung nguoi quan ly, cho biet ma nguoi quan ly va so nhan vien
---ma ho quan ly 
select distinct emp.manager_id, count(id) 
from s_emp emp
where emp.manager_id is not null
group by  manager_id;

---26 Hien thi nhung nguoi quan ly 20 nguoi tro len
select distinct manager_id, count(manager_id)
from s_emp emp 
where manager_id is not null
group by manager_id
having count manager_id >20;


---27 Cho biet ma vung, ten vung va so phong ban truc thuoc trong moi vung
select reg.id, reg.name, count(dept.id) 
from s_region reg join s_dept dept on dept.region_id = reg.id 
group by reg.id, reg.name;


---28 Hien thi ten khach hang va so luong don dat hang cua moi khach hang
select cus.name, count(ord.id)
from s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name;



---29 Cho biet khach hang co so luong don dat hang nhieu nhat 
select cus.name, count(ord.id)
from s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name 
order by count(ord.id) DESC 
fetch first 1 row with ties; 



---30 Cho biet khach hang co tong tien mua hang lon nhat

select cus.name
from s_customer cus join s_ord ord on cus.id = ord.customer_id
group by cus.id, cus.name 
order by sum(ord.total) DESC 
fetch first 1 row with ties;


---31 Hien thi ho ten va ngay tuyen dung cua tat ca nhan 
---vien cung phong voi Lan
select emp.last_name, emp.start_date 
from s_emp emp 
where emp.id in ( select emp1.id
                  from s_emp emp1
                  where emp1.last_name like 'Lan';
                )

---32 Hien thi ma nv, ho, ten va ma truy cap cua tat ca
---nv co muc luong tren muc trung binh

select emp.id, emp.userid, emp.last_name
from s_emp emp
where emp.salary > ( select avg(emp1.salary)
                        from s_emp emp1
                       )

---33Hien thi ma nv, ho ten, cua tat ca nv co muc
---luong tren tb va co ten chua ky tu L

select emp.id, emp.userid, emp.last_name
from s_emp emp
where lower(first_name) like '%l%' and
 emp.salary > ( select avg(emp1.salary)
                        from s_emp emp1
                       )


---34 Hien thi nhung khach hang chua bao gio
---dat hang

select first_name 
from s_customer  
where id not in ( select customer_id 
                  from s_ord 
                 );