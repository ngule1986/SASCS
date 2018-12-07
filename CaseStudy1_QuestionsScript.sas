/*------------------------------------------------------------------------------
--------------------------- CASE STUDY 1 (QUESTIONS) ---------------------------
-------------------------------------------------------------------------------*/

*------------------ Q1 -----------------------;

DATA Q1_Flights;
	set Flights;
	
	Year 	= year(Date);
	Month 	= month(Date);
	Day 	= day(Date);
	Hour 	= hour(Sched_Dep_Time);
	
	Dep_Delay_Mins = intck('minutes',Sched_Dep_Time, Dep_Time);
	Arr_Delay_Mins = intck('minutes', Sched_Arr_Time, Arr_Time);
	
	format  Carrier				$carrier.
			Origin				$airport.
			Dest				$airport.
			Dep_Delay_Mins 		Dep_Delay. 
			Arr_Delay_Mins 		Arr_Delay.
			;
RUN;

*------------------ Q2 -----------------------;

* Weather data with Hour variable;
DATA Q2A_Weather;
	set Weather;
	
	Hour = hour(Time);
	
	format 	Origin $airport.;
RUN;

* Flights & Weather combined Data set using JOIN;
PROC SQL;
	create table 
		Flight_Weather_SQL
	as
	select 	 x.Date
			,x.Carrier
			,x.Flight
			,x.Origin
			,x.Dest
			,x.Tailnum
			,x.Distance
			,x.Air_Time
			,x.Sched_Dep_Time
			,x.Dep_Time
			,x.Sched_Arr_Time
			,x.Arr_Time
			,y.Precip
			,y.Visib
			,y.Temp
			,y.Dewp
			,y.Humid
			,y.Wind_Dir
			,y.Wind_Speed
			,y.Wind_Gust
			,y.Pressure
	from 
		Q1_Flights as x
	left join 
		Q2A_Weather as y
	on
		x.origin = y.origin 
	and
		x.date = y.date		
	and
		x.hour = y.hour;
QUIT;

*------- Q2b --------;
DATA Q2B_Planes (drop = Current_Year);
	set Planes;

	Current_Year = 2013;
	Years_Use = (Current_Year - Manufacturing_Year);
RUN;

PROC SQL;
	create table 
		Flight_Plane_SQL
	as
	select 	 x.Date
			,x.Carrier
			,x.Flight
			,x.Origin
			,x.Dest
			,x.Tailnum
			,x.Distance
			,x.Air_Time
			,x.Sched_Dep_Time
			,x.Dep_Time
			,x.Sched_Arr_Time
			,x.Arr_Time
			,y.Manufacturer
			,y.Manufacturing_Year
			,y.Years_Use
	from
		Q1_Flights as x
	left join
		Q2B_Planes as y
	on  
		x.Tailnum = y.Plane
	order by
		x.Date;
QUIT;

*------------------ Q3 (i) -----------------------;

*Missing values in Flight Data Set;
PROC FREQ data = flights; 
format _CHAR_ $missfmt.; 
tables _CHAR_ / missing missprint nocum;

format _NUMERIC_ missfmt.;
tables _NUMERIC_ / missing missprint nocum;
RUN;

* Deleting observations with missing values for variables Tailnum, Dep_Time, Arr_Time;
DATA Flight_NoMisssing;
	set Flights;
	 
	where 	Tailnum  is not missing
	and 	Dep_Time is not missing
	and 	Arr_Time is not missing;
RUN;

* Missing value count after deleting observations;
PROC MEANS data = Flight_NoMisssing nmiss ;
	title 'Missing count of variables in Flight Data Set';
RUN;

* Replacing missing values for variables;
PROC Sort data = Q1_Flights;
	by Carrier Origin Dest;
RUN;

* Replacing misising values with mean; 
PROC stdize data = Q1_Flights out = Flight_Std method=mean reponly;
	var Air_Time Arr_delay_Mins;
	by Carrier Origin Dest;
RUN;

* To cross check the avg delay value;
PROC TABULATE data = Q1_Flights;
	class Carrier Origin Dest;
	var Air_Time Arr_Delay_Mins;
	table (Carrier*Origin*Dest), (Air_Time Arr_Delay_Mins)*(mean);
RUN;

*------------------ Q3 (ii) -----------------------;

* Missing count for variables;
PROC FREQ data = Q2A_Weather; 
format _CHAR_ $missfmt.; 
tables _CHAR_/ missing nocum nopercent;

format _NUMERIC_ missfmt.;
tables _NUMERIC_ / missing missprint nocum nopercent;
RUN;

* Replacing missing values with avg values for temp parameters;
PROC SORT data = Q2A_Weather;
	by Origin Date;
RUN;

PROC stdize data = Q2A_Weather out = weather_std method=mean reponly;
	var Temp Dewp Humid Wind_Dir Wind_Speed Wind_Gust Precip Pressure Visib;
	by Origin Date;
RUN;

* To cross check avg temp parameters values;
PROC TABULATE data = Q2A_Weather;
	class Origin Date;
	var Temp Dewp Humid Wind_Dir Wind_Speed Wind_Gust Precip Pressure Visib;
	table (Origin*Date), (Temp Dewp Humid Wind_Dir Wind_Speed Wind_Gust Precip Pressure Visib)*(mean);
	keylabel mean = 'Average';
RUN;

*------------------ Q3 (iii) -----------------------;

* Missing count for variables;
PROC FREQ data = Planes; 
format _CHAR_ $missfmt.; 
tables _CHAR_ / missing nocum ;

format _NUMERIC_ missfmt.;
tables _NUMERIC_ / missing missprint nocum;
RUN;

* Drop Variable with more than 70% missing values;
DATA Planes_LessVar (drop = speed);
	set Planes;
RUN;

* Count of observations with missing values for variables;
DATA Planes_Missing (keep = plane Fuel_CC Manufacturing_Year);
	set Planes_LessVar;
	
	where Fuel_CC = . or  Manufacturing_Year = .;
RUN;

* Only 70 observations (common) needs to be deleted hence deleting;
DATA Planes_LessData;
	set Planes_LessVar;
	
	where Fuel_CC ^= . or  Manufacturing_Year ^= .;
RUN;

*-------------------------------- Q4 -------------------------------;

*--------------- Q4 (i) --------------;
* Variable names and labels;
DATA Flights;
	set Flights;
	
	label 	Date			= 'Date of Departure'	
			Sched_Dep_Time	= 'Scheduled Departure Time'
			Dep_Time		= 'Departure Time'
			Sched_Arr_Time	= 'Scheduled Arrival Time'
			Arr_Time		= 'Arrival Time'
			Carrier			= 'Carrier Name'
			Flight			= 'Flight Number'
			Tailnum			= 'Tail Number'
			Origin			= 'Origin Airport'
			Dest			= 'Destination Airport'
			Distance		= 'Distance Flown'
			Air_Time		= 'Flight Duration (Mins)'
			;
RUN;

DATA Planes;
	set Planes;
	
	label  	Plane				= 'Tail Number'
			Manufacturing_Year	= 'Year Manufactured'
			Type				= 'Type of Plane'
			Manufacturer		= 'Manufacturer'
			Model				= 'Model Number'
			Engines				= 'Number of Engines'
			Seats				= 'Number of Seats'
			Speed				= 'Cruise Speed (MPH)'
			Engine				= 'Engine Type'
			Fuel_CC				= 'Avg Annual Fuel Consumption Cost'
			;
RUN;

DATA Weather;
	set Weather;
	
	label 	Origin		= 'Origin Airport'
			Date		= 'Date of Recording'
			Time		= 'Time of Recording'
			Temp		= 'Temperature (F)'
			Dewp		= 'Deppoint (F)'
			Humid		= 'Humidity'
			Wind_Dir	= 'Wind Direction (Degree)'
			Wind_Speed	= 'Wind Speed (MPH)'
			Wind_Gust	= 'Guest Speed (MPH)'
			Precip		= 'Preciptation (Inches)'
			Pressure	= 'Pressure (Milibars)'
			Visib		= 'Visibility (Miles)'
			;	
RUN;

*----------------- 4(ii) ------------------------;
DATA Approx_FuelCost;
	set planes;
	
	Fuel_CC = round(Fuel_CC);
	
	format Fuel_CC 10.;
RUN;

*----------------- 4(iii) ------------------------;

* Adding value labels to Carrier Codes has been done in Data Prep Script;
* Adding value labels to Origin and Destination has been done in Data Prep Script;

* Flight variable to CHAR;
DATA Flights (rename = (Flight_Char = Flight) drop = Flight);
	set Flights;
	
	Flight_Char = put(Flight, 4.);
RUN;

*------------------------------ Q5 ---------------------------------;

* Top 5 Busiest routes for 2013;
PROC SQL outobs = 5;
	create table 
		Busy_Routes
	as
	select	
		Origin			label = 'Origin Airport',
		Dest			label = 'Destination Airport',
		count(*) 	as  Flight_Count label = 'Flight Count'
	from
		Q1_Flights
	where 
		year(Date) = 2013
	group by
		Origin, Dest
	order by 
		Flight_Count desc;
		
	title 'Top 5 busiest route for year 2013';
	select * from Busy_Routes;
QUIT;

*-------------- Q5 (ii)-------------------;

* No of flights by Carrier to top 5 busiest routes;
PROC SQL;
	create table 
		Busy_Carrier
	as
	select	
		 Carrier						label = 'Carrier Name'
		,count(flight) 	as Flight_Count label = 'Flight Count'
	from
		Q1_Flights
	where 
		(Origin = 'JFK' and Dest = 'LAX')
	or
		(Origin = 'LGA' and Dest = 'ATL')
	or 
		(Origin = 'LGA' and Dest = 'ORD')
	or
		(Origin = 'JFK' and Dest = 'SFO')
	or	
		(Origin = 'LGA' and Dest = 'CLT')
	group by
		Carrier 
	order by 
		Flight_Count desc;	
		
	title 'No of flights by each Carrier for top 5 Routes';
	
	select 
		x.Carrier_Name,
		y.Flight_Count
	from	
		Airlines as x
	left join
		Busy_Carrier as y
	on
		x.Flight_Code = y.Carrier
	order by
		y.Flight_Count desc;
QUIT;

*-------------- Q5 (iii)-------------------;

* Total flights by Carrier;
PROC SQL;
	create table 
		Carrier_FlightCount
	as
	select	
		Carrier,
		count(*) as Total_Flights label = 'Total Flights'
	from	
		Q1_Flights
	group by
		Carrier;

	title 'Ratio of flights to top 5 routes to total flights for each Carrier';
	select
		 y.Carrier
		,case when x.Flight_Count is not missing then x.Flight_Count else 0 end as Flight_C
		,y.Total_Flights
		,((case when x.Flight_Count is not missing then x.Flight_Count else 0 end)/y.Total_Flights) as Percent_To_TopRoute format = percent7.3
	from
		Busy_Carrier as x
	right join
		Carrier_FlightCount as y
	on 
		x.Carrier = y.Carrier
	order by
		Percent_To_TopRoute desc;
QUIT;

*------------------------------ Q6 ---------------------------------;

*-------------- Q6 (i)-------------------;

* Busiest time of the day for Carrier;
PROC SQL;
	create table
		Busy_Time
	as
	select 
		 Carrier
		,Hour as Time_During_Day format = timeofday.
		,Count(*) as Total_Flight
	from
		Q1_flights
	group by
		Carrier, Hour
	order by
		Carrier, Total_Flight  desc;
QUIT;

PROC RANK data = Busy_Time out = Rank_Data descending ties= dense;
	by Carrier;
	var Total_Flight;
	ranks Rank;
RUN;

PROC SQL;
	title 'Busiest time of the day for each Carrier';
	
	select 
		 Carrier as Carrier_Name
		,Time_During_Day as Time_Interval
		,Total_Flight as Flight_Count
	from	
		Rank_Data
	where 
		Rank = 1
	order by
		Total_Flight desc;
QUIT;

*-------------- Q6 (ii)-------------------;

* Busiest time of the day for Airports;
PROC SQL;
	create table
		busy_time_airport
	as
	select	
		 Origin
		,Hour as Time_During_Day format = timeofday.
		,Count(*) as Total_Flights
	from
		Q1_flights
	group by
		Origin, Hour
	order by
		Origin, Total_Flights  desc;
QUIT;

PROC RANK data = busy_time_airport out  = rank_data_airport descending ties= dense;
	by Origin;
	var Total_Flights;
	ranks airportrank;
RUN;

PROC SQL;
	title 'Busiest Time of the Day for JFK, LGA & EWR';
	select 
		 Origin
		,Time_During_Day
		,Total_Flights as Flights_Count
	from
		rank_data_airport
	where 
		airportrank = 1;
QUIT;

*------------------------------ Q7 ---------------------------------;

*----------------- Q7 (i) -----------------;
* % of flights delayed at JFK Airport;
PROC SQL;
	title '% of flights delayed at JFK Airport';
	select distinct
		 Origin
		,sum(case when Dep_Delay_Mins > 0 then 1 else 0 end) as Delayed_Flights
		,count(*) as Total_Flights
		,(sum(case when Dep_Delay_Mins > 0 then 1 else 0 end))/count(*) as Delay_Percentage format=percent7.2
	from
		Q1_flights
	where 
		origin = 'JFK';	
QUIT;

*----------------- Q7 (ii) -----------------;
* Origin Airports with least no of delayed flights;
PROC SQL outobs=1;
	title 'Origin Airport with least number of delayed flights';
	
	select distinct
		 Origin
		,sum(case when Dep_Delay_Mins > 0 then 1 else 0 end) as Delayed_Flights
	from
		Q1_flights
	group by
		Origin
	order by
		Delayed_Flights;
QUIT;

*----------------- Q7 (iii) -----------------;
* Destination Airports with highest no of delayed flights;

PROC SQL outobs=1;
	title 'Destination Airports with highest no of delayed flights';
	
	select distinct
		 Dest
		,sum(case when Arr_Delay_Mins > 0 then 1 else 0 end) as Delayed_Flights
	from
		Q1_flights
	group by
		Dest
	order by
		Delayed_Flights desc;
QUIT;

*------------------------------ Q8 ---------------------------------;

*-------------------- Q8 (i) ---------------------;
* Joining Flights Data with Weather Data;
PROC SQL;
	create table 
		Flight_Weather_Join
	as
	select 	 x.Date
			,x.Month
			,x.Dep_Delay_Mins
			,y.Precip
			,y.Visib
			,y.Temp
			,y.Dewp
			,y.Humid
			,y.Wind_Dir
			,y.Wind_Speed
			,y.Wind_Gust
			,y.Pressure
	from 
		Q1_Flights as x
	left join 
		Q2A_Weather as y
	on
		x.origin = y.origin 
	and
		x.date = y.date		
	and
		x.hour = y.hour;
QUIT;

*-------------------- Q8 (ii) ---------------------;
* Sorting resultant data;
PROC SORT data = Flight_Weather_Join;
	by Month;
RUN;

* Standardzing missing values;
PROC stdize data = Flight_Weather_Join out = Flight_Weather_Std /*method=mean*/ missing=0 reponly;
	var Dep_Delay_Mins Temp Dewp Humid Wind_Dir Wind_Speed Wind_Gust Precip Pressure Visib;
	by Month;
RUN;

* Avg values for weather for each month;
PROC SQL;
	create table 
		Flight_Weather_Avg
	as
	select 	 Month 					as Month				format = MonthName.			
			,avg(Dep_Delay_Mins) 	as Avg_Delay			format = 4.
			,avg(Precip) 			as Avg_Precip			format = 4.2
			,avg(Visib) 			as Avg_Visibility		format = 5.2
			,avg(Temp) 				as Avg_Temp				format = 6.2
			,avg(Dewp) 				as Avg_Dewp				format = 5.2
			,avg(Humid) 			as Avg_Humid			format = 5.2
			,avg(Wind_Dir) 			as Avg_Wind_Dir			format = 3.
			,avg(Wind_Speed) 		as Avg_Wind_Speed		format = 7.2
			,avg(Wind_Gust) 		as Avg_Wind_Guest		format = 7.2
			,avg(Pressure) 			as Avg_Pressure			format = 6.1
	from
		Flight_Weather_Std
	group by
		month
	order by 
		Avg_Delay;
QUIT;

*-------------------- Q8 (iii) ---------------------;

* PROC CORR for correlation;
PROC CORR data = Flight_Weather_Avg ;
	title 'Correlation between Avg_Dealy and Temp Parameters';
	title2 'By looking at the proc data, we can see that Avg delay & Avg_Precip are related';
	var avg_delay Avg_Precip Avg_Visibility Avg_Temp Avg_Dewp Avg_Humid Avg_Wind_Dir Avg_Wind_Speed Avg_Wind_Guest Avg_Pressure;
RUN;

* PROC PLOT for correlation;
PROC PLOT data = Flight_Weather_Avg vpercent=30 hpercent = 30;
	plot Avg_Precip*Avg_Delay = '*';
	plot Avg_Visibility*Avg_Delay = '*';
	plot Avg_Temp*Avg_Delay = '*';
	plot Avg_Dewp*Avg_Delay = '*';
	plot Avg_Humid*Avg_Delay = '*';
	plot Avg_Wind_Dir*Avg_Delay = '*';
	plot Avg_Wind_Speed*Avg_Delay = '*';
	plot Avg_Wind_Guest*Avg_Delay = '*';
	plot Avg_Pressure*Avg_Delay = '*';
	
	title 'Average Flight Delay vs Temp Parameters';
	title2 'By looking at the Graphs below we can infer that Percipitaion corelates closely with Delay';
RUN;

*------------------------------ Q9  ---------------------------------;

*------------------ Q9 (i) -------------------;

* Average cost for fuel consumed by Planes;
PROC SQL;
	create table
		FuelCost_YearManu
	as
	select
		 Manufacturing_Year
		,Avg(Fuel_CC) as Fuel_Cost format=10.
	from
		Planes
	group by
		Manufacturing_Year
	order by
		Fuel_Cost desc;
QUIT;

PROC CORR data = FuelCost_YearManu;
	var Manufacturing_Year Fuel_Cost;
RUN;

PROC SGSCATTER data = FuelCost_YearManu;
	title 'Manufacturing Year vs Avg Fuel Cost';
	title2 'Avg Fuel Cost for newer planes is more when compared to older planes';
	plot Fuel_Cost*Manufacturing_Year / reg;
RUN;

*------------------ Q9 (ii) -------------------;

PROC TABULATE data = Planes;
	class Engines Seats Engine Type / style=[background=orange];
	var Fuel_CC;
	tables (Engines Seats Engine Type),(Fuel_CC)* mean;
	keylabel mean = 'Average Fuel Cost';
	label Fuel_CC='Fuel Consumption Cost' Engines = 'No of Engines' Seats = 'No of Seats' Engine = 'Engine Type' Type = 'Plane Type';
RUN;

PROC CORR data = Planes;
	var Fuel_CC Engines Seats;
RUN;

PROC SGSCATTER data = Planes;
	title 'By looking at the plotted data, we can infer that the fuel consumtion is directly proportional to 1) No of seats';

	plot Fuel_CC*Seats / reg;
RUN;

*------------------------------ Q10 ---------------------------------;

PROC SQL;
	create table
		DelayedFlights
	as
	select
		 Hour format=timeofday.
		,avg(Dep_Delay_Mins) as Avg_Delay_Mins format=5.2
	from
		Q1_flights
	where 
		Dep_Delay_Mins > 0
	group by
		Hour
	order by
		Avg_Delay_Mins;
QUIT;

* Avreage delay in mins over the day;
PROC SGSCATTER data = DelayedFlights;
	title 'Average flight delay in mins during the day';
	title2 'Looking at the chart we can infer that avg deprature delays increases as day progress and is max during midnight';

	plot Avg_Delay_Mins*Hour / reg;
RUN;





