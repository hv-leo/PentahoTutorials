drop database if exists soccer;
create database soccer;
use soccer;

create table date_dim(
  id int unsigned auto_increment primary key,
  date_day int,
  date_month int,
  date_year int,
  date_season varchar(20)
);

create table league_dim(
  id int unsigned auto_increment primary key,
  country varchar(20),
  league_name varchar(20)
);

create table team_dim(
  id int unsigned auto_increment primary key,
  team_name varchar(20),
  league varchar(20),
  country varchar(20)
); 

create table opponent_dim(
  id int unsigned auto_increment primary key,
  opponent_name varchar(20),
  league varchar(20),
  country varchar(20)
);

create table soccer_fact(
  date_id int unsigned not null,
  league_id int unsigned not null,
  team_id int unsigned not null,
  opponent_id int unsigned not null,
  won int,
  drawn int,
  lost int,
  team_shots int,
  team_shots_on_target int,
  primary key(date_id,league_id,team_id,opponent_id),
  foreign key(date_id) references date_dim(id) on delete cascade,
  foreign key(league_id) references league_dim(id) on delete cascade,
  foreign key(team_id) references team_dim(id) on delete cascade,
  foreign key(opponent_id) references opponent_dim(id) on delete cascade
); 