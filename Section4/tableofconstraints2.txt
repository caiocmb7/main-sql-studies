USE trash_stuff;

CREATE TABLE employees(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    last_name VARCHAR(255) NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    middle_name VARCHAR(255),
    age INT NOT NULL,
    current_status VARCHAR(255) NOT NULL DEFAULT "employed"
);

INSERT INTO employees(first_name, last_name, age) 
VALUES ('Dora', 'Smith', 58);

SELECT * FROM employees;