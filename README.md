# GettingCleaningDataProject

This file describes the steps taken in the run_analysis.R script to tidy the data obtained from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The following steps were taken to tidy the data:

1. Read in the feature vector
2. Read in the test data
3. Read in the subject id numbers for the test data
4. Read in the activity labels for the test data
5. Make a dataframe called allTestData that has columns subject_id, activity, variable names by merging data from steps 2-4
6. Repeat steps 2-5 for the training data set, making a dataframe called allTrainData
7. Merge allTestData with allTrainData to make a complete dataset called allData (step 1 of the project)
8. Make a vector of column names that will be assigned to allData.  Use the make.names function with unique = TRUE.  This will make sure all column names are unique and descriptive (needed when selecting mean and std columns) (step 4 of project)
9. Assign the vector from step 8 to the column names of allData
10. Subset allData into a dataframe called subData to include only the mean and std of the variables by using the select function with contains(".mean." and "std".  Note: ".mean." is used so only the mean values of the signals is selected, and not the mean og the signal window on the angle variable (see the features_info document provided with the dataset for more information).  (step 2 of project)
11. Rename the activity column with descriptive names using the mutate function.  (step 3 of project)
12. Create a pipeline that first melts subData into a long dataset with three columns: subject id, activity, all variables.  Then arrange the dataset by Subject id, and finally re-cast the long dataset into a wide data set where each variable is assigned to a column, and the observation is the mean by subject and id.  Call this dataframe aveData. (step 5 of project)
13. Finally, write taveData to a .txt file.
