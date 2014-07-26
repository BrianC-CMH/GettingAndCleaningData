### Original data:

- [source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) 
- [description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


### Data Transformation Steps

Following data transformations are carried out by the `run_analysis.R` script.

1. For each of the training and test datasets: 
    1. Read the `X` values.
    2. Read the 'Y' values.
    3. Append activity label.
    4. Merge X&Y data sets.
2. Take master data set and retain only columns that contain the mean and standard deviation values.
3. Save the result clean data set as `tidy.txt`


### Variable Descriptions

The data for this data set was derived from sources mentioned in the "Original data" section of this document. Part of the description below has been taken from the original data description.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

The set of variables that were estimated from these signals are:
- mean: Mean value
- std: Standard deviation

#### Data Columns

- Subject: ID indicating the subject from whom data was collected
- Activity: Activity being performed
- Time.Body.Acceleration..Mean.X
- Time.Body.Acceleration..Mean.Y
- Time.Body.Acceleration..Mean.Z
- Time.Gravity.Acceleration..Mean.X
- Time.Gravity.Acceleration..Mean.Y
- Time.Gravity.Acceleration..Mean.Z
- Time.Body.Acceleration.Jerk.Mean.X
- Time.Body.Acceleration.Jerk.Mean.Y
- Time.Body.Acceleration.Jerk.Mean.Z
- Time.BodyGyro.Mean.X
- Time.BodyGyro.Mean.Y
- Time.BodyGyro.Mean.Z
- Time.BodyGyroJerk.Mean.X
- Time.BodyGyroJerk.Mean.Y
- Time.BodyGyroJerk.Mean.Z
- FFT.Body.Acceleration..Mean.X
- FFT.Body.Acceleration..Mean.Y
- FFT.Body.Acceleration..Mean.Z
- FFT.Body.Acceleration.Jerk.Mean.X
- FFT.Body.Acceleration.Jerk.Mean.Y
- FFT.Body.Acceleration.Jerk.Mean.Z
- FFT.BodyGyro.Mean.X
- FFT.BodyGyro.Mean.Y
- FFT.BodyGyro.Mean.Z
- angle(Time.Body.Acceleration.Mean,gravity)
- angle(Time.Body.Acceleration.JerkMean),gravityMean)
- angle(Time.BodyGyroMean,gravityMean)
- angle(Time.BodyGyroJerkMean,gravityMean)
- angle(X,gravityMean)
- angle(Y,gravityMean)
- angle(Z,gravityMean)
- Time.Body.Acceleration..Std.X
- Time.Body.Acceleration..Std.Y
- Time.Body.Acceleration..Std.Z
- Time.Gravity.Acceleration..Std.X
- Time.Gravity.Acceleration..Std.Y
- Time.Gravity.Acceleration..Std.Z
- Time.Body.Acceleration.Jerk.Std.X
- Time.Body.Acceleration.Jerk.Std.Y
- Time.Body.Acceleration.Jerk.Std.Z
- Time.BodyGyro.Std.X
- Time.BodyGyro.Std.Y
- Time.BodyGyro.Std.Z
- Time.BodyGyroJerk.Std.X
- Time.BodyGyroJerk.Std.Y
- Time.BodyGyroJerk.Std.Z
- Time.Body.Acceleration.Mag.Std
- Time.Gravity.Acceleration.Mag.Std
- Time.Body.Acceleration.JerkMag.Std
- Time.BodyGyroMag.Std
- Time.BodyGyroJerkMag.Std
- FFT.Body.Acceleration..Std.X
- FFT.Body.Acceleration..Std.Y
- FFT.Body.Acceleration..Std.Z
- FFT.Body.Acceleration.Jerk.Std.X
- FFT.Body.Acceleration.Jerk.Std.Y
- FFT.Body.Acceleration.Jerk.Std.Z
- FFT.BodyGyro.Std.X
- FFT.BodyGyro.Std.Y
- FFT.BodyGyro.Std.Z
- FFT.Body.Acceleration.Mag.Std
- FFT.BodyBody.Acceleration.JerkMag.Std
- FFT.BodyBodyGyroMag.Std
- FFT.BodyBodyGyroJerkMag.Std
