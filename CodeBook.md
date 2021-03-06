# Code Book for Getting and Cleaning Data Course Project

## Description
Information about the variables, data and transformations used in the course project

## Source Data
A full description of the data used in this project can be found at 
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

The source data for this project can be found in the following link:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Training and testing datasets to imported are the fillowing files:: 
- features.txt
- activity_labels.txt
- subject_train.txt
- x_train.txt
- y_train.txt
- subject_test.txt
- x_test.txt
- y_test.txt

## The header file
 * `ActivityID` - The identity of activity that the measurements were conducted
 * `SubjectID` - The identity of the testing subject
 * `Meaturements` - The measurements of testing results (e.g. mean of values)
 * `ActivityType` - The type of activity when the feature measurements were conducted

## Activity Types 
The types of activity during the test consist of the following:
* `WALKING` (value `1`): walking during the test
* `WALKING_UPSTAIRS` (value `2`): walking up a staircase during the test
* `WALKING_DOWNSTAIRS` (value `3`): walking down a staircase during the test
* `SITTING` (value `4`): sitting during the test
* `STANDING` (value `5`): standing during the test
* `LAYING` (value `6`): laying down during the test

## Measurement Types 
Some of the measurement type consisted ib The tidy dataset are the following:
* `timeBodyAccMean-X`
* `timeBodyAccMean-Y`
* `timeBodyAccMean-Z`
* `timeBodyAcc-std-X`
* `timeBodyAcc-std-Y`
* `timeBodyAcc-std-Z`
* `timeGravityAccMean-X`
* `timeGravityAccMean-Y`
* `timeGravityAccMean-Z`
* `timeGravityAcc-std-X`
* `timeGravityAcc-std-Y`
* `timeGravityAcc-std-Z`
* `timeBodyAccJerkMean-X`

The detail of the measurment types can be found in the __tide_data.txt__
