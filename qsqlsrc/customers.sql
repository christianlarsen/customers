create or replace table clv1.customers (
    customer_id for             id          numeric(5) not null generated always as identity (start with 1 , increment by 1), 
    customer_description for    descrip     varchar(30) not null,
    customer_address for        address     varchar(50) not null,

    check (id >= 0),
    primary key(id)
)
rcdfmt rcustomers;

label on table clv1.customers is 'CUSTOMERS';

label on column clv1.customers (
    id          is 'ID',
    descrip     is 'Description',
    address     is 'Address'
);

