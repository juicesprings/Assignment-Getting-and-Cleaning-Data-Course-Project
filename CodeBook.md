
## Introduction

The script `run_analysis.R` first reads data into R, and then performs five steps:

1. Merge the following data sets using the `rbind()` function:
  a. training set (`x_train` and `y_train`) merged to (`x_data`)
  b. test sets (`x_test` and `y_test`) merged to (`y_data`)
  c. subject sets (`subject_test` and `subject_train`) merged to (`subject_data`)
2. Extract only the measurements on the mean and standard deviation for each measurement
  a. Extract on the `features` data set
  b. Extract column of `x_data` corresponding to the `features` data set to `x_data_mean_and_std_features`
  c. Rename extracted columns of `x_data_mean_and_std_features` to match the `features` data set
3. Use descriptive activity names to name the activities in the data set
  a. Match names of `activity` to `y_data`
  b. Rename column in `y_data` to "activity"
4. Appropriately label the data set with descriptive variable names
  a. Rename column in `subject_data` to "subject"
  b. Combine `x_data_mean_and_std_features` with `y_data` and `subject_data` to `all_data`
5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
  a. For the subject and activity variables, this fuction outputs `averages_data` which takes the average for each subject and activity type (30 subjects * 6 activities = 180 rows); columns 80 and 81 (i.e. subject and activity) are excluded
  b. The `averages_data` variable is then written to a table called "tidy.txt"
