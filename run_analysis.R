run_analysis <- function() { 
        ## check samsung data is in the folder
        if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")) {
                stop("Samsung data is not in working directory")
        }
        
        ## open connection to zip file and get the data
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/train/X_train.txt")
        trainingData <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/train/y_train.txt")
        trainingActivities <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/test/X_test.txt")
        testData <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/test/y_test.txt")
        testActivities <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/activity_labels.txt")
        activities <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/features.txt")
        features <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/train/subject_train.txt")
        trainSubject <- read.table(zipConnection)
        zipConnection <- unz("getdata_projectfiles_UCI HAR Dataset.zip",
                             "UCI HAR Dataset/test/subject_test.txt")
        testSubject <- read.table(zipConnection)
        
        ## Merges the training and the test sets to create one data set.
        ## add column names from the features file
        colnames(testData) <- features[,2]
        colnames(trainingData) <- features[,2]
        ## merge activity columns with the data
        testMerge <- cbind(testSubject, testActivities, testData)
        trainMerge <- cbind(trainSubject, trainingActivities, trainingData)
        ## merge training and test data sets
        mergedData <- rbind(testMerge, trainMerge)
        
        ## Extracts only the measurements on the mean and standard deviation
        ## for each measurement. 
        ## create filter vector for means and stds
        means <- grep("mean()", names(mergedData))
        std <- grep("std()", names(mergedData))
        meanstdfilter <- sort(c(1,2, means, std))
        ## extract columns based on filter vector
        tidyData <- mergedData[,meanstdfilter]
        ##remove Freq as mean frequency isn't a mean 
        tidyData <- tidyData[,-(grep("Freq", names(tidyData)))]
        
        ## Uses descriptive activity names to name the activities in the data set
        library(dplyr)
        tidyData <- mutate(tidyData, V1.1 = factor(tidyData[,2], labels = activities$V2))
        
        ## Appropriately labels the data set with descriptive variable names. 
        colnames(tidyData) <- c("subject", "activity", names(tidyData[3:68]))
        ## rest of the variable names done above before merge        

        ## Creates a second, independent tidy data set with the average of each
        ## variable for each activity and each subject.
        ## group data by activity and subject
        regrouped <- group_by(tidyData, activity, subject)
        ## get mean for all non-grouping variables
        outputData <- summarise_each(regrouped, funs(mean))
        ## output tidy data set
        write.table(outputData, file = "tidyData.txt", row.names = FALSE)
}
