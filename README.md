## Problem 1 Step-by-Step Procedures

Step 1: Setting the working directory
setwd("C:/Users/Lian Marie Mejos/Desktop/specdata")

Step 2: Creating act_label and reading the file from the directory
act_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

Step 3: Creating features  and reading the file from the directory
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

Step 4: Extracting each mean and standard deviation
extract_features <- grepl("mean|std",features)

Step 5: Loading and reading  X_test,y_test, and subject_test 
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

Step 6: Setting the names of the data from X_test to the names in features 
names(X_test) <- features

Step 7: Extracting each mean and standard deviation in X_test
X_test <-  X_test[,extract_features]

Step 8: Loading act_labels
y_test[,2] <-  act_labels[y_test[,1]]
names(y_test) <- c("Activity_ID", "Activity_Label")
names(subject_test) <- "subject"

Step 9: Column binding the data
test_data <- cbind(as.data.table(subject_test),y_test, X_test) 

Step 10: Loading and reading  X_test,y_test, and subject_train
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

Step 11: Setting the names of the data from X_train to the names in features
names(X_train) <- features

Step 11: Extracting each mean and standard deviation in X_train
X_train <- X_train[,extract_features]

Step 12: Loading act_labels
y_train[,2] <- act_labels[y_train[,1]]
names(y_train) <- c("Activity_ID", "Activity_Label")
names(subject_train) <- "subject"

Step13: Column binding the data
data1 <- cbind(as.data.table(subject_train),y_train,X_train)

Step 14: Row binding the data
data2 <- rbind(test_data,data1)

Step 15: Merging data1 and data2
id_labels <- c("subject","Activity_ID","Activity_Label")
data_labels <- setdiff(colnames(data2),id_labels)
melt_data <- melt(data2,id = id_labels,measure.vars = data_labels)

Step 16:  Creating independent tidy data set with the average of each variable
for each activity and each subject
tidy_data_UCIHAR <- dcast(melt_data, subject + Activity_Label ~ variable, mean)

Step 17: Creates a file to the directory. The file name is tidy_data_UCIHAR that contains independent tidy data set
write.table(tidy_data_UCIHAR, file = "./tidy_data_UCIHAR.txt")
