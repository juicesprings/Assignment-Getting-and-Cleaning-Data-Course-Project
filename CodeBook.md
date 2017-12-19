
## Introduction

The script `run_analysis.R` first reads data into R, and then performs five steps:

1. First, all the similar data is merged using the `rbind()` function. By similar, we address those files having the same number of columns and referring to the same entities.

2. Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.

3. As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.

4. On the whole dataset, those columns with vague column names are corrected.

5. Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called averages_data.txt, and uploaded to this repository.

1. Merge the following data sets using the `rbind()` function:
  a. training set (`x_train` and `y_train`) merged to (`x_data`)
  b. test sets (`x_test` and `y_test`) merged to (`y_data`)
  c. subject sets (`subject_test` and `subject_train`) merged to (`subject_data`)
2. Extract only the measurements on the mean and standard deviation for each measurement
  a. Extract on the `features` data set
  b. Extract column of `x_data` corresponding to the `features` data set to `x_data_mean_and_std_features`
  c. Rename extract columns of of `x_data_mean_and_std_features` to match the `features` data set
3. Use descriptive activity names to name the activities in the data set
  a. Match names of `activity` to `y_data`
  b. Rename column in `y_data` to "activity"
4. Appropriately label the data set with descriptive variable names
  a. Rename column in `subject_data` to "subject"
  b. Combine `x_data_mean_and_std_features` with `y_data` and `subject_data` to `all_data`
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Variables 

* features contains the correct names for the x_data dataset, which are applied to the column names stored in mean_and_std_features, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the activities variable.
* all_data merges x_data, y_data and subject_data in a big dataset.
* Finally, averages_data contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is used to apply colMeans() and ease the development.
