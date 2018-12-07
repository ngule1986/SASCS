*------------------------------------------;
*--------------- ASSIGNMENT 7 -------------;
*------------------------------------------;

OPTIONS mprint symbolgen mlogic merror serror;

filename models '/folders/myfolders/Assignment/Assignment 7 files and class exercise (Macros)/models.txt';
filename orders '/folders/myfolders/Assignment/Assignment 7 files and class exercise (Macros)/Orders.txt';

DATA Models;
	infile models dlm = ' ' dsd truncover;
	input Product $ :10. Type $ Cost Manu_Type $;
RUN;


DATA Orders;
	infile Orders firstobs=2 truncover;
	input @1 ID 3. @5 Orderdate date7. @13 Model $ & 12. @26 Quantity 2.;
	
	format Orderdate date7.;
RUN;

*---------------------------------- Q1 --------------------------------;

*For Sort order 1) Blank for Ascending 2) Descending for Descending;

%MACRO DataSort (SortOrd, ByVar);
	PROC SORT data = Models;
		by &SortOrd &ByVar;
	RUN;
	
	%if %length(&SortOrd) = 0 %then %do;
		PROC PRINT data = Models;
			title "Data is sorted by &ByVar in Acsending order";
		RUN;
	%end;
	
	%if %length(&SortOrd) ^= 0 %then %do;	
		PROC PRINT data = Models;
			title "Data is sorted by &ByVar in &SortOrd order";
		RUN;
	%end;
	
%MEND DataSort;

%DataSort(Descending,Cost);

*---------------------------------- Q2 --------------------------------;

%Macro Report;
	
	%if &sysday = Monday %then %do; 
		PROC SQL;
			title 'Current Orders Report';
			select * from Orders order by ID;
		QUIT;
	%end;	
	
	%if &sysday = Friday %then %do;
		PROC tabulate data = orders;
			title 'Customer Order Summary Report';
		
			class ID Model;
			var  Quantity;
			table ID, Model*Quantity;
			keylabel sum = 'Total Quantity Ordered';
		RUN;
	%end;

%MEND Report;

%Report;

*---------------------------------- Q3 --------------------------------;

%Macro Power;

	DATA sample;
		Array VarName(10) Var_1 Var_2 Var_3 Var_4 Var_5 Var_6 Var_7 Var_8 Var_9 Var_10;
	
		%do i = 2 %to 3;
			%do j = 1 %to 10;
				VarName(&j) = &j**&i;
			%end;
			output;
		%end;
	RUN;

%MEND Power;

%Power;

*---------------------------------- Q4 --------------------------------;

%Let String = hello please let me know;

%Macro StringOP;
		%do i =1 %to 5;
		 	%let str = %scan(&String,&i, ' ');
			%put The string is: &Str;
		%end;
		
		%put The String is: now empty;
%MEND StringOP;
	
%StringOP;

*---------------------------------- Q5 --------------------------------;
DATA Cars (keep = Make Model Type);
	set sashelp.cars;
RUN;

*------------- Macro Using Positional Paramaters ----------------;
%MACRO Cars (Var1, Var2);
	
	PROC FREQ data = Cars;
		table &Var1*&Var2 / crosslist;
	RUN;

%MEND Cars;

%Cars(Make, Type);

*------------- Macro using Keyword Parameter ---------------------;
%MACRO CarsKey (Var1=, Var2=);
	
	PROC FREQ data = Cars;
		table &Var1*&Var2 / crosslist;
	RUN;

%MEND CarsKey;

%CarsKey(Var1 = Make, Var2 = Type);


