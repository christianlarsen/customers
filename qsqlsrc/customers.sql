create or replace table clv1.customers (
    id numeric(5) not null 
        generated always as identity 
            (start with 7 , increment by 1),
    descrip varchar(30) not null,
    check (id >= 0),
    primary key(id)  
);
