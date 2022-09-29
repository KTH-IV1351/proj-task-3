-- Department
CREATE TABLE department (
 department_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 name VARCHAR(100)
);

ALTER TABLE department ADD CONSTRAINT PK_department PRIMARY KEY (department_id);

-- Employee
CREATE TABLE employee (
 employee_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 id VARCHAR(100) NOT NULL,
 name VARCHAR(500),
 department_id INT NOT NULL,
 managers_employee_id INT
);

ALTER TABLE employee ADD CONSTRAINT PK_employee PRIMARY KEY (employee_id);

-- Laptop
CREATE TABLE laptop (
 laptop_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 id VARCHAR(100) NOT NULL,
 model VARCHAR(100),
 employee_id INT,
 department_id INT
);

ALTER TABLE laptop ADD CONSTRAINT PK_laptop PRIMARY KEY (laptop_id);

-- Phone
CREATE TABLE phone (
 phone_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 id VARCHAR(100) NOT NULL,
 model VARCHAR(100),
 employee_id INT
);

ALTER TABLE phone ADD CONSTRAINT PK_phone PRIMARY KEY (phone_id);

-- Role
CREATE TABLE role (
 role_id INT GENERATED ALWAYS AS IDENTITY NOT NULL,
 title VARCHAR(100),
 description VARCHAR(2000)
);

ALTER TABLE role ADD CONSTRAINT PK_role PRIMARY KEY (role_id);

-- Employee-role cross reference table
CREATE TABLE employee_role (
 employee_id INT NOT NULL,
 role_id INT NOT NULL
);

ALTER TABLE employee_role ADD CONSTRAINT PK_employee_role PRIMARY KEY (employee_id,role_id);

-- Foreign keys
ALTER TABLE employee ADD CONSTRAINT FK_employee_0 FOREIGN KEY (department_id) REFERENCES department (department_id);
ALTER TABLE employee ADD CONSTRAINT FK_employee_1 FOREIGN KEY (managers_employee_id) REFERENCES employee (employee_id);

ALTER TABLE laptop ADD CONSTRAINT FK_laptop_0 FOREIGN KEY (employee_id) REFERENCES employee (employee_id);
ALTER TABLE laptop ADD CONSTRAINT FK_laptop_1 FOREIGN KEY (department_id) REFERENCES department (department_id);

ALTER TABLE phone ADD CONSTRAINT FK_phone_0 FOREIGN KEY (employee_id) REFERENCES employee (employee_id);

ALTER TABLE employee_role ADD CONSTRAINT FK_employee_role_0 FOREIGN KEY (employee_id) REFERENCES employee (employee_id);
ALTER TABLE employee_role ADD CONSTRAINT FK_employee_role_1 FOREIGN KEY (role_id) REFERENCES role (role_id);


