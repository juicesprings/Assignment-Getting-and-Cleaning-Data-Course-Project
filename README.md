
## Data set

Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

Data is available at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data set information

- Sample size = 30 individuals
- Each indvidiua performs six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
- An accelerometer and gyroscop captures 3-axial linear acceleration and 3-axial angular velocity 
- Dataset has been randomly partitioned (70% = training data and 30% = test data). 

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Files

`CodeBook.md` - describes the variables, the data, and any transformations or work performed to clean up the data

`run_analysis.R` - script for performing the analysis. Does the following:

`tidy.txt` - The output of `run_analysis.R`
