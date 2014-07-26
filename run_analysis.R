# run_analysis.R - main script for tidy data exercise
# 
# Author: BC
###############################################################################

library(data.table)
options(width=10000)
setwd("C:/Users/caldweb7/devl/getting_cleaning_data/")

prepareDataSet <- function(a.ds, f.ds, s.ds, x.ds, y.ds, set.name) {
	#	 Appends activity id/name and subject to the dataset
	#	  merges all of the results into a single dataset
	#	
	#	 Args:
	#	    a.ds: activity name lookup dataset
	#		s.ds: subject who performed the activity ds
	#		x.ds: observation set
	#		y.ds: observation lables
	#		set.name
	#	
	#	 Returns:
	#	   data.frame with aggregated results
		
	#	Rename the measurement w/ the correct names
	colnames(x.ds) <- as.matrix(f.ds[3])
	
	#	Lookup the activity name from the lookup file
	colnames(y.ds) <- c("activity.id")
	
	# Append additional information and merge datasets
	ds <- cbind(x.ds, s.ds, y.ds)
	ds <- merge(ds, a.ds)

	ds$set = set.name
	return(ds)
}

renameFeatures <- function(column.name) {
	#	 Renames features into a friendlier fashion
	#	
	#	 Args:
	#	    column.name: frame names
	#	
	#	 Returns:
	#	    list of column names
	column.name <- gsub("tBody", "Time.Body", column.name)
	column.name <- gsub("tGravity", "Time.Gravity", column.name)
	column.name <- gsub("fBody", "FFT.Body", column.name)
	column.name <- gsub("fGravity", "FFT.Gravity", column.name)
	column.name <- gsub("Acc", ".Acceleration.", column.name)
	column.name <- gsub("\\-mean\\(\\)\\-", ".Mean.", column.name)
	column.name <- gsub("\\-std\\(\\)\\-", ".Std.", column.name)
	column.name <- gsub("\\-mean\\(\\)", ".Mean", column.name)
	column.name <- gsub("\\-std\\(\\)", ".Std", column.name)
	return(column.name)
}

generateVariableAverageDataset <- function(tidy.ds) {
	#	 Generates an independent tidy data set with averages of 
	#		for each variable
	#	
	#	 Args:
	#	    tidy.ds: tidy data set to calculate averages for
	#	
	#	 Returns:
	#	    none: outputs file
	
	options(datatable.optimize=1)
	tidy.ds <- data.table(ds.tidy)
	mean.ds <- tidy.ds[, lapply(.SD, mean), by=c("Subject","Activity")]
	mean.ds <- mean.ds[order(mean.ds$Subject),]
	write.table(mean.ds, file="tidy.avg.ds.txt")
	
}

generateTidyDataset <- function() {
	#	 Generates an independent tidy data set with averages of 
	#		for each variable
	#	
	#	 Args:
	#	    tidy.ds: tidy data set to calculate averages for
	#	
	#	 Returns:
	#	    none: outputs file
	
	# Read in all input files and rename columns where necessary
	activity.labels <- read.table(paste0(getwd(),"/","activity_labels.txt"))
	colnames(activity.labels) <- c("activity.id","activity.name")
	
	features.labels <- read.table(paste0(getwd(),"/","features.txt"))
	features.names <- lapply(features.labels[2],renameFeatures)
	features.labels$tidy.name <- features.names$V2
	colnames(features.labels) <- c("feature.id","feature.name","feature.tidy.name")
	
	train.x.ds <- read.table(paste0(getwd(),"/","train/X_train.txt"))
	train.y.ds <- read.table(paste0(getwd(),"/","train/y_train.txt"))
	train.subjects.ds <- read.table(paste0(getwd(),"/","train/subject_train.txt")) #subject who performed the activity for each window sample.
	colnames(train.subjects.ds) <- c("subject.id")
	
	train.ds <- prepareDataSet(activity.labels, features.labels, train.subjects.ds, train.x.ds, train.y.ds, "train")
	
	test.x.ds <- read.table(paste0(getwd(),"/","test/X_test.txt"))
	test.y.ds <- read.table(paste0(getwd(),"/","test/y_test.txt"))
	test.subjects.ds <- read.table(paste0(getwd(),"/","test/subject_test.txt")) #subject who performed the activity for each window sample.
	colnames(test.subjects.ds) <- c("subject.id")
	
	test.ds <- prepareDataSet(activity.labels, features.labels, test.subjects.ds, test.x.ds, test.y.ds, "test")
	
	ds <- rbind(train.ds,test.ds)
	
	# Specify which columns to keep; only the mean's, standard deviation's and respective merged columns
	cols.to.keep <- c("subject.id","activity.name",grep("Mean[^F]", colnames(ds), value = TRUE), grep("Std", colnames(ds), value = TRUE))
	
	ds.tidy <- ds[,cols.to.keep]
	colnames(ds.tidy)[1] <- "Subject"
	colnames(ds.tidy)[2] <- "Activity"
	
	return(ds.tidy)
}

message("--Creating tidy dataset--")
ds.tidy <- generateTidyDataset()
message("--Outputing tidy dataset--")
write.table(ds.tidy, file="tidy.ds.txt")

message("--Creating average tidy dataset--")
generateVariableAverageDataset(ds.tidy)
message("--Application finished--")

