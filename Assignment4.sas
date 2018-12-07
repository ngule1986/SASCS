*------------------------------------------;
*--------------- ASSIGNMENT 4 -------------;
*------------------------------------------;

* ------------------ Q1 -------------------;
* Simple & Compounded rate of interest;
DATA Interest (drop = i);
	Yearly_Investment = 5000;
	Total_Investment = 0;
	Period_Years = 15;
	RateOfInterest = 10;
	Simple_Interest = 0;
	Compounded_Interest=0;
	Simple_Matured_Amount = 0;
	Compounded_Matured_Amount=0;

	do i = 1 to 15;
		Total_Investment + Yearly_Investment;
		Simple_Interest + (Total_Investment*RateOfInterest)/100;
		Compounded_Interest + ((Compounded_Interest + Total_Investment)*RateOfInterest)/100;
	end;
	
	Simple_Matured_Amount = Total_Investment + Simple_Interest;
	Compounded_Matured_Amount = Total_Investment + Compounded_Interest;
	
	format Simple_Matured_Amount 10.2;
	format Compounded_Interest Compounded_Matured_Amount 10.2;
		
RUN;

PROC PRINT data = Interest noobs;
	title 'Q1 - Simple & Compounded Rate of Interest';
RUN;

* ------------------ Q2 -------------------;
DATA CarTemp (keep = Gallons_Used Distance_Covered);
	TotalMiles = 250;
	TotalGallon = 10;
	Mileage = 20;
	Gallons_Used = 0;
	Distance_Covered = 0;

	do i = 1 to TotalGallon;
		if Distance_Covered > 250 then leave;				
		Distance_Covered + Mileage;
		Gallons_Used = i;
		output;
	end;
	
RUN;

PROC PRINT data = CarTemp noobs;
	title 'Q2 - Distance covered & Fuel used';
RUN;

* ------------------ Q3 -------------------;
* 3A - Compounded Anually;
DATA CompoundedAnually (drop = i Interest);
	Amount = 500000;
	Period_Years = 25;
	RateOfInterest = 7;
	MaturedAmount = 500000;

	do i = 1 to 25;
		Interest = (MaturedAmount*RateOfInterest)/100;
		MaturedAmount + Interest;
	end;
RUN;

PROC PRINT data = CompoundedAnually noobs;
	title 'Q3 A - Compounded Annually';
RUN;

* 3B - Compounded Monthly;
DATA CompoundedMonthly (keep = Year Month MaturedAmount);
	Amount = 500000;
	Period_Years = 25;
	AnnualRateOfInterest = 7;
	MonthlyRateOfInterest = 7/12;
	MaturedAmount = 500000;

	do Year = 1 to 25;
		do Month = 1 to 12;
			Interest = (MaturedAmount*MonthlyRateOfInterest)/100;
			MaturedAmount + Interest;
			output;
		end;
	end;
	
	format MaturedAmount 10.2;
		
RUN;

PROC PRINT data = CompoundedMonthly noobs ;
	var Year month MaturedAmount;
	title 'Q3 B - Compounded Monthly';
RUN;