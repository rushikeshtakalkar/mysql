create database	mi_project;
#collage Course & Fees managment system
CREATE TABLE students (
  s_id INT PRIMARY KEY,
  s_name VARCHAR(50) NOT NULL,
  s_city VARCHAR(40),
  s_mobile VARCHAR(15) UNIQUE
);
CREATE TABLE courses (
  c_id INT PRIMARY KEY,
  c_name VARCHAR(50) NOT NULL,
  fees INT CHECK (fees > 0)
);
CREATE TABLE enrollments (
  e_id INT PRIMARY KEY,
  s_id INT,
  c_id INT,
  enroll_date DATE,
  FOREIGN KEY (s_id) REFERENCES students(s_id),
  FOREIGN KEY (c_id) REFERENCES courses(c_id)
);
CREATE TABLE payments (
  pay_id INT PRIMARY KEY,
  e_id INT,
  amount INT,
  pay_date DATE,
  FOREIGN KEY (e_id) REFERENCES enrollments(e_id)
);
INSERT INTO students VALUES
(1,'Arjun','Pune','9999999991'),
(2,'Riya','Mumbai','9999999992'),
(3,'Sahil','Delhi','9999999993');

INSERT INTO courses VALUES
(101,'Java',15000),
(102,'Python',12000),
(103,'Data Science',30000);
INSERT INTO enrollments VALUES
(1,1,101,'2026-01-01'),
(2,2,103,'2026-01-05'),
(3,3,102,'2026-01-07');

INSERT INTO payments VALUES
(1,1,7000,'2026-01-10'),
(2,1,8000,'2026-02-05'),
(3,2,10000,'2026-01-20');

SELECT s.s_name, c.c_name, e.enroll_date
FROM enrollments e
JOIN students s ON e.s_id = s.s_id
JOIN courses c ON e.c_id = c.c_id;

select c.c_name ,sum(p.amount) as total_amount from courses
group by courses c;
 


