use restaurant;
/*EJERCICIO 1*/
/*Con "select"*/

select name
from ingredients
where vendorid = (
	select vendorid
    from vendors
    where companyname = 'Veggies_R_Us'
);
/*Con "Inner join"*/

select name
from ingredients
inner join vendors on ingredients.vendorid = vendors.vendorid
&& vendors.companyname = 'Veggies_R_Us';


/*Ejercicio 2*/
/*Con "select"*/

select name
from ingredients
where vendorid in(
	select vendorid
    from vendors
    where vendors.companyname = 'Veggies_R_Us' 
    or  vendors.companyname = 'Spring Water Supply'
);
/*Con "Inner join"*/

select name
from ingredients
inner join vendors on ingredients.vendorid = vendors.vendorid
&&(vendors.companyname = 'Veggies_R_Us'
or vendors.companyname = 'Spring Water Supply'
);


/*Ejercicio 3*/
/*Con "select"*/

select avg(price)
from items
where itemid in (
    select itemid
    from madewith
    where ingredientid in (
       select ingredientid
       from ingredients
       where vendorid = (
           select vendorid
           from vendors
           where vendors.companyname = 'Veggies_R_Us'
       )
    )
);
/*Con "Inner join"*/

select avg(price)
from items
inner join madewith on items.itemid = madewith.itemid
inner join ingredients on ingredients.ingredientid = madewith.ingredientid
inner join vendors on vendors.vendorid = ingredients.vendorid
&& vendors.companyname = 'Veggies_R_Us';


/*Ejercicio 4*/   

select name,inventory from ingredients
where inventory<(select avg(inventory) from ingredients);

/*Ejercicio 5*/
select companyname
from vendors
where vendors.referredby = (
     select vendorid 
     from vendors 
     where companyname='Veggies_R_Us')
     and vendorid in(
         select vendors.vendorid 
         from vendors
         inner join ingredients on vendors.vendorid=ingredients.vendorid
         and ingredients.foodgroup = 'Milk'
     )