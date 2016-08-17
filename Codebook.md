# The Codebook (Revision from last failure)
## This Codebook documents all the variables used in the output file, and how they are acquired and arranged

### The output format
The output table has the average of the mean values and standard deviation values from each measurement variable collected on each activity and each subject. This includes both the training data and the test data.
The first row, which are the labels for all those variables, are ordered as follows: first, the measurement variables take the lead,  followed by last two variables, the activity variable and the subject variable. <br></br>
In particular, the table has been ordered by the subject variable in ascending order.
The formats of the labels are specified as the following: <br>
- base measurement variables
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
  
<b><i>The measurement variables all has keywords "mean" and "std" inserted and separated by "_" symbol to represent if they are mean values or standard deviation values of the meausrement variables.</i></b>
- activity variables (Interger ranging from 1 to 6.)
  - 1 --- WALKING --- subject was walking during the test
  - 2 --- WALKING_UPSTAIRS --- subject was walking up a staircase during the test
  - 3 --- WALKING_DOWNSTAIRS --- subject was walking down a staircase during the test
  - 4 --- SITTING --- subject was sitting during the test
  - 5 --- STANDING --- subject was standing during the test
  - 6 --- LAYING --- subject was laying down during the test <br></br>
- subject value (Integer ranging from 1 to 30, representing different person)

## Transormations that have been done to the raw data
- The raw data set "train" and "test" have been merged into one data set. The columns related to mean and standard deviation of each measurement variable have been picked out. Furthermore, the activity variable and subject variable corresponding to each measurement variable have been appended as two extra columns. The merged data set is named "mean_and_std".
- The label of the measurement variables have been modified. Only relevant information has been retained, i.e. symbols such as parentheis "()" have been removed, while the keywords like "mean" and "std" are maintained.
- The output data are averages of all the mean and standard deviation of each measurement variable, running over each activity and each subject. This data set is named "average_set", which has 180 rows (6 activities and 30 subjects) and 88 columns (86 measurement variables + activity + subject)
- The output tidy data set is saved as a txt file named "tidy.txt". This is also included in the repository.
