rm(list=ls(all=TRUE))
### Environment specific variables
setwd("C:/OneDrive/Documents/Coursera/Cleaning and processing data/UCI HAR Dataset/")
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

# Combine data frames
testingDateset <- data.frame(subjectTests,
                             activityName = activity$activityName,
                             featureVector[,featureVectorIndexes])

# Load the training dataset


### Merge the datasets
#subject_tests => personid
#y => activity
#x => feature vector, extract mean and stdv
#Appropriately labels the data set with descriptive variable names.




# From the data set in step 4, creates a second, independent tidy data set with the average of each variable
# for each activity and each subject.