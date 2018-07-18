# Codebook

The data for this project comes from experiments that have been carried out with a 
group of 30 volunteers within  an age bracket of 19-48 years. 
Each person performed six
activities  (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING,
STANDING, LAYING)  wearing a smartphone (Samsung Galaxy S II) on the
waist.

The features selected for this database come from the accelerometer
and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.

The list of signals derived are as follows:

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBaodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals included *Mean value*, 
*Standard deviation*, *Median absolute deviation*, *Largest value in array*, *Smallest value in array*,
among others.


To the purpose of this exercise, I apply the following methodology:

1. Merge the training and test data sets for both dependent and independent variiable
to create one big dataset;
2. Select the variables regarding the Mean value and Standard deviation values of each feature;
3. Encode the activity code to their respective labels;
4. Merge the resulted data set with the merged subject data set;
5. Finally, create a new data set (called tidy_data.txt) with the average of each variable for each activity and each subject.



