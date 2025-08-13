use Blinkit_database;
select * from Blinkit;
select count(*) from Blinkit;

update blinkit
set Item_Fat_Content = 
case
when Item_Fat_Content in ('LF', 'low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end;

select * from blinkit;
select distinct(Item_Fat_Content) from blinkit;

-- KPI Requierments
select round(sum(Sales)/1000000,3) as total_sales_in_millions from blinkit;
select * from blinkit;

select round(avg(Sales),0) as avg_sales from Blinkit;

select count(*) as No_of_items from blinkit;

select round(sum(Sales)/1000000,2) as total_sales_in_millions from blinkit
where Item_Fat_Content = 'Low Fat'

select round(avg(Sales),0) as avg_sales from Blinkit
where Outlet_Establishment_Year = 2022;

select round(avg(Rating),2) as avg_rating from Blinkit;

-- Grnular Requierments
select * from Blinkit;

-- total sales by fat content
select Item_Fat_Content, 
round(sum(Sales),2) as total_sales,
round(avg(Sales),2) as avg_sales,
round(avg(Rating),2) as avg_rating,
count(*) as no_of_items
from blinkit
Group by Item_Fat_Content
order by total_sales desc;

-- total sales by item type
select Item_Type, 
round(sum(Sales),2) as total_sales,
round(avg(Sales),2) as avg_sales,
round(avg(Rating),2) as avg_rating,
count(*) as no_of_items
from blinkit
Group by Item_Type
order by total_sales desc;

select * from Blinkit;

-- fat content by outlet for total sales
select  Outlet_Location_Type, Item_Fat_Content, 
round(sum(Sales),2) as total_sales
from Blinkit
Group by  Outlet_Location_Type,Item_Fat_Content
order by total_sales desc;

select * from Blinkit;

select Outlet_Location_Type,
	isnull([Low Fat],0) as Low_Fat,
	isnull([Regular],0) as Regular
	from 
(select  Outlet_Location_Type, Item_Fat_Content, 
round(sum(Sales),2) as total_sales
from Blinkit
Group by  Outlet_Location_Type,Item_Fat_Content
) as source_table
Pivot
(sum(total_sales)
for Item_Fat_Content in ([Low Fat], [Regular]) 
) as PivotTable
order by Outlet_Location_Type;

-- total sales by outlet establishment 
select Outlet_Establishment_Year, 
round(sum(Sales),2) as total_sales,
round(avg(Sales),2) as avg_sales,
round(avg(Rating),2) as avg_rating,
count(*) as no_of_items
from Blinkit group by Outlet_Establishment_Year 
order by total_sales desc;

-- percentage of sales by outlet size
select * from Blinkit;
select Outlet_Size, round(sum(Sales),2) as total_sales, 
round((sum(Sales)*100/(select sum(Sales) from Blinkit)),2) as Sales_percentage
from Blinkit group by Outlet_Size order by Sales_percentage desc;

-- Sales by outlet location
select Outlet_Location_Type, 
round(sum(Sales),2) as total_sales,
round(avg(Sales),2) as avg_sales,
round(avg(Rating),2) as avg_rating,
count(*) as no_of_items
from Blinkit group by Outlet_Location_Type 
order by total_sales desc;

-- all metrics by outlet type
select Outlet_Type, 
round(sum(Sales),2) as total_sales,
round((sum(Sales)*100/(select sum(Sales) from Blinkit)),2) as Sales_percentage,
round(avg(Sales),2) as avg_sales,
round(avg(Rating),2) as avg_rating,
count(*) as no_of_items
from Blinkit group by Outlet_Type 
order by total_sales desc;

select * from Blinkit;