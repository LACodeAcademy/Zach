select * from users
select * from exercises
select * from muscles
select * from regions


alter table exercises
add RegionId int

update exercises set targetmuscleid = null, regionid = null


select * from exercises where targetmuscle = 'deltoids'
update exercises set regionid = 2 where region = 'Back'


update e set e.targetmuscleid = m.muscleid from exercises e
left outer join muscles m on e.targetmuscle = m.musclename


insert into regions (regionname) values ('Shoulders'), ('Back')


insert into users (fname, lname, birthdate) values ('Loren', 'Anderson', '1/10/1985')


select e.exercise, m.musclename
from exercises e
left outer join muscles m on m.muscleid = e.targetmuscleid

select exercises.exercise, muscles.musclename  from exercises
left outer join muscles on muscles.muscleid = exercises.targetmuscleid

select * from muscles
select * from exercises


insert into regions (regionname)
select distinct region from exercises where region not in ('back', 'shoulders')