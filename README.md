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

## Domain Model

https://docs.google.com/spreadsheets/d/1d0Gz_mINWiapO09sTUBmpzQA9FhS1RZKjNgzkgxkCbs/edit#gid=0

## Specifications and User Stories

- [ ] Any signed-up user can list a new space.
      - User story 2 - delivers listing a spac
      - User Story 5(a-c) for sign up and sign-in & sign-out
      -
- [ ] Users can list multiple spaces.
      -
      - Wait for sign-in functionality
- [x] Users should be able to name their space, provide a short description of the space, and a price per night.
      - Delivered via user story 3 & 2
- [ ] Users should be able to offer a range of dates where their space is available.
      - need to implement - need another user story
- [ ] Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
      - User story 4 - delivers booking function
      - need user story for approval mechanism
- [ ] Nights for which a space has already been booked should not be available for users to book that space.
      - part of offering a range of dates
      - need a mechanism for excluding booked dates
      - need to adjust booking function to specify particular dates
- [ ] Until a user has confirmed a booking request, that space can still be booked for that night.
      - Until owner accepts request, property can still be booked by a user-booker.

- [ ] add CSS

- Other:
  User profiles (hamocks they own, hammocks they have booked)
  Add telephone number & email
  Encrypted passwords

#### User Story 5a
As a user
In order to access the functionality to add a new space
I want to be able to sign-in

#### User Story 5b
As a user
In order to have the website remember me
I want to be able to register/sign-up

#### User Story 5c
As a user
In order to avoid others using my profile
I want to be able to sign-out


#### User Story 1
As a user-booker
To see what is available
I want to be able to see a list of all spaces (hammocks)

> SpaceHammock Class - to create an instance
> HammocksNDrinks Class - store all the created SpaceHammocks
> view (index.erb) erb file to see all the spaces with (name, description, price per night, owner)
> Database table for space hammocks (set up two environments) - hammocks





#### User Story 2
As a user-owner(Hammock-Lord! Master of the Beach)
To add my own hammock/space
I want to be able to list my space

> List space erb file (with associated buttons and routes) - DONE
> Functionality in HammocksNDrinks to create a space (which uses SpaceHammock class) - DONE (created database connection class as well)
> Include details in spaceHammock (name, description, price per night, owner) - Done and setup table to match

#### User Story 3
As a user-booker
To understand what I am looking at
I want to be able to see the details of the space (name, description, price per night, owner)

#### User Story 4
As a user-booker
To hire a space
I want to be able to book a space hammocks

> Need a button later
> function to book a hammock (do it in hammocks_n_drinks, update to database: flag booked on hammock object)



Break down user stories into tickets
Organise tickets into priority
