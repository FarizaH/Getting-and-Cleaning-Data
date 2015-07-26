# Code Book

This code book summarizes the resulting data fields in TidyData.txt

## Identifiers
*	subject - The ID of the test subject
*	activity - The type of activity performed when the corresponding measurements were taken

## Measurements
*	tBodyAccMeanX
*	tBodyAccMeanY
*	tBodyAccMeanZ
*	tBodyAccStdX
*	tBodyAccStdY
*	tBodyAccStdZ
*	tGravityAccMeanX
*	tGravityAccMeanY
*	tGravityAccMeanZ
*	tGravityAccStdX
*	tGravityAccStdY
*	tGravityAccStdZ
*	tBodyAccJerkMeanX
*	tBodyAccJerkMeanY
*	tBodyAccJerkMeanZ
*	tBodyAccJerkStdX
*	tBodyAccJerkStdY
*	tBodyAccJerkStdZ
*	tBodyGyroMeanX
*	tBodyGyroMeanY
*	tBodyGyroMeanZ
*	tBodyGyroStdX
*	tBodyGyroStdY
*	tBodyGyroStdZ
*	tBodyGyroJerkMeanX
*	tBodyGyroJerkMeanY
*	tBodyGyroJerkMeanZ
*	tBodyGyroJerkStdX
*	tBodyGyroJerkStdY
*	tBodyGyroJerkStdZ
*	tBodyAccMagMean
*	tBodyAccMagStd
*	tGravityAccMagMean
*	tGravityAccMagStd
*	tBodyAccJerkMagMean
*	tBodyAccJerkMagStd
*	tBodyGyroMagMean
*	tBodyGyroMagStd
*	tBodyGyroJerkMagMean
*	tBodyGyroJerkMagStd
*	fBodyAccMeanX
*	fBodyAccMeanY
*	fBodyAccMeanZ
*	fBodyAccStdX
*	fBodyAccStdY
*	fBodyAccStdZ
*	fBodyAccMeanFreqX
*	fBodyAccMeanFreqY
*	fBodyAccMeanFreqZ
*	fBodyAccJerkMeanX
*	fBodyAccJerkMeanY
*	fBodyAccJerkMeanZ
*	fBodyAccJerkStdX
*	fBodyAccJerkStdY
*	fBodyAccJerkStdZ
*	fBodyAccJerkMeanFreqX
*	fBodyAccJerkMeanFreqY
*	fBodyAccJerkMeanFreqZ
*	fBodyGyroMeanX
*	fBodyGyroMeanY
*	fBodyGyroMeanZ
*	fBodyGyroStdX
*	fBodyGyroStdY
*	fBodyGyroStdZ
*	fBodyGyroMeanFreqX
*	fBodyGyroMeanFreqY
*	fBodyGyroMeanFreqZ
*	fBodyAccMagMean
*	fBodyAccMagStd
*	fBodyAccMagMeanFreq
*	fBodyBodyAccJerkMagMean
*	fBodyBodyAccJerkMagStd
*	fBodyBodyAccJerkMagMeanFreq
*	fBodyBodyGyroMagMean
*	fBodyBodyGyroMagStd
*	fBodyBodyGyroMagMeanFreq
*	fBodyBodyGyroJerkMagMean
*	fBodyBodyGyroJerkMagStd
*	fBodyBodyGyroJerkMagMeanFreq

## Activity Labels
*	WALKING (value 1): subject was walking during the test.
*	WALKING_UPSTAIRS (value 2): subject was walking up a staircase during the test.
*	WALKING_DOWNSTAIRS (value 3): subject was walking down a staircase during the test.
*	SITTING (value 4): subject was sitting during the test.
*	STANDING (value 5): subject was standing during the test.
*	LAYING (value 6): subject was laying down during the test.

##  This script description of run_analysis for Module 3 Project

 Initially i tried to use lines  -  to download the zip file. 
 But i could not unzip
 So i used a different way
 alternatively i downloaded the file outside of R and unzip it to datasetphone folder
 in the datasetphone folder exists UCI HAR Dataset
 there are two sets of data (train and test) plus four text file (README, features_info, features, and activity_labels)

 need to set wd to UCI HAR Dataset
 using setwd("./datasetphone/UCI HAR Dataset")

 Load activity labels and set as a row
 Load features
 Extract data on mean and standard deviation and replacing the names
 Load all three train  datasets and bind into train
 Combined all Xtrain, Ytrain, and Strain into train table
 using train <- cbind(Strain, Ytrain, Xtrain)

 Similarly load test dataset into test table
 Merge train and test datasets and add labels
 using allData <- rbind(train, test)

 turn activities and subjects labels into factors
 Write into tidy.txt file
 using write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)
 tidy.txt file is written to the working directory 
 for purpose of the project assignment, tidy.txt is to be pushed to github repo

##  END