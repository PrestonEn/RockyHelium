library(dplyr)
library(magrittr)
library(caret)
tjs <- na.omit(tbl_df(read.csv("data/tjs_data_fin.csv")))
control.53 <- tbl_df(read.csv("data/control_53_examples_1.csv"))
control.106 <- tbl_df(read.csv("data/control_106_examples_1.csv"))
control.159 <- tbl_df(read.csv("data/control_159_examples_1.csv"))
control.212 <- tbl_df(read.csv("data/control_212_examples_1.csv"))

# bind tjs and controls
rset.53 <- rbind(tjs, control.53)
rset.106 <- rbind(tjs, control.106)
rset.159 <- rbind(tjs, control.159)
rset.212 <- rbind(tjs, control.212)
# shuffle
rset.53 <- rset.54[sample(1:nrow(rset.53)), ]
rset.106 <- rset.106[sample(1:nrow(rset.106)), ]
rset.159 <- rset.159[sample(1:nrow(rset.159)), ]
rset.212 <- rset.212[sample(1:nrow(rset.212)), ]

# write summary of datasets to files
summary(rset.53) %>%
  capture.output(file = "results/rset-53.txt")
summary(rset.106) %>%
  capture.output(file = "results/rset-106.txt")
summary(rset.159) %>%
  capture.output(file = "results/rset-159.txt")
summary(rset.212) %>%
  capture.output(file = "results/rset-212.txt")

# write standard deviation data to files
sapply(rset.53, sd) %>%
  capture.output(file = "results/rset-53-SD.txt")
sapply(rset.106, sd) %>%
  capture.output(file = "results/rset-106-SD.txt")
sapply(rset.159, sd) %>%
  capture.output(file = "results/rset-159-SD.txt")
sapply(rset.212, sd) %>%
  capture.output(file = "results/rset-212-SD.txt")

# attempt PCA on largest dataset - 4:1 control-case ratio
pca <- prcomp(rset.212[,!(names(rset.212) %in% c('key_bbref','mlbam_id', 'prev_yearID', 'yearID', 'tjs_label'))])

# write PCA summary data
summary(pca) %>%
  capture.output(file = "results/pca.txt")

## split training data into train batch and test batch
# 80/20 split
set.seed(313)
training.rows <- createDataPartition(rset.53$tjs_label, 
                                     p = 0.8, list = FALSE)
train.batch <- df.train.munged[training.rows, ]
test.batch <- df.train.munged[-training.rows, ]