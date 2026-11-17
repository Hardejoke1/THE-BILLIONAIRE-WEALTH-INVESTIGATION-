-- 1 Retrieve the 20 richest billionaires 

select *
from Top200RichestPersonintheWorld
order by rank ASC
limit 20;

--2 identify the five youngest billionaires

select *
from Top200RichestPersonintheWorld
order by age ASC
limit 5;

--3 Calculate the average age and average networth

select 
      AVG(age) as average_age,
      AVG(networth_billion) AS average_net_worth
from Top200RichestPersonintheWorld

--4 Identify the five most represented countries

select 
    country,
    count(*) AS billionaire_count
from Top200RichestPersonintheWorld
group by country
order by billionaire_count DESC
limit 5;

--5 Calculate the combined net worth of billionaires from each country

SELECT 
    country,
    sum(networth_billion) as total_net_worth
from Top200RichestPersonintheWorld
group by country
order by total_net_worth desc;


--6 Identify the five industries with the highest number of billionaires

select 
    industry,
    count(*) as billionaire_count
from Top200RichestPersonintheWorld
group by industry
order by billionaire_count DESC
limit 5;


--7 find countries with atleast five billionaires

select 
    country,
    count(*) as billionaire_count
from Top200RichestPersonintheWorld
group by country
having count(*) >= 5
order by billionaire_count desc

--8 calculate the total wealth of billionaires younger than 50

SELECT
    sum(networth_billion) as total_wealth_under_50
from Top200RichestPersonintheWorld
where age < 50;

--9 Identify billionaires whose net worth exceeds the overall average net worth

select *
from Top200RichestPersonintheWorld
where networth_billion > (
  select AVG(networth_billion)
  from Top200RichestPersonintheWorld
  )
  order by networth_billion desc;
  
  --10 identify the industry with the highest average net worth
  
  SELECT
      industry,
      AVG(networth_billion) AS avg_net_worth
from Top200RichestPersonintheWorld
group by industry
order by avg_net_worth DESC
limit 1;
