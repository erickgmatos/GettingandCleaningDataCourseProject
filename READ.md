run_analysis.R
================

## READ ME

This script initially reads the files “features.txt” of the data and
filter the “mean()” and “std()” variables to create a column subset of
the “X_train.txt” and “X_test” files.

Then it reads both train and test files, like subject “subject\_\*.txt”,
activity labels “y\_\*.txt” and measuments filtering the
“X_train/X_test” in the columns of interest before merging then into one
individually “train” or “test” data.frame.

Then it remove the X_train and X_test data read from the environment to
clear RAM space used. Full join the “train” or “test” data.frame into
the “measures” data.frame and removes “train” and “test” data.frame.

Finally, it groups by subject and by activity in “measures”, average the
values in those groups and writes the result in “measuresStd.txt”.  


## CODE BOOK

| Variable        | Description                                                                |
|:----------------|:---------------------------------------------------------------------------|
| activity_labels | Receive the table from file “activity_labels.txt”                          |
| features        | Receive the table from file “features.txt”                                 |
| subs            | Receives a subset of columns that are “mean()” or “std()”                  |
| subject_train   | Receives the table from file “train/subject_train.txt”                     |
| X_train         | Receives the table from file “train/X_train.txt” and then filtered by subs |
| train           | Bind by column all the train files                                         |
| X_test          | Receives the table from file “test/X_test.txt” and then filtered by subs   |
| y_test          | Receives the table from file “test/y_test.txt”                             |
| test            | Bind by column all the test files                                          |
| measures        | Join of train and test files                                               |
| measuresStd     | Average of measures variables grouped by activity and by subject           |
