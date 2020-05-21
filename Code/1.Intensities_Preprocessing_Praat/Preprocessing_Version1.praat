#Pre-processing the sound file

#Lay out of the script
form Data Preprocessing 
	#1_open sound file
	comment Open-Read from file...
	word sound_files_directory 
	sentence file_extension .wav
	
	#2_modify and scale average intensity
	comment Modify-scale intensity... 
	positive new_average_intensity 70
	
	#3_band pass filter the frequency
	comment Band pass filter the frequency
	positive from_frequency 400
	positive to_frequency 1600
	positive smoothing 50
	
	#4_Extract intensities
	comment To intensity 
	positive minimum_pitch 
	real time_step 0.0
	choice Subtract_mean
	option 'yse'
	option 'no'

	#5_save intensities into a text file
	comment Save as a short text file
	word save_file_directory 
endform

#Read all sound files in deirectory: sound_files_directory
Create Strings as file list... list 'sound_files_directory$'*'file_extension$'
number_of_files = Get number of strings

#Process all the sound files
for ifile to number_of_files

	#1_Open sound files
	soundname$ = Get string... ifile
	soundID=Read from file... 'sound_files_directory$''soundname$'

	#2_Modify and scale average intensity 
	Scale intensity... new_average_intensity

	#3_Band pass filter the sound frequency
	Filter (pass Hann band)... from_frequency to_frequency smoothing

	#4_Extract intensities
	To Intensity... minimum_pitch time_step Subtract_mean

	#5_Save intensities into a text file
	Write to short text file... 'save_file_directory$''soundname$'.txt
	select Strings list
endfor

select all
#Remove