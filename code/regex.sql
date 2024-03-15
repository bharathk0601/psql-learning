select * from actor where first_name ~ '^S.*a$'; -- begins with S ends with a middle any character.
select * from actor where first_name ~ '(?i)^s'; -- case insensitive comparision.
select * from actor where first_name ~ '^[a-zA-Z]';
select * from actor where first_name ~ '(?!)^[a-zA-Z]'; -- (?!) not operator.