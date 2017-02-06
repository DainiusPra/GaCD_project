Getting and Cleaning Data - project

This document describes describes the variables, the data, and any 
transformations/work that was performed to clean up the data.


Description of the data.

The experiments have been carried out with a group of 30 volunteers within 
an age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded 
to label the data manually. The obtained dataset has been randomly partitioned 
into two sets, where 70% of the volunteers was selected for generating the 
training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by 
applying noise filters and then sampled in fixed-width sliding windows 
of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration 
signal, which has gravitational and body motion components, was separated 
using a Butterworth low-pass filter into body acceleration and gravity. The 
gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, 
a vector of features was obtained by calculating variables from the time and 
frequency domain. See 'features_info.txt' for more details. 

Description of the data could be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data for the project could be found here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

We made the following modifications to the initial data set:
- Each data set contained a number of readings for 30 test subjects and for 6 
different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS,SITTING,
STANDING, LAYING). The initially separated training and testing data sets 
were merged into one set. 
- the resulting dataset was reduced and only columns that contain results 
regarding mean recordings and their standard deviations were left
- The subject and activity identifiers (initially stored in different files - 
y_test/y_train and subject_test/subject_train respectively) were added to this 
new data set. 
- originally, activity was defined as an integer indicator (ranging from 1 to 
6). In the new data set it was changed to string identificator according to the
information laid out in 'activity_labels.txt'.
- the resulting dataset was grouped (dplyr routine group_by) by test subject (30
subjects) and its activity (6 activities). The mean was taken for each 180 
groups. The resulting table is the output. Extra attention was paid for the 
preservation of the column names.