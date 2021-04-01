## Domain Model

https://docs.google.com/spreadsheets/d/1d0Gz_mINWiapO09sTUBmpzQA9FhS1RZKjNgzkgxkCbs/edit#gid=0

## Specifications and User Stories

- [ ] Any signed-up user can list a new space.
      - User Story 2 list a space
      - Need sign in functionality
- [ ] Users can list multiple spaces.
      - User Story 2
      - User profile functionality
- [ ] Users should be able to name their space, provide a short description of the space, and a price per night.
      - User Story 2 - provide details in the list
- [ ] Users should be able to offer a range of dates where their space is available.
      - Date functionality
- [ ] Any signed-up user can request to hire any space for one night, and this should be approved by the user that owns that space.
      - User Story 1
      - User Story 4 hire a space
      - Need date functionality
      - Need approval functionality
- [ ] Nights for which a space has already been booked should not be available for users to book that space.
      - need a date module
      - method for eliminating unavailable dates
- [ ] Until a user has confirmed a booking request, that space can still be booked for that night.
      - Somthing with the approval functionality

#### Nice to Haves

- [ ] Users should receive an email whenever one of the following happens:
  - [ ] They sign up
  - [ ] They create a space
  - [ ] They update a space
  - [ ] A user requests to book their space
  - [ ] They confirm a request
  - [ ] They request to book a space
  - [ ] Their request to book a space is confirmed
  - [ ] Their request to book a space is denied
- [ ] Users should receive a text message to a provided number whenever one of the following happens:
  - [ ] A user requests to book their space
  - [ ] Their request to book a space is confirmed
  - [ ] Their request to book a space is denied
- [ ] A ‘chat’ functionality once a space has been booked, allowing users whose space-booking request has been confirmed to chat with the user that owns that space
- [ ] Basic payment implementation though Stripe.



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

> List space erb file (with associated buttons and routes)
> Functionality in HammocksNDrinks to create a space (which uses SpaceHammock class)
> Include details in spaceHammock (name, description, price per night, owner)

#### User Story 3
As a user-booker
To understand what I am looking at
I want to be able to see the details of the space (name, description, price per night, owner)

#### User Story 4
As a user-booker
To hire a space
I want to be able to book a space hammocks


Break down user stories into tickets
Organise tickets into priority

Sign in - need a user story - second level priority



Test-Hammocks:

1. 'Neptune Blues'
    - 'Enjoy your luxury holiday on the idyllic planet of Neptune, at Neptune Blues you can while your worries away while drinking our famous Gas Seas Sparkling Methane.'
    - '100 bitcoin

2. 'Sunny days on Mercury'
    - 'Why settle for only 8 hours of sunshine a day when you can get it for 88 days. Your tan will be out of this world! Our hammocks are fully automateed to provide you with just the right amount of uv your skin can handle.'
    - 50 bitcoin

3. 'Diamond Seas above Saturn'
    - 'Enjoy our glorious views of the diamond sea around saturn. '


4. 'Alpha Centari'
    - Our hammocks are out of your solar system. Take a short trip on our pattented warp drive Falcon XC to get to our multi-sunned beaches and enjoy claw and foot service from the local residents. All while taking a dip in our perfect pink water beaches.
    - '600 bitcoin'


5. 'Wildlife Paradise on Europa'
    - Enjoy our arti-grav hammocks on the surface of Europa, where you can relax, enjoy the brilliant views of Jupiter and swim with the local wildlife on Europa. The Europa Hammock Corporation is not responsible for any swimmers death by giant tentacled monsters.
    - '300 bitcoin'
