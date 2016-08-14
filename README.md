# Getting and Cleaning Data Course Project
## How to run the run_analysis.R script and obtain the output
To run the script, one will need to make sure that the unzipped Samsung activity sensor data folder is located in the same working directory as the "run_analysis.R" script. If this data folder does not exist, the script will try to download the zip file from the web,  unzip it under the same working directory, and proceed. The output file is named "result5.txt". It will be saved under the same working directory as the "run_analysis.R" script.

## The output format
According to the requirements of the assignment, "an independent tidy data set with the average of each variable for each activity and each subject" need to be output as file. The raw data set first includes a 561-feature vector recording motion sensor data, which is further sampled for 6 different activities by 30 subjects. <br></br>
In this work, we treat the 561-feature vector and 6 different activities as a larger feature vector by doing an outer prodcut, which then lead to a 3366-feature vector. On the other hand, the 30 subjects (testing person) should be considered as different observations. <br></br>
To obtain the row vector, i.e. an observation from one specific subject (a certain person), we carry out an average over all the measurements on that specific subject as described by those 3366 features. <br></br> <b><i>Therefore, the output data will be a 30 rows x 3366 cols table. </i></b> The column names are identified by the combination of "activity" and "motion feature names", separated by an underscore symbol "_". The rows have already been ordered by the subject No. in the output file, and their row names have been suppressed in the output (required by the assignment).

## Other notes
The training data and test data have been merged into one data set and store in a data frame named "merged_table". The standard deviation of the same data set has also been calculated in the script, yet not outputed. 




