--all unctin names begins with json.
-- always type cast existing row in db val::jsonb;

select '{"a":1}'::jsonb->'a'; -- slects elemnt as json or jsonb.
select '{"a":{"a":1}}'::jsonb->'a'->'a';
select '{"a":1}'::jsonb->>'a'; -- selects element as text 
-> selects value as json or jsonb
->> selects value as text.
:: type casting;

-- creating tables.
create table json_test( id SERIAL, val json);
    or
create table json_test( id int, val json); // bigint

-- inserting json value.
insert into json_test(id, val) values (1, '{"a":1}'), (2, '{"b":2}');

--selecting key
select val->'c' from json_test;
select val->>'c' from json_test;

-- updating key
update json_test set val = (val::jsonb || '{"c":3}');
UPDATE table_name SET column_name = jsonb_set(cast(column_name as jsonb), '{key}', '"value"', true) WHERE id = 'target_id';

-- deleting key
select val::jsonb-'c' from json_test;

-- to delete nestead object.
select val::jsonb #- '{a,a,d}' from json_test;
actual value - {"a": {"a": {"d": 2}}, "d": {"a": 2}}
result - {
  "a": {
    "a": {}
  },
  "d": {
    "a": 2
  }
}

--updating nestead object
update json_test set val = jsonb_set(val::jsonb, '{a,a}', to_jsonb(2));
    or
update json_test set val = jsonb_set(val::jsonb, '{a,a}', '2');
update json_test set val = jsonb_set(val::jsonb, '{a,a}', '{"d":2}');
only type caste existing db value.

--json_each() returns top level key value in tuple.
select json_each(val) from json_test;

--json_build-object
select json_build_object('a',1);
select json_build_object('a',json_build_object('b',1));

--json_object_keys
select json_object_keys(val) from json_test;

--arrays
select json_array_elements(val->'a'->'a'->'d') from json_test;

