##########################################################################################################
##
## Coursera Getting and Cleaning Data Course Project
## 
## David W. Chang  06/04/2017
##
## runAnalysis.R 
##
## This script will perform the following processing on the data files downloaded from 
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
##
## 1. Download and unzip the given dataset
## 2. Merge the training and the test sets to create one data set.
## 3. Extract only the measurements on the mean and standard deviation for each measurement. 
## 4. Use descriptive activity names to name the activities in the data set
## 5. Appropriately label the data set with descriptive activity names. 
## 6. Creates a second, independent tidy data set with the average of each variable for 
##    each activity and each subject. 
##
##########################################################################################################

library(reshape2)

# 1. Download and unzip the given dataset
destFilename <- "destFilename.zip"
if (!file.exists(destFilename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, destFilename, method="curl")
}
unzip(destFilename)

# 2. Merge the training and the test sets to create one data set.

# Read in the data from files
features     = read.table('UCI HAR Dataset/features.txt',header=FALSE);
activityType = read.table('UCI HAR Dataset/activity_labels.txt',header=FALSE);
subjectTrain = read.table('UCI HAR Dataset/train/subject_train.txt',header=FALSE);
xTrain       = read.table('UCI HAR Dataset/train/x_train.txt',header=FALSE);
yTrain       = read.table('UCI HAR Dataset/train/y_train.txt',header=FALSE);

# Assigin column names to the data imported above
colnames(activityType)  = c('activityId','activityType');
colnames(subjectTrain)  = "subjectId";
colnames(xTrain)        = features[,2]; 
colnames(yTrain)        = "activityId";

# Create the training dataset by merging yTrain, subjectTrain, and xTrain
trainingData = cbind(yTrain, subjectTrain, xTrain);

# Read in the test data
subjectTest = read.table('UCI HAR Dataset/test/subject_test.txt',header=FALSE);
xTest       = read.table('UCI HAR Dataset/test/x_test.txt',header=FALSE);
yTest       = read.table('UCI HAR Dataset/test/y_test.txt',header=FALSE);

# Assign column names to the test data
colnames(subjectTest) = "subjectId";
colnames(xTest)       = features[,2]; 
colnames(yTest)       = "activityId";


# Create the final test dataset by merging the xTest, yTest and subjectTest data
testData = cbind(yTest,subjectTest,xTest);

# Combine training and test data to create a final data set
finalData = rbind(trainingData, testData);

# Create a vector for the column names from the finalData, which will be used
# to select the desired mean() & stddev() columns
colNames  = colnames(finalData); 

# 3. Extract only the measurements on the mean and standard deviation

# Create a desiredVector that contains TRUE values for the ID, 
# mean() & stddev() columns 
desiredVector = (grepl("activity..",colNames)| 
                 grepl("subject..",colNames) | 
                 grepl("-mean..",colNames)   | 
                 grepl("-std..",colNames));

# Subset finalData table based on the desiredVector to keep only desired columns
finalData = finalData[desiredVector==TRUE];

# 4. Use descriptive activity names to name the activities in the data set

# Merge the finalData set with the acitivityType table to include 
# descriptive activity names
finalData = merge(finalData, activityType, by='activityId', all.x=TRUE);

# 5. Appropriately label the data set with descriptive activity names. 

# Updating the colNames vector to include the new column names after merge
colNames  = colnames(finalData); 

for (i in 1:length(colNames)) 
{
  colNames[i] = gsub("\\()","",colNames[i])
  colNames[i] = gsub("-std$","StdDev",colNames[i])
  colNames[i] = gsub("-mean","Mean",colNames[i])
  colNames[i] = gsub("^(t)","time",colNames[i])
  colNames[i] = gsub("^(f)","freq",colNames[i])
  colNames[i] = gsub("([Gg]ravity)","Gravity",colNames[i])
  colNames[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colNames[i])
  colNames[i] = gsub("[Gg]yro","Gyro",colNames[i])
  colNames[i] = gsub("AccMag","AccMagnitude",colNames[i])
  colNames[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colNames[i])
  colNames[i] = gsub("JerkMag","JerkMagnitude",colNames[i])
  colNames[i] = gsub("GyroMag","GyroMagnitude",colNames[i])
};

# Reassigning the new descriptive column names to the finalData set
colnames(finalData) = colNames;

# 6. Create a second, independent tidy data set with the average of each 
#    variable for each activity and each subject. 

# Create a new table, without the activityType column
noActivityType  = finalData[,names(finalData) != 'activityType'];

# Summarizing the finalDataNoActivityType table to include just the 
# mean of each variable for each activity and each subject
tidyData = aggregate(noActivityType[,names(noActivityType) != c('activityId','subjectId')],
                     by=list(activityId = noActivityType$activityId,
                             subjectId = noActivityType$subjectId),
                     mean);

# Merging the tidyData with activityType to include descriptive acitvity names
tidyData = merge(tidyData, activityType, by='activityId', all.x=TRUE);

# Export the tidyData set 
write.table(tidyData, 'tidy_data.txt', row.names=TRUE, sep='\t');
