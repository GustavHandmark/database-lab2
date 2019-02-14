
Answers

4. 
a)
Which relations have natural keys?
Movies, users, theaters (perhaps if there are theaters with the same name, this wouldn't be unique, and we should probably use compounded key with location and name, or an invented key.)

b.)
Is there a risk that any of the natural keys will ever change?

c.)
Are there any weak entity sets?
Since four of our tables have natural keys or invented keys, only one remains. 
In this case, performances do not have a natural key, or and invented key, which 
results in this table being weak.
d.)
In which relations do you want to use an invented key. Why?
Invented keys are artifical values and are used where we cannot use any specific
value as our primary key, or if such a value wouldn't be a unique identifier.
Especially if our key changes, which would lead to more updates.

6.)
users(_username_, u_name,password)
movies(_title_,prod_year,imdb_id,running_time)
theaters(_t_name_,capacity)
performances(_title_,_t_name_,_date_,_time_,seats_available)
tickets(_id_,/usersname/,/title/,/date/,/time/)

7.)
Two waits to keep track of the number of seats available:
seats_available entity. upsides: downsides:
