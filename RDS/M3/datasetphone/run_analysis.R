##  This script is for Module 3 Project

##  Initially i tried to use lines  -  to download the zip file. 
##  But i could not unzip
##  So i used a different way, but i kept the line as comment for future reference

# library(reshape2)
# filename <-"datasetphone.zip"
# if(!file.exists(filename)){
#   fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#   download.file(fileURL,filename)
# }  
# if(!file.exists("UCI HAR Dataset")){
#   unzip(filename)
# }

##  unzip function does not work.
##  alternatively i downloaded the file outside of R and unzip it to datasetphone folder
##  in the datasetphone folder exists UCI HAR Dataset
##  there are two sets of data (train and test) plus four text file (README, features_info, features, and activity_labels)

##  need to set wd to UCI HAR Dataset
setwd("./datasetphone/UCI HAR Dataset")

##  Load activity labels and set as a row
actLbl <-read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/activity_labels.txt")
actLbl[,2]<-as.character(actLbl[,2]) 

##  Load features
features<-read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/features.txt")
features[,2]<-as.character(features[,2])

##  Extract data on mean and standard deviation and replacing the names
WFeatures <- grep(".*mean.*|.*std.*", features[,2])
WFeatures.names <- features[WFeatures,2]
WFeatures.names = gsub('-mean', 'Mean', WFeatures.names)
WFeatures.names = gsub('-std', 'Std', WFeatures.names)
WFeatures.names <- gsub('[-()]', '', WFeatures.names)

##  Load all three train  datasets and bind into train
Xtrain <- read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/train/X_train.txt")[WFeatures]
 
##  Ytrain contains the activities
Ytrain <- read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/train/Y_train.txt")
Strain <- read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/train/subject_train.txt")

##  Combined all Xtrain, Ytrain, and Strain into train table
train <- cbind(Strain, Ytrain, Xtrain)

##  Similarly load test dataset into test table
Xtest <- read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/test/X_test.txt")[WFeatures]
Ytest <- read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/test/Y_test.txt")
Stest <- read.table("C:/Users/Admin/Documents/RDS/M3/datasetphone/UCI HAR Dataset/test/subject_test.txt")
test <- cbind(Stest, Ytest, Xtest)

##  Merge train and test datasets and add labels
allData <- rbind(train, test)
colnames(allData) <- c("subject", "activity", WFeatures.names)

##  turn activities and subjects labels into factors
allData$activity <- factor(allData$activity, levels = actLbl[,1], labels = actLbl[,2])
allData$subject <- as.factor(allData$subject)

allData.melted <- melt(allData, id = c("subject", "activity"))
allData.mean <- dcast(allData.melted, subject + activity ~ variable, mean)

##  Write into tidy.txt file
write.table(allData.mean, "tidy.txt", row.names = FALSE, quote = FALSE)

##  tidy.txt file is written to the working directory 
##  for purpose of the project assignment, tidy.txt is to be pushed to github repo

##  END