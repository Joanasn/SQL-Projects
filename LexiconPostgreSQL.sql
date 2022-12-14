SELECT: --Determines which columns of the data to show in the results
FROM: -- From which table
WHERE -- is used to limit the number of rows returned
GROUP BY -- allows you to combine rows and aggregate data
HAVING -- allows you to filter the data after GROUP BY 
AVG -- calculates the 'average' of a numeric column from an specific column, returns it as a column
AS -- renames a column or table using an alias
ORDER BY -- gives a way to sort the result
COUNT -- will count the number of rows and return that count as a column
JOIN - INNER JOIN -- select records that have matching values in two tables
LEFT JOIN -- select all the records from the left table and show the matching rows from the right table
RIGHT JOIN -- select all the records from the right table and show the matching rows from the left table
FULL OUTER JOIN -- return all rows for which there is a match in either of the tables
LIKE -- used in a WHERE or HAVING to select specific information
SHOW ALL -- Show all parameters
SHOW TIMEZONE--Show the timezone you are working with
SELECT NOW() --Show the current time stamp
SELECT TIMEOFDAY() -- Show the current time stamp as a string(easier to read)
SELECT CURRENT_TIME, CURRENT_DATE -- Show the current time and the current_date
EXTRACT(YEAR FROM date_col) -- Extract YEAR of a date value
EXTRACT(YEAR FROM date_col) -- Extract the current year of the column
AGE(date_col) -- Calculates the age of the timestamp when you query it
TO_CHAR(column_name) --- Converts the column to character
TO_CHAR(date_col, 'mm-dd-yyyy') -- Formats the date to text
-- YEAR, MONTH, DAY, QUARTER
|| CONCAT -- Combines two columns
UPPER -- Uppercases the result
LOWER -- Lowercases the result
SUBQUERY -- A query nested inside a larger query. The subquery runs first.
EXIST -- It's used to test for the existance of any record in any subquery
SELF-JOIN -- To join a table with itself. A join of two copies of the same table. No special keywords. Uses alias.


