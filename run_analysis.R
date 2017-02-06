# Getting and Cleaning data - week 4 - project
# Performs all tasks as requested by the description
# Downloaded and extracted data (folder "UCI HAR Dataset" and its contents)
#    must be present in the same folder as the script.
# Outputs the grouped and averaged dataset
# the contents of dataset should be viewed with View() command

library("dplyr")

# folder definitions
datadir  <- "./UCI HAR Dataset/"
testdir  <- paste0(datadir, "test/")
traindir <- paste0(datadir, "train/")

# read in data
test_x <- read.table(paste0(testdir, "X_test.txt"))
test_y <- read.table(paste0(testdir, "y_test.txt"))
test_s <- read.table(paste0(testdir, "subject_test.txt"))

train_x <- read.table(paste0(traindir, "X_train.txt"))
train_y <- read.table(paste0(traindir, "y_train.txt"))
train_s <- read.table(paste0(traindir, "subject_train.txt"))

feat  <- read.table(paste0(datadir, "features.txt"))
activ <- read.table(paste0(datadir, "activity_labels.txt"))


#merge data
merge_x <- rbind(test_x, train_x)
merge_y <- rbind(test_y, train_y)
merge_s <- rbind(test_s, train_s)

#acquire column indices of columns with means and stdevs
#select this data
ind_mean <- grep("mean", feat[,2])
ind_stdv <- grep("std",  feat[,2])
ind_data <- c(ind_mean, ind_stdv)

merge_x <- merge_x[, ind_data]
feat    <- feat[ind_data, 2]

#pick names for the activities
#name the columns
activities <- activ[merge_y[, 1] ,2]
names(merge_x) <- feat
names(activities) <- "activities"
names(merge_s) <- "subject"

#merge data to one table, group by subjects+activities and summarize
dataFin <- group_by(cbind(merge_s, activities, merge_x), subject, activities)
dataSum <- summarise_each(dataFin, funs(mean))

# the last definition is also an output