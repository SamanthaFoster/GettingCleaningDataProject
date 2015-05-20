This code book describes the variables, the data, and transformations used to clean up the data provided for the Getting and Cleaning Data course project. 

The raw data comes from the following url:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The procedure for transforming the data can be found in the README.md file.

Two tidy dataframes result from running the script run_analysis.R:

1. subData - a subset of the original data set that has merged together training and test data, and selected only the std and standard deviation for each signal. 

NOTE:  Only std and standard deviation of the signals were included in subData.  The additional vectors obtained by  averaging the signals in the signal window sample on the angle() variable were not included (ie. gravitystd, tBodyAccstd, tBodyAccJerkstd, tBodyGyrostd, tBodyGyroJerkstd).  As these values are not available for all signals, it was assumed from the project description that they should not be included as true "std" values.  

2. aveData - a dataset that averages each variable from the subData dataset for each activity and each subject.

Both subData and aveData have the same column names (variables) as follows:

Subject_id (col 1): 			
	the id number of each subject
	int ranging 1:30

activity   (col 2): 			
	the activity type for each measure
	chr "lying" "sitting" "standing" "walking" "walking_down_stairs" "walking_up_stairs"

tBodyAcc.std...X,Y,Z (col 3:5)  	
	std of time domain body accelerometer in the X,Y, and Z directions
	num -1:1

tGravityAcc.std...X,Y,Z (col 6:8)
	std of time domain gravity accelerometer in the X, Y, and Z directions
	num -1:1

tBodyAccJerk.std...X,Y,Z (col 9:11)
	std of time domain body accelerometer jerk in the X, Y, and Z directions
	num -1:1
   

tBodyGyro.std...X,Y,Z (col 12:14)
	std of time domain body gyroscope in the X, Y, and Z directions
	num -1:1

tBodyGyroJerk.std...X,Y,Z (col 15:17)
	std of time domain body gyroscope in the X,Y, and Z directions
	num -1:1

tBodyAccMag.std.. (col 18)
	std of time domain body accelerometer magnitude
	num -1:1

tGravityAccMag.std.. (col 19)
	std of time domain gravity accelerometer magnitude
	num -1:1

tBodyAccJerkMag.std..  (col 20)
	std of time domain acclerometer jerk magnitude
	num -1:1

tBodyGyroMag.std.. (col 21)
	std of time domain body gyroscope magnitude
	num -1:1
	        
tBodyGyroJerkMag.std.. (col 22)
	std of time domain body gyroscope jerk magnitude
	num -1:1

fBodyAcc.std...X,Y,Z (col 23:25)
	std of fourier transform body accelerometer in X,Y,Z direction
	num -1:1
         
fBodyAccJerk.std...X, Y, Z (col 26:28)
	std of fourier transform body accelerometer jerk in X, Y,Z direction
	num -1:1
  
fBodyGyro.std...X, Y, Z (col 29:31)
	std of fourier transform body gyroscope in X, Y, Z direction
	num -1:1
         
fBodyAccMag.std..   (col 32)
	std of fourier transform body accelerometer magnitude
	num -1:1
    
fBodyBodyAccJerkMag.std.. (col 33)
	std of fourier transform body accelerometer jerk magnitude
	num -1:1
	  
fBodyBodyGyroMag.std..   (col 34)
	std of fourier transform body gyroscope magnitude
	num -1:1

fBodyBodyGyroJerkMag.std..  (col 35)
	std of fourier transform body gyroscope jerk magnitude
	num -1:1

tBodyAcc.std...X,Y,Z (col 36:38)  	
	std of time domain body accelerometer in the X,Y, and Z directions
	num -1:1

tGravityAcc.std...X,Y,Z (col 39:41)
	std of time domain gravity accelerometer in the X, Y, and Z directions
	num -1:1

tBodyAccJerk.std...X,Y,Z (col 42:44)
	std of time domain body accelerometer jerk in the X, Y, and Z directions
	num -1:1
   

tBodyGyro.std...X,Y,Z (col 45:47)
	std of time domain body gyroscope in the X, Y, and Z directions
	num -1:1

tBodyGyroJerk.std...X,Y,Z (col 48:50)
	std of time domain body gyroscope in the X,Y, and Z directions
	num -1:1

tBodyAccMag.std.. (col 51)
	std of time domain body accelerometer magnitude
	num -1:1

tGravityAccMag.std.. (col 52)
	std of time domain gravity accelerometer magnitude
	num -1:1

tBodyAccJerkMag.std..  (col 53)
	std of time domain acclerometer jerk magnitude
	num -1:1

tBodyGyroMag.std.. (col 54)
	std of time domain body gyroscope magnitude
	num -1:1
	        
tBodyGyroJerkMag.std.. (col 55)
	std of time domain body gyroscope jerk magnitude
	num -1:1

fBodyAcc.std...X,Y,Z (col 56:58)
	std of fourier transform body accelerometer in X,Y,Z direction
	num -1:1
         
fBodyAccJerk.std...X, Y, Z (col 59:61)
	std of fourier transform body accelerometer jerk in X, Y,Z direction
	num -1:1
  
fBodyGyro.std...X, Y, Z (col 62:64)
	std of fourier transform body gyroscope in X, Y, Z direction
	num -1:1
         
fBodyAccMag.std..   (col 65)
	std of fourier transform body accelerometer magnitude
	num -1:1
    
fBodyBodyAccJerkMag.std.. (col 66)
	std of fourier transform body accelerometer jerk magnitude
	num -1:1
	  
fBodyBodyGyroMag.std..   (col 67)
	std of fourier transform body gyroscope magnitude
	num -1:1

fBodyBodyGyroJerkMag.std..  (col 68)
	std of fourier transform body gyroscope jerk magnitude
	num -1:1

