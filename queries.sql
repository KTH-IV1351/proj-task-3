------------------------------------------------------------------------------------
--- This file contains all queries listed in Tips and Tricks for Project Task 3 ----
------------------------------------------------------------------------------------

-- Listing 1
SELECT * FROM phone 
FULL JOIN laptop ON laptop.id = phone.id;

--Listing 2
SELECT * FROM phone 
FULL JOIN laptop ON laptop.id = phone.id 
LEFT JOIN employee 
    ON laptop.employee_id = employee.employee_id 
        OR phone.employee_id = employee.employee_id;

-- Listing 3
SELECT phone.id AS phone_id, laptop.id AS laptop_id 
FROM phone 
FULL JOIN laptop ON laptop.id = phone.id 
LEFT JOIN employee 
    ON laptop.employee_id = employee.employee_id 
        OR phone.employee_id = employee.employee_id 
WHERE employee.department_id = 2 OR laptop.department_id = 2;

-- Listing 4
SELECT phone.id AS phone_id, laptop.id AS laptop_id, 
    CONCAT(laptop.department_id, employee.department_id) 
        AS department_id 
FROM phone FULL JOIN laptop ON laptop.id = phone.id 
LEFT JOIN employee 
    ON laptop.employee_id = employee.employee_id 
        OR phone.employee_id = employee.employee_id 
WHERE employee.department_id = 2 or laptop.department_id = 2;

-- Listing 5
SELECT phone.id AS phone_id, laptop.id AS laptop_id, 
    CONCAT(laptop.department_id, employee.department_id) 
        AS department_id 
FROM phone FULL JOIN laptop ON laptop.id = phone.id 
LEFT JOIN employee 
    ON laptop.employee_id = employee.employee_id 
        OR phone.employee_id = employee.employee_id 
WHERE employee.department_id = (
    SELECT department_id 
    FROM department 
    WHERE name = 'admin'
) OR laptop.department_id = (
    SELECT department_id 
    FROM department 
    WHERE name = 'admin'
);

--Listing 6
CREATE VIEW phone_and_laptop AS 
    SELECT phone.id AS phone_id, laptop.id AS laptop_id, 
        CONCAT(laptop.department_id, employee.department_id) 
            AS department_id 
    FROM phone FULL JOIN laptop ON laptop.id = phone.id 
    LEFT JOIN employee 
        ON laptop.employee_id = employee.employee_id 
            OR phone.employee_id = employee.employee_id;

-- Listing 7
SELECT phone_id, laptop_id, department_id
FROM phone_and_laptop
WHERE department_id = (
    SELECT CAST(department_id AS TEXT)
    FROM department
    WHERE name = 'admin'
);

-- Listing 8
SELECT COUNT(phone_id) AS phones, COUNT(laptop_id) AS laptops, 
    (CASE WHEN department_id = '' 
          THEN 'not in use' 
          ELSE department_id 
    END) AS department_id 
FROM phone_and_laptop 
GROUP BY department_id 
ORDER BY department_id;

-- Listing 9
VACUUM ANALYZE;

EXPLAIN SELECT phone.id AS phone_id, laptop.id AS laptop_id, 
    CONCAT(laptop.department_id, employee.department_id) 
        AS department_id 
FROM phone FULL JOIN laptop ON laptop.id = phone.id 
LEFT JOIN employee 
    ON laptop.employee_id = employee.employee_id 
        OR phone.employee_id = employee.employee_id;

-- Listing 11
SELECT name FROM employee e 
WHERE EXISTS (SELECT * FROM employee d 
              WHERE d.managers_employee_id = e.employee_id);

-- Listing 12
SELECT DISTINCT mgr.name FROM employee mgr 
INNER JOIN employee emp 
    ON emp.managers_employee_id = mgr.employee_id;

-- Listing 13
SELECT emp.employee_id, (
    SELECT COUNT(dep.department_id) AS emps_in_dep 
    FROM employee dep 
    WHERE dep.department_id = emp.department_id 
    GROUP BY department_id) 
FROM employee emp;

-- Listing 15
SELECT emp.employee_id, dep.emps_in_dep FROM employee emp 
INNER JOIN (
    SELECT count(department_id) AS emps_in_dep, department_id 
    FROM employee GROUP BY department_id) dep 
ON dep.department_id = emp.department_id;

-- Listing 16
SELECT phone.id AS device_id, 'phone' AS device_type, 
       CAST(emp.department_id AS text) 
FROM phone 
LEFT JOIN employee emp ON phone.employee_id = emp.employee_id 
WHERE emp.department_id = 2 

UNION 

SELECT laptop.id AS device_id, 'laptop' AS device_type, 
       CONCAT(laptop.department_id, emp.department_id) 
           AS department_id 
FROM laptop 
LEFT JOIN employee emp 
    ON laptop.employee_id = emp.employee_id 
WHERE emp.department_id = 2 OR laptop.department_id = 2;
