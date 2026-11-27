/*
================================================================================================
DDL SCRIPT. CREATE BRONZE TABLES
================================================================================================
SCRIPT PURPOSE:
    This script creates tables in the 'bronze' schhema, dropping existing tables 
    if they already exist. 
    Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================================
*/
    
CREATE OR ALTER PROCEDURE Bronze.load_bronze AS
BEGIN
  DECLARE @start_time DATETIME, @end_time DATETIME ,@batch_start_time DATETIME ,@batch_end_time DATETIME; 
  BEGIN TRY
   PRINT '=====================================================';
   PRINT 'Loading Bronze layer';
   PRINT '=====================================================';

   PRINT '-----------------------------------------------------';
   PRINT 'Loading CRM Tables';
   PRINT '-----------------------------------------------------';

   
   PRINT '>> Truncating Table:ronze.crm_cust_info'
   Truncate Table Bronze.crm_cust_info;

   SET @start_time = GETDATE();
   PRINT '>> Inserting Data Into:Bronze.crm_cust_info'
   Bulk Insert Bronze.crm_cust_info
   From 'C:\sql\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
   With (
        Firstrow = 2,
        Fieldterminator = ',',
        Tablock
   );
   SET @end_time = GETDATE();
   PRINT '>>Load Duration:' + CAST(DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) +'seconds';

   
   Truncate Table '>> Truncating Table:Bronze.crm_prd_info';
   Truncate Table Bronze.crm_prd_info;

   SET @start_time = GETDATE();
   PRINT '>>Inserting Data Into:Bronze.crm_prd_info'
   Bulk Insert Bronze.crm_prd_info
   From 'C:\sql\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
   With (
       Firstrow = 2,
       Fieldterminator = ',',
       Tablock
   );
   SET @end_time = GETDATE();
   PRINT '>>Load Duration:' + CAST(DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) +'seconds';


   
   PRINT '>>Truncating Table:Bronze.crm_sales_details'
   Truncate Table Bronze.crm_sales_details;

   SET @start_time = GETDATE();
   PRINT '>>Inserting Data Into:Bronze.crm_sales_details'
   Bulk Insert Bronze.crm_sales_details
   From 'C:\sql\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
   With (
       Firstrow = 2,
       Fieldterminator = ',',
       Tablock
   );
   ET @end_time = GETDATE();
   PRINT '>>Load Duration:' + CAST(DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) +'seconds';



   PRINT '-----------------------------------------------------';
   PRINT 'Loading ERP Tables';
   PRINT '-----------------------------------------------------';
   
   
   PRINT '>>Truncating Table:Bronze.erp_cust_az12 '
   Truncate Table Bronze.erp_cust_az12;

   SET @start_time = GETDATE();
   PRINT '>>Tnserting Data Into:Bronze.erp_cust_az12'
   Bulk Insert Bronze.erp_cust_az12
   From 'C:\sql\sql-data-warehouse-project\datasets\source_erp\cust_az12.csv'
   With (
       Firstrow = 2,
       Fieldterminator = ',',
       Tablock
   );
   SET @end_time = GETDATE();
   PRINT '>>Load Duration:' + CAST(DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) +'seconds';

   
   PRINT '>>Truncating Table:Bronze.erp_loc_a101'
   Truncate Table Bronze.erp_loc_a101;

   SET @start_time = GETDATE();
   PRINT '>>Inserting Data Into:Bronze.erp_loc_az12'
   Bulk Insert Bronze.erp_loc_az12
   From 'C:\sql\sql-data-warehouse-project\datasets\source_erp\loc_a101.csv'
   With (
       Firstrow = 2,
       Fieldterminator = ',',
       Tablock
   );
   SET @end_time = GETDATE();
   PRINT '>>Load Duration:' + CAST(DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) +'seconds';

   
   PRINT '>>Truncate Table: Bronze.erp_px_cat_g1v2'
   Truncate Table Bronze.erp_px_cat_g1v2;

   SET @start_time = GETDATE();
   PRINT '>>Inserting data into: Bronze.erp_px_cat_g1v2'
   Bulk Insert Bronze.erp_px_cat_g1v2
   From 'C:\sql\sql-data-warehouse-project\datasets\source_erp\px_px_g1v2.csv'
   With (
       Firstrow = 2,
       Fieldterminator = ',',
       Tablock
   );
   SET @end_time = GETDATE();
   PRINT '>>Load Duration:' + CAST(DATEDIFF (second, @start_time, @end_time) AS NVARCHAR) +'seconds';


  END TRY
  BEGIN CATCH
        PRINT '=================================================';
        PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
        PRINT 'Error Message'+ ERROR_MESSAGE();
        PRINT 'Error Message'+ CAST (ERROR_MESSAGE()AS NVARCHAR;
        PRINT 'Error Message'+ CAST (ERROR_STATE()AS NVARCHAR;
        PRINT '=================================================';
  END CATCH
END
