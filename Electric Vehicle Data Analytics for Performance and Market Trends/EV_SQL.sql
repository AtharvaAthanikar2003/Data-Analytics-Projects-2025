use evsql
select * from [dbo].[EV_Data]

--- 1. Find out which cities had produced the Tesla cars in 2014
select City, Make, [Model Year] from EV_Data where [Model Year] In (2014) and Make = 'TESLA'

--- 2. Find the total no.of cars produced by all car companies (Make) in 2019
select count (*) as Total_Cars_In_2019 from EV_Data where [Model Year] in (2019)
--- For all cars from 2008-2025, put "between 2008 and 2020" instead of "in 2019"

--- 3. Check the EV type of BMW car produced in 2018 of Model - 530E in Tacoma City
select distinct([Electric Vehicle Type]) from EV_Data 
where Make = 'BMW' and Model = '530E' and 
City = 'Tacoma' and [Model Year] = 2018

--- 4. Check which county had the highest no.of cars produced from 2008 to 2020 and give it's count in next column as Total_Cars
select top 1 County, count (*) as Total_Cars from EV_Data 
where [Model Year] between 2008 and 2020 
group by County
order by Total_Cars desc

--- 5. Make a list of cars produced in 2013-2019 having EV type as BEV
SELECT Make, [Model], [Electric Vehicle Type], [Model Year]
FROM EV_Data
WHERE [Model Year] BETWEEN 2013 AND 2019
AND [Electric Vehicle Type] LIKE '%Battery Electric%';

--- 6. Find out how many cars produced in 2013-2019 were of BEV (Battery EV) type
SELECT 'Battery Electric Vehicle (BEV)' AS EV_Type, COUNT(*) AS Total_Count
FROM EV_Data
WHERE [Model Year] BETWEEN 2013 AND 2019
AND [Electric Vehicle Type] = 'Battery Electric Vehicle (BEV)';

--- 7. Find out in 2017, which car make and model in Seattle city had the highest Electric Range
select Top 1 Make, Model, City, [Model Year], [Electric Range] from EV_Data 
where [Model Year] = 2017 and City = 'Seattle' 
order by [Electric Range] desc

--- 8. Check which car has the highest electric range
SELECT TOP 1 Make, Model, [Model Year], [Electric Range] AS Electric_Range
FROM EV_Data
WHERE ISNUMERIC([Electric Range]) = 1
ORDER BY CAST([Electric Range] AS INT) DESC;

--- 9. Check which car has the highest Base MSRP
SELECT TOP 1 Make, Model, [Model Year], [Base MSRP] AS Electric_Range
FROM EV_Data
WHERE ISNUMERIC([Base MSRP]) = 1
ORDER BY CAST([Base MSRP] AS INT) DESC;

--- 10. Make a list of cars produced in PHEV type between 2010-2016
SELECT DISTINCT Make, Model, [Model Year]
FROM EV_Data
WHERE [Model Year] BETWEEN 2010 AND 2016
  AND [Electric Vehicle Type] = 'Plug-in Hybrid Electric Vehicle (PHEV)';
