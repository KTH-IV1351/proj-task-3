# Project Task 3

This repo contains SQL scripts to create the employee database used for the examples in `tips and tricks for project task 3`. It also contains the SQL queries used in that document.

## How to Create the Database

Follow the steps below to create the database and insert data.

1. Create an empty database, this isn't done by the scripts.
1. Run the script `create-emp-db.sql` against the database created above. This creates the database schema.
1. Run the script `fill-emp-db.sql` against the database used above, which will insert data. Note that there is some amount of randomness in this script, some foreign keys will get different values each time the script is executed.

As an alternative to the steps above, use the script `empdb-from-pg_dump.sql` which creates the empty database, the schema, and also inserts data. This script has been generated with `pg_dump`, and when executed (for example with `pg_restore`) will create a database with exactly the same state as when the script was generated.

