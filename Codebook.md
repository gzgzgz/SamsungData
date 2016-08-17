# The Codebook
## This Codebook documentes all the variables used in the output file, and how they are arranged

### The output format
The output table has all the mean values of each measurement variables from each activity and each subject. This includes both the training data and the test data.
The first row are the labels for all those variables. The measurement variables first take the lead, and this is followed by last two variables, which are the activity variable and the subject variable. <br></br>
In particular, the table has been ordered by the subject variable in ascending order.
The formats of the labels are specified as the following: <br>
- measurement variables
  - tBodyAcc-XYZ
  - tGravityAcc-XYZ
  - tBodyAccJerk-XYZ
  - tBodyGyro-XYZ
  - tBodyGyroJerk-XYZ
  - tBodyAccMag
  - tGravityAccMag
  - tBodyAccJerkMag
  - tBodyGyroMag
  - tBodyGyroJerkMag
  - fBodyAcc-XYZ
  - fBodyAccJerk-XYZ
  - fBodyGyro-XYZ
  - fBodyAccMag
  - fBodyAccJerkMag
  - fBodyGyroMag
  - fBodyGyroJerkMag
  
<i>The measurement variables all has keywords "mean" and "std" to represent mean values and standard deviation values.</i>
- activity variables (Interger ranging from 1 to 6.)
  - 1 --- WALKING --- subject was walking during the test
  - 2 --- WALKING_UPSTAIRS --- subject was walking up a staircase during the test
  - 3 --- WALKING_DOWNSTAIRS --- subject was walking down a staircase during the test
  - 4 --- SITTING --- subject was sitting during the test
  - 5 --- STANDING --- subject was standing during the test
  - 6 --- LAYING --- subject was laying down during the test <br></br>
- subject value (Integer ranging from 1 to 30, representing different person)

## Transormations that have been done to the raw data
- The raw data set "train" and "test" have been merged into one data set. Moreover, the mean and standard deviation of each measurement variable has been picked out. Furthermore, the activity variable and subject variable corresponding to each measurement variable have been appended as two extra columns. The merged data set is named "mean_and_std".
- The label of the measurement variables have been modified. Only relevant information has been retained, i.e. symbols such as parentheis "()" have been removed, while the keywords like "mean" and "std" are maintained.
- The output data are averages of all the mean and standard deviation of each measurement variable, running over each activity and each subject. This data set is named "average_set", which has 180 rows (6 activities and 30 subjects) and 88 columns (86 measurement variables + activity + subject)
- The output tidy data set is saved as a txt file named "tidy.txt". This is also included in the repository.
