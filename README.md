# Getting-and-Cleaning-Data-Course-Project

## Decription
This is the course project for the Getting and Cleaning Data Coursera course.
The project is designed to deliver the following files:
Markup: *  Readme.md - Summary of the course project
        *  run_analysis.R - The R script that is used to clean up the given dataset
        *  tidy.txt - The end result of the cleaning process 
        *  CodeBook.md - Updated Code book to reflect the change of the original dataset 

## run_analysis.R
The main functions that are carried out by thet script are the following:
Markup: 1. Download given dataset if it does not already exist in the working directory
        2. Load the activity and feature info into R
        3. Loads both the training and test datasets, keeping only those columns which
           reflect a mean or standard deviation
        4. Loads the activity and subject data for each dataset, and merges those
           columns with the dataset
        5. Merges the two datasets
        6. Converts the `activity` and `subject` columns into factors
        7. Creates a tidy dataset that consists of the average (mean) value of each
           variable for each subject and activity pair.

## tidy.txt
The end result of the dataset clearning process

## CodeBook.md
Updated Code book to reflect the change of the original dataset 

