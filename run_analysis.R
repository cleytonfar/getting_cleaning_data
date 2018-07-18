
## LOADING THE PACKAGES:
library(data.table)
library(dplyr)


## 1. Merges the training and the test sets to create one data set.

## READING THE INDEPENDENT VARIABLES FROM TRAINING AND TEST SET:
foo_X_train <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/train/X_train.txt")
foo_X_test <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/test/X_test.txt")

## READING THE DEPENDENT VARIABLE FROM TRAINING AND TEST SET:
foo_Y_train <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/train/y_train.txt")
foo_Y_test <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/test/y_test.txt")

## BINDING ROWS FROM TRAINING AND TEST SET:
foo_X <- bind_rows(foo_X_train, foo_X_test)
foo_Y <- bind_rows(foo_Y_train, foo_Y_test)

## READING THE NAMES OF EACH VARIABLE:
temp <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/features.txt")

## RENAMING THE VARIABLES WITH THE LIST OF ALL FEATURES:
colnames(foo_X) <- temp$V2


## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
sd_mean <- c(grep(pattern = "mean()", x = colnames(foo_X), ignore.case = F, value = T, fixed = T),
             grep(pattern = "std()", x = colnames(foo_X), ignore.case = F, value = T, fixed = T))

## SELECTING THE VARIABLES REPRESENTING THE MEAN AND STD ON EACH MEASUREMENT:
dt <- foo_X[, sd_mean, with = F]


## 3. Uses descriptive activity names to name the activities in the data set:

## READING THE ACTIVITY LABELS:
activity_labels <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/activity_labels.txt")
activity_labels <- rename(activity_labels, activity_name = V2)

## JOIN THE DEPENDENT VARIABLE WITH THE ACTIVITY LABEL:
foo_YY <- left_join(foo_Y, activity_labels, by = c("V1")) %>% 
    as.data.table()

## BINDING DEPENDENT VARIABLE WITH INDENPENDENT VARIABLES:
foo <- bind_cols(select(foo_YY, activity_name), dt)

## READING THE SUBJECT VARIABLE:
subject_train <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/train/subject_train.txt")
subject_test <- fread("./final_project/getting_cleaning_data/UCI HAR Dataset/test/subject_test.txt")

## JOINING WITH THE DATASET:
foo <- bind_cols(foo, bind_rows(subject_train, subject_test))
foo <- rename(foo, subject = V1)
foo

## 5. From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject.
foo2 <- foo[, lapply(.SD, mean), by = .(activity_name, subject)]

## SAVING THE TIDY DATA:
fwrite(foo2, file = "./final_project/getting_cleaning_data/tidy_data.txt", 
       row.names = F)

