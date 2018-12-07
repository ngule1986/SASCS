*----------------------------------------------------;
*-------------------- ASSIGNMENT 8 ------------------;
*----------------------------------------------------;

filename Job		'/folders/myfolders/Assignment/Assignment 8 files/Job_satisfaction.dat';
filename Crime 		'/folders/myfolders/Assignment/Assignment 8 files/Crime_Stats.dat';
filename Crime_S	'/folders/myfolders/Assignment/Assignment 8 files/Crime_Stats2.dat';
filename Call		'/folders/myfolders/Assignment/Assignment 8 files Part-2/Daily_call_duration.txt';
filename HCA		'/folders/myfolders/Assignment/Assignment 8 files Part-2/HCA_file.txt';
filename Bill		'/folders/myfolders/Assignment/Assignment 8 files Part-2/Client_ID_12_months_bill.txt';
filename BillMiss	'/folders/myfolders/Assignment/Assignment 8 files Part-2/Client_ID_12_months_bill(missing).txt';

*---------------------- Q1 A ------------------------;
DATA Q1A_JobData (keep = ID Frustration_Scale Satisfaction_Scale Intent_To_Quit Quit_Flag Age_Years Tenure_Months);
	infile Job;
	input 	ID 1-3
			Frustration_Scale1 4
			Frustration_Scale2 5
			Frustration_Scale3 6
			Satisfaction_Scale1 7
			Satisfaction_Scale2 8
			Satisfaction_Scale3 9
			Intent_To_Quit 10
			Quit_Flag 11
			Age_Years 12-13
			Tenure_Months 14-16
			;	
			
	array Frustration(3) Frustration_Scale1 Frustration_Scale2 Frustration_Scale3;
	array Satisfaction(3) Satisfaction_Scale1 Satisfaction_Scale2 Satisfaction_Scale3;
	
	Frustration_Scale = sum(of Frustration(*));
	Satisfaction_Scale = sum(of Satisfaction(*));
RUN;

*---------------------- Q1 B ------------------------;
DATA Q1B_JobData (keep = ID Frustration_Scale Satisfaction_Scale Intent_To_Quit Quit_Flag Age_Years Tenure_Months);
	infile Job;
	input 	@1 ID 3.
			@4 Frustration_Scale1 1.
			@5 Frustration_Scale2 1.
			@6 Frustration_Scale3 1.
			@7 Satisfaction_Scale1 1.
			@8 Satisfaction_Scale2 1.
			@9 Satisfaction_Scale3 1.
			@10 Intent_To_Quit 1.
			@11 Quit_Flag 1.
			@12 Age_Years 2.
			@14 Tenure_Months 3.
			;		

	array Frustration(3) Frustration_Scale1 Frustration_Scale2 Frustration_Scale3;
	array Satisfaction(3) Satisfaction_Scale1 Satisfaction_Scale2 Satisfaction_Scale3;
	
	Frustration_Scale = sum(of Frustration(*));
	Satisfaction_Scale = sum(of Satisfaction(*));
RUN;

*---------------------- Q1 C ------------------------;
DATA Q1C_JobData (keep = ID Frustration_Scale Satisfaction_Scale Intent_To_Quit Quit_Flag Age_Years Tenure_Months);
	infile Job;
	input 	ID 3.
			+0 Frustration_Scale1 1.
			+0 Frustration_Scale2 1.
			+0 Frustration_Scale3 1.
			+0 Satisfaction_Scale1 1.
			+0 Satisfaction_Scale2 1.
			+0 Satisfaction_Scale3 1.
			+0 Intent_To_Quit 1.
			+0 Quit_Flag 1.
			+0 Age_Years 2.
			+0 Tenure_Months 3.
			;		
			
	array Frustration(3) Frustration_Scale1 Frustration_Scale2 Frustration_Scale3;
	array Satisfaction(3) Satisfaction_Scale1 Satisfaction_Scale2 Satisfaction_Scale3;
	
	Frustration_Scale = sum(of Frustration(*));
	Satisfaction_Scale = sum(of Satisfaction(*));		
RUN;

*---------------------- Q1 D ------------------------;
DATA Q1D_JobData (keep = ID Frustration_Scale Satisfaction_Scale Intent_To_Quit Quit_Flag Age_Years Tenure_Months);
	infile Job pad;
	input 	@1 ID 3.
			@4 Frustration_Scale1 1.
			@5 Frustration_Scale2 1.
			@6 Frustration_Scale3 1.
			@7 Satisfaction_Scale1 1.
			@8 Satisfaction_Scale2 1.
			@9 Satisfaction_Scale3 1.
			@10 Intent_To_Quit 1.
			@11 Quit_Flag 1.
			@12 Age_Years 2.
			@14 Tenure_Months 3.
			;		
			
	array Frustration(3) Frustration_Scale1 Frustration_Scale2 Frustration_Scale3;
	array Satisfaction(3) Satisfaction_Scale1 Satisfaction_Scale2 Satisfaction_Scale3;
	
	Frustration_Scale = sum(of Frustration(*));
	Satisfaction_Scale = sum(of Satisfaction(*));
RUN;

*---------------------- Q2 --------------------------;
DATA Q2_ListInput;
	infile Crime dlm= ',' dsd truncover;
	input 	City_Name			$	:25.
			Population			
			Crime_Index 
			Total_Crime_Index
			Murder
			Forcible_Rape
			Robbery
			Assault
			Burglary
			Theft
			Vehicle_Theft
			Arson         
			;
RUN;

*---------------------- Q3 --------------------------;
DATA Q3_ListInputSpace;
	infile Crime_S dlmstr= '  ' dsd truncover;
	input 	City_Name		$ & 25.
			Population			
			Crime_Index 
			Total_Crime_Index
			Murder
			Forcible_Rape
			Robbery
			Assault
			Burglary
			Theft
			Vehicle_Theft
			Arson         
			;
RUN;

*---------------------- Q4 --------------------------;
DATA Q4_Call;
	infile Call;
	input Date date9. Duration @@;
	
	format Date date9.;
RUN;

*---------------------- Q5 --------------------------;
DATA Q5_MonthlyCall;
	infile Call;
	input @ "Sep11" September @ 'Oct11' October @ "Nov11" November @ 'Dec11' December;
RUN;

DATA Q5A_MonthlyDiff;
	set Q5_MonthlyCall;
	
	array m(*) _numeric_;
	
	December = m(4) - m(3);
	November = m(3) - m(2);
	October = m(2) - m(1);	
	September = 0;
RUN;

DATA Q5B_DiffToSep (drop = September);
	set Q5_MonthlyCall;
	
	array m(*) _numeric_;
	
	December = m(4) - m(1);
	November = m(3) - m(1);
	October = m(2) - m(1);	
RUN;
	
*---------------------- Q6 --------------------------;
DATA Q6A_ClientBill (keep = ClientID Month BillAmt);
	infile Bill;
	input;		
	
	do i = 1 to 12;
		ClientID = scan(_infile_,1,' ');
		Month = i;
		BillAmt = scan(_infile_,i+1,' ');
		
		output;
	end;
RUN;

*-------- Bonus Q ---------;
PROC FORMAT;
	value MName
		1 = 'Jan'
		2 = 'Feb'
		3 = 'Mar'
		4 = 'Apr'
		5 = 'May'
		6 = 'Jun'
		7 = 'July'
		8 = 'Aug'
		9 = 'Sep'
		10 = 'Oct'
		11 = 'Nov'
		12 = 'Dec'
		;
RUN;

DATA Q6_Bonus (keep = ClientID Month BillAmt);
	infile Bill;
	input;		
	
	do i = 1 to 12;
		ClientID = scan(_infile_,1,' ');
		Month = i;
		BillAmt = scan(_infile_,i+1,' ');
		
		output;
	end;
	
	format Month MName.;
RUN;

*------------- Q6 B ----------------;
DATA Q6B_BillMiss (keep = ClientID Month BillAmt);
	infile BillMiss;
	input;		
	
	do i = 1 to 12;
		ClientID = scan(_infile_,1,' ');
		Month = i;
		BillAmt = scan(_infile_,1 + i,' ');
		
		output;
/* 		if not missing(BillAmt) then output;		 */
	end;
RUN;

*---------------------- Q7 --------------------------;
DATA Q7A_TranData (drop = firstvar);
	infile HCA ;
	input;
	
	firstvar = substr(_infile_,1,1);
	
	if firstvar = 'H' then do;
		ClientID = scan(_infile_,2, ' ');
		City = scan(_infile_,3, ' ');
	end;
	
	retain ClientID City;
	
	if firstvar = 'C' then do;
		Transaction_Date = scan(_infile_,2, ' ');
		Amount = scan(_infile_,3, ' ');
		
	end;
	
	if firstvar = 'H' then delete;
RUN;

* -------- Q7 B ----------;
DATA Q7B_HeaderData (drop = firstvar);
	infile HCA ;
	input;
	
	firstvar = substr(_infile_,1,1);
	
	if firstvar = 'H' then do;
		ClientID = scan(_infile_,2, ' ');
		City = scan(_infile_,3, ' ');
		DOB = scan(_infile_,4,'');
	end;
	
	if ClientID = . then delete;
RUN;
