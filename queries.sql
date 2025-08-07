USE freelancer_tracker;

-- 1. Total Pending Amount per Client

SELECT 
    c.name AS client_name,
    SUM(i.amount) - IFNULL(SUM(p.paid_amount), 0) AS pending_amount
FROM Clients c
JOIN Projects pr ON c.client_id = pr.client_id
JOIN Invoices i ON pr.project_id = i.project_id
LEFT JOIN Payments p ON i.invoice_id = p.invoice_id
GROUP BY c.client_id, c.name;

-- 2. Overdue Invoices
SELECT 
    i.invoice_id, pr.project_name, i.amount, i.due_date
FROM Invoices i
JOIN Projects pr ON i.project_id = pr.project_id
WHERE i.is_paid = FALSE AND i.due_date < CURDATE();

-- 3. Incomplete Tasks:

SELECT 
    pt.task_name, pr.project_name, pt.due_date
FROM Project_Tasks pt
JOIN Projects pr ON pt.project_id = pr.project_id
WHERE pt.is_completed = FALSE;


-- 4. List all ongoing projects with their client names

SELECT 
    pr.project_name, 
    pr.status, 
    c.name AS client_name
FROM Projects pr
JOIN Clients c ON pr.client_id = c.client_id
WHERE pr.status = 'Ongoing';

-- 5.Show All Incomplete Project Tasks

SELECT 
    pt.task_name, 
    pr.project_name, 
    pt.due_date
FROM Project_Tasks pt
JOIN Projects pr ON pt.project_id = pr.project_id
WHERE pt.is_completed = FALSE;
