create DATABASE library_db;
USE library_db;
#TABLE — MEMBERS
CREATE TABLE members (
  m_id INT PRIMARY KEY,
  m_name VARCHAR(50),
  m_city VARCHAR(40)
);
#TABLE — BOOKS
CREATE TABLE books (
  b_id INT PRIMARY KEY,
  b_title VARCHAR(60),
  b_author VARCHAR(50)
);
 #TABLE — BORROW
 CREATE TABLE borrow (
  borrow_id INT PRIMARY KEY,
  m_id INT,
  b_id INT,
  borrow_date DATE,
  FOREIGN KEY (m_id) REFERENCES members(m_id),
  FOREIGN KEY (b_id) REFERENCES books(b_id)
);

#Inser value
INSERT INTO members VALUES
(1,'Arjun','Pune'),
(2,'Riya','Delhi'),
(3,'Sahil','Mumbai');

INSERT INTO books VALUES
(101,'The Alchemist','Paulo Coelho'),
(102,'Atomic Habits','James Clear'),
(103,'Rich Dad Poor Dad','Robert Kiyosaki');

INSERT INTO borrow VALUES
(1,1,101,'2026-01-01'),
(2,2,103,'2026-01-03'),
(3,1,102,'2026-01-05');

#which member buy which book
SELECT 
  m.m_name,
  b.b_title,
  br.borrow_date
FROM borrow br
JOIN members m ON br.m_id = m.m_id
JOIN books b ON br.b_id = b.b_id;
#which member does not buy any book (left join)
SELECT m.m_name, b.b_title
FROM members m
LEFT JOIN borrow br ON m.m_id = br.m_id
LEFT JOIN books b ON br.b_id = b.b_id;

#which book does not borrowed
SELECT b.b_title
FROM books b
LEFT JOIN borrow br ON b.b_id = br.b_id
WHERE br.b_id IS NULL;

#number of book each student 
SELECT m.m_name, COUNT(*) AS total_borrowed
FROM borrow br
JOIN members m ON br.m_id = m.m_id
GROUP BY m.m_name;

#veiw
CREATE VIEW borrow_details AS
SELECT 
  m.m_name,
  b.b_title,
  br.borrow_date
FROM borrow br
JOIN members m ON br.m_id = m.m_id
JOIN books b ON br.b_id = b.b_id;


