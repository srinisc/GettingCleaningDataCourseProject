# Data for this obtained from - https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the 
#    average of each variable for each activity and each subject.

analyzeData <- function() {
    library("dplyr")
    
    #Reading Activity Labels data files
    message("reading Activity Labels")
    activityLabels <-
        read.table(paste(
            getwd(), "/UCI HAR Dataset/", "activity_labels.txt", sep = ''
        ))
    #setting column names for Activity data
    colnames(activityLabels)[1] <- "activity_id"
    colnames(activityLabels)[2] <- "activity_name"
    
    #Reading xTrain data files
    message("reading xTrain")
    xTrain <-
        read.table(paste(
            getwd(), "/UCI HAR Dataset/train/", "X_train.txt", sep = ''
        ))
    
    #Reading xTest data files
    message("reading xTest")
    xTest <-
        read.table(paste(getwd(), "/UCI HAR Dataset/test/", "X_test.txt", sep =
                             ''))
    #Binding rows of xTrain and xTest data
    xCombined <- rbind(xTrain, xTest)
    
    #Reading Features data from files
    message("reading features")
    features <-
        read.table(paste(getwd(), "/UCI HAR Dataset/", "features.txt", sep =
                             ''))
    
    #Reading Subject training data from files
    message("reading subject_train")
    sTr <-
        read.table(paste(
            getwd(), "/UCI HAR Dataset/train/", "subject_train.txt", sep = ''
        ))
    
    #Reading Subject test data from files
    message("reading subject_test")
    sTe <-
        read.table(paste(
            getwd(), "/UCI HAR Dataset/test/", "subject_test.txt", sep = ''
        ))
    
    #Row binding Subject training & test data
    sTCombined <- rbind(sTr, sTe)
    
    #Reading Y train data from files
    message("reading y_train")
    yTrain <-
        read.table(paste(
            getwd(), "/UCI HAR Dataset/train/", "y_train.txt", sep = ''
        ))
    
    #Reading Y test data from files
    message("reading y_test")
    yTest <-
        read.table(paste(getwd(), "/UCI HAR Dataset/test/", "y_test.txt", sep =
                             ''))
    #Row binding Y data
    yCombined <- rbind(yTrain, yTest)
    
    #Subsetting to columns that we are interested in (mean & standard deviation)
    setOfMeanStdCols <- c(
        1:6, 41:46, 81:86, 121:126,
        161:166, 201:202, 214:215,
        227:228, 240:241, 253:254,
        266:271, 345:350, 424:429,
        503:504, 516:517, 529:530,
        542:543
    )
    xCombined <- xCombined[,setOfMeanStdCols]
    
    #Naming columns of data set from the Features data
    meanStdFeatures <- as.character(features[setOfMeanStdCols, 2])
    colnames(xCombined) <- meanStdFeatures
    
    #Combining X and Y data
    xCombined <- cbind(sTCombined, yCombined, xCombined)
    colnames(xCombined)[1] <- "subject"
    colnames(xCombined)[2] <- "activity_id"
    
    #Merging Activity Label data based on activity ID
    xCombined = merge(xCombined, activityLabels, by.x = "activity_id", by.y =
                          "activity_id")
    
    #mergedData - rename columns to not have certain characters in their names
    names(xCombined) <-
        sapply(names(xCombined), function(x)
            gsub("-", "_", x))
    names(xCombined) <-
        sapply(names(xCombined), function(x)
            gsub("\\(", "", x))
    names(xCombined) <-
        sapply(names(xCombined), function(x)
            gsub(")", "", x))
    
    #Reordering columns to have the key values as the first set of columns
    dataFrame1 <-
        subset(xCombined, select = c(ncol(xCombined), 1:(ncol(xCombined) - 1)))
    
    #Group data by subject first, and then by activity
    groupedXData <-
        group_by(dataFrame1, subject, activity_id, activity_name)
    
    #Summarize the grouped data and obtain mean of all required values
    smz <- summarize(
        groupedXData,
        meanTBodyAcc_mean_X = mean(tBodyAcc_mean_X),
        meanTBodyAcc_mean_Y = mean(tBodyAcc_mean_Y),
        meanTtBodyAcc_mean_Z = mean(tBodyAcc_mean_Z),
        meanTBodyAcc_std_X = mean(tBodyAcc_std_X),
        meanTBodyAcc_std_Y = mean(tBodyAcc_std_Y),
        meanTBodyAcc_std_Z =  mean(tBodyAcc_std_Z),
        meanTGravityAcc_mean_X = mean(tGravityAcc_mean_X),
        meanTGravityAcc_mean_Y = mean(tGravityAcc_mean_Y),
        meanTGravityAcc_mean_Z = mean(tGravityAcc_mean_Z),
        meanTGravityAcc_std_X = mean(tGravityAcc_std_X),
        meanTGravityAcc_std_Y = mean(tGravityAcc_std_Y),
        meanTGravityAcc_std_Z = mean(tGravityAcc_std_Z),
        meanTBodyAccJerk_mean_X = mean(tBodyAccJerk_mean_X),
        meanTBodyAccJerk_mean_Y = mean(tBodyAccJerk_mean_Y),
        meanTBodyAccJerk_mean_Z = mean(tBodyAccJerk_mean_Z),
        meanTBodyAccJerk_std_X = mean(tBodyAccJerk_std_X),
        meanTBodyAccJerk_std_Y = mean(tBodyAccJerk_std_Y),
        meanTBodyAccJerk_std_Z = mean(tBodyAccJerk_std_Z),
        meanTBodyGyro_mean_X = mean(tBodyGyro_mean_X),
        meanTBodyGyro_mean_Y = mean(tBodyGyro_mean_Y),
        meanTBodyGyro_mean_Z = mean(tBodyGyro_mean_Z),
        meanTBodyGyro_std_X = mean(tBodyGyro_std_X),
        meanTBodyGyro_std_Y = mean(tBodyGyro_std_Y),
        meanTBodyGyro_std_Z = mean(tBodyGyro_std_Z),
        meanTBodyGyroJerk_mean_X = mean(tBodyGyroJerk_mean_X),
        meanTBodyGyroJerk_mean_Y = mean(tBodyGyroJerk_mean_Y),
        meanTBodyGyroJerk_mean_Z = mean(tBodyGyroJerk_mean_Z),
        meanTBodyGyroJerk_std_X = mean(tBodyGyroJerk_std_X),
        meanTBodyGyroJerk_std_Y = mean(tBodyGyroJerk_std_Y),
        meanTBodyGyroJerk_std_Z = mean(tBodyGyroJerk_std_Z),
        meanTBodyAccMag_mean = mean(tBodyAccMag_mean),
        meanTBodyAccMag_std = mean(tBodyAccMag_std),
        meanTGravityAccMag_mean = mean(tGravityAccMag_mean),
        meanTGravityAccMag_std = mean(tGravityAccMag_std),
        meanTBodyAccJerkMag_mean = mean(tBodyAccJerkMag_mean),
        meanTBodyAccJerkMag_std = mean(tBodyAccJerkMag_std),
        meanTBodyGyroMag_mean = mean(tBodyGyroMag_mean),
        meanTBodyGyroMag_std = mean(tBodyGyroMag_std),
        meanTBodyGyroJerkMag_mean = mean(tBodyGyroJerkMag_mean),
        meanTBodyGyroJerkMag_std = mean(tBodyGyroJerkMag_std),
        meanFBodyAcc_mean_X = mean(fBodyAcc_mean_X),
        meanFBodyAcc_mean_Y = mean(fBodyAcc_mean_Y),
        meanFBodyAcc_mean_Z = mean(fBodyAcc_mean_Z),
        meanFBodyAcc_std_X = mean(fBodyAcc_std_X),
        meanFBodyAcc_std_Y = mean(fBodyAcc_std_Y),
        meanFBodyAcc_std_Z = mean(fBodyAcc_std_Z),
        meanFBodyAccJerk_mean_X = mean(fBodyAccJerk_mean_X),
        meanFBodyAccJerk_mean_Y = mean(fBodyAccJerk_mean_Y),
        meanFBodyAccJerk_mean_Z = mean(fBodyAccJerk_mean_Z),
        meanFBodyAccJerk_std_X = mean(fBodyAccJerk_std_X),
        meanFBodyAccJerk_std_Y = mean(fBodyAccJerk_std_Y),
        meanFBodyAccJerk_std_Z = mean(fBodyAccJerk_std_Z),
        meanFBodyGyro_mean_X = mean(fBodyGyro_mean_X),
        meanFBodyGyro_mean_Y = mean(fBodyGyro_mean_Y),
        meanFBodyGyro_mean_Z = mean(fBodyGyro_mean_Z),
        meanFBodyGyro_std_X = mean(fBodyGyro_std_X),
        meanFBodyGyro_std_Y = mean(fBodyGyro_std_Y),
        meanFBodyGyro_std_Z = mean(fBodyGyro_std_Z),
        meanFBodyAccMag_mean = mean(fBodyAccMag_mean),
        meanFBodyAccMag_std = mean(fBodyAccMag_std),
        meanFBodyBodyAccJerkMag_mean = mean(fBodyBodyAccJerkMag_mean),
        meanFBodyBodyAccJerkMag_std = mean(fBodyBodyAccJerkMag_std),
        meanFBodyBodyGyroMag_mean = mean(fBodyBodyGyroMag_mean),
        meanFBodyBodyGyroMag_std = mean(fBodyBodyGyroMag_std),
        meanFBodyBodyGyroJerkMag_mean = mean(fBodyBodyGyroJerkMag_mean),
        meanFBodyBodyGyroJerkMag_std = mean(fBodyBodyGyroJerkMag_std)
    )
    
    #Convert summarized data to data frame
    dataFrame2 <- as.data.frame(smz)
    
    #Write data frame to a file for output
    write.table(dataFrame2, "tidyData.txt", row.name = FALSE)
}