***************************************************************************
*		 Final Year Project                                                     *
*                                    --------------                                                         *
*		P-center Estimation                                                  *
*                                                                                                                  *
*                              Student: Liu Chenyang                                              *
*                                   ------------------                                                   *
*                              Student ID: 16206550                                               *
*		   --------------------                                                *
*                            Supervisor: Fred Cummins                                          *
**************************************************************************
Note:
-------------------------------
There is "README" text file in each sub-file, which is used to explain the 
	program code.
The test result in two files which are "Measurement" and "Analysis"
	"Measurement" contains the data of the P-center estimation result;
	"Analysis" contains the data of speech rate and speech rhythum.
----------------------------------------------------------------------
Abstract:
-------------------------------
@brief: The achievement of the project is to implement P-center 
	measurenment method, and applying the method to study
	the relationship between speech rate and speech 
	rhythum in two conditions (solo & sychronous).
@parameter: There are four files, "Recodings", "measurement",
	"Code" and "Analysis".
@key part: the file "Code" is the main part of the program which
	includes three sub-files：
	"1.Intensities_Preprocessing_Praat" is used to process the
		audio file to extract intensity information.
	"2.PCenters_Extraction_MATLAB" is used to measure the 
		P-center in audio based on intensity information.
	"3.RatePhase_Linear_MATLAB“ is used to perform linear 
		regression and capture linear equation between 
		speech rate and speech rhythum.
@envoriment: The code in "1.Intensities_Preprocessing_Praat" runs in 
	Praat.
	The code in the other two file run in MATLAB
----------------------------------------------------------------------
Procedure to run the program:
---------------------------------
Preparetion: Open the file "Recordings" which is storing audio files, there are two
	type of audio file. One is solo, such as "sm1", "sm2". The other is synchronous
		such as "sm1_sm2" ( it means sm1 is the first channel, sm2 is the
		second channel).
	Before the P-center estamation double-channel audio needs to be split
		into single channels. These are operated within Praat.
	The process is: 
		choose the audio file ("sm1_sm2"); 
		click "Convert" in control bench -> click "Extract all channels"
	---------------------------------
	There will be two audio. They should be stored into "Recordings". ("sm121" &
		"sm122")
-Step_1: Extract intensity information (intensity contour) from audio
                *It has three taskes: scale the average intensity of audio
		band pass filter the audio
		smooth intensity contour 
	Open file:
	Code->1.Intensities_Preprocessing_Praat
	Click "Preprocessing_Version1":
	Click the script->Run->Run (or "ctrl+R")
	---------------------------------
	There will be a script called "Data processing"
	Fill  black "sound files directory" with the path of processed
		audio file.
		for example "D:\Pcenter_Estimation_FYP\Recordings\"
		(do not forget "\" at the end of file path)
	Fill black " minimum pitch" with a positive number which is
		used to smooth intensity contour.
		This parameter equals 25Hz in the project.
	Click 'yes'
	Fill black "save file directory" with the path of intensity information
		which is in "Measurement"->"Intensities"
		for emample"D:\Pcenter_Estimation_FYP\Measurement\Intensities\"
	Click "OK"
	---------------------------------
	The intensity contour will be saved to file "Intensities". The format 
		of each intensity is TextGrid text file and their name is the 
		same as correspnding file name of audio.
		For example, the output of "sm1.wav" is "sm1.txt"
-Step_2: Applying P-center measurement method to sound data
	*It has two taskes: estimate the P-centers in audio file by
			implemented method
		check and correct the estimate result from MATLAB
			by Praat
	Open file:
	Code->2.PCenters_Extraction_MATLAB
	Click "PCentersExtraction":
	Click Run
	---------------------------------
	There will be a sentence:
		Please enter the text file path of intensities sample"
	Input the path of intensity contour which want to be estimated
		for example, audio sm1 is processed, the input is
		'D:\Pcenter_Estimation_FYP\Measurement\Intensities\sm1.txt'
		(do not for get "'" at the start and end of the path)
	The P-center estimation result will be saved to file "Pcenters_Step4.txt". 
		("Pcenters_Step4.txt" is directively stored at file "2.PCenters_Extraction_MATLAB"
	---------------------------------
	Import "Pcenters_Step4.txt" and correponding estimated audio into Praat
		In the example, the audio file should be "sm1.wav"
	Next, choose the two files at the same time and click "View & Edit alone"
	Then to check the mrked beats in the file and update the error marked.
	---------------------------------
	After the estimation results is be checked,  store the new file with mark into
		"D:\Pcenter_Estimation_FYP\Measurement\Beats"
		In the example, the new Beats file should be "sm1.txt"
	There, the file "sm1.txt" in file "Beats" storing the P-center measurement
		result of audio.
-Step_3: Calculate the value of speech rate & speech rhythm and operate linear regression 
		between two variables.
		There, the phrase timing is used to discribe speech rhythm which is dependent
			vriable, speech rate is independent variable.
	*It has two taskes: extract the vaule of speech rate and phrase timing of each phrase
		linear regress the speech rate and phrse timing
	Open file:
	Code->3.RatePhase_Linear_MATLAB->Speechrate_Phrasetiming
	Click "RatePhase_LinearStep1":
	Click Run
	---------------------------------
	There will be a sentence:
		"Please enter the text file path of beats(Pcenters)"
	Input the path of beats which is to be calculated
		for example, beats in audio sm1 is processed, the input is
		'D:\Pcenter_Estimation_FYP\Measurement\Beats\sm1.txt'
		(do not for get "'" at the start and end of the path)
	The value of speech rate and phrase timing of each pharse is stored into file:
		"speechRate_pharse.txt". 
	---------------------------------
	Input "cftool" in control bench and choose x is speech rate, y is phrase timing
	Next, observe the fitting result. If there is error point affect the fitting result, 
		remove the point mannully and run script "LinearCheck_Step2".
		(running "LinearCheck_Step2" aims to update the data in file "speechRate_pharse.txt")
	Repeat to fit the line, until the slop and R-square of the line is satified the exceptation.
	Then store the result of speech rate and phrase timing into file "Analysis".
		the name of each sub-file is the same as their name of audio.
	---------------------------------
	Write down the linear equation capture from above linear regression process and collocet the
		result based on the speaker.
		(for example, the linear result of "sm1", "sm121", "sm131", and "sm141" will be collect 
		to sm1 file) 
 	Next plot the linear regression result with original data.
		(the linear regression result is mannually inputted into MATLAB)
	Open file:  
	Code->3.RatePhase_Linear_MATLAB->Result Analysis
		for example, want to plot the linear regression result related to sm1. (speaker in sm1 
			under solo condition and synchronous condition)
		Open the file:
		sm1->click script "sm1.m"	
	The result will be plotted.
	The project observed the relationship between speech rate and speech rhythum and the affect of conditons
		on speech rhythum by the result in this part.
----------------------------------------------------------------------
