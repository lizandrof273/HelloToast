CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT a.name, b.size from dogs as a, sizes as b where a.height > b.min and a.height <= b.max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_parent_height AS
  SELECT a.child from parents as a, dogs as b where a.parent = b.name order by -b.height;

-- Filling out this helper table is optional
CREATE TABLE siblings AS
  SELECT a.child as sib1 , b.child as sib2 from parents as a, parents as b where a.parent = b.parent and a.child < b.child;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  SELECT c.sib1 || " and " || c.sib2 || " are " || a.size || " siblings"
  from size_of_dogs as a, size_of_dogs as b, siblings as c
  where a.name = c.sib1 and b.name = c.sib2 and a.size = b.size
  order by a.name;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks_helper(dogs, stack_height, last_height);

-- Add your INSERT INTOs here
insert into stacks_helper SELECT name, height, height from dogs;

insert into stacks_helper SELECT a.dogs || " , " || b.dogs + a.stack_height + b.stack_height, b.stack_height
  from stacks_helper as a, stacks_helper as b
  where a.dogs <> b.dogs and a.last_height < b.last_height;

  insert into stacks_helper SELECT a.dogs || " , " || b.dogs + a.stack_height + b.stack_height, b.stack_height
    from stacks_helper as a, stacks_helper as b
    where a.stack_height > a.last_height and b.last_height = b.last_height and b.last_height > a.last_height;

  insert into stacks_helper SELECT a.dogs || " , " || b.dogs + a.stack_height + b.stack_height, b.stack_height
    from stacks_helper as a, stacks_helper as b
    where a.stack_height > a.last_height and b.last_height = b.last_height and b.last_height > a.last_height;

CREATE TABLE stacks AS
  SELECT name from dogs where n < 4;
