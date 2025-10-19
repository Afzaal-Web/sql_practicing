-- using sub queries in updates

-- sub query is the select statement
use sql_invoicing;

UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    client_id = (SELECT 
            client_id
        FROM
            clients
        WHERE
            name = 'Myworks');
            
            
UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    client_id IN (SELECT 
            client_id
        FROM
            clients
        WHERE
            state IN ('NY' , 'wv'));
            
UPDATE invoices 
SET 
    payment_total = invoice_total * 0.5,
    payment_date = due_date
WHERE
    payment_date IS NULL;
    
    
use sql_store;

UPDATE orders 
SET 
    comments = 'Gain the Gold Badge'
WHERE
    customer_id IN (SELECT 
            customer_id
        FROM
            customers
        WHERE
            points > 3000);