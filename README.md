# Getting-and-Cleaning-Data-Course-Project

## Decription
The course project for the Getting and Cleaning Data Coursera course.
The deliverables are the following files:
 *  __README.md__ 
 *  __run_analysis.R__
 *  __tidy_data.txt__ 
 *  __CodeBook.md__ 

## README.md
The readme file describing the course project

## run_analysis.R
The main functions provided by this script are the following:
 1. Download a given dataset that is to be cleaned
 2. Unzip the downloaded dataset
 3. Load the activity labels and feature names from the dataset
 4. Prepare to only process mean and standard deviation related data
 5. Load the training and testing data (features, subject, & activities)
    from the dataset
 6. Merge the training and testing data and assign it with appropriate column
    headers
 7. Melt all feature values in the merge dataset against subject & activity
 8. Summarize feature values in melted dataset with mean values
 9. Write resulting dataset to a local text file

## tidy_data.txt
The text file containing the result of the cleaning process

## CodeBook.md
The code book describing the data and format of the __tidy_data.txt__ file

