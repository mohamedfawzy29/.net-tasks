Create database task7

use task7

create schema tasks

create table tasks.actor (
	act_id int primary key,
	act_fname char(20),
	act_lname char(20),
	act_gender char(1)
)

create table tasks.director (
	dir_id int primary key,
	dir_fname char(20),
	dir_lname char(20)
)

create table tasks.movie (
	movie_id int primary key,
	movie_title char(50),
	movie_year int,
	movie_time int,
	movie_lang char(50),
	movie_dt_rel date,
	movie_rel_country char(5)
)

create table tasks.reviewer (
	rev_id int primary key ,
	rev_name char(30)
)

create table tasks.genres (
	gen_id int primary key,
	gen_title char(20)
)

create table tasks.movie_cast (
	actor_id int references tasks.actor(act_id),
	mov_id int references tasks.movie(movie_id),
	[role] char(30),
	primary key (actor_id , mov_id)
)

create table tasks.movie_direction (
	director_id int references tasks.director(dir_id),
	mov_id int references tasks.movie(movie_id),
	primary key (director_id , mov_id)
)

create table tasks.movie_genres (
	mov_id int references tasks.movie(movie_id),
	genre_id int references tasks.genres(gen_id),
	primary key (genre_id , mov_id)
)

create table tasks.rating (
	mov_id int references tasks.movie(movie_id),
	reviewer_id int references tasks.reviewer(rev_id),
	rev_stars int,
	num_of_ratings int,
	primary key (mov_id , reviewer_id)
)

