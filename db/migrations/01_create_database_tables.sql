CREATE TABLE users (
  id SERIAL PRIMARY KEY, 
  email VARCHAR(200) UNIQUE, 
  password VARCHAR(140), 
  name VARCHAR(200), 
  username VARCHAR(200) UNIQUE
);
INSERT INTO users (email, password, name, username) VALUES('test@email.com', 'testpass', 'test_user', 'test_username');

CREATE TABLE hammocks (
id SERIAL PRIMARY KEY,
name VARCHAR(200),
description VARCHAR(1000),
price_per_night NUMERIC(38,2),
owner_id INTEGER REFERENCES users(id),
booked BOOLEAN,
booked_by_user_id INTEGER REFERENCES users(id)
);

## Example Entries for the hammocks

INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Neptune Blues', 'Enjoy your luxury holiday on the idyllic planet of Neptune, at Neptune Blues you can while your worries away while drinking our famous Gas Seas Sparkling Methane.', 100, 1);
INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Sunny days on Mercury', 'Why settle for only 8 hours of sunshine a day when you can get it for 88 days. Your tan will be out of this world! Our hammocks are fully automateed to provide you with just the right amount of uv your skin can handle.', 50, 1);
INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Diamond Seas above Saturn', 'Enjoy our glorious views of the diamond sea ring around Saturn, all from your own individual hammock pod. Our drones will ensure you are kept topped up and relaxed.', 150, 1);
INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Alpha Centari', 'Our hammocks are out of your solar system. Take a short trip on our pattented warp drive Falcon XC to get to our multi-sunned beaches and enjoy claw and foot service from the local residents. All while taking a dip in our perfect pink water beaches.', 600, 1);
INSERT INTO hammocks (name, description, price_per_night, owner_id) VALUES ('Wildlife Paradise on Europa','Enjoy our arti-grav hammocks on the surface of Europa, where you can relax, enjoy the brilliant views of Jupiter and swim with the local wildlife on Europa. The Europa Hammock Corporation is not responsible for any swimmers death by giant tentacled monsters.', 300, 1);

--
--
-- Test-Hammocks:
--
-- 1. 'Neptune Blues'
--     - 'Enjoy your luxury holiday on the idyllic planet of Neptune, at Neptune Blues you can while your worries away while drinking our famous Gas Seas Sparkling Methane.'
--     - '100 bitcoin
--
-- 2. 'Sunny days on Mercury'
--     - 'Why settle for only 8 hours of sunshine a day when you can get it for 88 days. Your tan will be out of this world! Our hammocks are fully automateed to provide you with just the right amount of uv your skin can handle.'
--     - 50 bitcoin
--
-- 3. 'Diamond Seas above Saturn'
--     - 'Enjoy our glorious views of the diamond sea around saturn. '
--     - 150 bitcoin
--
--
-- 4. 'Alpha Centari'
--     - Our hammocks are out of your solar system. Take a short trip on our pattented warp drive Falcon XC to get to our multi-sunned beaches and enjoy claw and foot service from the local residents. All while taking a dip in our perfect pink water beaches.
--     - '600 bitcoin'
--
--
-- 5. 'Wildlife Paradise on Europa'
--     - Enjoy our arti-grav hammocks on the surface of Europa, where you can relax, enjoy the brilliant views of Jupiter and swim with the local wildlife on Europa. The Europa Hammock Corporation is not responsible for any swimmers death by giant tentacled monsters.
--     - '300 bitcoin'
