library(reshape2)

## Define the local downloaded filename
dest_filename <- "dest_filename.zip"

## Download the given project dataset to a local dest file
if (!file.exists(dest_filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, dest_filename, method="curl")
}
 
## Unzip the local dest file into project dataset
unzip(dest_filename) 

## Load activity label from project dataset
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

## Load features names from project dataset
featureNames <- read.table("UCI HAR Dataset/features.txt")
featureNames[,2] <- as.character(featureNames[,2])

## Prepare to extract only mean and standard deviation related data
featuresMeanStd <- grep(".*mean.*|.*std.*", featureNames[,2])
featuresMeanStd.names <- featureNames[featuresMeanStd,2]

## Load the interested training datasets only 
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresMeanStd]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainData <- cbind(trainSubjects, trainActivities, trainData)

## Load the interested testing datasets only
testData<- read.table("UCI HAR Dataset/test/X_test.txt")[featuresMeanStd]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
testData <- cbind(testSubjects, testActivities, testData)

## merge training and testing datasets and add column headers
mergeData <- rbind(trainData, testData)
colnames(mergeData) <- c("subject", "activity", featuresMeanStd.names)

# Factor activities & subjects in the merged dataset
mergeData$activity <- factor(mergeData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
mergeData$subject <- as.factor(mergeData$subject)

# Melt all feature values in merge dataset against subject & activity
meltData <- melt(mergeData, id = c("subject", "activity"))

# Summarize feature (variables) values in melted dataset with mean values
tidyData <- dcast(meltData, subject + activity ~ variable, mean)

# Write tidy dataset to a local text file
write.table(tidyData, "tidy_data.txt", row.names = FALSE, quote = FALSE)
