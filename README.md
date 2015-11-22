# Getting and Cleaning Data - Course Project

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

## Input Data Source
Here are the data for the project: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Course Project Tasks
1. You should create one R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Script Details
This github location contains the R script - run_analysis.R - for the course project of course Getting and Cleaning Data. The script does the following:

- The data sets from the training and test data sets are read and are merged to form one single data set. This has been accomplished using the rbind function in R. 

- Then the data for the subjects have been merged to associate each row of the data with the subject (person) it was for. The same has been done for the activity that the person was involved in for that row of data. These two actions have been accomplished using the cbind function of R.

- Only the mean and standard deviation related columns of this data set have been extracted to form a smaller data set with fewer columns of data. 

- The columns names for the data set has been read from the data files and then associated with each column of the data.

- That data set containing the activity IDs has then been merged with the descriptive activity names to form a more descriptive data set. 

- The column names have then been reformatted to not contain specific special characters such as '-', '(' and ')'

- The columns of the data set have been rearranged to have the subject and activity details as the first set of rows.

- The data has been grouped by subject and then by activity using the grouping functions of R. 

- This grouped data has then been summarized such that the average of data columns are obtained. 

- This then provides the mean of all data values for each subject for each activity they were involved in.

- This tidy data set is then converted to a data frame and then written to a text file

- This location also contains the uploaded tidy data set, in the tidyData.txt file.

This github location also contains the [CodeBook.md](./CodeBook.md) file that has details on the tidy data contained in the tidyData.txt file.