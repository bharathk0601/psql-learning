BEGIN;
SAVEPOINT s1;
DELETE FROM customer WHERE customer_id = 3001;

SAVEPOINT s2;
DELETE FROM customer WHERE customer_id = 3003;

ROLLBACK TO s1;
COMMIT; -- only rollback and commit cannot appear togather.

BEGIN WORK;
LOCK TABLE acc_feature IN ACCESS EXCLUSIVE MODE;
select * from acc_account where id = 's1625660607' FOR UPDATE;
select pg_sleep(10);
COMMIT WORK;