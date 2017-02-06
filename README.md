Getting and Cleaning Data - course project.

AvgResults.txt - output of the script

CodeBook.md - describes dataset, its transformation and variables

run_analysis.R - main script for the analysis

The script run_analysis.R operates on UCI Human Activity Recognition dataset. 
It could be downloaded from the following location
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The extracted folder ("UCI HAR Dataset") must be placed in the same folder as 
the script.

The script operates on the data found in "./UCI HAR Dataset/" and does the 
following:

1. Merges the training and the testing datasets to recreate the original 
   dataset;
2. Extracts only the mean and standard deviation values for each feature;
3. Names activities by names instead of numbers as profided by 
   "./UCI HAR Dataset/activity_labels.txt";
4. Pays extra attention to naming of columns;
5. Groups dataset by subject and their activities;
6. Creates an independent data set with the average of each variable for 
   each group. This is the output of the script.