Introduction
============
This codebook describes the data we obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. We have done some transformations to this data that we describe here as well.

Transformations on Raw data
===========================
* We combined test and train data set into one data set
* We renamed features by removing () and "-" from feature names

Description of Tidy Data Set
============================
* The first two columns are subject and activity representing the id of the subject and the activity the subject was performing during the measurement.
* The other columns represent mean values of all the features that were mean or standard deviation of each measurement. We assume that these would contain the word "mean" aor "std" (ignoring case). Following are the description of each of these columns.

  - tBodyAccmeanX, tBodyAccmeanY, tBodyAccmeanZ represent mean body component of senssor acceleration in X, Y and Z directions.
  - tBodyAccstdX, tBodyAccstdY, tBodyAccstdZ represent standard deviation of body component of senssor acceleration in X, Y and Z directions.
  - tGravityAccmeanX, tGravityAccmeanY, tGravityAccmeanZ represent mean gravity component of senssor acceleration in X, Y and Z directions.
  - tGravityAccstdX, tGravityAccstdY, tGravityAccstdZ represent standard deviation of gravity component of senssor acceleration in X, Y and Z directions.
  - tBodyAccJerkmeanX, tBodyAccJerkmeanY, tBodyAccJerkmeanZ represent mean jerk motion of body component of sensor acceleration in X, Y, Z directions.
  - tBodyAccJerkstdX, tBodyAccJerkstdY, tBodyAccJerkstdZ represent stand deviation of jerk motion of body component of sensor acceleration in X, Y, Z directions.  
  - tBodyGyromeanX, tBodyGyromeanY, tBodyGyromeanZ reperesent mean body component of gyro measurements in X, Y and Z directions.
  - tBodyGyrostdX    tBodyGyrostdY    tBodyGyrostdZ reperesent standard deviation of body component of gyro measurements in X, Y and Z directions.   
  - tBodyGyroJerkmeanX, tBodyGyroJerkmeanY, tBodyGyroJerkmeanZ represent mean jerk motion of body component of gyro measurement in X, Y and Z directions.
  - tBodyGyroJerkstdX, tBodyGyroJerkstdY, tBodyGyroJerkstdZ represent standard deviation of jerk motion of body component of gyro measurement in X, Y and Z directions.  
  - tBodyAccMagmean, tBodyAccMagstd represent body acceleration mean and standard deviations respectively   
  - tGravityAccMagmean   tGravityAccMagstd   
  - tBodyAccJerkMagmean, tBodyAccJerkMagstd represent mean and standard deviation for body jerk motion of accelerator.
  - tBodyGyroMagmean, tBodyGyroMagstd represent mean and standard deviation of body gyro measurements.
  - tBodyGyroJerkMagmean, tBodyGyroJerkMagstd represent mean and standard deviation of jerk motion of body gyro measurements.
  - fBodyAccmeanX, fBodyAccmeanY, fBodyAccmeanZ represent mean body acceleration measurements in X, Y and Z directions
  - fBodyAccstdX, fBodyAccstdY, fBodyAccstdZ represent standard deviation of body acceleration measurements in X, Y and Z directions
  - fBodyAccmeanFreqX, fBodyAccmeanFreqY, fBodyAccmeanFreqZ represent mean body acceleration frequency measurements in X, Y and Z directions
  - fBodyAccJerkmeanX, fBodyAccJerkmeanY, fBodyAccJerkmeanZ represent mean body acceleration jerk measurements in X, Y and Z directions
  - fBodyAccJerkstdX, fBodyAccJerkstdY, fBodyAccJerkstdZ represent standard deviation of body acceleration jerk measurements in X, Y and Z directions
  - fBodyAccJerkmeanFreqX, fBodyAccJerkmeanFreqY, fBodyAccJerkmeanFreqZ reperesent mean body acceleration jerk frequency measurements in X, Y and Z directions
  - fBodyGyromeanX, fBodyGyromeanY, fBodyGyromeanZ represent mean body gyro measurements in X, Y and Z directions
  - fBodyGyrostdX, fBodyGyrostdY, fBodyGyrostdZ represent standard deviation bidy gyro measurements in X, Y and Z directions
  - fBodyGyromeanFreqX, fBodyGyromeanFreqY, fBodyGyromeanFreqZ represent mean body gyro frequency measurements in X, Y and Z directions
  - fBodyAccMagmean, fBodyAccMagstd, fBodyAccMagmeanFreq represent body acceleration mean, standard deviation and frequency measurements.
  - fBodyBodyAccJerkMagmean, fBodyBodyAccJerkMagstd, fBodyBodyAccJerkMagmeanFreq represent body acceleration mean, standard deviation and frequency measurements.
  - fBodyBodyGyroMagmean, fBodyBodyGyroMagstd, fBodyBodyGyroMagmeanFreq represent body, body gyro mean, standard deviation and frequency measurements.
  - fBodyBodyGyroJerkMagmean, fBodyBodyGyroJerkMagstd, fBodyBodyGyroJerkMagmeanFreq represent body, body gyro gerk mean, standard deviation and frequency measurements.
