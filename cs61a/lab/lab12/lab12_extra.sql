.read lab12.sql

CREATE TABLE smallest_int_having AS
  SELECT time, smallest from students group by smallest having count(*) = 1;

CREATE TABLE fa19favpets AS
  SELECT pet, count(*) as count from students group by pet order by count desc, pet limit 10;


CREATE TABLE fa19dog AS
  SELECT pet, count(*) from students where pet = 'dog';


CREATE TABLE obedienceimages AS
  SELECT seven, instructor, count(*) from students where seven = '7' group by instructor;