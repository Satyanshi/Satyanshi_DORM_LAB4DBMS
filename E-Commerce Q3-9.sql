-- 3)	Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.

Select customer.CUS_GENDER, count(distinct customer.CUS_ID) from customer left join orders on customer.CUS_ID = orders.CUS_ID where orders.ORD_AMOUNT >= 3000
group by customer.CUS_GENDER;

-- 4)	Display all the orders along with product name ordered by a customer having Customer_Id=2

select o.ORD_AMOUNT, o.ORD_DATE, p.PRO_NAME from orders as o 
left join customer as c on c.CUS_ID = o.CUS_ID
left join supplier_pricing as sp on sp.PRICING_ID = o.PRICING_ID
left join product as p on p.PRO_ID = sp.PRO_ID
where o.CUS_ID =2;

-- 5)	Display the Supplier details who can supply more than one product.

select distinct S.SUPP_NAME,S.SUPP_CITY,S.SUPP_PHONE from supplier_pricing as SP
left join product as P on P.PRO_ID = SP.PRO_ID
left join supplier as S on S.SUPP_ID = SP.SUPP_ID
GROUP BY SP.PRO_ID,  SP.SUPP_ID;

-- 8)	Display customer name and gender whose names start or end with character 'A'.

select CUS_NAME, CUS_GENDER from customer where CUS_NAME like 'A%';

-- 7)	Display the Id and Name of the Product ordered after “2021-10-05”.

select p.PRO_ID, p.PRO_NAME from orders as o
left join supplier_pricing as sp on o.PRICING_ID = sp.PRICING_ID
left join product as p on sp.PRO_ID = p.PRO_ID
where o.ORD_DATE > '2021-10-05';


