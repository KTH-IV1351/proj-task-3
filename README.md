# Project Task 3

This repo contains SQL scripts to create the employee database used for the examples in `tips and tricks for project task 3`. It also contains the SQL queries used in that document.

## How to Create the Database

First run the script `employee-db.sql`, which creates the database schema. Note that the database itself isn't created, it must be created manually before running this script.

Next, run the scripts inserting data. The difficulty is that
1. Execute `dep-data.sql`, which will insert all departments data into the `department` table.
1. Execute `ceo-data.sql`, which will insert the CEO into the `employee` table.
1. Run the query `select employee_id from employee` to see the employee_id of the newly inserted CEO.
1. Edit the file `manager-data.sql` and set the last value on all rows, `managers_employee_id` to the employee id of the CEO.
1. Run the file `manager-data.sql` to insert all managers (except the CEO) into the `employee` table.
1. Run the query `select department_id,employee_id from employee where managers_employee_id is not null`. This will produce a result showing the department id and employee id for all managers except the CEO. 
1. Edit the file `employee-data.sql` and set the last value on all rows to the employee of the correct manager. The correct manager is the manager working at the same department as the employee.
1. Run the file `employee-data.sql` to insert all employees except managers into the `employee` table.
1. 
