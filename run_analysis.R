library(plyr)
############# helper function definitions ###############

ROOT_DIR <- sprintf("UCI HAR Dataset");
TEST_ROOT_DIR <- sprintf("UCI HAR Dataset/test");
TRAIN_ROOT_DIR <- sprintf("UCI HAR Dataset/train");

# get features data
features <- read.table(sprintf("%s/%s", ROOT_DIR, "features.txt"))
featuresNormalized <- gsub("-|\\(|\\)|,","",features[,2])

# get test data
subject_test <- read.table(sprintf("%s/%s", TEST_ROOT_DIR, "subject_test.txt"))
y_test <- read.table(sprintf("%s/%s", TEST_ROOT_DIR, "y_test.txt"))
X_test_file <- sprintf("%s/%s", TEST_ROOT_DIR, "X_test.txt")
X_test <- read.table(X_test_file, header=FALSE, colClasses="numeric")
names(X_test) <- featuresNormalized

# get train data
subject_train <- read.table(sprintf("%s/%s", TRAIN_ROOT_DIR, "subject_train.txt"))
y_train <- read.table(sprintf("%s/%s", TRAIN_ROOT_DIR, "y_train.txt"))
X_train_file <- sprintf("%s/%s", TRAIN_ROOT_DIR, "X_train.txt")
X_train <- read.table(X_train_file, header=FALSE, colClasses="numeric")
names(X_train) <- featuresNormalized

# consolidate test and train data
testData <- cbind(subject_test, y_test, X_test)
trainData <- cbind(subject_train, y_train, X_train)
cat(c("dims of test data: ", dim(testData), "\n"))
cat(c("dims of train data: ", dim(trainData), "\n"))

# combine test and train data
data <- rbind(testData, trainData)
names(data)[1:2] <- c("subject", "activity")
cat(c("dims of combined data: ", dim(data), "\n"))

# substitute activities with activity names
d1 <- gsub("1","WALKING", data[,2])
d1 <- gsub("2","WALKING_UPSTAIRS", d1)
d1 <- gsub("3","WALKING_DOWNSTAIRS", d1)
d1 <- gsub("4","SITTING", d1)
d1 <- gsub("5","STANDING", d1)
d1 <- gsub("6","LAYING", d1)
data[,2] <- d1

# extract mean and standard deviation for each measurement
columnIndicesToBeRemoved <- grep("mean|std|subject|activity", tolower(names(data)), invert=TRUE)
dataThin <- data[,-columnIndicesToBeRemoved]

# function implementing, brute force way of generating mean for each variable
avgFunction <- function(d) { 
  c(
  "tBodyAccmeanX"=mean(d[,"tBodyAccmeanX"]),
  "tBodyAccmeanY"=mean(d[,"tBodyAccmeanY"]),
  "tBodyAccmeanZ"=mean(d[,"tBodyAccmeanZ"]),
  "tBodyAccstdX"=mean(d[,"tBodyAccstdX"]),
  "tBodyAccstdY"=mean(d[,"tBodyAccstdY"]),
  "tBodyAccstdZ"=mean(d[,"tBodyAccstdZ"]),
  "tGravityAccmeanX"=mean(d[,"tGravityAccmeanX"]),
  "tGravityAccmeanY"=mean(d[,"tGravityAccmeanY"]),
  "tGravityAccmeanZ"=mean(d[,"tGravityAccmeanZ"]),
  "tGravityAccstdX"=mean(d[,"tGravityAccstdX"]),
  "tGravityAccstdY"=mean(d[,"tGravityAccstdY"]),
  "tGravityAccstdZ"=mean(d[,"tGravityAccstdZ"]),
  "tBodyAccJerkmeanX"=mean(d[,"tBodyAccJerkmeanX"]),
  "tBodyAccJerkmeanY"=mean(d[,"tBodyAccJerkmeanY"]),
  "tBodyAccJerkmeanZ"=mean(d[,"tBodyAccJerkmeanZ"]),
  "tBodyAccJerkstdX"=mean(d[,"tBodyAccJerkstdX"]),
  "tBodyAccJerkstdY"=mean(d[,"tBodyAccJerkstdY"]),
  "tBodyAccJerkstdZ"=mean(d[,"tBodyAccJerkstdZ"]),
  "tBodyGyromeanX"=mean(d[,"tBodyGyromeanX"]),
  "tBodyGyromeanY"=mean(d[,"tBodyGyromeanY"]),
  "tBodyGyromeanZ"=mean(d[,"tBodyGyromeanZ"]),
  "tBodyGyrostdX"=mean(d[,"tBodyGyrostdX"]),
  "tBodyGyrostdY"=mean(d[,"tBodyGyrostdY"]),
  "tBodyGyrostdZ"=mean(d[,"tBodyGyrostdZ"]),
  "tBodyGyroJerkmeanX"=mean(d[,"tBodyGyroJerkmeanX"]),
  "tBodyGyroJerkmeanY"=mean(d[,"tBodyGyroJerkmeanY"]),
  "tBodyGyroJerkmeanZ"=mean(d[,"tBodyGyroJerkmeanZ"]),
  "tBodyGyroJerkstdX"=mean(d[,"tBodyGyroJerkstdX"]),
  "tBodyGyroJerkstdY"=mean(d[,"tBodyGyroJerkstdY"]),
  "tBodyGyroJerkstdZ"=mean(d[,"tBodyGyroJerkstdZ"]),
  "tBodyAccMagmean"=mean(d[,"tBodyAccMagmean"]),
  "tBodyAccMagstd"=mean(d[,"tBodyAccMagstd"]),
  "tGravityAccMagmean"=mean(d[,"tGravityAccMagmean"]),
  "tGravityAccMagstd"=mean(d[,"tGravityAccMagstd"]),
  "tBodyAccJerkMagmean"=mean(d[,"tBodyAccJerkMagmean"]),
  "tBodyAccJerkMagstd"=mean(d[,"tBodyAccJerkMagstd"]),
  "tBodyGyroMagmean"=mean(d[,"tBodyGyroMagmean"]),
  "tBodyGyroMagstd"=mean(d[,"tBodyGyroMagstd"]),
  "tBodyGyroJerkMagmean"=mean(d[,"tBodyGyroJerkMagmean"]),
  "tBodyGyroJerkMagstd"=mean(d[,"tBodyGyroJerkMagstd"]),
  "fBodyAccmeanX"=mean(d[,"fBodyAccmeanX"]),
  "fBodyAccmeanY"=mean(d[,"fBodyAccmeanY"]),
  "fBodyAccmeanZ"=mean(d[,"fBodyAccmeanZ"]),
  "fBodyAccstdX"=mean(d[,"fBodyAccstdX"]),
  "fBodyAccstdY"=mean(d[,"fBodyAccstdY"]),
  "fBodyAccstdZ"=mean(d[,"fBodyAccstdZ"]),
  "fBodyAccmeanFreqX"=mean(d[,"fBodyAccmeanFreqX"]),
  "fBodyAccmeanFreqY"=mean(d[,"fBodyAccmeanFreqY"]),
  "fBodyAccmeanFreqZ"=mean(d[,"fBodyAccmeanFreqZ"]),
  "fBodyAccJerkmeanX"=mean(d[,"fBodyAccJerkmeanX"]),
  "fBodyAccJerkmeanY"=mean(d[,"fBodyAccJerkmeanY"]),
  "fBodyAccJerkmeanZ"=mean(d[,"fBodyAccJerkmeanZ"]),
  "fBodyAccJerkstdX"=mean(d[,"fBodyAccJerkstdX"]),
  "fBodyAccJerkstdY"=mean(d[,"fBodyAccJerkstdY"]),
  "fBodyAccJerkstdZ"=mean(d[,"fBodyAccJerkstdZ"]),
  "fBodyAccJerkmeanFreqX"=mean(d[,"fBodyAccJerkmeanFreqX"]),
  "fBodyAccJerkmeanFreqY"=mean(d[,"fBodyAccJerkmeanFreqY"]),
  "fBodyAccJerkmeanFreqZ"=mean(d[,"fBodyAccJerkmeanFreqZ"]),
  "fBodyGyromeanX"=mean(d[,"fBodyGyromeanX"]),
  "fBodyGyromeanY"=mean(d[,"fBodyGyromeanY"]),
  "fBodyGyromeanZ"=mean(d[,"fBodyGyromeanZ"]),
  "fBodyGyrostdX"=mean(d[,"fBodyGyrostdX"]),
  "fBodyGyrostdY"=mean(d[,"fBodyGyrostdY"]),
  "fBodyGyrostdZ"=mean(d[,"fBodyGyrostdZ"]),
  "fBodyGyromeanFreqX"=mean(d[,"fBodyGyromeanFreqX"]),
  "fBodyGyromeanFreqY"=mean(d[,"fBodyGyromeanFreqY"]),
  "fBodyGyromeanFreqZ"=mean(d[,"fBodyGyromeanFreqZ"]),
  "fBodyAccMagmean"=mean(d[,"fBodyAccMagmean"]),
  "fBodyAccMagstd"=mean(d[,"fBodyAccMagstd"]),
  "fBodyAccMagmeanFreq"=mean(d[,"fBodyAccMagmeanFreq"]),
  "fBodyBodyAccJerkMagmean"=mean(d[,"fBodyBodyAccJerkMagmean"]),
  "fBodyBodyAccJerkMagstd"=mean(d[,"fBodyBodyAccJerkMagstd"]),
  "fBodyBodyAccJerkMagmeanFreq"=mean(d[,"fBodyBodyAccJerkMagmeanFreq"]),
  "fBodyBodyGyroMagmean"=mean(d[,"fBodyBodyGyroMagmean"]),
  "fBodyBodyGyroMagstd"=mean(d[,"fBodyBodyGyroMagstd"]),
  "fBodyBodyGyroMagmeanFreq"=mean(d[,"fBodyBodyGyroMagmeanFreq"]),
  "fBodyBodyGyroJerkMagmean"=mean(d[,"fBodyBodyGyroJerkMagmean"]),
  "fBodyBodyGyroJerkMagstd"=mean(d[,"fBodyBodyGyroJerkMagstd"]),
  "fBodyBodyGyroJerkMagmeanFreq"=mean(d[,"fBodyBodyGyroJerkMagmeanFreq"])
  )
}
avgData <- ddply(dataThin, c("subject", "activity"), avgFunction)
write.table(avgData, file="avgData.txt",row.names=FALSE, sep=",")
