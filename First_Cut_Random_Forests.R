# This script trains a Random Forest model based on TJ data and a number of yearly attributes
# saves a sample submission, and plots the relative importance of each variable
# in making predictions

#All data was taken from pitchers before TJ surgery, or those that have not undergone surgery
#Attributes were binned yearly to
#As of now, there is now distinction between starter and closer (may want to change)
#
# install.packages("ggplot2")
# install.packages("randomForest")

library(ggplot2)
library(randomForest)
library(caret)
library(magrittr)
library(e1071)

all_data<- read.csv('../model.csv',   na.strings=c("NA","NaN", " ", "", "-"))

all_data$Percentage.Fastballs <- as.numeric(as.character(all_data$Percentage.Fastballs))
all_data$Percent.Cutting.Pitches<- as.numeric(as.character(all_data$Percent.Cutting.Pitches))

#Ensures that an analysis can be repeated
set.seed(1)

#Set number of testing cases, separate into testing and training
sample_size <- floor(0.75 * nrow(all_data))
train_rows<-sample(1:nrow(all_data), sample_size)

train<-all_data[train_rows,]
test<-all_data[-train_rows,]

#Features to model on
extractFeatures <- function(data) {
  features <- c("Adjusted.Horiz_Release",
                "Horizontal_Flexion",
                "STDEV_Horizontal_Release_Point",
                "Vertical_Release_Point",
                "STDEV_Vertical_Release_Point",
                "Maximum_Speed",
                "Overall_Number_Thrown",
                "Percentage.Fastballs",
                "Percent.Cutting.Pitches",
                "Percent.Curves",
                "Percent.Change")

  fea <- data[,features]
  return(fea)
}

rf <- randomForest(extractFeatures(train), as.factor(train$Before.TJ), ntree=100, importance=TRUE)

# summarize details
result <- data.frame(pitcher = test$pitcher)
result$prediction <- predict(rf, extractFeatures(test))
compare_results<-cbind(result,test$Before.TJ   )
# create confusion matrix
confusionMatrix(test$Before.TJ   ,result$prediction)
%>%
  capture.output(file = "results/conf_matrix_rockfence_1.txt")



