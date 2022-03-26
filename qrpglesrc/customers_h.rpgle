**FREE

dcl-ds customer_t qualified template;
    id zoned(5) inz;
    descrip varchar(30);
end-ds;

dcl-ds customerList_t qualified template;
    num_customers int(10) inz;
    dcl-ds customers likeds(customer_t) dim(10000) inz(*likeds);
end-ds;

// ------------------------------------------------------------------------------------
// Customers_IsOK - Returns if last operation was ok.
// ------------------------------------------------------------------------------------
dcl-pr Customers_IsOk ind extproc;
end-pr;

// ------------------------------------------------------------------------------------
// getNumOfCustomers - Retrieve the number of customers in table CUSTOMERS
// ------------------------------------------------------------------------------------
dcl-pr getNumofCustomers zoned(9) extproc;
end-pr;

// ------------------------------------------------------------------------------------
// getCustomer - Retrieve data from CUSTOMER
// ------------------------------------------------------------------------------------
dcl-pr getCustomer likeds(customer_t) extproc;
    id like(customer_t.id) const;
end-pr;

// ------------------------------------------------------------------------------------
// getCustomerList - Retrieve a list of max 10000 customers
// ------------------------------------------------------------------------------------
dcl-pr getCustomerList likeds(customerList_t) extproc;
end-pr;

// ------------------------------------------------------------------------------------
// addCustomer - Insert/Update data in table CUSTOMER
// ------------------------------------------------------------------------------------
dcl-pr addCustomer ind extproc;
    customer likeds(customer_t) const;
end-pr;

// ------------------------------------------------------------------------------------
// deleteCustomer - Insert data in table CUSTOMER
// ------------------------------------------------------------------------------------
dcl-pr deleteCustomer ind extproc;
    id like(customer_t.id) const;
end-pr;

// ------------------------------------------------------------------------------------
// Customers_Open - Opens Cursor to Customer Data
// ------------------------------------------------------------------------------------
dcl-pr Customers_Open ind extproc;
end-pr;

// ------------------------------------------------------------------------------------
// Customers_FetchNext - Fetch Next 
// ------------------------------------------------------------------------------------
dcl-pr Customers_FetchNext likeds(customer_t) extproc;
end-pr;

// ------------------------------------------------------------------------------------
// Customers_Close - Closes Cursor 
// ------------------------------------------------------------------------------------
dcl-pr Customers_Close extproc;
end-pr;

// ------------------------------------------------------------------------------------
// getCustomerListJSON - Retrieve a JSON string with max 10000 customers
// ------------------------------------------------------------------------------------
dcl-pr getCustomerListJSON varchar(2000000) extproc;
end-pr;

// ------------------------------------------------------------------------------------
// getCustomerListFromJSON - Retrieve a list of customers from a JSON string 
// ------------------------------------------------------------------------------------
dcl-pr getCustomerListFromJSON likeds(customerList_t) extproc;
    customerListJSON varchar(2000000) const;
end-pr;
