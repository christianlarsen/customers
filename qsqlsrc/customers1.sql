create or replace view clv1.customers1 as
    select c.id, c.descrip, count(*) as orders
    from clv1.customers c
    join clv1.orders o on
        c.id = o.customerid 
    group by c.id, c.descrip
union
    select c.id, c.descrip, 0 as orders
    from clv1.customers c
    exception join clv1.orders o on
        c.id = o.customerid
    group by c.id, c.descrip;


label on table clv1.customers1 is 'CUSTOMERS View(1)';

label on column clv1.customers1 (
    id          is 'ID',
    descrip     is 'Description',
    orders      is 'Nr. of Orders'
);
