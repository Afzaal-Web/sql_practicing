-- ACID Properties
/* transactions are fundamentals operations that allow us to modify and retrieve data
A = Atomicity (All or nothing transactions)
T = Consistency (Valid state maintenance)
I = isolution (Transactions do not affect each other)
D = Durability (permanent changes after commitment)
*/

-- A group of SQL statements that represent a single unit of work
-- Transactions have few properties
-- ACID
/* A = Atomicity: This means our transactions are like atoms, they are unbreakable.
Each transaction is a single unit of work no matter how many statements it contains.
Either All the statements get executed successfully and the trasaction is committed or the transaction is
rolled back and all the changes are undone.
T = Consistency : the second property of transaction is consistency and that means
with these transactions, or database will always remain in a consistent state. We won't end up with an order without
an item. 
I = Isolution: these transactions are isolated or protected from each other if they tried to modify the same data.
so they cannot interfere with each other. If multiple transactions try to update the same data
the rows that are being affected get locked, so only one transaction at a time can update those rows.
other transaction have to wait for that transaction to complete.
D = Durability: Once a transaction is committed, the changes made by transaction are permanent. So if you have the 
power failure or a system crash, we are not going to lose the system changes

*/