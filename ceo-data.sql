INSERT INTO employee (id,name,department_id,managers_employee_id)
   VALUES ('HYA984230948','Richard Jones',
           (select department_id from department where name = 'admin'),
	   NULL
	  ); 


