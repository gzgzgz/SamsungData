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
  subject_set <- sort(unique(merged_table$subject))
  
  total_mean=data.frame()
  total_std=data.frame()
  
  for (sub_ele in subject_set) {
    mean_act=data.frame(matrix(ncol=0, nrow=1))
    std_act=data.frame(matrix(ncol=0, nrow=1))
    for (ele in act_label$V2){
	    tmp_mean <- as.matrix(sapply(subset(merged_table, activity==ele & subject==sub_ele, select=-c(activity, subject)), mean, na.rm=TRUE))
      dim(tmp_mean) <- c(1, length(tmp_mean[,1]))
	    colnames(tmp_mean) <- paste("MEAN", paste(ele, feature_label$V2, sep="_"), sep="_")
      mean_act <- cbind(mean_act, tmp_mean)
	  
	    tmp_std <- as.matrix(sapply(subset(merged_table, activity==ele & subject==sub_ele, select=-c(activity, subject)), sd, na.rm=TRUE))
	    dim(tmp_std) <- c(1, length(tmp_std[,1]))
	    colnames(tmp_std) <- paste("STD", paste0(ele, feature_label$V2, sep="_"), sep="_")
	    std_act <- cbind(std_act, tmp_std)
    }
	  total_mean <-rbind(total_mean, mean_act)
    total_std <- rbind(total_std, std_act)
  }
  rm("merged_table")
  
  ### According to the assignment, standard deviations are not required for step 5, therefore we only output the average data set
  write.table(total_mean, file="result5.txt", row.names=FALSE)
