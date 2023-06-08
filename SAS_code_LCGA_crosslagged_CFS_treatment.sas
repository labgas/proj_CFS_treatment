
/*---------------------------------------------------*/
/* LCGA (CIS-20 total score)and risk factor analysis */
/*---------------------------------------------------*/
proc traj data = work.CFS_cross out=OF OUTPLOT=OP OUTSTAT=OS OUTEST=OE ITDETAIL ALTSTART;
ID nr;
VAR S_CIS_total O1_CIS_total O2_CIS_total EO_CIS_total;
INDEP Baseline Treatment_1 Treatment_2 Treatment_3;
MODEL CNORM; 
MIN 20; MAX 140;
NGROUPS 4; 
ORDER 1 1 1 1; 
DROPOUT 0;
RUN; 
%TRAJPLOTNEW (OP,OS,'Time vs. CIS total score', 'CNorm Model', 'CIS total score', 'Time');
%TRAJTEST('interc01=interc02')
%TRAJTEST('linear01=linear02')
%TRAJTEST('interc01=interc03')
%TRAJTEST('linear01=linear03')
%TRAJTEST('interc01=interc04')
%TRAJTEST('linear01=linear04')
%TRAJTEST('interc02=interc03')
%TRAJTEST('linear02=linear03')
%TRAJTEST('interc02=interc04')
%TRAJTEST('linear02=linear04')
%TRAJTEST('interc03=interc04')
%TRAJTEST('linear03=linear04')
quit;

data work.CFS_cross;
set work.CFS_cross; 
LT_div_ten = LT/10;
run; 

/*Risk factor depression*/
proc traj data = work.CFS_cross out=OF OUTPLOT=OP OUTSTAT=OS OUTEST=OE ITDETAIL ALTSTART;
ID nr;
VAR S_CIS_total O1_CIS_total O2_CIS_total EO_CIS_total;
INDEP Baseline Treatment_1 Treatment_2 Treatment_3;
MODEL CNORM; 
MIN 20; MAX 140;
RISK S_PHQ9_TOT LT_div_ten;
REFGROUP 4;
NGROUPS 4; 
ORDER 1 1 1 1; 
DROPOUT 0;
START    100.794474    -6.245474   107.684807   -20.857121   112.387415    -3.163713
  123.980801     1.014479    -2.007612    12.752465    -0.909293     0.663361
    0.007623     0.000000     0.000000     0.000000     0.000000     0.000000	0.00000;
RUN; 
%TRAJPLOTNEW (OP,OS,'Time vs. CIS total score', 'CNorm Model', 'CIS total score', 'Time');
quit;

/*Risk factor somatic symptoms*/
proc traj data = work.CFS_cross out=OF OUTPLOT=OP OUTSTAT=OS OUTEST=OE ITDETAIL ALTSTART;
ID nr;
VAR S_CIS_total O1_CIS_total O2_CIS_total EO_CIS_total;
INDEP Baseline Treatment_1 Treatment_2 Treatment_3;
MODEL CNORM; 
MIN 20; MAX 140;
RISK S_PHQ15_TOT LT_div_ten;
REFGROUP 4;
NGROUPS 4; 
ORDER 1 1 1 1; 
DROPOUT 0;
START  100.794448    -6.245473   107.684579   -20.856994   112.387356    -3.163675
  123.980650     1.014496    -2.007617    12.752470    -0.909294     0.663364
    0.007633     0.000000     0.000000     0.000000	0.00000	0.00000	0.00000;
RUN; 
%TRAJPLOTNEW (OP,OS,'Time vs. CIS total score', 'CNorm Model', 'CIS total score', 'Time');
quit;

/*Risk factor anxiety*/
proc traj data = work.CFS_cross out=OF OUTPLOT=OP OUTSTAT=OS OUTEST=OE ITDETAIL ALTSTART;
ID nr;
VAR S_CIS_total O1_CIS_total O2_CIS_total EO_CIS_total;
INDEP Baseline Treatment_1 Treatment_2 Treatment_3;
MODEL CNORM; 
MIN 20; MAX 140;
RISK S_GAD7_TOT LT_div_ten;
REFGROUP 4;
NGROUPS 4; 
ORDER 1 1 1 1; 
DROPOUT 0;
START  100.794448    -6.245473   107.684579   -20.856994   112.387356    -3.163675
  123.980650     1.014496    -2.007617    12.752470    -0.909294     0.663364
    0.007633     0.000000     0.000000     0.000000	0.000000     0.000000     0.000000;
RUN; 
%TRAJPLOTNEW (OP,OS,'Time vs. CIS total score', 'CNorm Model', 'CIS total score', 'Time');
quit;


/*Risk factor positive affect*/
proc traj data = work.CFS_cross out=OF OUTPLOT=OP OUTSTAT=OS OUTEST=OE ITDETAIL ALTSTART;
ID nr;
VAR S_CIS_total O1_CIS_total O2_CIS_total EO_CIS_total;
INDEP Baseline Treatment_1 Treatment_2 Treatment_3;
MODEL CNORM; 
MIN 20; MAX 140;
RISK S_PANAS_PA LT_div_ten;
REFGROUP 4;
NGROUPS 4; 
ORDER 1 1 1 1; 
DROPOUT 0;
START  100.794448    -6.245473   107.684579   -20.856994   112.387356    -3.163675
  123.980650     1.014496    -2.007617    12.752470    -0.909294     0.663364
    0.007633     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
RUN; 
%TRAJPLOTNEW (OP,OS,'Time vs. CIS total score', 'CNorm Model', 'CIS total score', 'Time');
quit;

/*Risk factor perceived stress*/
proc traj data = work.CFS_cross out=OF OUTPLOT=OP OUTSTAT=OS OUTEST=OE ITDETAIL ALTSTART;
ID nr;
VAR S_CIS_total O1_CIS_total O2_CIS_total EO_CIS_total;
INDEP Baseline Treatment_1 Treatment_2 Treatment_3;
MODEL CNORM; 
MIN 20; MAX 140;
RISK S_PSQ_index LT_div_ten;
REFGROUP 4;
NGROUPS 4; 
ORDER 1 1 1 1; 
DROPOUT 0;
START  100.794448    -6.245473   107.684579   -20.856994   112.387356    -3.163675
  123.980650     1.014496    -2.007617    12.752470    -0.909294     0.663364
    0.007633     0.000000     0.000000     0.000000     0.000000     0.000000     0.000000;
RUN; 
%TRAJPLOTNEW (OP,OS,'Time vs. CIS total score', 'CNorm Model', 'CIS total score', 'Time');
quit;

/*-------------------------------*/
/*     Cross-Lagged analysis     */
/*-------------------------------*/
/* Depressive symptoms*/
proc calis method =FIML data = work.CFS_cross modification; 
	path    /*define paths*/ 
		/*stabilities, unfixed over time*/
		S_PHQ9_TOT ---> O1_PHQ9_TOT = ST1, 
		O1_PHQ9_TOT ---> O2_PHQ9_TOT = ST2,
		O2_PHQ9_TOT ---> EO_PHQ9_TOT = ST3,
		S_CIS_total ---> O1_CIS_total = ST4,
		O1_CIS_total ---> O2_CIS_total = ST5,
		O2_CIS_total ---> EO_CIS_total = ST6,
		S_PHQ9_TOT ---> O2_PHQ9_TOT = ST7, /*path added based on modification indices*/
		S_PHQ9_TOT ---> EO_PHQ9_TOT = ST8, /*path added based on modification indices*/
		/*cross-lagged paths, path from measurement moment 2 -> 3 and from measurement moment 3 -> 4 equated*/
		S_PHQ9_TOT ---> O1_CIS_total = CL1,
		O1_PHQ9_TOT ---> O2_CIS_total = CL2,
		O2_PHQ9_TOT ---> EO_CIS_total = CL2,
		S_CIS_total ---> O1_PHQ9_TOT = CL3,
		O1_CIS_total ---> O2_PHQ9_TOT = CL4,
		O2_CIS_total ---> EO_PHQ9_TOT = CL4;
	pcov /*covariances*/
		S_CIS_total S_PHQ9_TOT = COV1,
		O1_CIS_total O1_PHQ9_TOT = COV2, 
		O2_CIS_total O2_PHQ9_TOT = COV3, 
		EO_CIS_total EO_PHQ9_TOT = COV4;
	fitindex on (only) = [chisq df probchi rmsea cn srmsr bentlercfi agfi] noindextype; 
run; 


/* Somatic symptom severity*/
proc calis method =FIML data = work.CFS_cross modification; 
	path    /*define paths*/ 
		/*stabilities, unfixed over time*/
		S_PHQ15_TOT ---> O1_PHQ15_TOT = ST1, 
		O1_PHQ15_TOT ---> O2_PHQ15_TOT = ST2,
		O2_PHQ15_TOT ---> EO_PHQ15_TOT = ST3,
		S_CIS_total ---> O1_CIS_total = ST4,
		O1_CIS_total ---> O2_CIS_total = ST5,
		O2_CIS_total ---> EO_CIS_total = ST6,
		S_PHQ15_TOT ---> O2_PHQ15_TOT = ST7,/*path added based on modification indices*/
		S_PHQ15_TOT ---> EO_PHQ15_TOT = ST8,/*path added based on modification indices*/
		/*cross-lagged paths, fixed over time*/
		S_PHQ15_TOT ---> O1_CIS_total = CL1,
		O1_PHQ15_TOT ---> O2_CIS_total = CL1,
		O2_PHQ15_TOT ---> EO_CIS_total = CL1,
		S_CIS_total ---> O1_PHQ15_TOT = CL2,
		O1_CIS_total ---> O2_PHQ15_TOT = CL2,
		O2_CIS_total ---> EO_PHQ15_TOT = CL2;
	pcov /*covariances*/
		S_CIS_total S_PHQ15_TOT = COV1,
		O1_CIS_total O1_PHQ15_TOT = COV2, 
		O2_CIS_total O2_PHQ15_TOT = COV3, 
		EO_CIS_total EO_PHQ15_TOT = COV4;
	fitindex on (only) = [chisq df probchi rmsea cn srmsr bentlercfi agfi] noindextype; 
run; 

/*Anxiety symptoms*/
proc calis method =FIML data = work.CFS_cross modification; 
	path    /*define paths*/ 
		/*stabilities, unfixed over time*/
		S_GAD7_TOT ---> O1_GAD7_TOT = ST1, 
		O1_GAD7_TOT ---> O2_GAD7_TOT = ST2,
		O2_GAD7_TOT ---> EO_GAD7_TOT = ST3,
		S_CIS_total ---> O1_CIS_total = ST4,
		O1_CIS_total ---> O2_CIS_total = ST5,
		O2_CIS_total ---> EO_CIS_total = ST6,
		/*cross-lagged paths, fixed over time*/
		S_GAD7_TOT ---> O1_CIS_total = CL1,
		O1_GAD7_TOT ---> O2_CIS_total = CL1,
		O2_GAD7_TOT ---> EO_CIS_total = CL1,
		S_CIS_total ---> O1_GAD7_TOT = CL2,
		O1_CIS_total ---> O2_GAD7_TOT = CL2,
		O2_CIS_total ---> EO_GAD7_TOT = CL2;
	pcov /*covariances*/
		S_CIS_total S_GAD7_TOT = COV1,
		O1_CIS_total O1_GAD7_TOT = COV2, 
		O2_CIS_total O2_GAD7_TOT = COV3, 
		EO_CIS_total EO_GAD7_TOT = COV4;
	fitindex on (only) = [chisq df probchi rmsea cn srmsr bentlercfi agfi] noindextype; 
run; 


/*Positive affectivity*/
proc calis method =FIML data = work.CFS_cross modification; 
	path    /*define paths*/ 
		/*stabilities, unfixed over time*/
		S_PANAS_PA ---> O1_PANAS_PA = ST1, 
		O1_PANAS_PA ---> O2_PANAS_PA = ST2,
		O2_PANAS_PA ---> EO_PANAS_PA = ST3,
		S_CIS_total ---> O1_CIS_total = ST4,
		O1_CIS_total ---> O2_CIS_total = ST5,
		O2_CIS_total ---> EO_CIS_total = ST6,
		S_PANAS_PA ---> EO_PANAS_PA = ST7, /*path added based on modification indices*/
		/*cross-lagged paths, fixed over time*/
		S_PANAS_PA ---> O1_CIS_total = CL1,
		O1_PANAS_PA ---> O2_CIS_total = CL1,
		O2_PANAS_PA ---> EO_CIS_total = CL1,
		S_CIS_total ---> O1_PANAS_PA = CL2,
		O1_CIS_total ---> O2_PANAS_PA = CL2,
		O2_CIS_total ---> EO_PANAS_PA = CL2;
	pcov /*covariances*/
		S_CIS_total S_PANAS_PA = COV1,
		O1_CIS_total O1_PANAS_PA = COV2, 
		O2_CIS_total O2_PANAS_PA = COV3, 
		EO_CIS_total EO_PANAS_PA = COV4;
	fitindex on (only) = [chisq df probchi rmsea cn srmsr bentlercfi agfi] noindextype; 
run; 

/*Perceived stress*/
proc calis method =FIML data = work.CFS_cross modification; 
	path    /*define paths*/ 
		/*stabilities, unfixed over time*/
		S_PSQ_index ---> O1_PSQ_index = ST1, 
		O1_PSQ_index ---> O2_PSQ_index = ST2,
		O2_PSQ_index ---> EO_PSQ_index = ST3,
		S_CIS_total ---> O1_CIS_total = ST4,
		O1_CIS_total ---> O2_CIS_total = ST5,
		O2_CIS_total ---> EO_CIS_total = ST6,
		S_PSQ_index ---> EO_PSQ_index = ST7,/*path added based on modification indices*/
		/*Cross-Lagged paths, fixed over time*/
		S_PSQ_index ---> O1_CIS_total = CL1,
		O1_PSQ_index ---> O2_CIS_total = CL1,
		O2_PSQ_index ---> EO_CIS_total = CL1,
		S_CIS_total ---> O1_PSQ_index = CL2,
		O1_CIS_total ---> O2_PSQ_index = CL2,
		O2_CIS_total ---> EO_PSQ_index = CL2;
	pcov /*covariances*/
		S_CIS_total S_PSQ_index = COV1, 
		O1_CIS_total O1_PSQ_index = COV2, 
		O2_CIS_total O2_PSQ_index = COV3, 
		EO_CIS_total EO_PSQ_index = COV4;
	fitindex on (only) = [chisq df probchi rmsea cn srmsr bentlercfi agfi] noindextype; 
run; 

