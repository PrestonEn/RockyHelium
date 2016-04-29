library(dplyr)
library(magrittr)
library(caret)
library(randomForest)

tjs <- na.omit(tbl_df(read.csv("data/tjs_data_fin.csv")))
control.53 <- tbl_df(read.csv("data/control_53_examples_1.csv"))
#control.106 <- tbl_df(read.csv("data/control_106_examples_1.csv"))
#control.159 <- tbl_df(read.csv("data/control_159_examples_1.csv"))
control.212 <- tbl_df(read.csv("data/control_216_examples_4.csv"))

# bind tjs and controls
rset.53 <- rbind(tjs, control.53)
#rset.106 <- rbind(tjs, control.106)
#rset.159 <- rbind(tjs, control.159)
rset.212 <- rbind(tjs, control.212)
# shuffle
rset.53 <- rset.53[sample(1:nrow(rset.53)), ]
#rset.106 <- rset.106[sample(1:nrow(rset.106)), ]
#rset.159 <- rset.159[sample(1:nrow(rset.159)), ]
rset.212 <- rset.212[sample(1:nrow(rset.212)), ]

# write summary of datasets to files
summary(rset.53) %>%
  capture.output(file = "results/rset-53.txt")
summary(rset.212) %>%
  capture.output(file = "results/rset-212_4.txt")

# write standard deviation data to files
sapply(rset.53, sd) %>%
  capture.output(file = "results/rset-53-SD.txt")
sapply(rset.212, sd) %>%
  capture.output(file = "results/rset-212-SD_4.txt")

# attempt PCA on largest dataset - 4:1 control-case ratio
#pca <- prcomp(rset.212[,!(names(rset.212) %in% c('key_bbref','mlbam_id', 'prev_yearID', 'yearID', 'tjs_label'))])

# write PCA summary data
#summary(pca) %>%
#  capture.output(file = "results/pca.txt")

## split training data into train batch and test batch
# 80/20 split
set.seed(313)
training.rows <- createDataPartition(rset.212$tjs_label, 
                                     p = 0.8, list = FALSE)
train.batch <- rset.212[training.rows, ]
test.batch <- rset.212[-training.rows, ]

# logistic regression
TJS.logit <- glm(tjs_label~.-mlbam_id -yearID -tjs_label, data = train.batch, family= binomial("logit"))
# print to file
TJS.logit %>%
  capture.output(file = "results/logit-train.txt")

# chi-sq test
TJS.chisq <- anova(TJS.logit, test="Chisq")
# print to file
TJS.chisq %>%
  capture.output(file = "results/chi-sq.txt")

# logistic regression
TJS.logit.pc <- glm(tjs_label~Cutter.y + Fourseam.y, data = train.batch, family= binomial("logit"))
# print to file
TJS.logit.pc %>%
  capture.output(file = "results/logit-train-pc.txt")

# not features
extractFeatures <- function(data) {
  fea <- data[,!names(data) %in% c("key_bbref","mlbam_id","prev_yearID", "yearID", "tjs_label")]
  return(fea)
}

#Run RandomForest Algorithm
rf <- randomForest(extractFeatures(train.batch), as.factor(train.batch$tjs_label), ntree=100, importance=TRUE)
# summarize details
result <- data.frame(mlbam_id = test.batch$mlbam_id)
result$prediction <- predict(rf, extractFeatures(test.batch))
compare_results<-cbind(result,test.batch$tjs_label)
# create confusion matrix
confusionMatrix(test.batch$tjs_label,result$prediction) %>%
  capture.output(file = "results/conf_matrix_rf_4.txt")

