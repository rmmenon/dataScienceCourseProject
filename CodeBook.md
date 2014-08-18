Introduction
============
This codebook describes the data we obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. We have done some transformations to this data that we describe here as well.

Transformations on Raw data
===========================
* We combined test and train data set into one data set
* We renamed features by removing () and "-"

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
 tBodyAccJerkMagmean   tBodyAccJerkMagstd   tBodyGyroMagmean    tBodyGyroMagstd    
 tBodyGyroJerkMagmean   tBodyGyroJerkMagstd   fBodyAccmeanX    fBodyAccmeanY    
 fBodyAccmeanZ    fBodyAccstdX     fBodyAccstdY     fBodyAccstdZ    
 fBodyAccmeanFreqX   fBodyAccmeanFreqY   fBodyAccmeanFreqZ   fBodyAccJerkmeanX   
 fBodyAccJerkmeanY   fBodyAccJerkmeanZ   fBodyAccJerkstdX    fBodyAccJerkstdY   
 fBodyAccJerkstdZ  fBodyAccJerkmeanFreqX fBodyAccJerkmeanFreqY fBodyAccJerkmeanFreqZ 
 fBodyGyromeanX  fBodyGyromeanY  fBodyGyromeanZ  fBodyGyrostdX  
 fBodyGyrostdY  fBodyGyrostdZ  fBodyGyromeanFreqX  fBodyGyromeanFreqY  
 fBodyGyromeanFreqZ  fBodyAccMagmean  fBodyAccMagstd  fBodyAccMagmeanFreq  
 fBodyBodyAccJerkMagmean fBodyBodyAccJerkMagstd fBodyBodyAccJerkMagmeanFreq fBodyBodyGyroMagmean 
 fBodyBodyGyroMagstd fBodyBodyGyroMagmeanFreq fBodyBodyGyroJerkMagmean fBodyBodyGyroJerkMagstd 
 fBodyBodyGyroJerkMagmeanFreq
