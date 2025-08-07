CREATE DATABASE freelancer_tracker;

USE freelancer_tracker;

CREATE TABLE Clients (
    client_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    client_id INT,
    project_name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (client_id) REFERENCES Clients(client_id)
);

CREATE TABLE Project_Tasks (
    task_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    task_name VARCHAR(100),
    due_date DATE,
    is_completed BOOLEAN,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Invoices (
    invoice_id INT PRIMARY KEY AUTO_INCREMENT,
    project_id INT,
    amount DECIMAL(10,2),
    due_date DATE,
    is_paid BOOLEAN,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id)
);

CREATE TABLE Payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    invoice_id INT,
    paid_amount DECIMAL(10,2),
    payment_date DATE,
    FOREIGN KEY (invoice_id) REFERENCES Invoices(invoice_id)
);


-- inserting values into tables
-- Sample Data Inserted

-- Clients
INSERT INTO Clients (name, email, phone) VALUES 
('Alice Smith', 'alice@example.com', '1234567890'),
('Bob Kumar', 'bob@example.com', '9876543210'),
('Bobby','bobby@example.com','7251892089');

-- Projects
INSERT INTO Projects (client_id, project_name, start_date, end_date, status) VALUES 
(1, 'Website Redesign', '2025-07-01', '2025-08-01', 'Ongoing'),
(2, 'Mobile App Development', '2025-06-15', '2025-08-15', 'Ongoing'),
(3, 'Website Development', '2025-07-15', '2025-10-15', 'Ongoing');

-- Tasks
INSERT INTO Project_Tasks (project_id, task_name, due_date, is_completed) VALUES
(1, 'Design UI Mockups', '2025-07-10', TRUE),
(1, 'Develop Frontend', '2025-07-20', FALSE),
(2, 'Setup Backend', '2025-07-25', FALSE),
(2, 'Setup Frontend', '2025-05-12', TRUE);

-- Invoices
INSERT INTO Invoices (project_id, amount, due_date, is_paid) VALUES
(1, 5000.00, '2025-07-15', FALSE),
(2, 8000.00, '2025-07-25', TRUE),
(3, 4000.00, '2025-03-19', TRUE);

-- Payments
INSERT INTO Payments (invoice_id, paid_amount, payment_date) VALUES
(4, 8000.00, '2025-07-20');
INSERT INTO Payments (invoice_id, paid_amount, payment_date) VALUES
(7, 4000.00, '2025-06-20');


