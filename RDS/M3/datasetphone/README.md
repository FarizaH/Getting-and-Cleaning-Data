# Getting and Cleaning Data - Course Project 

## Introduction
This document describes the project and the files associated with its submission.

## Project Decsription
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
A file run_analysis.R contains the executable scripts.

###  Description
This  script performs the following steps on the UCI HAR Dataset downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
1.	Merges the training and the test sets to create one data set.
2.	Extracts only the measurements on the mean and standard deviation for each measurement. 
3.	Uses descriptive activity names to name the activities in the data set
4.	Appropriately labels the data set with descriptive variable names. 
5.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Activities 
Specific steps in run_analysis.R are as follows:
* Download the dataset if it does not already exist in the working directory.
* Load the activity and feature information.
* Loads both the training and test datasets, keeping only those columns that reflect a mean or standard deviation.
* Loads the activity and subject data for each dataset, and merges those columns with the dataset.
* Merges the two datasets.
* Converts the activity and subject columns into factors.
* Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The output is shown in the file TidyData.txt.

### Source Data
A full description of the data used in this project can be found at The UCI Machine Learning Repository at url : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Identifiers

subject - The ID of the test subject activity - The type of activity performed when the corresponding measurements were taken

WALKING (value number
1): subject was walking during the test WALKING_UPSTAIRS (value number 
2): subject was walking up a staircase during the test WALKING_DOWNSTAIRS (value number 
3): subject was walking down a staircase during the test SITTING (value number 
4): subject was sitting during the test STANDING (value number 
5): subject was standing during the test LAYING (value number 
6): subject was laying down during the test