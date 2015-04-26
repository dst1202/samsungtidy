# samsungtidy
Getting and Cleaning Data Course Project

All code in [run_analysis.R](https://github.com/dst1202/samsungtidy/blob/master/run_analysis.R) file

1. Check for presence of `getdata_projectfiles_UCI HAR Dataset.zip`, exit with "Samsung data is not in working directory" message if the file is not found
2. Use unz to open a connection to each file as detailed in [Codebook.md](https://github.com/dst1202/samsungtidy/blob/master/CodeBook.md) within the zip archive in turn. Use read.table to read each file. No need to close the connection as `showConnections`shows no open connection left.
3. Attach the column names from features.txt to the test and training data
4. Merge the activity and subject columns with the test and training data
5. Merge the test and training data
6. Create a filter vector of the columns with `mean()` and `std()` in the variable name. 
7. Filter the merged data in to a new tidy data data frame 
8. Remove columns with `meanFreq`as the mean frequency value is not considered to be a mean measurement for the purposes of this project
9. Load dplyr library
10. Use mutate to change the activity column from identifiers (1:6) in to the descriptive activity labels given in the activity.txt file
11. Change the column names for activity and subject to "subject" and "activity" keeping the original variable names for the measurements which were added at step 3. 
12. Group the data by activity and subject using group_by
13. Use summarise_each to get the average of all non-grouping variables
14. Create tidyData.txt using write.table(row.names = FALSE)

## citations
[Tidy data discussion on course forum](https://class.coursera.org/getdata-013/forum/thread?thread_id=31)
