**FREE
ctl-opt nomain;

/include "/home/CLV/customers/qrpglesrc/customersh.sqlrpgle"

// ------------------------------------------------------------------------------------
// getNumOfCustomers - Retrieve the number of customers in table CUSTOMERS
// ------------------------------------------------------------------------------------
dcl-proc getNumofCustomers export;

    dcl-pi getNumofCustomers packed(9);
    end-pi;

    dcl-s NumOfCustomers zoned(9);

    // Retrieving number of records in table CUSTOMERS
    exec sql
        select count(*) into :NumOfCustomers from clv1.customers;

    return NumOfCustomers;

end-proc;
