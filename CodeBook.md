# Code Book for Course Project

Code book for data collected, processed and cleansed using the R programming language and its libraries

## Input Data Source

The data has been collected from a wearable computing experiment that has been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

##Output Data Description

### Transformation & Work

The output data has been processed and cleansed such that data is relatively denormalized and assimilated across the training and test domains. 
The signals, activity and subject data have been collated into one tidy data set.
The data has then been grouped for each subject and each activity the subjects participated in.
A mean of the data is being reported below for each all of their mean and standard deviation feature readings.

### Subject & Activity Identifiers/Descriptions
- Subject ID identifies the subject that is performing the experiment (the person wearing the device)
- Activity ID identifies the activity the subject is involved in for that reading. 
  The list of activities are listed below, and this descriptive activity name has also been added to the output data set. 
  The output data is available in the tidyData.txt file and has the descriptive activity names in addition to the activity ID.
  - WALKING
  - WALKING\_UPSTAIRS
  - WALKING\_DOWNSTAIRS
  - SITTING
  - STANDING
  - LAYING

### Mean & Standard Deviations of various signals collected & processed
  
- Overall mean body accelaration signal for that subject performing that activity - time domain signals
  - meanTBodyAcc\_mean\_X
  - meanTBodyAcc\_mean\_Y
  - meanTtBodyAcc\_mean\_Z
  
- Overall mean of standard deviation of body accelaration signal for that subject performing that activity - time domain signals
  - meanTBodyAcc\_std\_X
  - meanTBodyAcc\_std\_Y
  - meanTBodyAcc\_std\_Z

- Overall mean gravity accelaration signal for that subject performing that activity - time domain signals
  - meanTGravityAcc\_mean\_X
  - meanTGravityAcc\_mean\_Y
  - meanTGravityAcc\_mean\_Z

- Overall mean of standard deviation of gravity accelaration signal for that subject performing that activity - time domain signals
  - meanTGravityAcc\_std\_X
  - meanTGravityAcc\_std\_Y
  - meanTGravityAcc\_std\_Z
  
- Overall mean of the linear accelaration jerk signals for that subject performing that activity - time domain signals
  - meanTBodyAccJerk\_mean\_X
  - meanTBodyAccJerk\_mean\_Y
  - meanTBodyAccJerk\_mean\_Z
  
- Overall mean of the standard deviation of linear accelaration jerk signals for that subject performing that activity - time domain signals     
  - meanTBodyAccJerk\_std\_X
  - meanTBodyAccJerk\_std\_Y
  - meanTBodyAccJerk\_std\_Z

- Overall mean of the angular velocity signals for that subject performing that activity - time domain signals
  - meanTBodyGyro\_mean\_X
  - meanTBodyGyro\_mean\_Y
  - meanTBodyGyro\_mean\_Z

- Overall mean of the standard deviation of angular velocity signals for that subject performing that activity - time domain signals     
  - meanTBodyGyro\_std\_X
  - meanTBodyGyro\_std\_Y
  - meanTBodyGyro\_std\_Z

- Overall mean of the angular velocity jerk signals for that subject performing that activity - time domain signals
  - meanTBodyGyroJerk\_mean\_X
  - meanTBodyGyroJerk\_mean\_Y
  - meanTBodyGyroJerk\_mean\_Z

- Overall mean of the standard deviation of angular velocity jerk signals for that subject performing that activity - time domain signals         
  - meanTBodyGyroJerk\_std\_X
  - meanTBodyGyroJerk\_std\_Y
  - meanTBodyGyroJerk\_std\_Z
  
- Overall mean of magnitude of body accelaration signals for that subject performing that activity - time domain signals
  - meanTBodyAccMag\_mean
- Overall mean of standard deviation of magnitude of body accelaration signals for that subject performing that activity - time domain signals            
  - meanTBodyAccMag\_std
  
- Overall mean of magnitude of gravity accelaration signal for that subject performing that activity - time domain signals
  - meanTGravityAccMag\_mean
- Overall mean of standard deviation of magnitude of gravity accelaration signals for that subject performing that activity - time domain signals
  - meanTGravityAccMag\_std
  
- Overall mean of magnitude of body accelaration jerk signal for that subject performing that activity - time domain signals
  - meanTBodyAccJerkMag\_mean
- Overall mean of standard deviation of magnitude of body accelaration jerk signals for that subject performing that activity - time domain signals
  - meanTBodyAccJerkMag\_std
  
- Overall mean of magnitude of angular velocity for that subject performing that activity - time domain signals
  - meanTBodyGyroMag\_mean
- Overall mean of standard deviation of angular velocity signals for that subject performing that activity - time domain signals
  - meanTBodyGyroMag\_std
  
- Overall mean of magnitude of angular velocity jerk signal for that subject performing that activity - time domain signals
  - meanTBodyGyroJerkMag\_mean
- Overall mean of standard deviation of angular velocity jerk signals for that subject performing that activity - time domain signals
  - meanTBodyGyroJerkMag\_std
  
- Overall mean body accelaration signal for that subject performing that activity - frequency domain signals  
  - meanFBodyAcc\_mean\_X
  - meanFBodyAcc\_mean\_Y  
  - meanFBodyAcc\_mean\_Z
  
- Overall mean of standard deviation of body accelaration signal for that subject performing that activity - frequency domain signals  
  - meanFBodyAcc\_std\_X
  - meanFBodyAcc\_std\_Y
  - meanFBodyAcc\_std\_Z
  
- Overall mean of the linear accelaration jerk signals for that subject performing that activity - frequency domain signals  
  - meanFBodyAccJerk\_mean\_X
  - meanFBodyAccJerk\_mean\_Y
  - meanFBodyAccJerk\_mean\_Z
  
- Overall mean of the standard deviation of linear accelaration jerk signals for that subject performing that activity - frequency domain signals  
  - meanFBodyAccJerk\_std\_X
  - meanFBodyAccJerk\_std\_Y
  - meanFBodyAccJerk\_std\_Z

- Overall mean of the angular velocity signals for that subject performing that activity - frequency domain signals
  - meanFBodyGyro\_mean\_X
  - meanFBodyGyro\_mean\_Y
  - meanFBodyGyro\_mean\_Z

- Overall mean of the standard deviation of angular velocity signals for that subject performing that activity - frequency domain signals  
  - meanFBodyGyro\_std\_X
  - meanFBodyGyro\_std\_Y
  - meanFBodyGyro\_std\_Z

- Overall mean of magnitude of body accelaration signals for that subject performing that activity - frequency domain signals  
  - meanFBodyAccMag\_mean
- Overall mean of standard deviation of magnitude of gravity accelaration signals for that subject performing that activity - frequency domain signals  
  - meanFBodyAccMag\_std

- Overall mean of magnitude of body accelaration jerk signal for that subject performing that activity - frequency domain signals  
  - meanFBodyBodyAccJerkMag\_mean
- Overall mean of standard deviation of magnitude of body accelaration jerk signals for that subject performing that activity - frequency domain signals  
  - meanFBodyBodyAccJerkMag\_std

- Overall mean of magnitude of angular velocity for that subject performing that activity - frequency domain signals
  - meanFBodyBodyGyroMag\_mean
- Overall mean of standard deviation of angular velocity signals for that subject performing that activity - frequency domain signals  
  - meanFBodyBodyGyroMag\_std

- Overall mean of magnitude of angular velocity jerk signal for that subject performing that activity - frequency domain signals  
  - meanFBodyBodyGyroJerkMag\_mean
- Overall mean of standard deviation of angular velocity jerk signals for that subject performing that activity - frequency domain signals  
  - meanFBodyBodyGyroJerkMag\_std