-- *****************************************************************************
-- This script contains INSERT statements for populating tables with seed data
-- *****************************************************************************

BEGIN;

-- INSERT statements go here
INSERT INTO app_user
    (user_name, password, role, birthdate, email_address) VALUES
('a', 'a', 'brewer', CAST('01/01/1999' as date), 'a@a.com'),
('b', 'b', 'brewer', CAST('02/02/1998' as date), 'b@b.com'),
('c', 'c', 'brewer', CAST('03/03/1997' as date), 'c@c.com'),
('d', 'd', 'brewer', CAST('04/04/1996' as date), 'd@d.com');

INSERT INTO brewery
    (name, brewer, hours_of_operation, phone, history, active_status) values
('The Funkatorium', 1, '11AM - 11PM', '(828) 552-3203','Wicked Weed sour & funky beers are served in a rustic pub with a barrel room & a dog-friendly patio.', true),
('Highland Brewing Company', 2, '2PM - 9PM', '(828) 299-3370', 'Brewery offering free tours of its facilities plus a low-key taproom to sample a pint or flight.', true),
('Wicked Weed Brewing Pub', 1, '11AM - 11PM', '(828) 575-9599', 'Hip brewery with a tasting room & a restaurant serving high-end, locally sourced New American fare.', true),
('Ben''s Tune Up', 3, '4PM - 11PM', '(828) 424-7580', 'Trendy brewery & beer garden offering house sakes, craft beers & Japanese-American fusion eats.', true),
('Asheville Brewing Company', 4, '', '', '', false);

COMMIT;