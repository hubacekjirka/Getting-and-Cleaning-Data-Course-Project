# Codebook for Getting and Cleaning Data Course Project assignment

## About
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
For each record it is provided:
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
This file consists of information on data processing, variables and their description, and data lineage.


## Study design
Data were retrieved from UCI's Machine learning repository at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones. Files' description may be found in the README.md included in this repository.

### Data transformation
The following instuctions were being performed on both testing and training dataset.
Files included:
 - subject_test.txt
 - y_test.txt
 - activity_labels.txt
 - X_test.txt - only a set of column was retrieved - check the Codebook section
 
 Datasets from files y_test and activity_labels were merged in order to retrieve acitivty id's labels.
 The result was combined with X_test and subject_test data sets to create a dataframe.
 
 Dataframes for testing and training data were unioned. The outcome was grouped by activity and person id and mean was computed for each variable. The resul was exported into the tidy_data.txt text file.
 

## Codebook
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

All values were normalised and bounded within [-1,1]. The following table contains variable names mapping of the original dataset to the new one.

|Ordinal value|Original name|Ordinal value|New name|
|--------|---------|---------|---------|
|1|tBodyAcc_mean()_X|1| tBodyAcc_mean_x|
|2|tBodyAcc_mean()_Y|2|tBodyAcc_mean_y|
|3|tBodyAcc_mean()_Z|3|tBodyAcc_mean_z|
|4|tBodyAcc_std()_X|4|tBodyAcc_std_x|
|5|tBodyAcc_std()_Y|5|tBodyAcc_std_y|
|6|tBodyAcc_std()_Z|6|tBodyAcc_std_z|
|41|tGravityAcc_mean()_X|41|tGravityAcc_mean_x|
|42|tGravityAcc_mean()_Y|42|tGravityAcc_mean_y|
|43|tGravityAcc_mean()_Z|43|tGravityAcc_mean_z|
|44|tGravityAcc_std()_X|44|tGravityAcc_std_x|
|45|tGravityAcc_std()_Y|45|tGravityAcc_std_y|
|46|tGravityAcc_std()_Z|46|tGravityAcc_std_z|
|81|tBodyAccJerk_mean()_X|81|tBodyAccJerk_mean_x|
|82|tBodyAccJerk_mean()_Y|82|tBodyAccJerk_mean_y|
|83|tBodyAccJerk_mean()_Z|83|tBodyAccJerk_mean_z|
|84|tBodyAccJerk_std()_X|84|tBodyAccJerk_std_x|
|85|tBodyAccJerk_std()_Y|85|tBodyAccJerk_std_y|
|86|tBodyAccJerk_std()_Z|86|tBodyAccJerk_std_z|
|121|tBodyGyro_mean()_X|121|tBodyGyro_mean_x|
|122|tBodyGyro_mean()_Y|122|tBodyGyro_mean_y|
|123|tBodyGyro_mean()_Z|123|tBodyGyro_mean_z|
|124|tBodyGyro_std()_X|124|tBodyGyro_std_x|
|125|tBodyGyro_std()_Y|125|tBodyGyro_std_y|
|126|tBodyGyro_std()_Z|126|tBodyGyro_std_z|
|161|tBodyGyroJerk_mean()_X|161|tBodyGyroJerk_mean_x|
|162|tBodyGyroJerk_mean()_Y|162|tBodyGyroJerk_mean_y|
|163|tBodyGyroJerk_mean()_Z|163|tBodyGyroJerk_mean_z|
|164|tBodyGyroJerk_std()_X|164|tBodyGyroJerk_std_x|
|165|tBodyGyroJerk_std()_Y|165|tBodyGyroJerk_std_y|
|166|tBodyGyroJerk_std()_Z|166|tBodyGyroJerk_std_z|
|201|tBodyAccMag_mean()|201|tBodyAccMag_mean|
|202|tBodyAccMag_std()|202|tBodyAccMag_std|
|214|tGravityAccMag_mean()|214|tGravityAccMag_mean|
|215|tGravityAccMag_std()|215|tGravityAccMag_std|
|227|tBodyAccJerkMag_mean()|227|tBodyAccJerkMag_mean|
|228|tBodyAccJerkMag_std()|228|tBodyAccJerkMag_std|
|240|tBodyGyroMag_mean()|240|tBodyGyroMag_mean|
|241|tBodyGyroMag_std()|241|tBodyGyroMag_std|
|253|tBodyGyroJerkMag_mean()|253|tBodyGyroJerkMag_mean|
|254|tBodyGyroJerkMag_std()|254|tBodyGyroJerkMag_std|
|266|fBodyAcc_mean()_X|266|fBodyAcc_mean_x|
|267|fBodyAcc_mean()_Y|267|fBodyAcc_mean_y|
|268|fBodyAcc_mean()_Z|268|fBodyAcc_mean_z|
|269|fBodyAcc_std()_X|269|fBodyAcc_std_x|
|270|fBodyAcc_std()_Y|270|fBodyAcc_std_y|
|271|fBodyAcc_std()_Z|271|fBodyAcc_std_z|
|294|fBodyAcc_meanFreq()_X|294|fBodyAcc_meanFreq_x|
|295|fBodyAcc_meanFreq()_Y|295|fBodyAcc_meanFreq_y|
|296|fBodyAcc_meanFreq()_Z|296|fBodyAcc_meanFreq_z|
|345|fBodyAccJerk_mean()_X|345|fBodyAccJerk_mean_x|
|346|fBodyAccJerk_mean()_Y|346|fBodyAccJerk_mean_y|
|347|fBodyAccJerk_mean()_Z|347|fBodyAccJerk_mean_z|
|348|fBodyAccJerk_std()_X|348|fBodyAccJerk_std_x|
|349|fBodyAccJerk_std()_Y|349|fBodyAccJerk_std_y|
|350|fBodyAccJerk_std()_Z|350|fBodyAccJerk_std_z|
|373|fBodyAccJerk_meanFreq()_X|373|fBodyAccJerk_meanFreq_x|
|374|fBodyAccJerk_meanFreq()_Y|374|fBodyAccJerk_meanFreq_y|
|375|fBodyAccJerk_meanFreq()_Z|375|fBodyAccJerk_meanFreq_z|
|424|fBodyGyro_mean()_X|424|fBodyGyro_mean_x|
|425|fBodyGyro_mean()_Y|425|fBodyGyro_mean_y|
|426|fBodyGyro_mean()_Z|426|fBodyGyro_mean_z|
|427|fBodyGyro_std()_X|427|fBodyGyro_std_x|
|428|fBodyGyro_std()_Y|428|fBodyGyro_std_y|
|429|fBodyGyro_std()_Z|429|fBodyGyro_std_z|
|452|fBodyGyro_meanFreq()_X|452|fBodyGyro_meanFreq_x|
|453|fBodyGyro_meanFreq()_Y|453|fBodyGyro_meanFreq_y|
|454|fBodyGyro_meanFreq()_Z|454|fBodyGyro_meanFreq_z|
|503|fBodyAccMag_mean()|503|fBodyAccMag_mean|
|504|fBodyAccMag_std()|504|fBodyAccMag_std|
|513|fBodyAccMag_meanFreq()|513|fBodyAccMag_meanFreq|
|516|fBodyBodyAccJerkMag_mean()|516|fBodyBodyAccJerkMag_mean|
|517|fBodyBodyAccJerkMag_std()|517|fBodyBodyAccJerkMag_std|
|526|fBodyBodyAccJerkMag_meanFreq()|526|fBodyBodyAccJerkMag_meanFreq|
|529|fBodyBodyGyroMag_mean()|529|fBodyBodyGyroMag_mean|
|530|fBodyBodyGyroMag_std()|530|fBodyBodyGyroMag_std|
|539|fBodyBodyGyroMag_meanFreq()|539|fBodyBodyGyroMag_meanFreq|
|542|fBodyBodyGyroJerkMag_mean()|542|fBodyBodyGyroJerkMag_mean|
|543|fBodyBodyGyroJerkMag_std()|543|fBodyBodyGyroJerkMag_std|
|552|fBodyBodyGyroJerkMag_meanFreq()|552|fBodyBodyGyroJerkMag_meanFreq|
|555|angle(tBodyAccMean,gravity)|555|angle_tBodyAccMean_gravity|
|556|angle(tBodyAccJerkMean),gravityMean)|556|angle_tBodyAccJerkMean_gravity_Mean|
|557|angle(tBodyGyroMean,gravityMean)|557|angle_tBodyGyroMean_gravity_Mean|
|558|angle(tBodyGyroJerkMean,gravityMean)|558|angle_tBodyGyroJerkMean_gravity_Mean|
|559|angle(X,gravityMean)|559|angle_gravityMean_x|
|560|angle(Y,gravityMean)|560|angle_gravityMean_y|
|561|angle(Z,gravityMean)|561|angle_gravityMean_z|
