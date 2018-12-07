*--------------------------------;
*-------- ASSIGNMENT 1 ----------;
*--------------------------------;

LIBNAME FileOP '/folders/myfolders';

* -------------- Q1 -------------;
PROC IMPORT DATAFILE 	= '/folders/myfolders/Assignment/Car_sales.csv'
			OUT 		= FileOP.CarSales_Imported
			DBMS 		= CSV
			REPLACE		;
			GETNAMES 	= YES;
			DATAROW 	= 2;
RUN;

* -------------- Q2 -------------;
DATA FileOP.CarSales;
	SET 	FileOP.CarSales_Imported;
	WHERE 	_4_year_resale_value 	IS NOT MISSING 
	AND 	Price_in_thousands 		IS NOT MISSING;
RUN;

* -------------- Q3 -------------;
DATA FileOP.CarPrice_Under15k FileOP.CarPrice_15kTo20k FileOP.CarPrice_20kTo30k FileOP.CarPrice_30kTo40k FileOP.CarPrice_Above40k;
	SET FileOP.CarSales;
	IF Price_in_thousands <= 15 	THEN OUTPUT FileOP.CarPrice_Under15k;
	IF 15<Price_in_thousands<=20 	THEN OUTPUT FileOP.CarPrice_15kTo20k;
	IF 20<Price_in_thousands<=30 	THEN OUTPUT FileOP.CarPrice_20kTo30k; 
	IF 30<Price_in_thousands<=40 	THEN OUTPUT FileOP.CarPrice_30kTo40k;
	IF Price_in_thousands>40 		THEN OUTPUT FileOP.CarPrice_Above40k;
RUN;

* -------------- Q4 -------------;
DATA FileOP.CarSales_LessVariables;
	SET FileOP.CarSales (KEEP = Manufacturer Model Sales_in_thousands Price_in_thousands 
						 RENAME = (Sales_in_thousands = Sales Price_in_thousands = Price));
	Sales = Sales*1000;
	Price = Price*1000;
RUN;

* -------------- Q5 -------------;
DATA FileOP.Car_LaunchDate;
	SET FileOP.CarSales;
	WHERE 	Latest_Launch > '01OCT2014'd 
	AND 	Vehicle_type = 'Passenger';
RUN;

PROC SORT DATA = FileOP.Car_LaunchDate;
	BY LATEST_LAUNCH;
RUN;