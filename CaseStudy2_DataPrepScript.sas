/*------------------------------------------------------------------------------
----------------------- CASE STUDY 2 (DATA PREP SCRIPT) ------------------------
-------------------------------------------------------------------------------*/

filename laptops 	'/folders/myfolders/CaseStudy/SAS Master Case Study 2/Laptops.csv';
filename codes 		'/folders/myfolders/CaseStudy/SAS Master Case Study 2/London_postal_codes.csv';
filename pos1 		'/folders/myfolders/CaseStudy/SAS Master Case Study 2/POS_Q1.csv';
filename pos2 		'/folders/myfolders/CaseStudy/SAS Master Case Study 2/POS_Q2.csv';
filename pos3 		'/folders/myfolders/CaseStudy/SAS Master Case Study 2/POS_Q3.csv';
filename pos4		'/folders/myfolders/CaseStudy/SAS Master Case Study 2/POS_Q4.csv';
filename stores		'/folders/myfolders/CaseStudy/SAS Master Case Study 2/Store_Locations.csv';

* VALUE FORMATS FOR VARIABLES;
PROC FORMAT;
 	value $missfmt 
 		' '='Missing' other='Not Missing'
 		;
 
 	value missfmt  
 		. ='Missing' other='Not Missing'
 		;
 		
	value MonthName
		1='January'
		2='February'
		3='March'
		4='April'
		5='May'
		6='June'
		7='July'
		8='August'
		9='September'
		10='October'
		11='November'
		12='December'
		;
				
	picture million (round fuzz=0)
		0-<1000000 = '9.000' (prefix = '$' mult = 0.001)
		1000000 - high = '0000.0' (prefix = '$' mult=.00001)
		;
		
	value distance
		0-5 = '0-5 KM'
		6-10 = '6-10 KM'
		11-15 = '10-15 KM'
		other = '>15 KM'
		;
RUN;
 		
*------------------------ IMPORTING LAPTOPS FILE ----------------------------;
DATA laptops;
	infile laptops dlm = ',' dsd truncover firstobs=2; 
	input 	Configuration			
			Screen_Size
			Battery_Life
			RAM
			Processor_Speeds
			Integrated_Wireless $
			HD_Size
			Bundled_Applications $
			;
RUN;

* Checking variables for missing values in the Data Set;
PROC FREQ DATA = laptops;
	title 'MISSING VLAUES IN LAPTOPS DATA SET';
	format _CHAR_ $missfmt.;
	tables _CHAR_ / missing nocum;
	
	format _NUMERIC_ missfmt.;
	tables _NUMERIC_ / missing nocum;
RUN;

*------------------------- IMPORTING Postal Code FILE -------------------------;
DATA postal_codes;
	infile codes dlm = ',' dsd truncover firstobs=2; 
	input PostCode $ Customer_X Customer_Y;
RUN;

* Checking variables for missing values in the Data Set;
PROC FREQ DATA = postal_codes;
		title 'MISSING VLAUES IN POSTAL CODES DATA SET';
	format _CHAR_ $missfmt.;
	tables _CHAR_ / missing nocum;
	
	format _NUMERIC_ missfmt.;
	tables _NUMERIC_ / missing nocum;
RUN;

*------------------------ IMPORTING POS QUATER FILES --------------------------;
DATA po1;
	infile pos1 dlm = ',' dsd truncover firstobs=2; 
	input	Date			:ANYDTDTE10.
			Configuration		
			Customer_Postcode	$	
			Store_Postcode		$
			Retail_Price
			Month
			;
	format Date date10.;
RUN;

* IMPORTING POS Q2 FILE;
DATA po2;
	infile pos2 dlm = ',' dsd truncover firstobs=2; 
	input	Date			:ANYDTDTE10.
			Configuration		
			Customer_Postcode	$	
			Store_Postcode		$
			Retail_Price
			Month
			;
	format Date date10.;
RUN;

* IMPORTING POS Q3 FILE;
DATA po3;
	infile pos3 dlm = ',' dsd truncover firstobs=2; 
	input	Date			:ANYDTDTE10.
			Configuration		
			Customer_Postcode	$	
			Store_Postcode		$
			Retail_Price
			Month
			;
	format Date date10.;
RUN;

* IMPORTING POS Q4 FILE;
DATA po4;
	infile pos4 dlm = ',' dsd truncover firstobs=2; 
	input	Date			:ANYDTDTE10.
			Configuration		
			Customer_Postcode	$	
			Store_Postcode		$
			Retail_Price
			Month
			;
	format Date date10.;
RUN;

*------------------------ Appending POS FILES -----------------------------;

DATA POS;
	set po1 po2 po3 po4;
RUN;

* Checking missing values count in the Data Set;
PROC FREQ DATA = POS;
	title 'MISSING VLAUES IN POS DATA SET';
	format _CHAR_ $missfmt.;
	tables _CHAR_ / missing nocum;
	
	format _NUMERIC_ missfmt.;
	tables _NUMERIC_ / missing nocum;
RUN;

* Removing observations with missing Date & Retail_Price values;
DATA POS;
	set POS;
	where Date is not missing AND Retail_Price is not missing;
RUN;

*--------------------- IMPORTING STORES FILE ------------------------------;

DATA store;
	infile stores dlm = ',' dsd truncover firstobs=2; 
	input 	Postcode $
			Store_X
			Store_Y
			Lat
			Long
			;
RUN;

* Checking missing values count in the Data Set;
PROC FREQ DATA = store;
	title 'MISSING VLAUES IN STORES DATA SET';
	format _CHAR_ $missfmt.;
	tables _CHAR_ / missing nocum;
	
	format _NUMERIC_ missfmt.;
	tables _NUMERIC_ / missing nocum;
RUN;

*------------------------------------------- DATA SET FOR REPORTS ------------------------------------------;

PROC SQL NOPRINT;
	create table 
		Sales_Analysis
	as
	select 
			 tbl1.Date
			,tbl1.Month format=MonthName.
			,tbl1.Configuration				
			,case when tbl2.Screen_Size = 15 then 'LOW' else 'HIGH' end as Screen_Size
			,case when tbl2.Battery_Life =4 then 'LOW' else 'HIGH' end as Battery_Life
			,case when tbl2.RAM in (1,2) then 'LOW' else 'HIGH' end as RAM
			,case when tbl2.Processor_Speeds =1.5 then 'LOW' else 'HIGH' end as Processor_Speeds
			,case when tbl2.HD_Size in (40,80) then 'LOW' ELSE 'HIGH' end as HardDisk
			,tbl2.Bundled_Applications
			,tbl2.Integrated_Wireless
			,tbl1.Customer_Postcode		
			,tbl1.Store_Postcode
			,tbl3.Customer_X 
			,tbl3.Customer_Y
			,tbl4.Store_X
			,tbl4.Store_Y
			,sqrt((Customer_X - Store_X)**2 + (Customer_Y - Store_Y)**2)/1000 as Distance format=3.1
			,sum(tbl1.Retail_Price) as TotalSales
			,tbl1.Retail_Price
	from
		POS	tbl1
	left join
		Laptops tbl2
	on
		tbl1.Configuration = tbl2.Configuration	
	left join
		postal_codes tbl3
	on
		tbl1.Customer_Postcode = tbl3.PostCode
	left join
		store tbl4
	on	
		tbl1.Store_Postcode = tbl4.Postcode
	order by
		tbl1.Date;
QUIT;

/* DATA Sales_Analysis; */
/* 	set Sales_Analysis; */
/* 	RetailPrice_Prev = lag(Retail_Price); */
/* 	 */
/* 	if missing(RetailPrice_Prev) then RetailPrice_Prev = 0; */
/* RUN; */

*--------------------------------------------- DATA FOR GRAPHS --------------------------------------------;

* TABLE - STORE SALES;
PROC SQL number;
	CREATE TABLE 
		StoreSales
	AS
	SELECT distinct
		 Store_Postcode as Stores
		,count(*) as Visitors
		,sum(Retail_Price) as StoreSales format=10.
		,case when avg(Distance) = . then 6.6 else avg(Distance) end as Distance format=3.1
		,avg(TotalSales) as Total_Sales
		,(sum(Retail_Price))/(avg(TotalSales)) as PercentOfTotal format=percent7.2
	from
		Sales_Analysis
	group by
		Store_Postcode
	order by
		StoreSales desc;
RUN;

* TABLE - MONTHLY SALES;
PROC SQL number;
	CREATE TABLE 
		MonthlyStats
	AS
	SELECT distinct
		 Store_Postcode as Stores
		,Month
		,Count(*) as UnitsSold
		,sum(Retail_Price) as StoreSales format=10.
	from
		Sales_Analysis
	group by
		Store_Postcode,Month
	order by
		Stores, month ;
RUN;

* TABLE - STORE TO DISTANCE;
PROC SQL number;
	CREATE TABLE 
		DistanceStore
	AS
	SELECT distinct
		 Store_Postcode as Stores
		,case when avg(Distance) = . then 6.6 else avg(Distance) end as Distance format=3.1
		,sum(retail_price) as StoreSales format = 10.
	from
		Sales_Analysis
	group by
		Store_Postcode;
RUN;


* TABLE - Distance between stores;
DATA StoreDist (keep = PostCode Distance);
	set store;
	Distance = sqrt(dif(Store_X)**2 + dif(Store_Y)**2)/1000;
	
	format Distance 3.1;
RUN;

* TABLE - LAPTOP CONFIGURATION;
PROC SQL outobs = 20;
	create table
		LapConfig
	as	
	select
		Configuration,
		count(*) as UnitsSold
	from
		Sales_Analysis
	group by
		Configuration
		
	order by
		UnitsSold desc;
QUIT;

* TABLE - SALES BY ScreenSize;
PROC SQL;
	create table 
		screen
	as
	select
		Screen_Size
		,count(*) as UnitsSold
	from	
		Sales_Analysis
	group by
		Screen_Size;
QUIT;

* TABLE - SALES BY BATTERY;
PROC SQL;
	create table 
		battery
	as
	select
		Battery_Life
		,count(*) as UnitsSold
	from	
		Sales_Analysis
	group by
		Battery_Life;
QUIT;

* TABLE - SALES BY RAM;
PROC SQL;
	create table 
		ram
	as
	select
		RAM
		,count(*) as UnitsSold
	from	
		Sales_Analysis
	group by
		RAM;
QUIT;

* TABLE - SALES BY HARD DISK;
PROC SQL;
	create table 
		harddisk
	as
	select
		HardDisk
		,count(*) as UnitsSold
	from	
		Sales_Analysis
	group by
		HardDisk;
QUIT;

* TABLE - SALES BY BUNDELED APPS;
PROC SQL;
	create table 
		apps
	as
	select
		Bundled_Applications as apps
		,count(*) as UnitsSold
	from	
		Sales_Analysis
	group by
		Bundled_Applications;
QUIT;

* TABLE - SALES BY WIRELESS FEATURE;
PROC SQL;
	create table 
		wifi
	as
	select
		Integrated_Wireless as wifi
		,count(*) as UnitsSold
	from	
		Sales_Analysis
	group by
		Integrated_Wireless;
QUIT;

* TABLE - DATA SET FOR FORCASTING DATA;
PROC SQL;
	create table 
		forecast
	as	
	select
		 store_postcode as store
		,day(date) as Dayno
		,sum(Retail_Price) as Sales
	from
		Sales_Analysis
	group by
		store, dayno;
QUIT;

PROC SQL;
	create table 
		forecast2
	as	
	select
		date
		,sum(Retail_Price) as Sales
	from
		Sales_Analysis
	group by
		date;
QUIT;

* SALES FORECAST FOR 2014; 
PROC UCM data = forecast2;
	id date interval= day;
	
	level;
	slope;
	
	model sales;
	
	estimate back = 5;
	forecast back = 5 lead = 364 plot = forecasts outfor=result;
RUN;

DATA plotforecast (keep = date forecast);
	set result;
	where year(date) = 2014;
RUN;
