
## -- Read the Test Dataset --
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

## -- Read the Training Dataset --
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

## -- Read the other required tables --
features <- read.table("features.txt")
activities <- read.table("activity_labels.txt")

## -- Find those columns in features which have min or std --
req_col <- grep("-(mean|std)\\(\\)",features[,2])

## Apply the above subsetting to both test and train data
x_test_req <- x_test[,req_col]
x_train_req <- x_train[,req_col]


## Change the column names using req_col
names(x_test_req) <- features[req_col,2]
names(x_train_req) <- features[req_col,2]


## Change the activity to descriptive values
y_test[,1]<-activities[y_test[,1],2]
y_train[,1]<-activities[y_train[,1],2]

## Change the column names for the subjects and activities 
names(y_test) <- c("Activity_desc")
names(y_train) <- c("Activity_desc")
names(subject_test) <- c("Subject_ID")
names(subject_train) <- c("Subject_ID")

## Colbind the test datasets 
Test_full <- cbind(subject_test,y_test,x_test_req)

## Colbind the training datasets 
Train_full <- cbind(subject_train,y_train,x_train_req)

## Rowbind the test and training datsets to get the final clean data
Final_data <- rbind(Test_full,Train_full)

## Obtain the second clean dataset
Final_mean <- aggregate(Final_data[,3:68], by = list(Subject_ID = Final_data$Subject_ID , Activity_desc = Final_data$Activity_desc),mean)

write.table(Final_mean,"Tidy_data.txt",row.name = FALSE)
