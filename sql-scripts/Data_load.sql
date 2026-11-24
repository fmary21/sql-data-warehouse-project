------Bulk loading data into tables -------

Truncate Table Bronze.crm_cust_info;
Bulk Insert Bronze.crm_cust_info
From 'C:\sql\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
With (
    Firstrow = 2,
    Fieldterminator = ',',
    Tablock
);

Truncate Table Bronze.crm_prd_info;
Bulk Insert Bronze.crm_prd_info
From 'C:\sql\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
With (
   Firstrow = 2,
    Fieldterminator = ',',
    Tablock
);

Truncate Table Bronze.crm_sales_details;
Bulk Insert Bronze.crm_sales_details
From 'C:\sql\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
With (
   Firstrow = 2,
    Fieldterminator = ',',
    Tablock
);

Truncate Table Bronze.erp_cust_az12;
Bulk Insert Bronze.erp_cust_az12
From 'C:\sql\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
With (
   Firstrow = 2,
    Fieldterminator = ',',
    Tablock
);

Truncate Table Bronze.erp_loc_a101;
Bulk Insert Bronze.erp_loc_az12
From 'C:\sql\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
With (
   Firstrow = 2,
    Fieldterminator = ',',
    Tablock
);

Truncate Table Bronze.erp_px_cat_g1v2;
Bulk Insert Bronze.erp_px_cat_g1v2
From 'C:\sql\sql-data-warehouse-project\datasets\source_erp\px_px_g1v2.csv'
With (
   Firstrow = 2,
    Fieldterminator = ',',
    Tablock
);
