## This script dowloads a set of data and does the following:
## 1. Merges training and test data
## 2. Extracts measurements on the mean and standard deviation
## 3. renames activities
## 4. Creates a new, tidy data set with the average of each variable for each activity and subject

## download the zipped data
fileURL = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileURL,destfile="zipdata.zip")

## unzip the file
unzip("zipdata.zip")

## read in the feature vector
features<-read.table("./UCI HAR Dataset/features.txt", header = FALSE, sep = "")

## read the test data into a variable called testdata
testData<-read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE, sep = "")


## read in the test subject test numbers
testSubjects<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE, sep = "")

## read in test activity labels
testActivityLabels<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE, sep = "")

## merge the subject numbers, activity labels, and test data into one dataframe
allTestData <- cbind(testSubjects,testActivityLabels,testData)

## read the training data into a variable called traindata
trainData<-read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE, sep = "")

## read in the training subject test numbers
trainSubjects<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")

## read in training activity labels
trainActivityLabels<-read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE, sep = "")

## merge the subject numbers, activity labels, and test data into one dataframe
allTrainData <- cbind(trainSubjects,trainActivityLabels,trainData)

## merge the test and training data into one dataframe
allData <- rbind(allTestData,allTrainData)

## make a vector of names for the columns of the dataframe using the features vector
dataNames <- make.names(cbind("Subject_id","activity",t(features[2])),unique=TRUE,allow_=TRUE)

## assign names to the dataframe
names(allData) <- dataNames

## select only the mean,std, subject id, and activity columns from allData
subData <- select(allData,matches("subject_id"), matches("activity"),contains(".mean."),contains("std"))

## rename the activity column with descriptive activity names
subData <- mutate(subData,activity=ifelse(activity==1,"walking",
                        (ifelse(activity==2,"walking_up_stairs",
                        (ifelse(activity == 3, "walking_down_stairs",
                        (ifelse(activity == 4, "sitting",
                        (ifelse(activity == 5, "standing",
                        (ifelse(activity == 6, "laying",       
                        ("error")))))))))))))

## create a pipeline that will melt the subData, arrange it with respect to subject id, then cast the 
## data into a new dataframe consisting of the mean for each variable for each subject and activity
aveData <- subData %>% melt(id = c("Subject_id","activity"),measure.vars = names(subData)[3:68]) %>% arrange(Subject_id)%>%
dcast(Subject_id + activity ~ variable, mean)

## create text file of aveData
write.table(aveData, file = "aveData.txt", row.names=FALSE)
