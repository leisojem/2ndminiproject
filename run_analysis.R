###Lian Marie Mejos
###CMSC 197 2ND MINI PROJECT

#################### Problem 1 #####################

##Setting the working directory

setwd("C:/Users/Lian Marie Mejos/Desktop/specdata")

act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

features <- read.table("./UCI HAR Dataset/features.txt")[,2]

extract_features <- grepl("mean|std",features)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) <- features

X_test <-  X_test[,extract_features]

y_test[,2] <-  act_labels[y_test[,1]]

names(y_test) <- c("Activity_ID", "Activity_Label")

names(subject_test) <- "subject"

test_data <- cbind(as.data.table(subject_test),y_test, X_test) 

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) <- features

X_train <- X_train[,extract_features]

y_train[,2] <- act_labels[y_train[,1]]

names(y_train) <- c("Activity_ID", "Activity_Label")

names(subject_train) <- "subject"

data1 <- cbind(as.data.table(subject_train),y_train,X_train)

data2 <- rbind(test_data,data1)

id_labels <- c("subject","Activity_ID","Activity_Label")

data_labels <- setdiff(colnames(data2),id_labels)

melt_data <- melt(data2,id = id_labels,measure.vars = data_labels)

tidy_data_UCIHAR <- dcast(melt_data, subject + Activity_Label ~ variable, mean)

write.table(tidy_data_UCIHAR, file = "./tidy_data_UCIHAR.txt")
