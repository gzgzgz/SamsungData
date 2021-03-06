#########################################################
#
#   The anlaysis script for cleaning the Samsung data 
#     Homework for the Getting&Cleaning Data Course       
#
#              by Zhi Guo,   Aug 12, 2016
#
#########################################################

library(data.table)
library(dplyr)
library(plyr)

  # check if the raw data are in the same folder as the execution script
  if(!file.exists("./UCI HAR Dataset")) {
    # The test data don't exist, download and unzip them
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, destfile = "Samsung_data.zip")
    unzip("Samsung_data.zip")
  }
  
  # step 1: Acquire activity labels and feature labels
  act_label <- fread("./UCI HAR Dataset/activity_labels.txt")
  feature_label <- fread("./UCI HAR Dataset/features.txt")

  
  
  # step 2: Load train dataset and map its label
  train_num_label <- fread("./UCI HAR Dataset/train/y_train.txt")
  train_label <- as.character(factor(train_num_label$V1, levels=c(1:length(act_label$V2)), labels=act_label$V2))
  train_table <- as.data.frame(fread("./UCI HAR Dataset/train/X_train.txt", col.names = feature_label$V2))
  train_table["activity"]=train_label
      # we need to add another column for describing the subject
  subject_train <-fread("./UCI HAR Dataset/train/subject_train.txt")
  train_table["subject"]=subject_train

  # step 3: Load test dataset and map its label
  test_num_label <- fread("./UCI HAR Dataset/test/y_test.txt")
  test_label <- as.character(factor(test_num_label$V1, levels=c(1:length(act_label$V2)), labels=act_label$V2))
  test_table <- as.data.frame(fread("./UCI HAR Dataset/test/X_test.txt", col.names = feature_label$V2))
  test_table["activity"]=test_label
    # we need to add another column for describing the subject
  subject_test <-fread("./UCI HAR Dataset/test/subject_test.txt")
  test_table["subject"]=subject_test
  
  # step 4: construct two dataset and select specific activities to average or std

  merged_table <- rbind(train_table, test_table)
  rm("train_table", "test_table")
  
  
  
  mean_and_std <- select(merged_table, matches("activity|subject|(^[tf].*?(mean\\()|(std\\())"))
  names(mean_and_std) <- gsub("^t","Time", names(mean_and_std))
  names(mean_and_std) <- gsub("^f", "Freq", names(mean_and_std))
  names(mean_and_std) <- gsub("[()]","", names(mean_and_std))

  
  used_col_no <- ncol(mean_and_std)-2
  average_set <- matrix(nrow=0, ncol=used_col_no)
  for (each_sub in unique(mean_and_std$subject)) {
    for (each_activity in unique(mean_and_std$activity)) {
      average_set <- rbind(average_set, sapply(subset(mean_and_std, activity==each_activity & subject==each_sub, select=-c(activity, subject)), mean, na.rm=TRUE))
    }
  }
  names(average_set) <- colnames(mean_and_std)[1:used_col_no]
  average_set <- as.data.frame(average_set)
  average_set <- cbind(average_set, unique(mean_and_std[c("activity", "subject")]))
  names(average_set) <- names(mean_and_std)
  
  average_set <- arrange(average_set, subject)
  ### According to the assignment, standard deviations are not required for step 5, therefore we only output the average data set
  write.table(average_set, file="tidy.txt", row.names=FALSE)
