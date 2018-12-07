*------------------------------------------;
*--------------- ASSIGNMENT 3 -------------;
*------------------------------------------;

PROC IMPORT DATAFILE 	= '/folders/myfolders/Assignment/Car_sales.csv'
			OUT 		= CarSales_Temp
			DBMS 		= CSV
			REPLACE		;
			GETNAMES 	= YES;
			guessingrows= 157;
RUN;

* -------------- Q1 -------------;
/* 
PROC FREQ data = carsales_temp nlevels; 
 	table Manufacturer / nocol norow nopercent nocum; 
RUN; 
*/

DATA CarSales;
	set carsales_temp;
	select (Manufacturer);
		when ('Hyundai') 		Origin = 'South Korea';
		when ('Acura') 			Origin = 'Japan';
		when ('Audi') 			Origin = 'Germany';
		when ('BMW')			Origin = 'Germany';
		when ('Buick') 			Origin = 'USA';
		when ('Cadillac') 		Origin = 'USA';
		when ('Chevrolet')   	Origin = 'USA';
		when ('Chrysler')   	Origin = 'USA';
		when ('Dodge')	    	Origin = 'USA';
		when ('Ford')	    	Origin = 'USA';
		when ('Honda') 			Origin = 'Japan';
		when ('Infiniti') 		Origin = 'Japan';
		when ('Jaguar')			Origin = 'England';
		when ('Jeep') 			Origin = 'USA';
		when ('Lexus') 			Origin = 'Japan';
		when ('Lincoln') 		Origin = 'USA';
		when ('Mercury') 		Origin = 'Germany';
		when ('Mercedes-Benz') 	Origin = 'USA';
		when ('Mitsubishi') 	Origin = 'Japan';
		when ('Nissan') 		Origin = 'Japan';
		when ('Oldsmobile') 	Origin = 'USA';
		when ('Plymouth') 		Origin = 'USA';
		when ('Pontiac') 		Origin = 'USA';
		when ('Porsche') 		Origin = 'German';
		when ('Saab')			Origin = 'Sweden';
		when ('Saturn') 		Origin = 'USA';
		when ('Subaru') 		Origin = 'Japan';
		when ('Toyota') 		Origin = 'Japan';
		when ('Volkswagen') 	Origin = 'German';
		when ('Volvo') 			Origin = 'Sweden';
		otherwise 				Origin = 'NA';
	end;
RUN;

PROC SORT data = CarSales;
	by origin;
RUN;

PROC PRINT data = CarSales;
	ID origin;
	title ' Q1 - Manufacturer and Country of Origin';
RUN;

* -------------- Q2 -------------;
DATA carsales;
	set carsales;
	UniqueID = trim(Manufacturer) || ' ' || trim(Model);
RUN;

PROC PRINT data = carsales;
	ID UniqueID;
	title ' Q2 - Car Sales data with UniqueID';
RUN;

* -------------- Q3 -------------;
DATA CarSales_Set1 (Keep = UniqueID Manufacturer Model Latest_Launch Sales_in_thousands _4_year_resale_value Price_in_thousands rename = (Latest_Launch=Launch_Date) rename = (Sales_in_thousands = Sales) rename = (_4_year_resale_value = Resale) rename = (Price_in_thousands=Price) ) 
	 CarSales_Set2 (DROP = Manufacturer Model Latest_Launch Sales_in_thousands _4_year_resale_value Price_in_thousands);
	
	set CarSales;
RUN;

PROC PRINT DATA = CarSales_Set1;
	ID UniqueID;
	title 'Q3a - CarSales Data Set 1';
RUN;

PROC PRINT DATA = CarSales_Set2;
	ID UniqueID;
	title 'Q3b- CarSales Data Set 2';
RUN;

* -------------- Q4 -------------;
DATA Hyundai;
	input 	@1 Manufacturer $ 7. 
			@9 Model $ 14. 
			@24 Sales 6.3 
			@31 Resale 6.3 
			@38 Launch_Date date9.
;
	cards;
Hyundai Tuscon         16.919 16.36  2Feb12
Hyundai i45            39.384 19.875 3Jun11
Hyundai Vernae Terraca 14.114 18.225 4Jan12
Hyundai n              8.588  29.725 10Mar11
;
RUN;

* Adding UniqueID;
DATA Hyundai;
	set Hyundai;
	Length UniqueID $ 22.;
	UniqueID = trim(Manufacturer) || ' ' || trim(Model);
RUN;

PROC PRINT data = Hyundai;
	ID UniqueID;
	format Launch_Date date7.;
	title 'Q4 - Unique ID';
RUN;

* -------------- Q5 -------------;
DATA Toatl_Sales;
	set CarSales_Set1 Hyundai;
RUN;

PROC PRINT data = Toatl_Sales;
	id Manufacturer;
	title 'Q5 - Appended data';
RUN;

* -------------- Q6 -------------;
PROC SORT data = Toatl_Sales;
	by UniqueID;
RUN;

PROC SORT data = CarSales_Set2;
	by UniqueID;
RUN;

DATA Merged_Data;
	merge Toatl_Sales CarSales_Set2;
	by UniqueID;
RUN;

PROC PRINT data = Merged_Data;
	id UniqueID;
	title 'Q6 - Merged Data (All Data)';
RUN;

* -------------- Q7 -------------;
DATA Merged_CommonData;
	merge Toatl_Sales (in=Priamry) CarSales_Set2 (in=Secondary);
	by UniqueID;
	if Priamry =1 and Secondary =1;
RUN;

PROC PRINT data= Merged_CommonData;
	id UniqueID;
	title 'Q7 - Merged Data (Common to both tabels)';
RUN;