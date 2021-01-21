-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.  
select title, length, rank() over(order by length desc) as 'Rank'
from sakila.film
where length<>0;
-- Rank films by length within the `rating` category (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, rating and the rank.  
select title, rating, length, rank() over(partition by rating order by length desc) as 'Rank'
from sakila.film
having length<>0;
-- How many films are there for each of the categories in the category table. Use appropriate join to write this query
use sakila;
select c.category_id, c.name, count(f.film_id) as no_of_films from category as c
join film_category as f
on c.category_id = f.category_id
group by c.category_id
order by c.category_id;
-- Which actor has appeared in the most films?
select count(f.film_id) as no_film, a.actor_id, a.first_name, a.last_name from actor as a
join film_actor as f
on a.actor_id = f.actor_id
group by f.actor_id
order by no_film desc
limit 1;
-- Most active customer (the customer that has rented the most number of films)
select c.first_name, c.last_name, count(r.rental_id) as no_of_rentals from rental as r
join customer as c
on r.customer_id = c.customer_id
group by r.customer_id
order by no_of_rentals desc
limit 1;


The answer is Bucket Brotherhood
This query might require using more than one join statement. Give it a try. We will talk about queries with multiple join statements later in the lessons.
