/* In this lab, you will be using the [Sakila](https://dev.mysql.com/doc/sakila/en/) database of movie rentals. You have been using this database for a couple labs already, but if you need to get the data again, refer to the official [installation link](https://dev.mysql.com/doc/sakila/en/sakila-installation.html).

The database is structured as follows:
![DB schema](https://education-team-2020.s3-eu-west-1.amazonaws.com/data-analytics/database-sakila-schema.png)

### Instructions
1. In the table actor, which are the actors whose last names are not repeated? For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list. 
2. Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
3. Using the rental table, find out how many rentals were processed by each employee.
4. Using the film table, find out how many films were released each year.
order5. Using the film table, find out for each rating how many films were there.
6. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places 
7. Which kind of movies (rating) have a mean duration of more than two hours?
*//
-- 1 
use sakila;
select actor_id, first_name, last_name from actor
group by last_name
having count(last_name) = 1
order by actor_id;
-- 2 
select last_name , count(last_name) as frequency from actor
group by last_name
having count(last_name) > 1
order by last_name;
-- 3 
select count(rental_id) as no_of_rentals , staff_id from rental
group by staff_id
order by staff_id;
-- 4 
select count(film_id) as no_of_films, release_year from film
group by release_year;
-- 5 
select rating, count(film_id) as no_of_films from film
group by rating
order by rating asc;
-- 6 
select rating, round(avg(length),2) as avg_length from film
group by rating
order by rating asc;
-- 7
select rating, round(avg(length),2) as avg_length from film
group by rating
having avg_length > 120
order by rating asc;