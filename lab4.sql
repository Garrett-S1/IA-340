--Q4.1
/* No, because we still have VA records in the other tables*/

--Q4.2
/* No, because no state has fips of 80*/ 

--Q4.3
/* Yes, its not perfect but it is functional and has no syntax errors, it just isn't optimized*/

--Q4.5
/* Yes, it did a good job recognizing the diagram*/

--Q4.6
SELECT n.name, i.income, i.year
FROM income i
JOIN name n ON i.fips = n.fips
WHERE i.year = (SELECT MAX(year) FROM income)
ORDER BY i.income DESC
LIMIT 1;
/* Yes, it works*/

--Q4.7
WITH va_population AS (
    SELECT year, pop
    FROM population
    WHERE fips = '51'
    ORDER BY year DESC
    LIMIT 6  -- Get data for the past 5 years + 1 additional year to calculate growth for the first year
)
SELECT
    curr.year AS year,
    curr.pop AS current_population,
    prev.pop AS previous_population,
    ((curr.pop - prev.pop) / CAST(prev.pop AS DECIMAL)) * 100 AS growth_rate_percentage
FROM
    va_population curr
JOIN
    va_population prev ON curr.year = prev.year + 1  -- Join on consecutive years
ORDER BY
    curr.year DESC;
/* My original prompt was "calculate the VA population growth rate in the past 5 years", I had to modify it to be "calculate the VA population growth rate of each year in the past five 
years". Which provided a growth rate for each year when the original prompt just provided the growth from 2015 to 2019.*/

--Q4.8
/* It doesn't always give accurate results because the prompts need to be specific, but it can still generate what you need*/
