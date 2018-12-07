*------------------------------------------;
*--------------- ASSIGNMENT 5 -------------;
*------------------------------------------;

*-----------------------
Importing Grocery file
------------------------;
PROC IMPORT datafile 		= '/folders/myfolders/assignment/Grocery_coupons.xls'
			dbms 			= xls
			out 			= GroceryData (where= (storeid is not missing))
			replace			;
			sheet 			='Data';
			getnames 		= yes;
			guessingrows	= 100;
RUN;

PROC CONTENTS data = GroceryData;
RUN;

PROC MEANS data = GroceryData n nmiss;
	var couponexpiry;
RUN;

*----------------------------------------------------
Importing Department file (with sepcial characters)
-----------------------------------------------------;
filename deptfile '/folders/myfolders/assignment/department.csv' encoding= 'wlatin2';

PROC IMPORT datafile 		= deptfile
			dbms 			= csv
			out 			= DeptDataTemp
			replace			;
			getnames 		= yes;
			guessingrows	= 288;
RUN;

PROC CONTENTS data = DeptDataTemp;
RUN;

DATA DeptData (rename = (Ex1 = Expenditure ) drop = Expenditure);
	set DeptDataTemp;
	
	if Expenditure = '-' then Ex1 = .;
	else Ex1 = input(Expenditure, comma18.);
RUN;

*---------------------- Q1 ------------------------;
DATA Q1A_DateDiff;
	set GroceryData (keep = couponexpiry);
	
	Current_day = today();
	Months_Diff	= intck('month', couponexpiry, Current_day);
	Weeks_Diff 	= intck('week', couponexpiry, Current_day);
	Days_Diff 	= intck('day', couponexpiry, Current_day);
	
	format Current_day date9.
RUN;

*--------- Q1B ------------;
DATA Q1B_DateDiff ;
	set GroceryData (keep = couponexpiry);
	
	Since_Day 	= mdy(03,31,2014);
	
	Months_Diff	= intck('month', couponexpiry, Since_Day);
	Weeks_Diff 	= intck('week', couponexpiry, Since_Day);
	Days_Diff 	= intck('day', couponexpiry, Since_Day);
	
	format Since_Day date9.;
RUN;

*---------------------- Q2 ------------------------;
DATA Q2_IssueDate;
	set GroceryData (keep = couponexpiry);
	
	Coupon_IssueDate = intnx('months', couponexpiry, -3, 's');
	
	format Coupon_IssueDate date9.;
RUN;

*---------------------- Q3 ------------------------;
DATA Q3_DaysDiff;
	set GroceryData (keep = couponexpiry);
	
	Since = mdy(09,30,2014);
	Days_Diff = datdif(couponexpiry, Since, '30/360');
	
	format since date9.;
RUN;

*---------------------- Q4 ------------------------;
DATA Q4_MarginAmt;
	set GroceryData (keep = amtspent);
	
	amount_integer 		= int(amtspent);
	amtspent_round 		= round(amtspent);
	amtspent_ceiling 	= ceil(amtspent);
	amtspent_floor 		= floor(amtspent);
	
	margin_interger = (amount_integer - amtspent);	
	margin_round 	= (amtspent_round - amtspent);
	margin_ceiling 	= (amtspent_ceiling - amtspent);
	margin_floor 	= (amtspent_floor - amtspent);
RUN;

PROC MEANS data = MarginAmt sum maxdec=0;
	var margin_interger margin_round margin_ceiling margin_floor;
	title 'Q4 - Most Profitable Estimation Method';
RUN;

*---------------------- Q5 ------------------------;
Data Q5_LastName;
	set DeptData (keep = Name);
	
	LastName = scan(Name, 1, ',' );
RUN;

*---------------------- Q6 ------------------------;
Data Q6_Position;
	set DeptData (keep = Name);
	
	Fistname_Position = find(Name, ',') + 2;
RUN;

*---------------------- Q7 ------------------------;
Data Q7_FirstName (keep = Name FirstName);
	set Q6_Position;
	
	FirstName = substr(Name, Fistname_Position, (length(Name) - Fistname_Position - 1));
RUN;


