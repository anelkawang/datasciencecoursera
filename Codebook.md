## Codebook for the analysis 

### Data Source
Human Activity Recognition Using Smartphones Data Set
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

### Data description
Each measurement variables is the average value of its belong group.
The group is determined by its activity and subject

### Variables
* The description variables: 
Activity:         activity when using, 1-6
Activity.Name:    activity when using, 
                                1 WALKING
								2 WALKING_UPSTAIRS
								3 WALKING_DOWNSTAIRS
								4 SITTING
								5 STANDING
								6 LAYING

Subject:          subject for the experiment, 1-30

* The measurement variables:

XYZ denote the axis for the measurement:

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

mean() or std() denote the meaning of the number
mean(): Mean value
std(): Standard deviation
