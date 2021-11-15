# Run analysis on train and test measurements of Samsung Data
# For more details, access the file READ.md.

library(dplyr)
activity_labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subs<-grep("std\\(\\)|mean\\(\\)", features$V2)
subject_train <- read.table("train/subject_train.txt", col.names = "subject")
X_train <- read.table("train/X_train.txt", col.names = features[,2])
X_train <- X_train[,subs]
y_train <- read.table("train/y_train.txt", col.names = "activity")
train <-  cbind(subject_train, y_train, X_train)
subject_test<- read.table("test/subject_test.txt", col.names = "subject")
X_test <- read.table("test/X_test.txt", col.names = features[,2])
X_test <- X_test[,subs]
y_test <- read.table("test/y_test.txt", col.names = "activity")
test <- cbind(subject_test, y_test, X_test)
rm(X_test,X_train)
measures <- full_join(train, test)
rm(train,test)
measures$activity <- factor(measures$activity,levels = activity_labels[,1], labels = activity_labels[,2])

measuresStd <- measures %>% group_by(subject,activity) %>% 
        summarise_all(funs(mean))
write.table(measuresStd, "measuresStd.txt", row.names = FALSE)
