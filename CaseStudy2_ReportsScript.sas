*------------------------------------------------------------------------------------;
*-------------------------- CASE STUDY 2 - REPORTS ----------------------------------;
*------------------------------------------------------------------------------------;

ODS EXCEL FILE = '/folders/myfolders/CaseStudy2 - Reports.xlsx' 
	OPTIONS ( embedded_titles="yes" embed_titles_once="yes" sheet_name="Report " embedded_footnotes="yes");

* 1 - Report showing no of Laptops sold, Total Sales, Distance to each Store;
PROC TABULATE data = Sales_Analysis order = freq ;
	title 'SALES AT STORE vs DISTANCE TO STORE';
	ods noproctitle;
	
	class Store_Postcode / style=[background=yellow];
	var Configuration Retail_Price Distance;
	table Store_Postcode='LAPTOP STORE', (Configuration=''*n Retail_Price=''*sum*f=dollar12. Distance=''*mean) / misstext='Data Not Available';
	
	keylabel n 		= 'LAPTOPS SOLD';
	keylabel sum 	= 'TOTAL SALES ($)';
	keylabel mean 	= 'DISTANCE (K.M)';

	footnote1  'Note1: Store with postcode SW1P 3AU which is nearest to the customer is having maximum sales.';
	footnote2  'Note2: Top 3 Stores (sales) are relatively nearer to the customer when compared with other stores.';
RUN;

*2 - Distance between Stores;
PROC TABULATE data = StoreDist;
	title 'DISTANCE BETWEEN STORES';
	ods noproctitle;
	
	class PostCode / style=[background=yellow];
	var Distance;
	table PostCode='STORE POSTCODE', Distance='DISTANCE (K.M)'*f=3.1*mean='' / misstext='REFERENCE STORE';
	
	footnote 'Minimum distance between stores is 1.5KM (CR7 8LE - E2 0RY) and maximun distance is 28KM (E7 8NW - KT2 5AU).';
RUN;

* 3 - % Of total sales at Stores;
PROC TABULATE data = Sales_Analysis order = freq;
	title 'STORES CONTRIBUTION TO TOTAL SALES';
	ods noproctitle;

	class Store_Postcode / style=[background=yellow];
	var Retail_Price;
	table Store_Postcode='LAPTOP STORE', Retail_Price=''*(sum*f=dollar12. pctn);
	keylabel sum = 'TOTAL SALES ($)';
	keylabel pctn = '% TOTAL SALES';
	
	footnote 'Top 5 Stores are contributing to approx 70% of total sales.';
RUN;

* 4 - Total no of Laptops sold during various month;
PROC TABULATE data = Sales_Analysis order = freq;
	title 'NUMBER OF LAPTOPS SOLD DURING THE YEAR';
	ods noproctitle;

	class 	Month / style=[background=yellow];
	table	Month='MONTH NAME',n pctn*f=3.;
	keylabel n = 'UNITS SOLD';
	keylabel pctn = '% TOTAL VOLUME';
	
	footnote1 'Maximun no of laptops are sold during December.';
	footnote2 '80% of laptops are sold in Q3 & Q4 during 2013.';
RUN;

* 5 - Price variation for various configurations during the year;
PROC TABULATE data = Sales_Analysis;
	title 'PRICE VARIATION FOR EACH LAPTOP CONFIGURATION DURING THE YEAR';
	ods noproctitle;

	class 	Configuration month / style=[background=yellow];
	var 	Retail_Price / style=[background=pink];
	table	Configuration='LAPTOP CONFIG', Month='MONTH'*Retail_Price=''*f=dollar6.*(mean) / misstext= '$0';
	keylabel mean = 'Avg Price';
	
	footnote 'Most of the Laptop Configurations are available at min retail price during december.';
RUN;

* 6 - Laptop Configurations sold at stores;
PROC TABULATE data = Sales_Analysis order = freq;
	title 'LAPTOP CONFIGURATIONS SOLD AT EACH STORE';
	ods noproctitle;

	class 	Store_PostCode Configuration / style=[background=yellow];
	table	Configuration='LAPTOP CONFIG',Store_PostCode='STORE POSTCODE'*(n='') / misstext= 'No Sale';
	Classlev Store_PostCode /style= [width=1.8cm] ; 
	footnote 'Maximum units for each configuration is sold at SW1P 3AU and minimum units are sold at S1P 3AU.';
RUN;

* 7 - Number of Units sold for each Laptop Configuration;
PROC TABULATE data = Sales_Analysis order = freq;
	title 'NUMBER OF LAPTOPS SOLD FOR EACH CONFIGURATOPN';
	ods noproctitle;

	class 	Configuration / style=[background=yellow];
	table	Configuration='CONFIGURATION',n / misstext='0';
	keylabel n = 'UNITS SOLD';
	
	footnote 'Laptop Configutaion 61 is the most favourite amoung customers.';
RUN;

* 8 - Top Hardware configurations of laptops;
PROC SQL;
	title 'SALES BY LAPTOP HARDWARE CONFIGURATION';	
	footnote 'LOW(SCREEN SIZE) HIGH (BATTERY LIFE) LOW(RAM) HIGH(PROCESSOR SPEED) HIGH(HARD DISK) is the highest selling hardware laptop configuration.';
	ods noproctitle;
	
	SELECT 
		 Screen_Size label = 'SCREEN SIZE'
		,Battery_Life label = 'BATTERY LIFE'
		,RAM label = 'RAM'
		,Processor_Speeds label = 'PROCESSOR SPEED'
		,HardDisk label = 'HARD DISK'
		,count(*) as Units_Sold label = 'UNITS SOLD'
		,avg(Retail_Price) as avgPrice label = 'AVG RETAIL PRICE ($)' format = DOLLAR4.
		,SUM(Retail_Price) as REVENUE LABEL = 'REVENUE ($)' FORMAT = DOLLAR12.
		,SUM(Retail_Price)/avg(TotalSales) as Contribution  format=percent7.2 label = '%TOTAL SALES'
	from
		Sales_Analysis
	group by
		Screen_Size,Battery_Life,RAM,Processor_Speeds,HardDisk
	order by
		Units_Sold desc;
QUIT;

ODS EXCEL CLOSE;
