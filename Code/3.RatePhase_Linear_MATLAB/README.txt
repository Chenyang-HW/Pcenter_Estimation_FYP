***************************************************************************
*Code->3.RatePhase_Linear_MATLAB
***************************************************************************
-Speechrate_Phrasetiming：
@brief: it is used to calculate the value of speech rate and phrase timing
	based on the P-center measurenment result.
	In this file, the value of speech rate with the corresponding value
		of phrase timing will be checked.
		(if there is error point which lead a error result of linear
		regression, the point will be removed)
	The output of the file is the value of speech rate and corresponding 
		phrase timing after checking. It is stored in "Analysis".
@main function: "RatePhase_LinearStep1"
	"LinearCheck_Step2"
-Result Analysis:
@brief: in each sub-file, there are two plots, one is speaking under solo condition,
	the other is speaking under synchronous condition.
	The linear equation is captured by "cftool" which is a function in MATLAB 
		and based on the reault from "Speechrate_Phrasetiming" file.