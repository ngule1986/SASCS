*---------------------------------------- GRAPHS -------------------------------------------------;

ODS EXCEL FILE = '/folders/myfolders/CaseStudy2 - Graphs.xlsx'
	OPTIONS ( embedded_titles="yes" embed_titles_once="yes" sheet_name="Graph " embedded_footnotes="yes");

* GRAPH - STORES vs DISTANCE;
PROC SGPLOT data = DistanceStore noborder;
	title 'DISTANCE TO STORE';
	ods noproctitle;
	
	vbar Stores / response = Distance datalabel=distance colormodel=(BRPK BRO) colorresponse=Distance categoryorder=respasc;
	xaxis display= (noline noticks nolabel);
	yaxis grid label= 'DISTANCE (KM)' display= (noline noticks);
	
	footnote 'The nearest store to customer is SW1P 3AU (2.7KM) where as the farthest store is SW18 1NN (6.6KM).';
RUN;

* GRAPH - STORES vs StoreSales;
PROC SGPLOT data = StoreSales noborder;
	title 'TOTAL SALES AT STORE';
	ods noproctitle;
	
	format StoreSales million.;
	vbar Stores/ response = StoreSales colorresponse=StoreSales colormodel=(red gold green) datalabel categoryorder=respasc baselineattrs= (thickness=0);
	xaxis display=(noticks nolabel noline);
	yaxis  label= 'TOTAL SALES ($M)' grid display=(noticks noline);
	
	footnote 'Highest laptop sales were done at SW1P 3AU and lowest sales at N3 1DH.';
RUN;

* GRAPH - SALES vs DISTANCE;
PROC SGSCATTER data = StoreSales;
	title 'TOTAL SALES vs DISTANCE';
	ods noproctitle;
	
	format StoreSales million.;
	plot StoreSales*Distance / reg;
	label StoreSales = 'TOTAL SALES (MILLION)' Distance = 'DISTANCE (KM)';
	
	footnote 'Looking at the Graph we can infer that sales at stores is inversely proportional to distance to store.';
RUN;

* GRAPH CONTRIBUTION TO TOTAL SALES;
PROC SGPLOT data = StoreSales noborder;
	title '% CONTRIBUTION TO TOTAL SALES';
	ods noproctitle;
	
	vbar Stores/ response = PercentOfTotal colorresponse=PercentOfTotal colormodel=(red greenyellow GREEN) datalabel categoryorder= respdesc baselineattrs= (thickness=0);
	xaxis display=(noticks nolabel noline);
	yaxis  label= '% OF TOTAL SALES' grid display=(noticks noline);
	
	footnote '5 stores (SW1P 3AU /SE1 2BN/ SW1V 4QQ/ NW5 2QH/ E2 0RY) contribute to approx 70% of total sales.';
RUN;

* SALES TREND YEARLY;
PROC SGPLOT data = MonthlyStats noborder;
	title 'SALES TREND FOR 2013';
	ods noproctitle;
	format StoreSales million.;
	
	series x = month y = StoreSales / group= stores;
	xaxis interval=month integer display=(nolabel noticks noline) grid;
	yaxis grid display=(noline) LABEL= 'TOTAL SALES ($M)';
	
	footnote 'Approx 80% of sales happens during Q3 & Q4 with max sales in the month of December.';
RUN;

* SALES DURING MONTH;
PROC SGPLOT data = forecast noborder;
	title 'SALES TREND FOR VARIOUS MONTHS';
	ods noproctitle;
	
	series x = dayno y = sales / group= store;
	xaxis  display=(nolabel noticks noline);
	yaxis grid display=(noticks noline) LABEL= 'SALES ($)';
	
	footnote 'Looking at the graph we can infer that the sales are least during last week of the month.';
RUN;

* TOP 20 LAPTOP CONFIGURATIONS SOLD;
PROC SGPLOT data = LapConfig noborder;
	title 'TOP 20 LAPTOP CONFIGURATIONS SOLD';
	ods noproctitle;
	
	vbar configuration / response= UnitsSold categoryorder=respdesc datalabel = UnitsSold;
	xaxis label = 'LAPTOP CONFIGURATION' display=(noticks noline);
	yaxis label = 'UNITS SOLD' display = (noticks noline) grid;
	
	footnote 'Top 5 selling laptop configurations are 61, 316, 72, 345 & 353.';
RUN;

* LAPTOP SALES BASED ON SCREEN SIZE;
PROC SGPLOT data = screen noborder;
	title 'SCREEN SIZE PREFERENCE';
	ods noproctitle;
	
	vbar Screen_Size / response=UnitsSold datalabel=UnitsSold;
	xaxis display=(noline nolabel);
	yaxis label = 'LAPTOPS UNITS SOLD' display = (noline) grid;
	
	footnote 'Customers are buying more laptops with low screen size.';
RUN;

* LAPTOP SALES BASED ON BATTERY LIFE;
PROC SGPLOT data = battery noborder;
	title 'BATTERY PREFERENCE';
	ods noproctitle;

	vbar Battery_Life / response=UnitsSold datalabel=UnitsSold;
	xaxis display=(noline nolabel);
	yaxis label = 'LAPTOPS UNITS SOLD' display = (noline) grid;
	
	footnote 'Customers are buying more laptops with higher battery life.';
RUN;

* LAPTOP SALES BASED ON RAM SIZE;
PROC SGPLOT data = ram noborder;
	title 'RAM CAPACITY PREFERENCE';
	ods noproctitle;
	
	vbar ram / response=UnitsSold datalabel=UnitsSold;
	xaxis display=(noline nolabel);
	yaxis label = 'LAPTOPS UNITS SOLD' display = (noline) grid;
	
	footnote 'Customers are buying more laptops with lower RAM size.';
RUN;

* LAPTOP SALES BASED ON HARD DISK SIZE;
PROC SGPLOT data = harddisk noborder;
	title 'HARD DISK CAPACITY PREFERENCE';
	ods noproctitle;
	
	vbar harddisk / response=UnitsSold datalabel=UnitsSold;
	xaxis display=(noline nolabel);
	yaxis label = 'LAPTOPS UNITS SOLD' display = (noline) grid;
	
	footnote 'Hard Disk capactity does not influenze customer prefernce much.';
RUN;

* SALES FORECAST for 2014;
PROC SGSCATTER data = plotforecast;
	title 'SALES FORECAST FOR 2014';
	ods noproctitle;
	format forecast million.;
	
	plot forecast*date / reg;
	label forecast = 'SALES ($M)' date = '';
	
	footnote 'Sales decreases as the year progress.';
RUN;

ODS EXCEL CLOSE;
