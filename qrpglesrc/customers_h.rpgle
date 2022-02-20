**FREE

dcl-ds customer_t qualified template;
    id zoned(5);
    descrip varchar(30);
end-ds;

// ------------------------------------------------------------------------------------
// getNumOfCustomers - Retrieve the number of customers in table CUSTOMERS
// ------------------------------------------------------------------------------------
dcl-pr getNumofCustomers zoned(9) extproc;
end-pr;

// ------------------------------------------------------------------------------------
// getCustomerData - Retrieve data from CUSTOMER
// ------------------------------------------------------------------------------------
dcl-pr getCustomerData likeds(customer_t) extproc;
    id like(customer_t.id) const;
end-pr;

// ------------------------------------------------------------------------------------
// Customers_IsOK - Returns if last operation was ok.
// ------------------------------------------------------------------------------------
dcl-pr Customers_IsOk ind extproc;
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



