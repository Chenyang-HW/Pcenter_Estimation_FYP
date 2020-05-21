***************************************************************************
*Code->2.PCenters_Extraction_MATLAB
***************************************************************************
@main function: "PCentersExtraction"
@brief: It aims to implement P-center eatimation metho to estimate the
	P-center in audio file.
----------------------------------
There are three versions to implement the estimation:
-Version_1: 
	stored in "Step3_PCentersEstimation_Version1"
	The method is to iterate the intensit contour to find the maixmum
		value and the minimum intensity value within the contour.
	Next step is to calculate median value between each maximum value 
		and the correponding minimum value.
	Then the correponding time of the median is the P-center. (This is 
		conclude by the P-center estimation method in the report)
-Version_2:
	stored in "Step3_PCentersEstimation_Version2"
	The method is used findpeaks() function in MATLAB to find the 
		maximum values and the minimum values within each
		onset stage in the intensity contour
	Next step is to calculate the median value between the two values, 
		which is the same as Version.
	Then there is a variable called“distance", which trace the difference
		between each intensity value of intensity sample point,
	The point has the minimum distance with median value which is holding
		the value of P-center.
-Version_3:
	sotored in "Step3_PCentersEstimation_Version3"
	Comparing with Version 1 and Version 2, it has less error marks on beat.
	This is beacause, it will "clean" the data before the P-center estimation. 
		The method to clean the data is to remove the word without beat 
			based on the timestamp of the word.
		(The timestamp is stored within "Pcenter_Estimation_FYP\Measurement\UnaccentSylllable")
		When runing the P-center estimation code based on Version 3, the path of timestamp
			should be input.
	The step to estimate the P-center is the same as Version 2.

