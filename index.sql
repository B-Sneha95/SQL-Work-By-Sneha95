/* In SQL, an index is a database object that helps 
speed up the retrieval of data from a table. 
You can think of it like the index in a book — 
instead of scanning every page, 
you can jump directly to the section you want.
When you run queries with WHERE, JOIN, ORDER BY, 
or GROUP BY, the database has to search through rows
 to find the matching records. Without indexes,
 it may scan the entire table (full table scan), 
 which can be slow for large datasets.

With an index,
 the database can quickly locate the needed data.*/

/*Select all records from the ‘salaries’ table of people 
whose salary is higher than $89,000 per annum.
Then, create an index on the ‘salary’ column of
 that table, and check if it has sped up the search of 
 the same SELECT statement.*/
 
 select * from salaries 
 where salary>89000;
 
 create index i_sal on salaries(salary);