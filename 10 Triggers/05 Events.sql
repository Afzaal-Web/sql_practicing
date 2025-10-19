-- Events: A task (or block of SQL Code) thats gets executed according to a schedule
-- First turn on mysql event scheduler
SHOW VARIABLES LIKE 'event%';
-- turn on event
SET GLOBAL event_scheduler = ON;
-- turn off event
SET GLOBAL event_scheduler = OFF;

DELIMITER $$

CREATE EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
	-- AT '2025-10-06' To execute once
    -- to eexcute on regular basis see below line
    EVERY 1 HOUR STARTS '2025-10-06' ENDS '2025-10-30' 
DO
BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$

DELIMITER ;


SHOW EVENTS;

DROP EVENT IF EXISTS yearly_delete_stale_audit_rows;
-- FOR CHANGE THE EVENT
DELIMITER $$

ALTER  EVENT yearly_delete_stale_audit_rows
ON SCHEDULE
	-- AT '2025-10-06' To execute once
    -- to eexcute on regular basis see below line
    EVERY 1 HOUR STARTS '2025-10-06' ENDS '2025-10-30' 
DO
BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END $$
DELIMITER ; 

-- TO DISABLE THE EVENT
ALTER EVENT yearly_delete_stale_audit_rows DISABLE;
-- TO ENABLE THE EVENT
ALTER EVENT yearly_delete_stale_audit_rows ENABLE;
