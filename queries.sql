--cross join
select * from phone, laptop;
select * from phone cross join laptop;

select * from phone full join laptop on laptop.id = phone.id;

select * from phone full join laptop on laptop.id = phone.id join employee on laptop.employee_id = employee.employee_id;

select * from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id;

select * from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id;

select * from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id where employee.department_id = 1 or laptop.department_id = 1;

select phone.id, laptop.id from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id where employee.department_id = 1 or laptop.department_id = 1;

select phone.id as phone_id, laptop.id as laptop_id from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id where employee.department_id = 1 or laptop.department_id = 1;

select phone.id as phone_id, laptop.id as laptop_id, laptop.department_id as department_id from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id where employee.department_id = 2 or laptop.department_id = 2;

select phone.id as phone_id, laptop.id as laptop_id, concat(laptop.department_id, employee.department_id) as department_id from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id where employee.department_id = 2 or laptop.department_id = 2;

create view phone_and_laptop as select phone.id as phone_id, laptop.id as laptop_id, concat(laptop.department_id, employee.department_id) as department_id from phone full join laptop on laptop.id = phone.id left join employee on laptop.employee_id = employee.employee_id or phone.employee_id = employee.employee_id;

select count(phone_id) as phones, count(laptop_id) as laptops, department_id from phone_and_laptop group by department_id;

select count(phone_id) as phones, count(laptop_id) as laptops, department_id from phone_and_laptop group by department_id order by department_id;

select count(phone_id) as phones, count(laptop_id) as laptops,  (CASE WHEN department_id = '' THEN 'not in use' ELSE department_id END) as next_group_lesson from phone_and_laptop group by department_id order by department_id;
