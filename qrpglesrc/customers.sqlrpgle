**FREE
ctl-opt nomain;

/include "/home/CLV/customers/qrpglesrc/customers_h.rpgle"


// ------------------------------------------------------------------------------------
// Customers_IsOK - Returns if last operation was ok.
// ------------------------------------------------------------------------------------
dcl-proc Customers_IsOk export;

    dcl-pi Customers_IsOk ind end-pi;

    return (sqlstate = '00000'); 

end-proc;

// ------------------------------------------------------------------------------------
// getNumOfCustomers - Retrieve the number of customers in table CUSTOMERS
// ------------------------------------------------------------------------------------
dcl-proc getNumofCustomers export;

    dcl-pi getNumofCustomers zoned(9);
    end-pi;

    dcl-s numOfCustomers zoned(9); 

    // Retrieving number of records in table CUSTOMERS
    exec sql
        select count(*) into :numOfCustomers 
        from clv1.customers;

    return numOfCustomers;

end-proc;

// ------------------------------------------------------------------------------------
// getCustomer - Retrieve data from CUSTOMER
// ------------------------------------------------------------------------------------
dcl-proc getCustomer export;

    dcl-pi getCustomer likeds(customer_t);
        id like(customer_t.id) const;
    end-pi;

    dcl-ds customer likeds(customer_t);

    // Retrieving customer data with ID
    exec sql
        select id, descrip 
        into 
        :customer.id,
        :customer.descrip
        from clv1.customers
        where id = :id;

    return customer;

end-proc;

// ------------------------------------------------------------------------------------
// addCustomer - Insert/update data in table CUSTOMER
// ------------------------------------------------------------------------------------
dcl-proc addCustomer export;

    dcl-pi addCustomer ind;
        customer likeds(customer_t) const;
    end-pi;

    // First I try to update, if not, I insert new data
    exec sql
        update clv1.customers set
            descrip = :customer.descrip
            where
            id = :customer.id;
    if (not Customers_IsOk());
        exec sql
            insert into clv1.customers values (
                :customer.id,
                :customer.descrip);
    endif;

    return Customers_IsOk();

end-proc;

// ------------------------------------------------------------------------------------
// deleteCustomer - Insert data in table CUSTOMER
// ------------------------------------------------------------------------------------
dcl-proc deleteCustomer export;

    dcl-pi deleteCustomer ind;
        id like(customer_t.id) const;
    end-pi;

    // Delete data of table CUSTOMER
    exec sql
        delete clv1.customers where
            :id = id;
    
    return Customers_IsOk();

end-proc;

// ------------------------------------------------------------------------------------
// Customers_Open - Opens Cursor to Customer Data
// ------------------------------------------------------------------------------------
dcl-proc Customers_Open export;

    dcl-pi Customers_Open ind end-pi;

    exec sql
        declare Customers_Cur cursor for
        select id, descrip
        from clv1.customers;

    exec sql
        open Customers_Cur;

    return (sqlstate = '00000');

end-proc;

// ------------------------------------------------------------------------------------
// Customers_FetchNext - Fetch Next 
// ------------------------------------------------------------------------------------
dcl-proc Customers_FetchNext export;

    dcl-pi Customers_FetchNext likeds(customer_t) end-pi;

    dcl-ds customer likeds(customer_t);

    exec sql
        fetch next from Customers_Cur
        into 
            :customer.id,
            :customer.descrip; 

    return customer;

end-proc;

// ------------------------------------------------------------------------------------
// Customers_Close - Closes Cursor 
// ------------------------------------------------------------------------------------
dcl-proc Customers_Close export;

    dcl-pi Customers_Close end-pi;

    exec sql
        close Customers_Cur;

end-proc;
