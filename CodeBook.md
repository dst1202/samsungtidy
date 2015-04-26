---
title: "Codebook for Getting and Cleaning Data Course Project"
author: "dst1202"
date: "26/04/2015"
---
 
## Project Description
Getting and Cleaning Data course project. Goals include collecting, working with and cleaning a data set. Output should be tidy data that could be used in further analysis.

##Study design and data processing
Full description of the data to be processed is available here: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
Data can be retrieved from here: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

###Collection of the raw data
From the UCI Machine Learning Repository link above
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Notes on the original (raw) data 
Original data is in a zip file which unzips to the following directories:
* UCI HAR Dataset/
* UCI HAR Dataset/train
* UCI HAR Dataset/test

For this project the files needing to be merged and tidied are as follows:
* UCI HAR Dataset/activity_labels.txt for the activity names
* UCI HAR Dataset/features.txt for the variable names
* UCI HAR Dataset/train/X_train.txt for the training data
* UCI HAR Dataset/train/y_train.txt for the activity identifiers for the training data
* UCI HAR Dataset/train/subject_train.txt for the subject identifiers for the training data
* UCI HAR Dataset/test/X_test.txt for the test data
* UCI HAR Dataset/test/y_test.txt for the activity identifiers for the test data
* UCI HAR Dataset/test/subject_test.txt for the subject identifer for the test data



 
##Creating the tidy datafile
 
###Guide to create the tidy data file
1. Download the data from the link above to the working directory
2. Load the files listed above in to R
3. Merge the test and training data with the activity and subject information
4. Replace activity identifers  with descriptive activity names 
5. Appropriately label the data set with descriptive variable names
6. Create a second, independent, tidy data set with the average of each variable for each activity and each subject.
 
###Cleaning of the data
Cleaning script runs as follows 

1. Checks for the presence of the zip file
2. Inputs the files listed above
3. Merges test & training data with the variable names, identifiers of the activity and participants
4. Merge the test and training data
5. Extract the std and mean information from the merged data set
7. Replace activity identifiers with activity names
8. Rename subject and activity columns
9. Group data by activity and subject
10. Summarise data by getting averages for each variable
11. Use write.table(row.names=FALSE) to output the tidy data set.

More details can be found in [https://www.github.com/dst1202/samsungtidy/README.md](README.md)
 
##Description of the variables in the tidyData.txt file

 - tidyData has 180 rows of 68 variables
 - Grouped by activity and subject and then average of each mean and std variable in the original data set

###activity
Description of each of the 6 activities:  
 - Factor
 - Levels: LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
 - No units
 
###subject
Description of each of the 6 activities:  
 - integer
 - Test subject identifier from 1:30
 - No units
 - In case names follow some schema, describe how entries were constructed (for example time-body-gyroscope-z has 4 levels of descriptors. Describe these 4 levels). 
 
###Variables 3:68
Names as follows: tBodyAcc.mean...X
tBodyAcc.mean...Y
tBodyAcc.mean...Z
tBodyAcc.std...X
tBodyAcc.std...Y
tBodyAcc.std...Z
tGravityAcc.mean...X
tGravityAcc.mean...Y
tGravityAcc.mean...Z
tGravityAcc.std...X
tGravityAcc.std...Y
tGravityAcc.std...Z
tBodyAccJerk.mean...X
tBodyAccJerk.mean...Y
tBodyAccJerk.mean...Z
tBodyAccJerk.std...X
tBodyAccJerk.std...Y
tBodyAccJerk.std...Z
tBodyGyro.mean...X
tBodyGyro.mean...Y
tBodyGyro.mean...Z
tBodyGyro.std...X
tBodyGyro.std...Y
tBodyGyro.std...Z
tBodyGyroJerk.mean...X
tBodyGyroJerk.mean...Y
tBodyGyroJerk.mean...Z
tBodyGyroJerk.std...X
tBodyGyroJerk.std...Y
tBodyGyroJerk.std...Z
tBodyAccMag.mean..
tBodyAccMag.std..
tGravityAccMag.mean..
tGravityAccMag.std..
tBodyAccJerkMag.mean..
tBodyAccJerkMag.std..
tBodyGyroMag.mean..
tBodyGyroMag.std..
tBodyGyroJerkMag.mean..
tBodyGyroJerkMag.std..
fBodyAcc.mean...X
fBodyAcc.mean...Y
fBodyAcc.mean...Z
fBodyAcc.std...X
fBodyAcc.std...Y
fBodyAcc.std...Z
fBodyAccJerk.mean...X
fBodyAccJerk.mean...Y
fBodyAccJerk.mean...Z
fBodyAccJerk.std...X
fBodyAccJerk.std...Y
fBodyAccJerk.std...Z
fBodyGyro.mean...X
fBodyGyro.mean...Y
fBodyGyro.mean...Z
fBodyGyro.std...X
fBodyGyro.std...Y
fBodyGyro.std...Z
fBodyAccMag.mean..
fBodyAccMag.std..
fBodyBodyAccJerkMag.mean..
fBodyBodyAccJerkMag.std..
fBodyBodyGyroMag.mean..
fBodyBodyGyroMag.std..
fBodyBodyGyroJerkMag.mean..
fBodyBodyGyroJerkMag.std..

Each of these is a computed average of either a mean or standard deviation value for that subject in that activity.

 - t in a variable name denotes time
 - f denotes frequency
 - X, Y & Z denote axial directions
 - It's not clear from the information provided with the original data set what units these measurements are in.

##Sources
[Tidy data paper by Hadley Wickham](http://vita.had.co.nz/papers/tidy-data.pdf)

[Discussion thread in the Course Forum](https://class.coursera.org/getdata-013/forum/thread?thread_id=31)
