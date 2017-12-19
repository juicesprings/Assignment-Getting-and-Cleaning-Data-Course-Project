library(dplyr)
library(reshape2)

##Get data
URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
FILE <- "UCI HAR Dataset.zip"

if (!file.exists(FILE)){
    download.file(URL, FILE)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(FILE) 
}

#####Read data into R

#Read train data into R
subject_train <- read.table("./train/subject_train.txt")
x_train <- read.table("./train/X_train.txt")
y_train <- read.table("./train/y_train.txt")

#Read test data into R
subject_test <- read.table("./test/subject_test.txt")
x_test <- read.table("./test/X_test.txt")
y_test <- read.table("./test/y_test.txt")

#Read features into R
features <- read.table("./features.txt")

#Read activity into R
activity <- read.table("./activity_labels.txt")

#####Merge Data

# merge x data set
x_data <- rbind(x_train, x_test)

# merge y data set
y_data <- rbind(y_train, y_test)

# merge subject data set
subject_data <- rbind(subject_train, subject_test)

#####Extract only mean and std. dev.
#Get only mean and std. dev. from features
mean_and_std_features <- grep(".*mean.*|.*std.*", features[,2])
# subset columns corresponding to mean and std. dev. from features
x_data_mean_and_std_features <- x_data[, mean_and_std_features]
# change column name
names(x_data_mean_and_std_features) <- features[mean_and_std_features, 2]

#####Uses descriptive activity names to name the activities in the data set
# update with activity names
y_data[, 1] <- activity[y_data[, 1], 2]
# change column name
names(y_data) <- "activity"

#####Appropriately label the data set with descriptive variable names
# change column name
names(subject_data) <- "subject"
# bind all the data in a single data set
all_data <- cbind(x_data_mean_and_std_features, y_data, subject_data)

#####creates independent tidy data set with the average of each variable for each activity and each subject.
averages_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:79]))
write.table(averages_data, "tidy.txt", row.name=FALSE)
