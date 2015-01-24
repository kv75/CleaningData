# CleaningData
The data set tidy.txt is the result of course project for Getting and Cleaning Data.

It is derived from [human activity recognition using smartphones data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

1. The training (train/X_train.txt) and the test (test/X_test.txt) sets are merged in one data set.
2. The measurements on the mean and standard deviation for each measurement are extracted. These are variables with _mean()_ and _std()_ in their names (variables names are taken from file features.txt). 66 variables satisfy the condition, all other variables are skipped.
3. Variable names are based on the names from file features.txt. Brackets were deleted, and hyphens were replaced with underscores to simplify use of the variable names.
4. Identifiers of the subject and activity labels have been added. Subjects are taken from files train/subject_train.txt and test/subject_test.txt. Identifiers of activities are taken from files train/y_train.txt and test/y_test.txt, then replaced with activity labels using file activity_labels.txt.
5. From this data set, new tidy data set is created by averaging all 66 numeric variables for each subject and activity.

