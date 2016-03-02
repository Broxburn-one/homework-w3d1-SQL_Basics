
Section 1
==========

1. Select the names of all users
    SELECT * FROM users;

2. Select the names of all shows that cost less than £15.
   select * from shows where price < 15.00;

3. Insert a user with the name "Val Gibson" into the users table.
   INSERT INTO "users" (name) VALUES ('Val Gibson');

4. Select the id of the user with your name.
  SELECT id FROM users WHERE name = 'Val Gibson';

5. Insert a record that Val Gibson wants to attend the show "Two girls, one cup of comedy".
    INSERT INTO "shows_users" (show_id, user_id) VALUES (10, 5);

6. Updates the name of the "Val Gibson" user to be "Valerie Gibson".
    UPDATE users SET name = 'Valerie Gibson' where name = 'Val Gibson';

7. Deletes the user with the name 'Valerie Gibson'.
    DELETE FROM users WHERE name = 'Valerie Gibson';

8. Deletes the shows for the user you just deleted.
    delete from shows_users where user_id = 5;

Section 2
----------

1. Select the names and prices of all shows, ordered by price in ascending order.
    SELECT name, price FROM shows ORDER BY price;


2. Select the average price of all shows.
    SELECT avg(price) FROM shows;

3. Select the price of the least expensive show.
    SELECT min(price) FROM shows;

4. Select the sum of the price of all shows.
    SELECT sum(price) FROM shows;

5. Select the sum of the price of all shows whose prices is less than £20.
    SELECT sum(price) FROM shows where price < 20;
  
6. Select the name and price of the most expensive show.
    SELECT max(price) FROM shows;

7. Select the name and price of the second from cheapest show.

      SELECT MAX(price) FROM shows
      WHERE price NOT IN (SELECT MAX(price) FROM shows );

        SELECT TOP 1 price,name
        FROM (
        SELECT DISTINCT TOP 1 price,name
        FROM shows
        ORDER BY price DESC) a
        ORDER BY price;


8. Select the names of all users whose names start with the letter "N".
    SELECT name from users where name like 'N%';

9. Select the names of users whose names contain "mi"
    SELECT name from users where name like '%ni%';


Section 3
----------

1. Select the time for the Edinburgh Royal Tattoo.

 select times.time
 from times, shows
  where shows.name = 'Edinburgh Royal Tattoo'
  and show_id = shows.id;

also:

  select times.time 
  from times
  inner join shows on
  times.show_id = shows.id
  and shows.name = 'Edinburgh Royal Tattoo';
  



2. Select the number of users who want to see "Shitfaced Shakespeare".

select count(user_id) 
  from shows_users
  inner join shows on
  shows_users.show_id = shows.id
  and shows.name = 'Shitfaced Shakespeare';


3. Select all of the user names and the count of shows they're going to see.

  select users.name, count(shows_users.show_id) AS NumberOfShows
  from shows_users
  inner join users on
  users.id = shows_users.user_id
  GROUP BY name;


4. SELECT all users who are going to a show at 17:15.
    select users.name 
    from users
    inner join shows_users on 
    shows_users.user_id = users.id
    inner join times on
    times.show_id = shows_users.show_id
    where times.time = '17:15';




=============================
(aide-memoire)

Model from class

-- select victim.name, victim.id, zombie.type, zombie.id, attack.attach_date
from victim
inner join attack on 
victim.id = attack.victim_id
inner join zombie on
attack.zombie_id = zombie.id
where attack.attack_date = ’28 Jun 2015’;


is same as


select * from 
victim, zombie, attack
where attack_date = ’28 Jun 2015’
and victim.id = attack.victim_id
and zombie.id = attack.zombie.id;
