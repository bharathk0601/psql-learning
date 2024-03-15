-- append and prepend.
select array_append('{1,2,3}',1);
select array_prepend('{1,2,3}',1);

-- removing element.
select array_remove('{1,2,3}',1);
select array_remove('{1,2,3,10}', 10); -- removes the element by value.

--merging array.
select array_cat('{1,2,3}','{1,2}');

--array postion.
select array_position('{1,2,3,10}', 10);

--searching element.
select 1 = ANY('{1,2,3}');