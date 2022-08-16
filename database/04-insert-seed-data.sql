-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user
    (user_name, password, role, birthdate, email_address, salt) VALUES
('Admin1', 'q9zYhV+vZAmWu7tfDyKCRw==', 'brewer', CAST('01/01/1999' as date), 'a@a.com',
 'HOmSruexAbYm3qyY5PfebrlI2oBThGOL4e5lK5M+U6w2x0S7TUQKnqHxN6Eu15TdzGhBb2NTQjCj/+rr1XRoJtcAK' ||
 '+x1PYIAhyCZT15obFyDku6ABDy4KZEzh132RzeCTA+oxK6zhlTanUNtcIAPcp57ggfXEYYnEY19WAElZ8Y=');
--  ,
-- ('Admin2', 'FwvpdO+vnAODbHguKkSF3Q==', 'brewer', CAST('02/02/1998' as date), 'b@b.com', 'NeZJmRNM4Ngsw/a8ETvpu2Fjyl6FD3pqhtfruQhvsUadckffofngV6La9FjEnn5Q3Ww0iBKX91qv7Tta++OHJQvtEJfDK2bWSpsCiMIic2nHTUfEoFwTbtXCT4D41g+z9Iwybnhfr+Zzd2T3jwmrgmk1oiJwfKzrEN7J+ZCP4HQ='),
-- ('Admin3', 'BXcaDunH9TfSolELJ3Z6zw==', 'brewer', CAST('03/03/1997' as date), 'c@c.com', 'Mos1ff2qiF7Je6JuEy8erTK98qj2YEHk7lsjl3HRpKSXu5U1T97g+fTFOwZUpjNQgwqnzmd8Zk+oaSUDn7Fs8c8JphCCCZDALwDUWxEZoLOk4SJAcxg+VpgzjPenfQJ3qEFXRwG6Gx1zzKNFB00kVUbJk4sykOvGOtIk+FkH3l0='),
-- ('Admin4', 'J4K/y8+3dfhiBWY/XjwLXQ==', 'brewer', CAST('04/04/1996' as date), 'd@d.com', '7O4CTR3BsM934G6Zcof3kDn4r5vUv/1ZDnMTzBuE8NHb4ySiLle+CahcBtc3/QrJ+IX6CFr9S99kjMvakE91OsHWqsxPYBb091LT0ABcuXVfCcAj8+cQ/eUkez0725WODDfLI9csSzhdrk0ZeguGSsgkBdyYq742y014XNofChA=');

INSERT INTO brewery
    (name, brewer, hours_of_operation, phone, history, address, active_status) values
('The Funkatorium', 1, '11AM - 11PM', '(828) 552-3203','Wicked Weed sour & funky beers are served in a rustic pub ' ||
                                                       'with a barrel room & a dog-friendly patio.', '123 Main St.',
 true),
('Highland Brewing Company', 1, '2PM - 9PM', '(828) 299-3370', 'Brewery offering free tours of its facilities plus a ' ||
                                                               'low-key taproom to sample a pint or flight.',  '4123 ' ||
                                                                                                               'Broad' ||
                                                                                                               ' St.',
 true),
('Wicked Weed Brewing Pub', 1, '11AM - 11PM', '(828) 575-9599', 'Hip brewery with a tasting room & a restaurant ' ||
                                                                'serving high-end, locally sourced New American fare' ||
                                                                '.','6123 High St.', true),
('Ben''s Tune Up', 1, '4PM - 11PM', '(828) 424-7580', 'Trendy brewery & beer garden offering house sakes, craft beers' ||
                                                      ' & Japanese-American fusion eats.', '7902 Park Place', true),
('Asheville Brewing Company', 1, '', '', '', '', false);

INSERT INTO beer
    (name, brewery_id, image, description, abv, beer_type) values
('Beer 1', 1, 'beer image url', 'i will come back and change these later', '0.5', 'the good kind'),
('Beer 2', 1, 'beer image url', 'i will come back and change these later', '5.5', 'the good kind'),
('Beer 3', 2, 'beer image url', 'i will come back and change these later', '6.5', 'the good kind'),
('Beer 4', 3, 'beer image url', 'i will come back and change these later', '9.5', 'the good kind'),
('Beer 5', 4, 'beer image url', 'i will come back and change these later', '10.5', 'the good kind');

COMMIT;