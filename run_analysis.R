library(plyr)
library(reshape2)

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

# find mean by subject and activity
molten <- melt(dataThin, id=c("subject", "activity"))
tidyData <- dcast(molten, subject+activity~variable, mean)
write.table(tidyData, file="tidyData.txt",row.names=FALSE, sep=",")
