-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user
    (name, user_name, password, role, birthdate, email_address, salt) VALUES
('Admin Lastname', 'Admin1', 'q9zYhV+vZAmWu7tfDyKCRw==', 'brewer', '01/01/1999', 'a@a.com',
 'HOmSruexAbYm3qyY5PfebrlI2oBThGOL4e5lK5M+U6w2x0S7TUQKnqHxN6Eu15TdzGhBb2NTQjCj/+rr1XRoJtcAK' ||
 '+x1PYIAhyCZT15obFyDku6ABDy4KZEzh132RzeCTA+oxK6zhlTanUNtcIAPcp57ggfXEYYnEY19WAElZ8Y=');
--  ,
-- ('Admin2', 'FwvpdO+vnAODbHguKkSF3Q==', 'brewer', CAST('02/02/1998' as date), 'b@b.com', 'NeZJmRNM4Ngsw/a8ETvpu2Fjyl6FD3pqhtfruQhvsUadckffofngV6La9FjEnn5Q3Ww0iBKX91qv7Tta++OHJQvtEJfDK2bWSpsCiMIic2nHTUfEoFwTbtXCT4D41g+z9Iwybnhfr+Zzd2T3jwmrgmk1oiJwfKzrEN7J+ZCP4HQ='),
-- ('Admin3', 'BXcaDunH9TfSolELJ3Z6zw==', 'brewer', CAST('03/03/1997' as date), 'c@c.com', 'Mos1ff2qiF7Je6JuEy8erTK98qj2YEHk7lsjl3HRpKSXu5U1T97g+fTFOwZUpjNQgwqnzmd8Zk+oaSUDn7Fs8c8JphCCCZDALwDUWxEZoLOk4SJAcxg+VpgzjPenfQJ3qEFXRwG6Gx1zzKNFB00kVUbJk4sykOvGOtIk+FkH3l0='),
-- ('Admin4', 'J4K/y8+3dfhiBWY/XjwLXQ==', 'brewer', CAST('04/04/1996' as date), 'd@d.com', '7O4CTR3BsM934G6Zcof3kDn4r5vUv/1ZDnMTzBuE8NHb4ySiLle+CahcBtc3/QrJ+IX6CFr9S99kjMvakE91OsHWqsxPYBb091LT0ABcuXVfCcAj8+cQ/eUkez0725WODDfLI9csSzhdrk0ZeguGSsgkBdyYq742y014XNofChA=');

INSERT INTO brewery
    (name, brewer, hours_of_operation, phone, history, address, active_status, image) values
('The Funkatorium', 1, '11AM - 11PM', '(828) 552-3203','Wicked Weed sour & funky beers are served in a rustic pub ' ||
                                                       'with a barrel room & a dog-friendly patio.', '123 Main St.',
 true, 'brewery_1.jpg'),
('Highland Brewing Company', 1, '2PM - 9PM', '(828) 299-3370', 'Brewery offering free tours of its facilities plus a ' ||
                                                               'low-key taproom to sample a pint or flight.',  '4123 ' ||
                                                                                                               'Broad' ||
                                                                                                               ' St.',
 true, 'brewery_2.jpg'),
('Wicked Weed Brewing Pub', 1, '11AM - 11PM', '(828) 575-9599', 'Hip brewery with a tasting room & a restaurant ' ||
                                                                'serving high-end, locally sourced New American fare' ||
                                                                '.','6123 High St.', true, 'brewery_3.jpg'),
('Ben''s Tune Up', 1, '4PM - 11PM', '(828) 424-7580', 'Trendy brewery & beer garden offering house sakes, craft beers' ||
                                                      ' & Japanese-American fusion eats.', '7902 Park Place', true, 'brewery_4.jpg'),
('Asheville Brewing Company', 1, '', '', '', '', false, '');

INSERT INTO beer
    (active_status, name, brewery_id, image, description, abv, beer_type) values
(true, 'Black Angel', 1,
 'beer_1.jpg',
 'Black Angel is aged in bourbon barrels on over 1.5 pounds per gallon of tart Michigan Montmorency cherries. ' ||
 'It rests in the barrels for approximately 9 months and is then artfully blended to achieve complexity.',
 '6.8', 'Sour'),
(true, 'Watermelon Dragon Fruit Burst', 1, 'beer_2.jpg',
 'Burst into an explosion of tart fruit flavor that refreshes your senses with every sip. Vibrant colors, fresh fruits, ' ||
 'and a quenching tartness make Burst Session Sour a vivid new beer experience.', '4.5', 'Sour'),
(true, 'High Pines', 2, 'beer_3.jpg',
'This imperial IPA features citrus and blueberry hop flavors with a touch of fresh mountain pine.', '9', 'Imperial IPA'),
(true, 'Black Watch', 2, 'beer_4.jpg',
 'Black Watch Double Chocolate Milk Stout combines more than 100 pounds of cacao nibs with five malts, roasted barley,' ||
 ' and flaked oats to create a rich, high-gravity ale reminiscent of brownie batter and marshmallows with an aromatic ' ||
 'nose and a lingering dark chocolate finish.', '8', 'Double Chocolate Milk Stout'),
(true, 'Freak of Nature', 3, 'beer_5.jpg',
 'Freak of Nature. Noun. 1. An unusual, unexpected natural phenomenon. 2. An outlying, west coast style double India Pale ' ||
 'Ale brewed with an abnormally large quantity of hops. 3. A delicately crafted, and crushable ale designed for fresh and ' ||
 'immediate consumption. 4. A hophead vice or downfall. Ex: Though warned about its habit-forming hoppiness, they were ' ||
 'seduced by the dank, tropical, and drinkable Freak of Nature.', '8.5', 'Double IPA'),
(true, 'Fresh Pressed', 3, 'beer_6.jpg', 'Fresh pressed is a medium-bodied wheat ale ' ||
'that is hazy straw colored in nature. It is beautifully balanced with juicy and tropical fruit flavors. It’s brewed with mango, pineapple, and guava.', '5.2', 'Wheat Ale with Mango, Pineapple, and Guava'),
(true, 'Black Label Premium', 4, 'beer_7.jpg',
 'Our traditional Junmai Ginjo sake, this has been brightly filtered then diluted to 14% ABV. Full body, off dry with fruity/ floral notes.', '14', 'Sake');


INSERT INTO beer_review (beer_id, user_id, rating, review_title, review)
VALUES
       (1, 1, 5, 'AMAZING BEER!!!!','This is one of the best beers I have ever had'),
       (1, 1, 4, 'would try again?','Not normally a fan of this kind of beer but it was pretty ok - might try again ' ||
                                    'if I come back'),
       (2, 1, 3, 'Not a fan of Stouts', 'This beer was not my beer. Not a fan of stouts typically so not really sure ' ||
                                        'what I was expecting. ');

INSERT INTO beer_review_images (beer_review_id, image)
VALUES
       (1, 'review_1.jpg'),
       (1, 'review_2.jpg');
COMMIT;