**FREE
ctl-opt nomain;

/include "customers_h.rpgle"

// ------------------------------------------------------------------------------------
// retrieveRecordsColours
// ------------------------------------------------------------------------------------
dcl-proc getNumofCustomers extproc;

    dcl-pi getNumofCustomers packed(9);
    end-pi;

    dcl-s NumOfCustomers zoned(9);

    // Retrieving number of records in table CUSTOMERS
    exec sql
        select count(*) into :NumOfCustomers from clv1.customers;

    return NumOfCustomers;

end-proc;
