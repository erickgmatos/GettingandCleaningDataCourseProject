---
title: "run_analysis.R"
output: html_document
---
## READ ME

This script initially reads the files "features.txt" of the data and filter the 
"mean()" and "std()" variables to create a column subset of the "X_train.txt" 
and "X_test" files.\n

Then it reads both train and test files, like subject "subject_\*.txt", activity
labels "y_\*.txt" and measuments filtering the "X_train/X_test" in the columns 
of interest before merging then into one individually "train" or "test" 
data.frame.\n

Then it remove the X_train and X_test data read from the environment to clear 
RAM space used. Full join the "train" or "test" data.frame into the "measures" 
data.frame and removes "train" and "test" data.frame.\n

Finally, it groups by subject and by activity in "measures", average the values 
in those groups and writes the result in "measuresStd.txt".\n


## CODE BOOK

activity_labels Receive the table from file "activity_labels.txt"\n
features        Receive the table from file "features.txt"\n             
subs            Receives a subset of columns that are "mean()" or "std()"\n
subject_train   Receives the table from file "train/subject_train.txt"\n
X_train         Receives the table from file "train/X_train.txt" and then filtered by subs.\n
y_train         Receives the table from file "train/y_train.txt".\n
train           Bind by column all the train files.\n
X_test          Receives the table from file "test/X_test.txt" and then filtered by subs.\n
y_test          Receives the table from file "test/y_test.txt".\n
test            Bind by column all the test files.\n
measures        Join of train and test files\n
measuresStd     Average of measures variables grouped by activity and by subject.



