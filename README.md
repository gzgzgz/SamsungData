# Getting and Cleaning Data Course Project
## The data source and what does this script do
The Human Activity Recognition Database are collected from the accelerometers from the Samsung Galaxy S smartphone. Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted smartphone with embedded inertial sensors. The raw data used for this study is downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
<br>A more detailed background description of this data can be followed from this link: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones <br></br>
The dataset includes the following files:
<ul>
<li>'features.txt': List of all features.</li>
<li>'activity_labels.txt': Links the class labels with their activity name.</li>
<li>'train/X_train.txt': Training features set.</li>
<li>'train/y_train.txt': Training activitis labels.</li>
<li>'train/subject_train.txt': Training subjects labels.</li>
<li>'test/X_test.txt': Test features set.</li>
<li>'test/y_test.txt': Test activities labels.</li>
<li>'test/subject_test.txt': Test subjects labels.</li>
</ul>

Overall, this script does the following things: <br>
(1) Merges the training and the test sets to create one data set. <br>
(2) Extracts only the measurements on the mean and standard deviation for each measurement.<br>
(3) Uses descriptive activity names to name the activities in the data set<br>
(4) Appropriately labels the data set with descriptive variable names.<br>
(5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject.<br>

## What is included in this repository
- A R script named "run_analysis.R"
- A Readme file
- A codebook to define the variables
- A result txt file, the output 

## How to run the run_analysis.R script and obtain the output
To run the script, one will need to make sure that the unzipped Samsung activity sensor data folder is located in the same working directory as the "run_analysis.R" script. If this data folder does not exist, the script will try to download the zip file from the web,  unzip it under the same working directory, and proceed. The output file is named "result5.txt". It will be saved under the same working directory as the "run_analysis.R" script.






