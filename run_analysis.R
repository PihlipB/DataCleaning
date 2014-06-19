

setwd("~/UCI HAR Dataset/")

subjectTest<-read.table("~/UCI HAR Dataset/test/subject_test.txt")
Xtest<-read.table("~/UCI HAR Dataset/test/X_test.txt")
Ytest<-read.table("~/UCI HAR Dataset/test/Y_test.txt")
subjectTrain<-read.table("~/UCI HAR Dataset/train/subject_train.txt")
Xtrain<-read.table("~/UCI HAR Dataset/train/X_train.txt")
Ytrain<-read.table("~/UCI HAR Dataset/train/Y_train.txt")

testdata<-rbind(Xtrain,Xtest)
SDdata<-apply(testdata[,1:561],1,function(x) sd(x))
Meandata<-apply(testdata[,1:561],1,function(x) mean(x))
Subject<-rbind(subjectTest,subjectTrain)
Y<-rbind(Ytest,Ytrain)
Fulldata<-cbind(Subject,Y,Meandata,SDdata)
colnames(Fulldata)<-c("Subject","Activity","Mean","Standard Deviation")
for(i in 1:10299){
  if(Fulldata$Activity[i]==1){Fulldata$Activity[i]="Walking"}
  if(Fulldata$Activity[i]==2){Fulldata$Activity[i]="Walking_UpStairs"}
  if(Fulldata$Activity[i]==3){Fulldata$Activity[i]="Walking_DownStairs"}
  if(Fulldata$Activity[i]==4){Fulldata$Activity[i]="Sitting"}
  if(Fulldata$Activity[i]==5){Fulldata$Activity[i]="Standing"}
  if(Fulldata$Activity[i]==6){Fulldata$Activity[i]="Laying"}
}
