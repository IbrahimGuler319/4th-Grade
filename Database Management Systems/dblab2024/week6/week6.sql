use movie_db;
# 1. Show the films with a budget greater than $10 million and a ranking lower than 6.
select m.title, m.budget, m.ranking 
from movies m
where m.budget > 10000000 and m.ranking < 6;

# 2. Show the action films with a rating higher than 8.8, produced after 2009.
select m.title, m.rating, m.year, g.genre_name 
from movies m
join genres g on m.movie_id = g.movie_id
where m.rating > 8.8 and m.year < 2009 and g.genre_name = 'Action';

# 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
select m.title, m.duration, m.oscars, g.genre_name 
from movies m
join genres g on m.movie_id = g.movie_id
where m.duration > 150 and m.oscars > 2 and g.genre_name = 'Drama';

# 4. Show the films in which Orlando Bloom and Ian McKellen acted together and that have won more than 2 Oscars.
select m.title, m.oscars
from movies m
join movie_stars ms on m.movie_id = ms.movie_id
join stars s on ms.star_id = s.star_id
join movie_stars ms1 on m.movie_id = ms1.movie_id
join stars s1 on ms1.star_id = s1.star_id
where m.oscars > 2 and s.star_name = 'Orlando Bloom' and s1.star_name = 'Ian McKellen';

# 5. Show the Quentin Tarantino films with more than 500,000 votes, produced before 2000.
select m.movie_id, m.title
from movies m
where m.votes > 500000 and  m.year < 2000 and m.movie_id in (
select md.movie_id
from movie_directors md
#join directors d on md.director_id = d.director_id
where md.director_id in (
select d.director_id
from directors d
where d.director_name = "Quentin Tarantino"
));
# 6. Show the thriller films with a budget greater than $25 million.

# 7. Show the drama films in Italian, produced between 1990 and 2000.
select m.title, g.genre_name, l.language_name, m.year
from movies m
join languages l on m.movie_id = l.movie_id
join genres g on m.movie_id = g.movie_id
where g.genre_name = "Drama" and l.language_name = "Italian" and m.year between 1990 and 2000;
# 8. Show the films featuring Tom Hanks that have won more than 3 Oscars.

# 9. Show the history films produced in the USA with a duration between 100 and 200 minutes.

# 10. Compute the average budget of films directed by Peter Jackson.
select avg(m.budget) as avg_budget
from movies m
join movie_directors md on m.movie_id = md.movie_id
join directors d on d.director_id = md.director_id
where d.director_name = "Peter Jackson";
# 11. Show the Francis Ford Coppola film with the lowest budget.
select m.title, m.budget
from movies m
join movie_directors md on m.movie_id = md.movie_id
join directors d on d.director_id = md.director_id
where d.director_name = "Francis Ford Coppola"
order by m.budget asc 
limit 1;
# 12. Show the film with the most votes that was produced in the USA.

# 13. Show films produced in more than one country
select m.title, count(pc.country_id) as pc_count
from movies m 
join producer_countries pc on m.movie_id = pc.movie_id
group by pc.movie_id
having pc_count > 1;
# 14. List all stars who have acted in more than 2 films

# 15. Show the films with a duration of more than 150 minutes and more than half of a million votes
select m.title, m.duration, m.votes from movies m where m.duration > 150 and m.votes > 500000
# 16. List all directors who have directed more than 2 films