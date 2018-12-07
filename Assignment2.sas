*------------------------------------------;
*--------------- ASSIGNMENT 2 -------------;
*------------------------------------------;

* ----------------- Q1 --------------------;

PROC IMPORT datafile = '/folders/myfolders/assignment/Grocery_coupons.xls'
			dbms = xls
			out = GroceryTemp (where= (storeid is not missing))
			replace;
			sheet ='Data';
			getnames = yes;
RUN;

PROC FORMAT;
	value HealthFoodStore
		0 = 'No'
		1 = 'Yes';
	
	value StoreSize
		1 = 'Small'
		2 = 'Medium'
		3 = 'Large';
		
	value StoreOrg
		1 = 'Emphasizes produce'
		2 = 'Emphasizes deli'
		3 = 'Emphasizes bakery'
		4 = 'No emphasis';
	
	value Gender
		0 = 'Male'
		1 = 'Female';
	
	value Veg
		0 = 'No'
		1 = 'Yes';
	
	value ShoppingStyle
		1 = 'Biweekly; in bulk'
		2 = 'Weekly; similar items'
		3 = 'Often; what''s on sale';
	
	value UseCoupon
		1 = 'No'
		2 = 'From newspaper'
		3 = 'From mailings'
		4 = 'From both';
	
	value CarryOver
		0 = 'First period'
		1 = 'No coupon'
		2 = '5 percent'
		3 = '15 percent'
		4 = '25 percent';
	
	value CouponValue
		1 = 'No value'
		2 = '5 percent'
		3 = '15 percent'
		4 = '25 percent';
RUN;

DATA Grocery_Coupons;
	set GroceryTemp;
	
	label
 		storeid		='Store ID'
		hlthfood	='Health food store'
		size		='Size of store'
		org			='Store organization'
		custid		='Customer ID'
		gender		='Gender'
		shopfor		='Who shopping for'
		veg			='Vegetarian'
		style		='Shopping style'
		usecoup		='Use coupons'
		week		='Week'
		seq			='Sequence'
		carry		='Carryover'
		coupval		='Value of coupon'
		amtspent	='Amount spent';

	format
		hlthfood 	HealthFoodStore.
		size 		StoreSize.
		org 		StoreOrg.
		gender 		gender.
		veg 		veg.
		style 		ShoppingStyle.
		usecoup 	UseCoupon.
		carry 		CarryOver.
		coupval 	CouponValue.;
RUN;

PROC PRINT data = grocery_coupons noobs label;
	id storeid;
	title 'Q1 - Grocery Coupon Details';
RUN;

* ----------------- Q2 --------------------;
PROC SORT data = grocery_coupons;
	by gender;
RUN;

* Distribution of Coupon value and Shopping Style for Overall data;
PROC FREQ data = grocery_coupons;
	table coupval style;
	title 'Q2a - Distribution of Coupon value and Shopping Style';
RUN;

* Distribution of Coupon value and Shopping Style by Gender Category;
PROC FREQ data = grocery_coupons;
	table coupval style ;
	by gender;
	title 'Q2b - Distribution of Coupon value and Shopping Style by Gender';
RUN;

* ----------------- Q3 --------------------;
PROC FREQ data = grocery_coupons;
	table org*size / nopercent norow nocol;
	title 'Q3a - Frequency Distribution of Store Size by Store Organization';
RUN;

*----------------- Part B----------------;
PROC FREQ data = grocery_coupons;
	table org*size / nofreq norow nocol;
	title 'Q3b - % of total Frequency Distribution of Store Size by Store Organization';
RUN;

* ----------------- Q4 --------------------;
PROC MEANS data = grocery_coupons nonobs max min mean var sum maxdec = 1;
	class size org;
	types () size*org;
	var amtspent;
	title 'Q4 - Stats for Amount Spent by Store Size & Store Organization';
RUN;