WITH ceo_emp_id AS (
    SELECT employee_id
    FROM employee WHERE managers_employee_id IS NULL
)
INSERT INTO employee (id,name,department_id,managers_employee_id)
VALUES
  ('XFS925542235','Shaine Morgan',3,1),
  ('JNJ633640389','Chaney Horne',5,1),
  ('YXW307850738','Kibo Morton',2,1),
  ('HTU075956647','Mannix Beasley',4,1),
  ('KCE895573493','Katelyn Love',1,1);

