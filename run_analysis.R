library("plyr")
dftrain <- read.table("train/X_train.txt")
dftrain_subject <- read.table("train/subject_train.txt")
dftrain_activity <- read.table("train/y_train.txt")
dftest <- read.table("test/X_test.txt")
dftest_subject <- read.table("test/subject_test.txt")
dftest_activity <- read.table("test/y_test.txt")
dffeatures <- read.table("features.txt", stringsAsFactors=FALSE)
dfactivities <- read.table("activity_labels.txt", stringsAsFactors=FALSE)
dffull <- rbind(dftrain, dftest)
df_subject <- rbind(dftrain_subject, dftest_subject)
colnames(df_subject) <- c("Subject")
df_activity <- rbind(dftrain_activity, dftest_activity)
colnames(df_activity) <- c("Activity")

good_columns <- grepl("mean\\(\\)|std\\(\\)", dffeatures[,2])
df_extracted <- dffull[,good_columns]

mean_stds <- dffeatures[good_columns,]
colnames(df_extracted) <- gsub("\\(\\)", "", gsub("-", "_", mean_stds[,2]))

df_activity$Activity <- dfactivities[df_activity$Activity,2]
df <- cbind(df_subject, df_activity, df_extracted)

df_tidy<-ddply(df, .(Subject, Activity), numcolwise(mean))

write.table(df_tidy, file="tidy.txt", row.names=FALSE)