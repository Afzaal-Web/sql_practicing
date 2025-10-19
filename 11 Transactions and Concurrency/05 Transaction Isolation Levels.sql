-- Lost Updates
/* When two transaction updates the same row and the one which commits last
overrides the changes made earlier*/

-- Dirty Reads
/* if you read uncommited data.alter */

-- Non Repeating Reads
/* if you read the same data twice in a transaction but get
 different result
*/

-- Phantom Reads
/* Which happens we miss one or more rows in our query, because another
transaction is changing the data and we are not aware of the changes
in our transaction 


-- Solutions

-- Read uncommitted: 
/* Which does not really protect us from any problem because our transaction are 
isolated from each other

-- Read Committed:
/* Which gives our transaction a bit of isolation so we can only read committed
data and this prevents dirty reads
but its possible you read something twice during a transaction
we get different result because another transaction updates the data
in between 2 reads.
so it does not protect us from non repeatable reads.*/

-- REPEATABLE READS
/* At this level, we can be confident that multiple reads returns 
the same result, even if the data gets changed in the mean time*/

-- Serializable:
/* which prevents all these common problem: we can prevent phantom reads
if data is getting changed in the meantime, our transaction will wait 
to get the most recent data. 
Obvoiusly this puts an overhead on server 

SHOW VARIABLES LIKE 'transaction%';

-- Applies only to the next transaction.
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Applies to all future transactions in the current session.
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Applies to all future transactions for the entire server
SET SESSION TRANSACTION ISOLATION LEVEL SERIALIZABLE;



