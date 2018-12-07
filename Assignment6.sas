*------------------------------------------;
*--------------- ASSIGNMENT 6 -------------;
*------------------------------------------;

filename smbfile '/folders/myfolders/Assignment/Assignment 6 files (SQL)/SMB usage and billing sample (April- Sep).csv';
filename ChuLab  '/folders/myfolders/Assignment/Assignment 6 files (SQL)/Churners and labels.xls';

*---------------------------------- Q1 --------------------------------;

DATA SMB_Data;
	infile smbfile dlm = ',' dsd truncover firstobs=2;
	input 	PRODUCT_ID
			Year
			AON
			CELL_CALL_CNT_M1
			CELL_CALL_CNT_M2
			CELL_CALL_CNT_M3
			CELL_CALL_CNT_M4
			CELL_CALL_CNT_M5
			CELL_CALL_CNT_M6
			CELL_CALL_SEC_M1
			CELL_CALL_SEC_M2
			CELL_CALL_SEC_M3
			CELL_CALL_SEC_M4
			CELL_CALL_SEC_M5
			CELL_CALL_SEC_M6
			CELL_CALL_avg_dur_M1
			CELL_CALL_avg_dur_M2
			CELL_CALL_avg_dur_M3
			CELL_CALL_avg_dur_M4
			CELL_CALL_avg_dur_M5
			CELL_CALL_avg_dur_M6
			CELL_USAGE_CHARGE_AMT_M1
			CELL_USAGE_CHARGE_AMT_M2
			CELL_USAGE_CHARGE_AMT_M3
			CELL_USAGE_CHARGE_AMT_M4
			CELL_USAGE_CHARGE_AMT_M5
			CELL_USAGE_CHARGE_AMT_M6
			DATA_CALL_CNT_M1
			DATA_CALL_CNT_M2
			DATA_CALL_CNT_M3
			DATA_CALL_CNT_M4
			DATA_CALL_CNT_M5
			DATA_CALL_CNT_M6
			DATA_CALL_SEC_M1
			DATA_CALL_SEC_M2
			DATA_CALL_SEC_M3
			DATA_CALL_SEC_M4
			DATA_CALL_SEC_M5
			DATA_CALL_SEC_M6
			DATA_CALL_avg_dur_M1
			DATA_CALL_avg_dur_M2
			DATA_CALL_avg_dur_M3
			DATA_CALL_avg_dur_M4
			DATA_CALL_avg_dur_M5
			DATA_CALL_avg_dur_M6
			DATA_USAGE_CHARGE_AMT_M1
			DATA_USAGE_CHARGE_AMT_M2
			DATA_USAGE_CHARGE_AMT_M3
			DATA_USAGE_CHARGE_AMT_M4
			DATA_USAGE_CHARGE_AMT_M5
			DATA_USAGE_CHARGE_AMT_M6
			INT_CALL_CNT_M1
			INT_CALL_CNT_M2
			INT_CALL_CNT_M3
			INT_CALL_CNT_M4
			INT_CALL_CNT_M5
			INT_CALL_CNT_M6
			INT_CALL_SEC_M1
			INT_CALL_SEC_M2
			INT_CALL_SEC_M3
			INT_CALL_SEC_M4
			INT_CALL_SEC_M5
			INT_CALL_SEC_M6
			INT_CALL_avg_dur_M1
			INT_CALL_avg_dur_M2
			INT_CALL_avg_dur_M3
			INT_CALL_avg_dur_M4
			INT_CALL_avg_dur_M5
			INT_CALL_avg_dur_M6
			INT_USAGE_CHARGE_AMT_M1
			INT_USAGE_CHARGE_AMT_M2
			INT_USAGE_CHARGE_AMT_M3
			INT_USAGE_CHARGE_AMT_M4
			INT_USAGE_CHARGE_AMT_M5
			INT_USAGE_CHARGE_AMT_M6
			LOCAL_CALL_CNT_M1
			LOCAL_CALL_CNT_M2
			LOCAL_CALL_CNT_M3
			LOCAL_CALL_CNT_M4
			LOCAL_CALL_CNT_M5
			LOCAL_CALL_CNT_M6
			LOCAL_CALL_SEC_M1
			LOCAL_CALL_SEC_M2
			LOCAL_CALL_SEC_M3
			LOCAL_CALL_SEC_M4
			LOCAL_CALL_SEC_M5
			LOCAL_CALL_SEC_M6
			LOCAL_CAL_avg_dur_M1
			LOCAL_CAL_avg_dur_M2
			LOCAL_CAL_avg_dur_M3
			LOCAL_CAL_avg_dur_M4
			LOCAL_CAL_avg_dur_M5
			LOCAL_CAL_avg_dur_M6
			LOCAL_USAGE_CHARGE_AMT_M1
			LOCAL_USAGE_CHARGE_AMT_M2
			LOCAL_USAGE_CHARGE_AMT_M3
			LOCAL_USAGE_CHARGE_AMT_M4
			LOCAL_USAGE_CHARGE_AMT_M5
			LOCAL_USAGE_CHARGE_AMT_M6
			NAT_CALL_CNT_M1
			NAT_CALL_CNT_M2
			NAT_CALL_CNT_M3
			NAT_CALL_CNT_M4
			NAT_CALL_CNT_M5
			NAT_CALL_CNT_M6
			NAT_CALL_SEC_M1
			NAT_CALL_SEC_M2
			NAT_CALL_SEC_M3
			NAT_CALL_SEC_M4
			NAT_CALL_SEC_M5
			NAT_CALL_SEC_M6
			NAT_CALL_avg_dur_M1
			NAT_CALL_avg_dur_M2
			NAT_CALL_avg_dur_M3
			NAT_CALL_avg_dur_M4
			NAT_CALL_avg_dur_M5
			NAT_CALL_avg_dur_M6
			NAT_USAGE_CHARGE_AMT_M1
			NAT_USAGE_CHARGE_AMT_M2
			NAT_USAGE_CHARGE_AMT_M3
			NAT_USAGE_CHARGE_AMT_M4
			NAT_USAGE_CHARGE_AMT_M5
			NAT_USAGE_CHARGE_AMT_M6
			ONE_TIME_CHARGE_AMT_M1
			ONE_TIME_CHARGE_AMT_M2
			ONE_TIME_CHARGE_AMT_M3
			ONE_TIME_CHARGE_AMT_M4
			ONE_TIME_CHARGE_AMT_M5
			ONE_TIME_CHARGE_AMT_M6
			OTHER_CALL_CNT_M1
			OTHER_CALL_CNT_M2
			OTHER_CALL_CNT_M3
			OTHER_CALL_CNT_M4
			OTHER_CALL_CNT_M5
			OTHER_CALL_CNT_M6
			OTHER_CALL_SEC_M1
			OTHER_CALL_SEC_M2
			OTHER_CALL_SEC_M3
			OTHER_CALL_SEC_M4
			OTHER_CALL_SEC_M5
			OTHER_CALL_SEC_M6
			OTHER_CAL_avg_dur_M1
			OTHER_CAL_avg_dur_M2
			OTHER_CAL_avg_dur_M3
			OTHER_CAL_avg_dur_M4
			OTHER_CAL_avg_dur_M5
			OTHER_CAL_avg_dur_M6
			OTHER_USAGE_CHARGE_AMT_M1
			OTHER_USAGE_CHARGE_AMT_M2
			OTHER_USAGE_CHARGE_AMT_M3
			OTHER_USAGE_CHARGE_AMT_M4
			OTHER_USAGE_CHARGE_AMT_M5
			OTHER_USAGE_CHARGE_AMT_M6
			OVR_CALL_AVG_DURATION_M1
			OVR_CALL_AVG_DURATION_M2
			OVR_CALL_AVG_DURATION_M3
			OVR_CALL_AVG_DURATION_M4
			OVR_CALL_AVG_DURATION_M5
			OVR_CALL_AVG_DURATION_M6
			RECURRING_CHARGE_AMT_M1
			RECURRING_CHARGE_AMT_M2
			RECURRING_CHARGE_AMT_M3
			RECURRING_CHARGE_AMT_M4
			RECURRING_CHARGE_AMT_M5
			RECURRING_CHARGE_AMT_M6
			SPEND_AMT_M1
			SPEND_AMT_M2
			SPEND_AMT_M3
			SPEND_AMT_M4
			SPEND_AMT_M5
			SPEND_AMT_M6
			TOT_CALL_CNT_M1
			TOT_CALL_CNT_M2
			TOT_CALL_CNT_M3
			TOT_CALL_CNT_M4
			TOT_CALL_CNT_M5
			TOT_CALL_CNT_M6
			TOT_CALL_SEC_M1
			TOT_CALL_SEC_M2
			TOT_CALL_SEC_M3
			TOT_CALL_SEC_M4
			TOT_CALL_SEC_M5
			TOT_CALL_SEC_M6
			TOT_CHARGE_AMT_M1
			TOT_CHARGE_AMT_M2
			TOT_CHARGE_AMT_M3
			TOT_CHARGE_AMT_M4
			TOT_CHARGE_AMT_M5
			TOT_CHARGE_AMT_M6
			USAGE_CHARGE_AMT_M1
			USAGE_CHARGE_AMT_M2
			USAGE_CHARGE_AMT_M3
			USAGE_CHARGE_AMT_M4
			USAGE_CHARGE_AMT_M5
			USAGE_CHARGE_AMT_M6
			TCL_DLM
			TCL_DL2M
			TCL_DL3M
			TCH_DLM
			TCH_DL2M
			TCH_DL3M
			LCL_DLM
			LCL_DL2M
			LCL_DL3M
			NCL_DLM
			NCL_DL2M
			NCL_DL3M
			CELL_CALL_SEC_Avg6
			CELL_CALL_avg_dur_Avg6
			CELL_USAGE_CHARGE_AMT_Avg6
			DATA_CALL_CNT_Avg6
			DATA_CALL_SEC_Avg6
			DATA_CALL_avg_dur_Avg6
			DATA_USAGE_CHARGE_AMT_Avg6
			INT_CALL_CNT_Avg6
			INT_CALL_SEC_Avg6
			INT_CALL_avg_dur_Avg6
			INT_USAGE_CHARGE_AMT_Avg6
			LOCAL_CALL_CNT_Avg6
			LOCAL_CALL_SEC_Avg6
			LOCAL_CAL_avg_dur_Avg6
			LOCAL_USAGE_CHARGE_AMT_Avg6
			NAT_CALL_CNT_Avg6
			NAT_CALL_SEC_Avg6
			NAT_CALL_avg_dur_Avg6
			NAT_USAGE_CHARGE_AMT_Avg6
			ONE_TIME_CHARGE_AMT_Avg6
			OTHER_CALL_CNT_Avg6
			OTHER_CALL_SEC_Avg6
			OTHER_CAL_avg_dur_Avg6
			OTHER_USAGE_CHARGE_AMT_Avg6
			OVR_CALL_AVG_DURATION_Avg6
			RECURRING_CHARGE_AMT_Avg6
			SPEND_AMT_Avg6
			TOT_CALL_CNT_Avg6
			TOT_CALL_SEC_Avg6
			TOT_CHARGE_AMT_Avg6
			USAGE_CHARGE_AMT_Avg6
			CELL_CALL_SEC_Avg3
			CELL_CALL_avg_dur_Avg3
			CELL_USAGE_CHARGE_AMT_Avg3
			DATA_CALL_CNT_Avg3
			DATA_CALL_SEC_Avg3
			DATA_CALL_avg_dur_Avg3
			DATA_USAGE_CHARGE_AMT_Avg3
			INT_CALL_CNT_Avg3
			INT_CALL_SEC_Avg3
			INT_CALL_avg_dur_Avg3
			INT_USAGE_CHARGE_AMT_Avg3
			LOCAL_CALL_CNT_Avg3
			LOCAL_CALL_SEC_Avg3
			LOCAL_CAL_avg_dur_Avg3
			LOCAL_USAGE_CHARGE_AMT_Avg3
			NAT_CALL_CNT_Avg3
			NAT_CALL_SEC_Avg3
			NAT_CALL_avg_dur_Avg3
			NAT_USAGE_CHARGE_AMT_Avg3
			ONE_TIME_CHARGE_AMT_Avg3
			OTHER_CALL_CNT_Avg3
			OTHER_CALL_SEC_Avg3
			OTHER_CAL_avg_dur_Avg3
			OTHER_USAGE_CHARGE_AMT_Avg3
			OVR_CALL_AVG_DURATION_Avg3
			RECURRING_CHARGE_AMT_Avg3
			SPEND_AMT_Avg3
			TOT_CALL_CNT_Avg3
			TOT_CALL_SEC_Avg3
			TOT_CHARGE_AMT_Avg3
			USAGE_CHARGE_AMT_Avg3
			CELL_CALL_CNT_DEC2_1
			CELL_CALL_CNT_DEC3_2
			CELL_CALL_CNT_DEC4_3
			CELL_CALL_CNT_DEC5_4
			CELL_CALL_CNT_DEC6_5
			CELL_CALL_SEC_DEC2_1
			CELL_CALL_SEC_DEC3_2
			CELL_CALL_SEC_DEC4_3
			CELL_CALL_SEC_DEC5_4
			CELL_CALL_SEC_DEC6_5
			CELL_CALL_avg_dur_DEC2_1
			CELL_CALL_avg_dur_DEC3_2
			CELL_CALL_avg_dur_DEC4_3
			CELL_CALL_avg_dur_DEC5_4
			CELL_CALL_avg_dur_DEC6_5
			CELL_USAGE_CHARGE_AMT_DEC2_1
			CELL_USAGE_CHARGE_AMT_DEC3_2
			CELL_USAGE_CHARGE_AMT_DEC4_3
			CELL_USAGE_CHARGE_AMT_DEC5_4
			CELL_USAGE_CHARGE_AMT_DEC6_5
			INT_CALL_CNT_DEC2_1
			INT_CALL_CNT_DEC3_2
			INT_CALL_CNT_DEC4_3
			INT_CALL_CNT_DEC5_4
			INT_CALL_CNT_DEC6_5
			INT_CALL_SEC_DEC2_1
			INT_CALL_SEC_DEC3_2
			INT_CALL_SEC_DEC4_3
			INT_CALL_SEC_DEC5_4
			INT_CALL_SEC_DEC6_5
			INT_CALL_avg_dur_DEC2_1
			INT_CALL_avg_dur_DEC3_2
			INT_CALL_avg_dur_DEC4_3
			INT_CALL_avg_dur_DEC5_4
			INT_CALL_avg_dur_DEC6_5
			INT_USAGE_CHARGE_AMT_DEC2_1
			INT_USAGE_CHARGE_AMT_DEC3_2
			INT_USAGE_CHARGE_AMT_DEC4_3
			INT_USAGE_CHARGE_AMT_DEC5_4
			INT_USAGE_CHARGE_AMT_DEC6_5
			LOCAL_CALL_CNT_DEC2_1
			LOCAL_CALL_CNT_DEC3_2
			LOCAL_CALL_CNT_DEC4_3
			LOCAL_CALL_CNT_DEC5_4
			LOCAL_CALL_CNT_DEC6_5
			LOCAL_CALL_SEC_DEC2_1
			LOCAL_CALL_SEC_DEC3_2
			LOCAL_CALL_SEC_DEC4_3
			LOCAL_CALL_SEC_DEC5_4
			LOCAL_CALL_SEC_DEC6_5
			LOCAL_CAL_avg_dur_DEC2_1
			LOCAL_CAL_avg_dur_DEC3_2
			LOCAL_CAL_avg_dur_DEC4_3
			LOCAL_CAL_avg_dur_DEC5_4
			LOCAL_CAL_avg_dur_DEC6_5
			LOCAL_USAGE_CHARGE_AMT_DEC2_1
			LOCAL_USAGE_CHARGE_AMT_DEC3_2
			LOCAL_USAGE_CHARGE_AMT_DEC4_3
			LOCAL_USAGE_CHARGE_AMT_DEC5_4
			LOCAL_USAGE_CHARGE_AMT_DEC6_5
			NAT_CALL_CNT_DEC2_1
			NAT_CALL_CNT_DEC3_2
			NAT_CALL_CNT_DEC4_3
			NAT_CALL_CNT_DEC5_4
			NAT_CALL_CNT_DEC6_5
			NAT_CALL_SEC_DEC2_1
			NAT_CALL_SEC_DEC3_2
			NAT_CALL_SEC_DEC4_3
			NAT_CALL_SEC_DEC5_4
			NAT_CALL_SEC_DEC6_5
			NAT_CALL_avg_dur_DEC2_1
			NAT_CALL_avg_dur_DEC3_2
			NAT_CALL_avg_dur_DEC4_3
			NAT_CALL_avg_dur_DEC5_4
			NAT_CALL_avg_dur_DEC6_5
			NAT_USAGE_CHARGE_AMT_DEC2_1
			NAT_USAGE_CHARGE_AMT_DEC3_2
			NAT_USAGE_CHARGE_AMT_DEC4_3
			NAT_USAGE_CHARGE_AMT_DEC5_4
			NAT_USAGE_CHARGE_AMT_DEC6_5
			SPEND_AMT_DEC2_1
			SPEND_AMT_DEC3_2
			SPEND_AMT_DEC4_3
			SPEND_AMT_DEC5_4
			SPEND_AMT_DEC6_5
			TOT_CALL_CNT_DEC2_1
			TOT_CALL_CNT_DEC3_2
			TOT_CALL_CNT_DEC4_3
			TOT_CALL_CNT_DEC5_4
			TOT_CALL_CNT_DEC6_5
			TOT_CALL_SEC_DEC2_1
			TOT_CALL_SEC_DEC3_2
			TOT_CALL_SEC_DEC4_3
			TOT_CALL_SEC_DEC5_4
			TOT_CALL_SEC_DEC6_5
			TOT_CHARGE_AMT_DEC2_1
			TOT_CHARGE_AMT_DEC3_2
			TOT_CHARGE_AMT_DEC4_3
			TOT_CHARGE_AMT_DEC5_4
			TOT_CHARGE_AMT_DEC6_5
			USAGE_CHARGE_AMT_DEC2_1
			USAGE_CHARGE_AMT_DEC3_2
			USAGE_CHARGE_AMT_DEC4_3
			USAGE_CHARGE_AMT_DEC5_4
			USAGE_CHARGE_AMT_DEC6_5
			Avg_DEC_6M_CELL_CALL_CNT
			Avg_DEC_6M_CELL_CALL_SEC
			Avg_DEC_6M_CELL_CALL_avg_dur
			Avg_DEC_6M_CELL_USAGE_CHARGE_AMT
			Avg_DEC_6M_INT_CALL_CNT
			Avg_DEC_6M_INT_CALL_SEC
			Avg_DEC_6M_INT_CALL_avg_dur
			Avg_DEC_6M_INT_USAGE_CHARGE_AMT
			Avg_DEC_6M_LOCAL_CALL_CNT
			Avg_DEC_6M_LOCAL_CALL_SEC
			Avg_DEC_6M_LOCAL_CAL_avg_dur
			Avg_DEC_6M_LOC_USAGE_CHRG_AMT
			Avg_DEC_6M_NAT_CALL_CNT
			Avg_DEC_6M_NAT_CALL_SEC
			Avg_DEC_6M_NAT_CALL_avg_dur
			Avg_DEC_6M_NAT_USAGE_CHARGE_AMT
			Avg_DEC_6M_SPEND_AMT
			Avg_DEC_6M_TOT_CALL_CNT
			Avg_DEC_6M_TOT_CALL_SEC
			Avg_DEC_6M_TOT_CHARGE_AMT
			Avg_DEC_6M_USAGE_CHARGE_AMT
			Avg_DEC_3M_CELL_CALL_CNT
			Avg_DEC_3M_CELL_CALL_SEC
			Avg_DEC_3M_CELL_CALL_avg_dur
			Avg_DEC_3M_CELL_USAGE_CHARGE_AMT
			Avg_DEC_3M_INT_CALL_CNT
			Avg_DEC_3M_INT_CALL_SEC
			Avg_DEC_3M_INT_CALL_avg_dur
			Avg_DEC_3M_INT_USAGE_CHARGE_AMT
			Avg_DEC_3M_LOCAL_CALL_CNT
			Avg_DEC_3M_LOCAL_CALL_SEC
			Avg_DEC_3M_LOCAL_CAL_avg_dur
			Avg_DEC_3M_LOC_USAGE_CHRG_AMT
			Avg_DEC_3M_NAT_CALL_CNT
			Avg_DEC_3M_NAT_CALL_SEC
			Avg_DEC_3M_NAT_CALL_avg_dur
			Avg_DEC_3M_NAT_USAGE_CHARGE_AMT
			Avg_DEC_3M_SPEND_AMT
			Avg_DEC_3M_TOT_CALL_CNT
			Avg_DEC_3M_TOT_CALL_SEC
			Avg_DEC_3M_TOT_CHARGE_AMT
			Avg_DEC_3M_USAGE_CHARGE_AMT
			;
			
		label 
			PRODUCT_ID='Line number'
			Year='Year'
			AON='Age on network'
			CELL_CALL_CNT_M1='count of cell calls-April'
			CELL_CALL_CNT_M2='count of cell calls-May'
			CELL_CALL_CNT_M3='count of cell calls-June'
			CELL_CALL_CNT_M4='count of cell calls-July'
			CELL_CALL_CNT_M5='count of cell calls-August '
			CELL_CALL_CNT_M6='count of cell calls-September'
			CELL_CALL_SEC_M1='Cell calls duration in seconds-April'
			CELL_CALL_SEC_M2='Cell calls duration in seconds-May'
			CELL_CALL_SEC_M3='Cell calls duration in seconds-June'
			CELL_CALL_SEC_M4='Cell calls duration in seconds-July'
			CELL_CALL_SEC_M5='Cell calls duration in seconds-August '
			CELL_CALL_SEC_M6='Cell calls duration in seconds-September'
			CELL_CALL_avg_dur_M1='Average cell calls duration-April'
			CELL_CALL_avg_dur_M2='Average cell calls duration-May'
			CELL_CALL_avg_dur_M3='Average cell calls duration-June'
			CELL_CALL_avg_dur_M4='Average cell calls duration-July'
			CELL_CALL_avg_dur_M5='Average cell calls duration-August '
			CELL_CALL_avg_dur_M6='Average cell calls duration-September'
			CELL_USAGE_CHARGE_AMT_M1='Cell usage charge amount-April'
			CELL_USAGE_CHARGE_AMT_M2='Cell usage charge amount-May'
			CELL_USAGE_CHARGE_AMT_M3='Cell usage charge amount-June'
			CELL_USAGE_CHARGE_AMT_M4='Cell usage charge amount-July'
			CELL_USAGE_CHARGE_AMT_M5='Cell usage charge amount-August '
			CELL_USAGE_CHARGE_AMT_M6='Cell usage charge amount-September'
			DATA_CALL_CNT_M1='count of Data calls-April'
			DATA_CALL_CNT_M2='count of Data calls-May'
			DATA_CALL_CNT_M3='count of Data calls-June'
			DATA_CALL_CNT_M4='count of Data calls-July'
			DATA_CALL_CNT_M5='count of Data calls-August '
			DATA_CALL_CNT_M6='count of Data calls-September'
			DATA_CALL_SEC_M1='Data calls duration in seconds-April'
			DATA_CALL_SEC_M2='Data calls duration in seconds-May'
			DATA_CALL_SEC_M3='Data calls duration in seconds-June'
			DATA_CALL_SEC_M4='Data calls duration in seconds-July'
			DATA_CALL_SEC_M5='Data calls duration in seconds-August '
			DATA_CALL_SEC_M6='Data calls duration in seconds-September'
			DATA_CALL_avg_dur_M1='Average Data calls duration-April'
			DATA_CALL_avg_dur_M2='Average Data calls duration-May'
			DATA_CALL_avg_dur_M3='Average Data calls duration-June'
			DATA_CALL_avg_dur_M4='Average Data calls duration-July'
			DATA_CALL_avg_dur_M5='Average Data calls duration-August '
			DATA_CALL_avg_dur_M6='Average Data calls duration-September'
			DATA_USAGE_CHARGE_AMT_M1='Data usage charge amount-April'
			DATA_USAGE_CHARGE_AMT_M2='Data usage charge amount-May'
			DATA_USAGE_CHARGE_AMT_M3='Data usage charge amount-June'
			DATA_USAGE_CHARGE_AMT_M4='Data usage charge amount-July'
			DATA_USAGE_CHARGE_AMT_M5='Data usage charge amount-August '
			DATA_USAGE_CHARGE_AMT_M6='Data usage charge amount-September'
			INT_CALL_CNT_M1='count of International calls calls-April'
			INT_CALL_CNT_M2='count of International calls calls-May'
			INT_CALL_CNT_M3='count of International calls calls-June'
			INT_CALL_CNT_M4='count of International calls calls-July'
			INT_CALL_CNT_M5='count of International calls calls-August '
			INT_CALL_CNT_M6='count of International calls calls-September'
			INT_CALL_SEC_M1='International calls calls duration in seconds-April'
			INT_CALL_SEC_M2='International calls calls duration in seconds-May'
			INT_CALL_SEC_M3='International calls calls duration in seconds-June'
			INT_CALL_SEC_M4='International calls calls duration in seconds-July'
			INT_CALL_SEC_M5='International calls calls duration in seconds-August '
			INT_CALL_SEC_M6='International calls calls duration in seconds-September'
			INT_CALL_avg_dur_M1='Average International calls calls duration-April'
			INT_CALL_avg_dur_M2='Average International calls calls duration-May'
			INT_CALL_avg_dur_M3='Average International calls calls duration-June'
			INT_CALL_avg_dur_M4='Average International calls calls duration-July'
			INT_CALL_avg_dur_M5='Average International calls calls duration-August '
			INT_CALL_avg_dur_M6='Average International calls calls duration-September'
			INT_USAGE_CHARGE_AMT_M1='International calls usage charge amount-April'
			INT_USAGE_CHARGE_AMT_M2='International calls usage charge amount-May'
			INT_USAGE_CHARGE_AMT_M3='International calls usage charge amount-June'
			INT_USAGE_CHARGE_AMT_M4='International calls usage charge amount-July'
			INT_USAGE_CHARGE_AMT_M5='International calls usage charge amount-August '
			INT_USAGE_CHARGE_AMT_M6='International calls usage charge amount-September'
			LOCAL_CALL_CNT_M1='count of Local calls calls-April'
			LOCAL_CALL_CNT_M2='count of Local calls calls-May'
			LOCAL_CALL_CNT_M3='count of Local calls calls-June'
			LOCAL_CALL_CNT_M4='count of Local calls calls-July'
			LOCAL_CALL_CNT_M5='count of Local calls calls-August '
			LOCAL_CALL_CNT_M6='count of Local calls calls-September'
			LOCAL_CALL_SEC_M1='Local calls calls duration in seconds-April'
			LOCAL_CALL_SEC_M2='Local calls calls duration in seconds-May'
			LOCAL_CALL_SEC_M3='Local calls calls duration in seconds-June'
			LOCAL_CALL_SEC_M4='Local calls calls duration in seconds-July'
			LOCAL_CALL_SEC_M5='Local calls calls duration in seconds-August '
			LOCAL_CALL_SEC_M6='Local calls calls duration in seconds-September'
			LOCAL_CAL_avg_dur_M1='Average Local calls calls duration-April'
			LOCAL_CAL_avg_dur_M2='Average Local calls calls duration-May'
			LOCAL_CAL_avg_dur_M3='Average Local calls calls duration-June'
			LOCAL_CAL_avg_dur_M4='Average Local calls calls duration-July'
			LOCAL_CAL_avg_dur_M5='Average Local calls calls duration-August '
			LOCAL_CAL_avg_dur_M6='Average Local calls calls duration-September'
			LOCAL_USAGE_CHARGE_AMT_M1='Local calls usage charge amount-April'
			LOCAL_USAGE_CHARGE_AMT_M2='Local calls usage charge amount-May'
			LOCAL_USAGE_CHARGE_AMT_M3='Local calls usage charge amount-June'
			LOCAL_USAGE_CHARGE_AMT_M4='Local calls usage charge amount-July'
			LOCAL_USAGE_CHARGE_AMT_M5='Local calls usage charge amount-August '
			LOCAL_USAGE_CHARGE_AMT_M6='Local calls usage charge amount-September'
			NAT_CALL_CNT_M1='count of National calls calls-April'
			NAT_CALL_CNT_M2='count of National calls calls-May'
			NAT_CALL_CNT_M3='count of National calls calls-June'
			NAT_CALL_CNT_M4='count of National calls calls-July'
			NAT_CALL_CNT_M5='count of National calls calls-August '
			NAT_CALL_CNT_M6='count of National calls calls-September'
			NAT_CALL_SEC_M1='National calls calls duration in seconds-April'
			NAT_CALL_SEC_M2='National calls calls duration in seconds-May'
			NAT_CALL_SEC_M3='National calls calls duration in seconds-June'
			NAT_CALL_SEC_M4='National calls calls duration in seconds-July'
			NAT_CALL_SEC_M5='National calls calls duration in seconds-August '
			NAT_CALL_SEC_M6='National calls calls duration in seconds-September'
			NAT_CALL_avg_dur_M1='Average National calls calls duration-April'
			NAT_CALL_avg_dur_M2='Average National calls calls duration-May'
			NAT_CALL_avg_dur_M3='Average National calls calls duration-June'
			NAT_CALL_avg_dur_M4='Average National calls calls duration-July'
			NAT_CALL_avg_dur_M5='Average National calls calls duration-August '
			NAT_CALL_avg_dur_M6='Average National calls calls duration-September'
			NAT_USAGE_CHARGE_AMT_M1='National calls usage charge amount-April'
			NAT_USAGE_CHARGE_AMT_M2='National calls usage charge amount-May'
			NAT_USAGE_CHARGE_AMT_M3='National calls usage charge amount-June'
			NAT_USAGE_CHARGE_AMT_M4='National calls usage charge amount-July'
			NAT_USAGE_CHARGE_AMT_M5='National calls usage charge amount-August '
			NAT_USAGE_CHARGE_AMT_M6='National calls usage charge amount-September'
			ONE_TIME_CHARGE_AMT_M1='One time charge-April'
			ONE_TIME_CHARGE_AMT_M2='One time charge-May'
			ONE_TIME_CHARGE_AMT_M3='One time charge-June'
			ONE_TIME_CHARGE_AMT_M4='One time charge-July'
			ONE_TIME_CHARGE_AMT_M5='One time charge-August '
			ONE_TIME_CHARGE_AMT_M6='One time charge-September'
			OTHER_CALL_CNT_M1='count of cell calls-April'
			OTHER_CALL_CNT_M2='count of cell calls-May'
			OTHER_CALL_CNT_M3='count of cell calls-June'
			OTHER_CALL_CNT_M4='count of cell calls-July'
			OTHER_CALL_CNT_M5='count of cell calls-August '
			OTHER_CALL_CNT_M6='count of cell calls-September'
			OTHER_CALL_SEC_M1='Cell calls duration in seconds-April'
			OTHER_CALL_SEC_M2='Cell calls duration in seconds-May'
			OTHER_CALL_SEC_M3='Cell calls duration in seconds-June'
			OTHER_CALL_SEC_M4='Cell calls duration in seconds-July'
			OTHER_CALL_SEC_M5='Cell calls duration in seconds-August '
			OTHER_CALL_SEC_M6='Cell calls duration in seconds-September'
			OTHER_CAL_avg_dur_M1='Average cell calls duration-April'
			OTHER_CAL_avg_dur_M2='Average cell calls duration-May'
			OTHER_CAL_avg_dur_M3='Average cell calls duration-June'
			OTHER_CAL_avg_dur_M4='Average cell calls duration-July'
			OTHER_CAL_avg_dur_M5='Average cell calls duration-August '
			OTHER_CAL_avg_dur_M6='Average cell calls duration-September'
			OTHER_USAGE_CHARGE_AMT_M1='Cell usage charge amount-April'
			OTHER_USAGE_CHARGE_AMT_M2='Cell usage charge amount-May'
			OTHER_USAGE_CHARGE_AMT_M3='Cell usage charge amount-June'
			OTHER_USAGE_CHARGE_AMT_M4='Cell usage charge amount-July'
			OTHER_USAGE_CHARGE_AMT_M5='Cell usage charge amount-August '
			OTHER_USAGE_CHARGE_AMT_M6='Cell usage charge amount-September'
			OVR_CALL_AVG_DURATION_M1='Overall average calls duration-April'
			OVR_CALL_AVG_DURATION_M2='Overall average calls duration-May'
			OVR_CALL_AVG_DURATION_M3='Overall average calls duration-June'
			OVR_CALL_AVG_DURATION_M4='Overall average calls duration-July'
			OVR_CALL_AVG_DURATION_M5='Overall average calls duration-August '
			OVR_CALL_AVG_DURATION_M6='Overall average calls duration-September'
			RECURRING_CHARGE_AMT_M1='Recurring bill amount-April'
			RECURRING_CHARGE_AMT_M2='Recurring bill amount-May'
			RECURRING_CHARGE_AMT_M3='Recurring bill amount-June'
			RECURRING_CHARGE_AMT_M4='Recurring bill amount-July'
			RECURRING_CHARGE_AMT_M5='Recurring bill amount-August '
			RECURRING_CHARGE_AMT_M6='Recurring bill amount-September'
			SPEND_AMT_M1='Spend amount-April'
			SPEND_AMT_M2='Spend amount-May'
			SPEND_AMT_M3='Spend amount-June'
			SPEND_AMT_M4='Spend amount-July'
			SPEND_AMT_M5='Spend amount-August '
			SPEND_AMT_M6='Spend amount-September'
			TOT_CALL_CNT_M1='Total calls counts-April'
			TOT_CALL_CNT_M2='Total calls counts-May'
			TOT_CALL_CNT_M3='Total calls counts-June'
			TOT_CALL_CNT_M4='Total calls counts-July'
			TOT_CALL_CNT_M5='Total calls counts-August '
			TOT_CALL_CNT_M6='Total calls counts-September'
			TOT_CALL_SEC_M1='Total calls seconds-April'
			TOT_CALL_SEC_M2='Total calls seconds-May'
			TOT_CALL_SEC_M3='Total calls seconds-June'
			TOT_CALL_SEC_M4='Total calls seconds-July'
			TOT_CALL_SEC_M5='Total calls seconds-August '
			TOT_CALL_SEC_M6='Total calls seconds-September'
			TOT_CHARGE_AMT_M1='Total charge amount-April'
			TOT_CHARGE_AMT_M2='Total charge amount-May'
			TOT_CHARGE_AMT_M3='Total charge amount-June'
			TOT_CHARGE_AMT_M4='Total charge amount-July'
			TOT_CHARGE_AMT_M5='Total charge amount-August '
			TOT_CHARGE_AMT_M6='Total charge amount-September'
			USAGE_CHARGE_AMT_M1='Total usage charge amount-April'
			USAGE_CHARGE_AMT_M2='Total usage charge amount-May'
			USAGE_CHARGE_AMT_M3='Total usage charge amount-June'
			USAGE_CHARGE_AMT_M4='Total usage charge amount-July'
			USAGE_CHARGE_AMT_M5='Total usage charge amount-August '
			USAGE_CHARGE_AMT_M6='Total usage charge amount-September'
			TCL_DLM='Ratio of total calls seconds in last month to previous 5 months'
			TCL_DL2M='Ratio of total calls seconds in last 2 month to previous 4 months'
			TCL_DL3M='Ratio of total calls seconds in last 3 month to previous 3 months'
			TCH_DLM='Ratio of total charge amount in last month to previous 5 months'
			TCH_DL2M='Ratio of total charge amount in last 2 month to previous 4 months'
			TCH_DL3M='Ratio of total charge amount in last 3 month to previous 3 months'
			LCL_DLM='Ratio of Local calls seconds in last month to previous 5 months'
			LCL_DL2M='Ratio of Local calls seconds in last 2 month to previous 4 months'
			LCL_DL3M='Ratio of Local calls seconds in last 3 month to previous 3 months'
			NCL_DLM='Ratio of National calls seconds in last month to previous 5 months'
			NCL_DL2M='Ratio of National calls seconds in last 2 month to previous 4 months'
			NCL_DL3M='Ratio of National calls seconds in last 3 month to previous 3 months'
			CELL_CALL_SEC_Avg6='Cell calls duration in seconds (Last 6 months Average)'
			CELL_CALL_avg_dur_Avg6='Average cell calls duration (Last 6 months Average)'
			CELL_USAGE_CHARGE_AMT_Avg6='Cell usage charge amount (Last 6 months Average)'
			DATA_CALL_CNT_Avg6='Count of Data calls (Last 6 months Average)'
			DATA_CALL_SEC_Avg6='Data calls duration in seconds (Last 6 months Average)'
			DATA_CALL_avg_dur_Avg6='Average data calls duration (Last 6 months Average)'
			DATA_USAGE_CHARGE_AMT_Avg6='Data usage charge amount (Last 6 months Average)'
			INT_CALL_CNT_Avg6='Count of international calls (Last 6 months Average)'
			INT_CALL_SEC_Avg6='international calls duration in seconds (Last 6 months Average)'
			INT_CALL_avg_dur_Avg6='Average international calls duration (Last 6 months Average)'
			INT_USAGE_CHARGE_AMT_Avg6='international calls usage charge amount (Last 6 months Average)'
			LOCAL_CALL_CNT_Avg6='Count of Local calls (Last 6 months Average)'
			LOCAL_CALL_SEC_Avg6='Local calls duration in seconds (Last 6 months Average)'
			LOCAL_CAL_avg_dur_Avg6='Average local calls duration (Last 6 months Average)'
			LOCAL_USAGE_CHARGE_AMT_Avg6='Local calls usage charge amount (Last 6 months Average)'
			NAT_CALL_CNT_Avg6='Count of National calls (Last 6 months Average)'
			NAT_CALL_SEC_Avg6='National calls duration in seconds (Last 6 months Average)'
			NAT_CALL_avg_dur_Avg6='Average national calls duration (Last 6 months Average)'
			NAT_USAGE_CHARGE_AMT_Avg6='National calls usage charge amount (Last 6 months Average)'
			ONE_TIME_CHARGE_AMT_Avg6='One time charge amount (Last 6 months Average)'
			OTHER_CALL_CNT_Avg6='Count of other calls (Last 6 months Average)'
			OTHER_CALL_SEC_Avg6='Other calls duration in seconds (Last 6 months Average)'
			OTHER_CAL_avg_dur_Avg6='Average others calls duration (Last 6 months Average)'
			OTHER_USAGE_CHARGE_AMT_Avg6='Other usage charge amount (Last 6 months Average)'
			OVR_CALL_AVG_DURATION_Avg6='Overall average calls duration (Last 6 months Average)'
			RECURRING_CHARGE_AMT_Avg6='Recurring bill amount (Last 6 months Average)'
			SPEND_AMT_Avg6='Spend amount (Last 6 months Average)'
			TOT_CALL_CNT_Avg6='Total call count (Last 6 months Average)'
			TOT_CALL_SEC_Avg6='Total call seconds (Last 6 months Average)'
			TOT_CHARGE_AMT_Avg6='Total charge amount (Last 6 months Average)'
			USAGE_CHARGE_AMT_Avg6='Total usage charge amount (Last 6 months Average)'
			CELL_CALL_SEC_Avg3='Cell calls duration in seconds (Last 3 months Average)'
			CELL_CALL_avg_dur_Avg3='Average cell calls duration (Last 3 months Average)'
			CELL_USAGE_CHARGE_AMT_Avg3='Cell usage charge amount (Last 3 months Average)'
			DATA_CALL_CNT_Avg3='Count of Data calls (Last 3 months Average)'
			DATA_CALL_SEC_Avg3='Data calls duration in seconds (Last 3 months Average)'
			DATA_CALL_avg_dur_Avg3='Average data calls duration (Last 3 months Average)'
			DATA_USAGE_CHARGE_AMT_Avg3='Data usage charge amount (Last 3 months Average)'
			INT_CALL_CNT_Avg3='Count of international calls (Last 3 months Average)'
			INT_CALL_SEC_Avg3='international calls duration in seconds (Last 3 months Average)'
			INT_CALL_avg_dur_Avg3='Average international calls duration (Last 3 months Average)'
			INT_USAGE_CHARGE_AMT_Avg3='international calls usage charge amount (Last 3 months Average)'
			LOCAL_CALL_CNT_Avg3='Count of Local calls (Last 3 months Average)'
			LOCAL_CALL_SEC_Avg3='Local calls duration in seconds (Last 3 months Average)'
			LOCAL_CAL_avg_dur_Avg3='Average local calls duration (Last 3 months Average)'
			LOCAL_USAGE_CHARGE_AMT_Avg3='Local calls usage charge amount (Last 3 months Average)'
			NAT_CALL_CNT_Avg3='Count of National calls (Last 3 months Average)'
			NAT_CALL_SEC_Avg3='National calls duration in seconds (Last 3 months Average)'
			NAT_CALL_avg_dur_Avg3='Average national calls duration (Last 3 months Average)'
			NAT_USAGE_CHARGE_AMT_Avg3='National calls usage charge amount (Last 3 months Average)'
			ONE_TIME_CHARGE_AMT_Avg3='One time charge amount (Last 3 months Average)'
			OTHER_CALL_CNT_Avg3='Count of other calls (Last 3 months Average)'
			OTHER_CALL_SEC_Avg3='Other calls duration in seconds (Last 3 months Average)'
			OTHER_CAL_avg_dur_Avg3='Average others calls duration (Last 3 months Average)'
			OTHER_USAGE_CHARGE_AMT_Avg3='Other usage charge amount (Last 3 months Average)'
			OVR_CALL_AVG_DURATION_Avg3='Overall average calls duration (Last 3 months Average)'
			RECURRING_CHARGE_AMT_Avg3='Recurring bill amount (Last 3 months Average)'
			SPEND_AMT_Avg3='Spend amount (Last 3 months Average)'
			TOT_CALL_CNT_Avg3='Total call count (Last 3 months Average)'
			TOT_CALL_SEC_Avg3='Total call seconds (Last 3 months Average)'
			TOT_CHARGE_AMT_Avg3='Total charge amount (Last 3 months Average)'
			USAGE_CHARGE_AMT_Avg3='Total usage charge amount (Last 3 months Average)'
			CELL_CALL_CNT_DEC2_1='Total cell calls count-Change from 2 months to 1 month '
			CELL_CALL_CNT_DEC3_2='Total cell calls count-Change from 3 months to 2 month '
			CELL_CALL_CNT_DEC4_3='Total cell calls count-Change from 4 months to 3 month '
			CELL_CALL_CNT_DEC5_4='Total cell calls count-Change from 5 months to 4 month '
			CELL_CALL_CNT_DEC6_5='Total cell calls count-Change from 6 months to 5 month '
			CELL_CALL_SEC_DEC2_1='Total cell calls seconds-Change from 2 months to 1 month '
			CELL_CALL_SEC_DEC3_2='Total cell calls seconds-Change from 3 months to 2 month '
			CELL_CALL_SEC_DEC4_3='Total cell calls seconds-Change from 4 months to 3 month '
			CELL_CALL_SEC_DEC5_4='Total cell calls seconds-Change from 5 months to 4 month '
			CELL_CALL_SEC_DEC6_5='Total cell calls seconds-Change from 6 months to 5 month '
			CELL_CALL_avg_dur_DEC2_1='Average cell calls duration-Change from 2 months to 1 month '
			CELL_CALL_avg_dur_DEC3_2='Average cell calls duration-Change from 3 months to 2 month '
			CELL_CALL_avg_dur_DEC4_3='Average cell calls duration-Change from 4 months to 3 month '
			CELL_CALL_avg_dur_DEC5_4='Average cell calls duration-Change from 5 months to 4 month '
			CELL_CALL_avg_dur_DEC6_5='Average cell calls duration-Change from 6 months to 5 month '
			CELL_USAGE_CHARGE_AMT_DEC2_1='Cell usage charge amount-Change from 2 months to 1 month '
			CELL_USAGE_CHARGE_AMT_DEC3_2='Cell usage charge amount-Change from 3 months to 2 month '
			CELL_USAGE_CHARGE_AMT_DEC4_3='Cell usage charge amount-Change from 4 months to 3 month '
			CELL_USAGE_CHARGE_AMT_DEC5_4='Cell usage charge amount-Change from 5 months to 4 month '
			CELL_USAGE_CHARGE_AMT_DEC6_5='Cell usage charge amount-Change from 6 months to 5 month '
			INT_CALL_CNT_DEC2_1='Total international calls count-Change from 2 months to 1 month '
			INT_CALL_CNT_DEC3_2='Total international calls count-Change from 3 months to 2 month '
			INT_CALL_CNT_DEC4_3='Total international calls count-Change from 4 months to 3 month '
			INT_CALL_CNT_DEC5_4='Total international calls count-Change from 5 months to 4 month '
			INT_CALL_CNT_DEC6_5='Total international calls count-Change from 6 months to 5 month '
			INT_CALL_SEC_DEC2_1='Total international calls seconds-Change from 2 months to 1 month '
			INT_CALL_SEC_DEC3_2='Total international calls seconds-Change from 3 months to 2 month '
			INT_CALL_SEC_DEC4_3='Total international calls seconds-Change from 4 months to 3 month '
			INT_CALL_SEC_DEC5_4='Total international calls seconds-Change from 5 months to 4 month '
			INT_CALL_SEC_DEC6_5='Total international calls seconds-Change from 6 months to 5 month '
			INT_CALL_avg_dur_DEC2_1='Average international calls duration-Change from 2 months to 1 month '
			INT_CALL_avg_dur_DEC3_2='Average international calls duration-Change from 3 months to 2 month '
			INT_CALL_avg_dur_DEC4_3='Average international calls duration-Change from 4 months to 3 month '
			INT_CALL_avg_dur_DEC5_4='Average international calls duration-Change from 5 months to 4 month '
			INT_CALL_avg_dur_DEC6_5='Average international calls duration-Change from 6 months to 5 month '
			INT_USAGE_CHARGE_AMT_DEC2_1='international usage charge amount-Change from 2 months to 1 month '
			INT_USAGE_CHARGE_AMT_DEC3_2='international usage charge amount-Change from 3 months to 2 month '
			INT_USAGE_CHARGE_AMT_DEC4_3='international usage charge amount-Change from 4 months to 3 month '
			INT_USAGE_CHARGE_AMT_DEC5_4='international usage charge amount-Change from 5 months to 4 month '
			INT_USAGE_CHARGE_AMT_DEC6_5='international usage charge amount-Change from 6 months to 5 month '
			LOCAL_CALL_CNT_DEC2_1='Total Local calls count-Change from 2 months to 1 month '
			LOCAL_CALL_CNT_DEC3_2='Total Local calls count-Change from 3 months to 2 month '
			LOCAL_CALL_CNT_DEC4_3='Total Local calls count-Change from 4 months to 3 month '
			LOCAL_CALL_CNT_DEC5_4='Total Local calls count-Change from 5 months to 4 month '
			LOCAL_CALL_CNT_DEC6_5='Total Local calls count-Change from 6 months to 5 month '
			LOCAL_CALL_SEC_DEC2_1='Total Local calls seconds-Change from 2 months to 1 month '
			LOCAL_CALL_SEC_DEC3_2='Total Local calls seconds-Change from 3 months to 2 month '
			LOCAL_CALL_SEC_DEC4_3='Total Local calls seconds-Change from 4 months to 3 month '
			LOCAL_CALL_SEC_DEC5_4='Total Local calls seconds-Change from 5 months to 4 month '
			LOCAL_CALL_SEC_DEC6_5='Total Local calls seconds-Change from 6 months to 5 month '
			LOCAL_CAL_avg_dur_DEC2_1='Average Local calls duration-Change from 2 months to 1 month '
			LOCAL_CAL_avg_dur_DEC3_2='Average Local calls duration-Change from 3 months to 2 month '
			LOCAL_CAL_avg_dur_DEC4_3='Average Local calls duration-Change from 4 months to 3 month '
			LOCAL_CAL_avg_dur_DEC5_4='Average Local calls duration-Change from 5 months to 4 month '
			LOCAL_CAL_avg_dur_DEC6_5='Average Local calls duration-Change from 6 months to 5 month '
			LOCAL_USAGE_CHARGE_AMT_DEC2_1='Local usage charge amount-Change from 2 months to 1 month '
			LOCAL_USAGE_CHARGE_AMT_DEC3_2='Local usage charge amount-Change from 3 months to 2 month '
			LOCAL_USAGE_CHARGE_AMT_DEC4_3='Local usage charge amount-Change from 4 months to 3 month '
			LOCAL_USAGE_CHARGE_AMT_DEC5_4='Local usage charge amount-Change from 5 months to 4 month '
			LOCAL_USAGE_CHARGE_AMT_DEC6_5='Local usage charge amount-Change from 6 months to 5 month '
			NAT_CALL_CNT_DEC2_1='Total National calls count-Change from 2 months to 1 month '
			NAT_CALL_CNT_DEC3_2='Total National calls count-Change from 3 months to 2 month '
			NAT_CALL_CNT_DEC4_3='Total National calls count-Change from 4 months to 3 month '
			NAT_CALL_CNT_DEC5_4='Total National calls count-Change from 5 months to 4 month '
			NAT_CALL_CNT_DEC6_5='Total National calls count-Change from 6 months to 5 month '
			NAT_CALL_SEC_DEC2_1='Total National calls seconds-Change from 2 months to 1 month '
			NAT_CALL_SEC_DEC3_2='Total National calls seconds-Change from 3 months to 2 month '
			NAT_CALL_SEC_DEC4_3='Total National calls seconds-Change from 4 months to 3 month '
			NAT_CALL_SEC_DEC5_4='Total National calls seconds-Change from 5 months to 4 month '
			NAT_CALL_SEC_DEC6_5='Total National calls seconds-Change from 6 months to 5 month '
			NAT_CALL_avg_dur_DEC2_1='Average National calls duration-Change from 2 months to 1 month '
			NAT_CALL_avg_dur_DEC3_2='Average National calls duration-Change from 3 months to 2 month '
			NAT_CALL_avg_dur_DEC4_3='Average National calls duration-Change from 4 months to 3 month '
			NAT_CALL_avg_dur_DEC5_4='Average National calls duration-Change from 5 months to 4 month '
			NAT_CALL_avg_dur_DEC6_5='Average National calls duration-Change from 6 months to 5 month '
			NAT_USAGE_CHARGE_AMT_DEC2_1='National usage charge amount-Change from 2 months to 1 month '
			NAT_USAGE_CHARGE_AMT_DEC3_2='National usage charge amount-Change from 3 months to 2 month '
			NAT_USAGE_CHARGE_AMT_DEC4_3='National usage charge amount-Change from 4 months to 3 month '
			NAT_USAGE_CHARGE_AMT_DEC5_4='National usage charge amount-Change from 5 months to 4 month '
			NAT_USAGE_CHARGE_AMT_DEC6_5='National usage charge amount-Change from 6 months to 5 month '
			SPEND_AMT_DEC2_1='Total spend amount-Change from 2 months to 1 month '
			SPEND_AMT_DEC3_2='Total spend amount-Change from 3 months to 2 month '
			SPEND_AMT_DEC4_3='Total spend amount-Change from 4 months to 3 month '
			SPEND_AMT_DEC5_4='Total spend amount-Change from 5 months to 4 month '
			SPEND_AMT_DEC6_5='Total spend amount-Change from 6 months to 5 month '
			TOT_CALL_CNT_DEC2_1='Total calls count-Change from 2 months to 1 month '
			TOT_CALL_CNT_DEC3_2='Total calls count-Change from 3 months to 2 month '
			TOT_CALL_CNT_DEC4_3='Total calls count-Change from 4 months to 3 month '
			TOT_CALL_CNT_DEC5_4='Total calls count-Change from 5 months to 4 month '
			TOT_CALL_CNT_DEC6_5='Total calls count-Change from 6 months to 5 month '
			TOT_CALL_SEC_DEC2_1='Total calls seconds-Change from 2 months to 1 month '
			TOT_CALL_SEC_DEC3_2='Total calls seconds-Change from 3 months to 2 month '
			TOT_CALL_SEC_DEC4_3='Total calls seconds-Change from 4 months to 3 month '
			TOT_CALL_SEC_DEC5_4='Total calls seconds-Change from 5 months to 4 month '
			TOT_CALL_SEC_DEC6_5='Total calls seconds-Change from 6 months to 5 month '
			TOT_CHARGE_AMT_DEC2_1='Total charge amount-Change from 2 months to 1 month '
			TOT_CHARGE_AMT_DEC3_2='Total charge amount-Change from 3 months to 2 month '
			TOT_CHARGE_AMT_DEC4_3='Total charge amount-Change from 4 months to 3 month '
			TOT_CHARGE_AMT_DEC5_4='Total charge amount-Change from 5 months to 4 month '
			TOT_CHARGE_AMT_DEC6_5='Total charge amount-Change from 6 months to 5 month '
			USAGE_CHARGE_AMT_DEC2_1='Total usage charge amount-Change from 2 months to 1 month '
			USAGE_CHARGE_AMT_DEC3_2='Total usage charge amount-Change from 3 months to 2 month '
			USAGE_CHARGE_AMT_DEC4_3='Total usage charge amount-Change from 4 months to 3 month '
			USAGE_CHARGE_AMT_DEC5_4='Total usage charge amount-Change from 5 months to 4 month '
			USAGE_CHARGE_AMT_DEC6_5='Total usage charge amount-Change from 6 months to 5 month '
			Avg_DEC_6M_CELL_CALL_CNT='Total cell calls count (Average change in last 6 months)'
			Avg_DEC_6M_CELL_CALL_SEC='Total cell calls seconds (Average change in last 6 months)'
			Avg_DEC_6M_CELL_CALL_avg_dur='Average cell calls duration (Average change in last 6 months)'
			Avg_DEC_6M_CELL_USAGE_CHARGE_AMT='Cell usage charge amount (Average change in last 6 months)'
			Avg_DEC_6M_INT_CALL_CNT='Total international calls count (Average change in last 6 months)'
			Avg_DEC_6M_INT_CALL_SEC='Total international calls seconds (Average change in last 6 months)'
			Avg_DEC_6M_INT_CALL_avg_dur='Average international calls duration (Average change in last 6 months)'
			Avg_DEC_6M_INT_USAGE_CHARGE_AMT='international usage charge amount (Average change in last 6 months)'
			Avg_DEC_6M_LOCAL_CALL_CNT='Total Local calls count (Average change in last 6 months)'
			Avg_DEC_6M_LOCAL_CALL_SEC='Total Local calls seconds (Average change in last 6 months)'
			Avg_DEC_6M_LOCAL_CAL_avg_dur='Average Local calls duration (Average change in last 6 months)'
			Avg_DEC_6M_LOC_USAGE_CHRG_AMT='Local usage charge amount (Average change in last 6 months)'
			Avg_DEC_6M_NAT_CALL_CNT='Total National calls count (Average change in last 6 months)'
			Avg_DEC_6M_NAT_CALL_SEC='Total National calls seconds (Average change in last 6 months)'
			Avg_DEC_6M_NAT_CALL_avg_dur='Average National calls duration (Average change in last 6 months)'
			Avg_DEC_6M_NAT_USAGE_CHARGE_AMT='National usage charge amount (Average change in last 6 months)'
			Avg_DEC_6M_SPEND_AMT='Total spend amount (Average change in last 6 months)'
			Avg_DEC_6M_TOT_CALL_CNT='Total calls count (Average change in last 6 months)'
			Avg_DEC_6M_TOT_CALL_SEC='Total calls seconds (Average change in last 6 months)'
			Avg_DEC_6M_TOT_CHARGE_AMT='Total charge amount (Average change in last 6 months)'
			Avg_DEC_6M_USAGE_CHARGE_AMT='Total usage charge amount (Average change in last 6 months)'
			Avg_DEC_3M_CELL_CALL_CNT='Total cell calls count (Average change in last 3 months)'
			Avg_DEC_3M_CELL_CALL_SEC='Total cell calls seconds (Average change in last 3 months)'
			Avg_DEC_3M_CELL_CALL_avg_dur='Average cell calls duration (Average change in last 3 months)'
			Avg_DEC_3M_CELL_USAGE_CHARGE_AMT='Cell usage charge amount (Average change in last 3 months)'
			Avg_DEC_3M_INT_CALL_CNT='Total international calls count (Average change in last 3 months)'
			Avg_DEC_3M_INT_CALL_SEC='Total international calls seconds (Average change in last 3 months)'
			Avg_DEC_3M_INT_CALL_avg_dur='Average international calls duration (Average change in last 3 months)'
			Avg_DEC_3M_INT_USAGE_CHARGE_AMT='international usage charge amount (Average change in last 3 months)'
			Avg_DEC_3M_LOCAL_CALL_CNT='Total Local calls count (Average change in last 3 months)'
			Avg_DEC_3M_LOCAL_CALL_SEC='Total Local calls seconds (Average change in last 3 months)'
			Avg_DEC_3M_LOCAL_CAL_avg_dur='Average Local calls duration (Average change in last 3 months)'
			Avg_DEC_3M_LOC_USAGE_CHRG_AMT='Local usage charge amount (Average change in last 3 months)'
			Avg_DEC_3M_NAT_CALL_CNT='Total National calls count (Average change in last 3 months)'
			Avg_DEC_3M_NAT_CALL_SEC='Total National calls seconds (Average change in last 3 months)'
			Avg_DEC_3M_NAT_CALL_avg_dur='Average National calls duration (Average change in last 3 months)'
			Avg_DEC_3M_NAT_USAGE_CHARGE_AMT='National usage charge amount (Average change in last 3 months)'
			Avg_DEC_3M_SPEND_AMT='Total spend amount (Average change in last 3 months)'
			Avg_DEC_3M_TOT_CALL_CNT='Total calls count (Average change in last 3 months)'
			Avg_DEC_3M_TOT_CALL_SEC='Total calls seconds (Average change in last 3 months)'
			Avg_DEC_3M_TOT_CHARGE_AMT='Total charge amount (Average change in last 3 months)'
			Avg_DEC_3M_USAGE_CHARGE_AMT='Total usage charge amount (Average change in last 3 months)'
			;	
RUN;

*---------------------------------- Q2 --------------------------------;
*----------------------------
Importing CHURNERS details
-----------------------------;
PROC IMPORT datafile = ChuLab
			out = Churner_Data
			dbms = xls
			replace;
			getnames = yes;
			sheet= 'Churners';
			guessingrows=100;
RUN;

PROC SQL noprint;
	create table
		Chruner_Unique
	as	
		select distinct *
	from 
		Churner_Data;
QUIT;

PROC SQL;
	CREATE TABLE 
		SMB_Chruner
	as
	select 
		 x.*
		,(case when x.Product_ID = y.Product_ID then 'Chruner' else 'Non Churner' end) as Churners 
	from
		SMB_Data as x
	left join
		Chruner_Unique as y
	on	
		x.Product_ID = y.Product_ID;
QUIT;

*---------------------------------- Q3 --------------------------------;

PROC SQL;
	create table SMB_AvgMinMax as 
	select distinct
		 Product_ID
		,AON
		,avg(AON) as Avg_AON
		,min(AON) as Min_AON
		,max(AON) as Max_AON
	from	
		SMB_Chruner
	group by
		Product_ID, AON;
QUIT;

*---------------------------------- Q4 --------------------------------;

PROC SQL;
	create table temp1 as 
	select distinct
		 Product_ID
		,max(AON) as Max_AON
	from	
		SMB_Chruner
	group by
		Product_ID;
QUIT;

PROC SQL;
	update SMB_Data x
	set AON = (select Max_AON from temp1 where x.Product_ID = Product_ID);	
QUIT;

*---------------------------------- Q5 --------------------------------;

DATA Q5_Temp (keep = Churners Local_Call_Count Usage_Charge Avg_Call_Duration);
	set SMB_Chruner;
	Local_Call_Count = sum(of LOCAL_CALL_SEC_M1-LOCAL_CALL_SEC_M6);
	Usage_Charge = sum(of USAGE_CHARGE_AMT_M1-USAGE_CHARGE_AMT_M6);
	Avg_Call_Duration = TOT_CALL_SEC_Avg6;
	
	where year in (2010,2011) and TOT_CALL_SEC_Avg6 <60;
RUN;

PROC SQL;
	create table 
		Q5
	as
	select
		 Churners
		 ,avg(Avg_Call_Duration) as Avg_Call_Duration
		 ,sum(Local_Call_Count) as LocalCall_Count
		 ,sum(Usage_Charge) as Total_Usage_Charge		 
	from
		Q5_Temp
	group by
	 	Churners;
QUIT;

*---------------------------------- Q6 --------------------------------;

PROC SQL;
	create table 
		SMB_SubSet
	as
	select   CELL_USAGE_CHARGE_AMT_M4
			,CELL_USAGE_CHARGE_AMT_M5
			,CELL_USAGE_CHARGE_AMT_M6
			,DATA_USAGE_CHARGE_AMT_M4
			,DATA_USAGE_CHARGE_AMT_M5
			,DATA_USAGE_CHARGE_AMT_M6
			,INT_USAGE_CHARGE_AMT_M4
			,INT_USAGE_CHARGE_AMT_M5
			,INT_USAGE_CHARGE_AMT_M6
			,LOCAL_USAGE_CHARGE_AMT_M4
			,LOCAL_USAGE_CHARGE_AMT_M5
			,LOCAL_USAGE_CHARGE_AMT_M6
			,NAT_USAGE_CHARGE_AMT_M4
			,NAT_USAGE_CHARGE_AMT_M5
			,NAT_USAGE_CHARGE_AMT_M6
			,OTHER_USAGE_CHARGE_AMT_M4
			,OTHER_USAGE_CHARGE_AMT_M5
			,OTHER_USAGE_CHARGE_AMT_M6
			,USAGE_CHARGE_AMT_M4
			,USAGE_CHARGE_AMT_M5
			,USAGE_CHARGE_AMT_M6
	from
		SMB_Data;
RUN;

*---------------------------------- Q7 --------------------------------;

PROC IMPORT datafile = '/folders/myfolders/assignment/Grocery_coupons.xls'
			dbms = xls
			out = GroceryTemp (where= (storeid is not missing))
			replace;
			sheet ='Data';
			getnames = yes;
RUN;

PROC SQL;
	select 
		 case 
			when amtspent < 100 then 'Spent Below 100'
			when amtspent between 100 and 200 then 'Spent between 100-200' 
			else 'Above 200' 
			end as Amount_Spent
		,count(*) as Customer_Count
	from
		GroceryTemp
	group by
	Amount_Spent;
QUIT;

*---------------------------------- Q8 --------------------------------;

libname sample '/folders/myfolders/Assignment/Assignment 6 files (SQL)';

DATA Q8;
	set sample.airlines;
RUN;

PROC SQL;
	create table 
		Q8_Desired
	as
	select 
		Loc as Location,
		Client_Name,
		sum(case when Airlines in('Air India','Jet Airways') then Amout else 0 end) as Group1,
		sum(case when Airlines not in ('Air India','Jet Airways') then Amout else 0 end) as Group2,
		sum(Amout) as Total,
		sum(case when Airlines in('Air India','Jet Airways') then Amout else 0 end)/sum(Amout) as Group1_Per format=percent7.2,
		sum(case when Airlines not in ('Air India','Jet Airways') then Amout else 0 end)/sum(Amout) as Group2_Per format=percent7.2
	from
		Q8
	group by
		Loc,Client_Name
	order by
		Loc, Total desc;
QUIT;

PROC RANK data = Q8_Desired out= Q8_Rank descending ties= dense;
	by Location;
	var Total;
	ranks Ranking;
RUN;

PROC SQL;
	select
		Ranking,
		Client_Name,
		Group1,
		Group2,
		Total,
		Group1_Per,
		Group2_Per
	from 
		Q8_Rank 
	where 
		Ranking <=15;
QUIT;










