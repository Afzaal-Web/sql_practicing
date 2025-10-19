-- LOST UPDATES
/* A and B : A updates states but not commit then B updates points and commit so transaction commits last will override the changes made earlier
How we prevent this happening
We use locks
by default mysql uses locks*/

-- DIRTY READS
/*
when transaction reads data has not been commited yet.
to solve this problems we need to provide a level of isolation around our transaction.
so data modified by transaction will not be visible unless it is commited */

-- Non Repeatable Reads
/* By adding more isolation to our transaction, we guarrantee that the transaction only read committed data.
But What if
				during a course of transaction, you read something twice and get different results
                REPEATABLE READS WILL RESOLVE THE ISSUE

-- PHANTON READS: means ghosts we have data that suddenly appears like a ghost
solution for this problem: we will have to make sure no other transaction is running that can impact our query 
SERIALIZABLE for this problem