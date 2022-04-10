create or replace view clv1.customers1 as
    select c.id, c.descrip, count(*) as orders
    from clv1.customers c
    join clv1.orders o on
        c.id = o.customerid
    group by c.id, c.descrip;

