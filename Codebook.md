# The Codebook
## This Codebook documentes all the variables used in the output file, and how are they arranged

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
  
<i>The measurement variables all has a keyword "mean" to represent mean value.</i>
- activity variables (Interger ranging from 1 to 6.)
  - 1 --- WALKING --- subject was walking during the test
  - 2 --- WALKING_UPSTAIRS --- subject was walking up a staircase during the test
  - 3 --- WALKING_DOWNSTAIRS --- subject was walking down a staircase during the test
  - 4 --- SITTING --- subject was sitting during the test
  - 5 --- STANDING --- subject was standing during the test
  - 6 --- LAYING --- subject was laying down during the test <br></br>
- subject value (Integer ranging from 1 to 30, representing different person)
