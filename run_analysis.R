run_analysis <- function() {
    library(dplyr)
    library(reshape2)
    setwd("/Users/shantanupawar/Desktop/Coursera/Getting and Cleaning Data/Directory/Project/")
    features <- read.table("features.txt")
    features1 <- vector(mode = "character", length = length(features$V2))
    features1 <- features$V2
    xte <- read.table("X_test.txt")
    yte <- read.table("Y_test.txt")
    subte <- read.table("subject_test.txt")
    xtr <- read.table("X_train.txt")
    ytr <- read.table("Y_train.txt")
    subtr <- read.table("subject_train.txt")
    colnames(xte) <- make.names(features1[1:561], unique = TRUE)
    colnames(xtr) <- make.names(features1[1:561], unique = TRUE)
    ytr <- ytr[,1]
    ytr1 <- vector(mode = "character", length = 7352)
    for(i in 1:7352) {
        if (ytr[i]==1) {ytr1[i]="WALKING"}
        if (ytr[i]==2) {ytr1[i]="WALKING_UPSTAIRS"}
        if (ytr[i]==3) {ytr1[i]="WALKING_DOWNSTAIRS"}
        if (ytr[i]==4) {ytr1[i]="SITTING"}
        if (ytr[i]==5) {ytr1[i]="STANDING"}
        if (ytr[i]==6) {ytr1[i]="LAYING"}
    }
    yte <- yte[,1]
    yte1 <- vector(mode = "character", length = 2947)
    for(i in 1:2947) {
        if (yte[i]==1) {yte1[i]="WALKING"}
        if (yte[i]==2) {yte1[i]="WALKING_UPSTAIRS"}
        if (yte[i]==3) {yte1[i]="WALKING_DOWNSTAIRS"}
        if (yte[i]==4) {yte1[i]="SITTING"}
        if (yte[i]==5) {yte1[i]="STANDING"}
        if (yte[i]==6) {yte1[i]="LAYING"}
    }
    xte$Activity <- yte1
    xtr$Activity <- ytr1
    xte$Subject <- subte[,1]
    xtr$Subject <- subtr[,1]
    xt <- rbind(xtr, xte)
    xt1 <- select(xt, matches(c("mean"), ignore.case = TRUE))
    xt2 <- select(xt, matches(c("std"), ignore.case = TRUE))
    xt3 <- select(xt, Activity)
    xt4 <- select(xt, Subject)
    xt5 <- cbind(xt1, xt2, xt3, xt4)
    xt6 <- xt5 %>% group_by(Activity,Subject) %>% summarise_each(funs(mean))
  	print(xt6)
}