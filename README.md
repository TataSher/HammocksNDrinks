# MakersHnD
## Hammocks and Drinks! Find the most relaxing spot on earth.

 ## To Use

 ## To use
 1. git clone to your local machine
 2. run bundle install
 3. Set up both of the below databases following the command below - you will need PostgreSQL
 4. run rspec and get clean tests to ensure setup correctly
 5. run `rackup -p 5001` to start app
 6. Connect in browser via `localhost:5001`

 #### To set up the database for actual use
 1. Connect to psql
 2. Create the database using the psql command `CREATE DATABASE  makers_hnd_database;`
 3. Connect to the database using the pqsl command `\c makers_hnd_database;`
 4. Run the querys we have saved in the file `01_create_database_tables.sql`


 #### Set up database for testing
 1. Connect to psql
 2. Create the database using the psql command `CREATE DATABASE makers_hnd_database_test;`
 3. Tables will create and reset automatically when you run rspec
