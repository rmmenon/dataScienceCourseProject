Data Science Course Project (https://class.coursera.org/getdata-006)
====================================================================

This project tidies up the data obtained from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. The data set for the project is available at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The R script run_analysis.R assumes the following:
1. The zip file has been downloaded from the url https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. The zip file has been expanded such that data exists under a subdirectory "UCI HAR Dataset".

The R script run_analysis.R does the following:
1. Loads features data set and normalizes them. These would become column names of the variables eventually. Normalizing them essentially means removing "()" and "-". We delibarately do not lower case the variable names since we think it reduces readability
2. Loads subject, y and X data for test and train data sets. Also sets the column names in each of these to normalized feature data set obtained in step 1.
3. Consolidates test and training data bu adding them column wise
4. Combines test and training data set row wise to create a combined data set. Also sets the names of the first and second column to more readable names.
5. Substitutes activity codes with activity names given in file "activity_labels.txt".
6. Retains only the mean and standard deviation related features. Assumes that these are the ones that have either "mean" or "std" in the column name (ignore case).
7. Generates avergae value for each column grouped by "subject" and "activity" columns and stores it in a variable avggData
8. Writes avgData from step 7 into a file called avgData.txt
