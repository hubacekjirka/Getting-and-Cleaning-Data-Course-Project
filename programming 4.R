rm(list=ls(all=TRUE))
library(dplyr)
### Environment specific variables
setwd("C:/OneDrive/Documents/Coursera/Cleaning and processing data/UCI HAR Dataset/")
###### This was very unfortunate idea to hardcode the column indicies (facepalm) #####
featureVectorIndexes <- c(
        1:6,
        41:46,
        81:86,
        121:126,
        161:166,
        201:202,
        214:215,
        227:228,
        240:241,
        253:254,
        266:271,
        294:296,
        345:350,
        373:375,
        424:429,
        452:454,
        503:504,
        513,
        516:517,
        526,
        529:530,
        539,
        542:543,
        552,
        555:561)


### Load the testing dataset
subjectTests <- read.table("./test/subject_test.txt",col.names = "personId", colClasses = "integer")
#resolve activity labels
activityType <- read.table("./test/y_test.txt",col.names = "activityId", colClasses = "integer")
activityTypeLabels <- read.table("./activity_labels.txt",col.names = c("activityId","activityName"), colClasses = c("integer","character"))
activity <- merge(activityType,activityTypeLabels,by.x="activityId",by.y="activityId")

featureVector <- read.table("./test/X_test.txt", colClasses = "numeric")

testingDateset <- data.frame(subjectTests,
                             activityName = activity$activityName,
                             featureVector[,featureVectorIndexes])

### Load the training dataset
subjectTests <- read.table("./train/subject_train.txt",col.names = "personId", colClasses = "integer")
#resolve activity labels
activityType <- read.table("./train/y_train.txt",col.names = "activityId", colClasses = "integer")
activityTypeLabels <- read.table("./activity_labels.txt",col.names = c("activityId","activityName"), colClasses = c("integer","character"))
activity <- merge(activityType,activityTypeLabels,by.x="activityId",by.y="activityId")

featureVector <- read.table("./train/X_train.txt", colClasses = "numeric")

trainingDataset <- data.frame(subjectTests,
                             activityName = activity$activityName,
                             featureVector[,featureVectorIndexes])


### Merge the datasets
combinedDataset <- union(testingDateset,trainingDataset) %>%
        tbl_df %>%
        rename(tBodyAcc_mean_x=V1
               ,tBodyAcc_mean_y=V2
               ,tBodyAcc_mean_z=V3
               ,tBodyAcc_std_x=V4
               ,tBodyAcc_std_y=V5
               ,tBodyAcc_std_z=V6
               ,tGravityAcc_mean_x=V41
               ,tGravityAcc_mean_y=V42
               ,tGravityAcc_mean_z=V43
               ,tGravityAcc_std_x=V44
               ,tGravityAcc_std_y=V45
               ,tGravityAcc_std_z=V46
               ,tBodyAccJerk_mean_x=V81
               ,tBodyAccJerk_mean_y=V82
               ,tBodyAccJerk_mean_z=V83
               ,tBodyAccJerk_std_x=V84
               ,tBodyAccJerk_std_y=V85
               ,tBodyAccJerk_std_z=V86
               ,tBodyGyro_mean_x=V121
               ,tBodyGyro_mean_y=V122
               ,tBodyGyro_mean_z=V123
               ,tBodyGyro_std_x=V124
               ,tBodyGyro_std_y=V125
               ,tBodyGyro_std_z=V126
               ,tBodyGyroJerk_mean_x=V161
               ,tBodyGyroJerk_mean_y=V162
               ,tBodyGyroJerk_mean_z=V163
               ,tBodyGyroJerk_std_x=V164
               ,tBodyGyroJerk_std_y=V165
               ,tBodyGyroJerk_std_z=V166
               ,tBodyAccMag_mean=V201
               ,tBodyAccMag_std=V202
               ,tGravityAccMag_mean=V214
               ,tGravityAccMag_std=V215
               ,tBodyAccJerkMag_mean=V227
               ,tBodyAccJerkMag_std=V228
               ,tBodyGyroMag_mean=V240
               ,tBodyGyroMag_std=V241
               ,tBodyGyroJerkMag_mean=V253
               ,tBodyGyroJerkMag_std=V254
               ,fBodyAcc_mean_x=V266
               ,fBodyAcc_mean_y=V267
               ,fBodyAcc_mean_z=V268
               ,fBodyAcc_std_x=V269
               ,fBodyAcc_std_y=V270
               ,fBodyAcc_std_z=V271
               ,fBodyAcc_meanFreq_x=V294
               ,fBodyAcc_meanFreq_y=V295
               ,fBodyAcc_meanFreq_z=V296
               ,fBodyAccJerk_mean_x=V345
               ,fBodyAccJerk_mean_y=V346
               ,fBodyAccJerk_mean_z=V347
               ,fBodyAccJerk_std_x=V348
               ,fBodyAccJerk_std_y=V349
               ,fBodyAccJerk_std_z=V350
               ,fBodyAccJerk_meanFreq_x=V373
               ,fBodyAccJerk_meanFreq_y=V374
               ,fBodyAccJerk_meanFreq_z=V375
               ,fBodyGyro_mean_x=V424
               ,fBodyGyro_mean_y=V425
               ,fBodyGyro_mean_z=V426
               ,fBodyGyro_std_x=V427
               ,fBodyGyro_std_y=V428
               ,fBodyGyro_std_z=V429
               ,fBodyGyro_meanFreq_x=V452
               ,fBodyGyro_meanFreq_y=V453
               ,fBodyGyro_meanFreq_z=V454
               ,fBodyAccMag_mean=V503
               ,fBodyAccMag_std=V504
               ,fBodyAccMag_meanFreq=V513
               ,fBodyBodyAccJerkMag_mean=V516
               ,fBodyBodyAccJerkMag_std=V517
               ,fBodyBodyAccJerkMag_meanFreq=V526
               ,fBodyBodyGyroMag_mean=V529
               ,fBodyBodyGyroMag_std=V530
               ,fBodyBodyGyroMag_meanFreq=V539
               ,fBodyBodyGyroJerkMag_mean=V542
               ,fBodyBodyGyroJerkMag_std=V543
               ,fBodyBodyGyroJerkMag_meanFreq=V552
               ,angle_tBodyAccMean_gravity=V555
               ,angle_tBodyAccJerkMean_gravity_Mean=V556
               ,angle_tBodyGyroMean_gravity_Mean=V557
               ,angle_tBodyGyroJerkMean_gravity_Mean=V558
               ,angle_gravityMean_x=V559
               ,angle_gravityMean_y=V560
               ,angle_gravityMean_z=V561
               )




# From the data set in step 4, creates a second, independent tidy data set with the average of each variable
# for each activity and each subject.
grouppedDataset <- combinedDataset %>%
        group_by(activityName,personId) %>%
        summarize(
                tBodyAcc_mean_x=mean(tBodyAcc_mean_x)
                ,tBodyAcc_mean_y=mean(tBodyAcc_mean_y)
                ,tBodyAcc_mean_z=mean(tBodyAcc_mean_z)
                ,tBodyAcc_std_x=mean(tBodyAcc_std_x)
                ,tBodyAcc_std_y=mean(tBodyAcc_std_y)
                ,tBodyAcc_std_z=mean(tBodyAcc_std_z)
                ,tGravityAcc_mean_x=mean(tGravityAcc_mean_x)
                ,tGravityAcc_mean_y=mean(tGravityAcc_mean_y)
                ,tGravityAcc_mean_z=mean(tGravityAcc_mean_z)
                ,tGravityAcc_std_x=mean(tGravityAcc_std_x)
                ,tGravityAcc_std_y=mean(tGravityAcc_std_y)
                ,tGravityAcc_std_z=mean(tGravityAcc_std_z)
                ,tBodyAccJerk_mean_x=mean(tBodyAccJerk_mean_x)
                ,tBodyAccJerk_mean_y=mean(tBodyAccJerk_mean_y)
                ,tBodyAccJerk_mean_z=mean(tBodyAccJerk_mean_z)
                ,tBodyAccJerk_std_x=mean(tBodyAccJerk_std_x)
                ,tBodyAccJerk_std_y=mean(tBodyAccJerk_std_y)
                ,tBodyAccJerk_std_z=mean(tBodyAccJerk_std_z)
                ,tBodyGyro_mean_x=mean(tBodyGyro_mean_x)
                ,tBodyGyro_mean_y=mean(tBodyGyro_mean_y)
                ,tBodyGyro_mean_z=mean(tBodyGyro_mean_z)
                ,tBodyGyro_std_x=mean(tBodyGyro_std_x)
                ,tBodyGyro_std_y=mean(tBodyGyro_std_y)
                ,tBodyGyro_std_z=mean(tBodyGyro_std_z)
                ,tBodyGyroJerk_mean_x=mean(tBodyGyroJerk_mean_x)
                ,tBodyGyroJerk_mean_y=mean(tBodyGyroJerk_mean_y)
                ,tBodyGyroJerk_mean_z=mean(tBodyGyroJerk_mean_z)
                ,tBodyGyroJerk_std_x=mean(tBodyGyroJerk_std_x)
                ,tBodyGyroJerk_std_y=mean(tBodyGyroJerk_std_y)
                ,tBodyGyroJerk_std_z=mean(tBodyGyroJerk_std_z)
                ,tBodyAccMag_mean=mean(tBodyAccMag_mean)
                ,tBodyAccMag_std=mean(tBodyAccMag_std)
                ,tGravityAccMag_mean=mean(tGravityAccMag_mean)
                ,tGravityAccMag_std=mean(tGravityAccMag_std)
                ,tBodyAccJerkMag_mean=mean(tBodyAccJerkMag_mean)
                ,tBodyAccJerkMag_std=mean(tBodyAccJerkMag_std)
                ,tBodyGyroMag_mean=mean(tBodyGyroMag_mean)
                ,tBodyGyroMag_std=mean(tBodyGyroMag_std)
                ,tBodyGyroJerkMag_mean=mean(tBodyGyroJerkMag_mean)
                ,tBodyGyroJerkMag_std=mean(tBodyGyroJerkMag_std)
                ,fBodyAcc_mean_x=mean(fBodyAcc_mean_x)
                ,fBodyAcc_mean_y=mean(fBodyAcc_mean_y)
                ,fBodyAcc_mean_z=mean(fBodyAcc_mean_z)
                ,fBodyAcc_std_x=mean(fBodyAcc_std_x)
                ,fBodyAcc_std_y=mean(fBodyAcc_std_y)
                ,fBodyAcc_std_z=mean(fBodyAcc_std_z)
                ,fBodyAcc_meanFreq_x=mean(fBodyAcc_meanFreq_x)
                ,fBodyAcc_meanFreq_y=mean(fBodyAcc_meanFreq_y)
                ,fBodyAcc_meanFreq_z=mean(fBodyAcc_meanFreq_z)
                ,fBodyAccJerk_mean_x=mean(fBodyAccJerk_mean_x)
                ,fBodyAccJerk_mean_y=mean(fBodyAccJerk_mean_y)
                ,fBodyAccJerk_mean_z=mean(fBodyAccJerk_mean_z)
                ,fBodyAccJerk_std_x=mean(fBodyAccJerk_std_x)
                ,fBodyAccJerk_std_y=mean(fBodyAccJerk_std_y)
                ,fBodyAccJerk_std_z=mean(fBodyAccJerk_std_z)
                ,fBodyAccJerk_meanFreq_x=mean(fBodyAccJerk_meanFreq_x)
                ,fBodyAccJerk_meanFreq_y=mean(fBodyAccJerk_meanFreq_y)
                ,fBodyAccJerk_meanFreq_z=mean(fBodyAccJerk_meanFreq_z)
                ,fBodyGyro_mean_x=mean(fBodyGyro_mean_x)
                ,fBodyGyro_mean_y=mean(fBodyGyro_mean_y)
                ,fBodyGyro_mean_z=mean(fBodyGyro_mean_z)
                ,fBodyGyro_std_x=mean(fBodyGyro_std_x)
                ,fBodyGyro_std_y=mean(fBodyGyro_std_y)
                ,fBodyGyro_std_z=mean(fBodyGyro_std_z)
                ,fBodyGyro_meanFreq_x=mean(fBodyGyro_meanFreq_x)
                ,fBodyGyro_meanFreq_y=mean(fBodyGyro_meanFreq_y)
                ,fBodyGyro_meanFreq_z=mean(fBodyGyro_meanFreq_z)
                ,fBodyAccMag_mean=mean(fBodyAccMag_mean)
                ,fBodyAccMag_std=mean(fBodyAccMag_std)
                ,fBodyAccMag_meanFreq=mean(fBodyAccMag_meanFreq)
                ,fBodyBodyAccJerkMag_mean=mean(fBodyBodyAccJerkMag_mean)
                ,fBodyBodyAccJerkMag_std=mean(fBodyBodyAccJerkMag_std)
                ,fBodyBodyAccJerkMag_meanFreq=mean(fBodyBodyAccJerkMag_meanFreq)
                ,fBodyBodyGyroMag_mean=mean(fBodyBodyGyroMag_mean)
                ,fBodyBodyGyroMag_std=mean(fBodyBodyGyroMag_std)
                ,fBodyBodyGyroMag_meanFreq=mean(fBodyBodyGyroMag_meanFreq)
                ,fBodyBodyGyroJerkMag_mean=mean(fBodyBodyGyroJerkMag_mean)
                ,fBodyBodyGyroJerkMag_std=mean(fBodyBodyGyroJerkMag_std)
                ,fBodyBodyGyroJerkMag_meanFreq=mean(fBodyBodyGyroJerkMag_meanFreq)
                ,angle_tBodyAccMean_gravity=mean(angle_tBodyAccMean_gravity)
                ,angle_tBodyAccJerkMean_gravity_Mean=mean(angle_tBodyAccJerkMean_gravity_Mean)
                ,angle_tBodyGyroMean_gravity_Mean=mean(angle_tBodyGyroMean_gravity_Mean)
                ,angle_tBodyGyroJerkMean_gravity_Mean=mean(angle_tBodyGyroJerkMean_gravity_Mean)
                ,angle_gravityMean_x=mean(angle_gravityMean_x)
                ,angle_gravityMean_y=mean(angle_gravityMean_y)
                ,angle_gravityMean_z=mean(angle_gravityMean_z)
                )

# export to a file
write.table(grouppedDataset,file="tidy_data.txt",row.name=FALSE)
