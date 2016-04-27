# script to construct master list of tjs and control pitchers
# pitchers have been selected from respective sets based on having 2
# consecutive years of stats in chadwick bureau. 

library(magrittr)

# load all data files
pitchers.cnt <- read.csv("data/control_pitchers_2_cons.csv")
pitchers.tjs <- read.csv("data/tjs_pitchers_2_cons.csv")
cntl.id <- read.csv("data/control_pitchers_mlbamid.csv")
cntl.pcnt <- read.csv("data/pitchcnt_control_pitchers.csv")
cnt.pfx <- read.csv("data/pitchfx_control_pitchers.csv")
tjs.pcnt <- read.csv("data/pitchcnt_tjs_pitchers.csv")
tjs.pfx <- read.csv("data/pitchfx_tjs_pitchers.csv")

# control pitchers is missing mlbam_id - can drop playerID after
pitchers.cnt <- merge(pitchers.cnt, cntl.id, by.x = "playerID", by.y = "key_bbref")
pitchers.cnt$playerID <- NULL
pitchers.cnt <- pitchers.cnt[,c(8,1:7)]
colnames(pitchers.cnt)[1] <- "mlbam_id"
# drop playerID from TJS as well
pitchers.tjs$playerID <- NULL

# replace NA in pitchcnt to 0
tjs.pcnt[is.na(tjs.pcnt)] <- 0
cntl.pcnt[is.na(cntl.pcnt)] <- 0

# merge stats with pitch counts
tjs.merged <- merge(pitchers.tjs, tjs.pcnt, by.x = c("mlbam_id", "yearID"), by.y = c("mlbam_id", "year"))
cntl.merged <- merge(pitchers.cnt, cntl.pcnt, by.x = c("mlbam_id", "yearID"), by.y = c("mlbam_id", "year"))

# replace NA in pitchfx to 0
tjs.pfx[is.na(tjs.pfx)] <- 0
cnt.pfx[is.na(cnt.pfx)] <- 0

# reshape pitchfx data tables
tjs.pfx.wide <- reshape(tjs.pfx, timevar = "pfx_var", idvar = c("mlbam_id", "Year"), direction = "wide")
cnt.pfx.wide <- reshape(cnt.pfx, timevar = "pfx_var", idvar = c("mlbam_id", "Year"), direction = "wide")

# merge pitchfx data
tjs.merged.complete <- merge(tjs.merged, tjs.pfx.wide, by.x = c("mlbam_id", "yearID"), by.y = c("mlbam_id", "Year"))
cntl.merged.complete <- merge(cntl.merged, cnt.pfx.wide, by.x = c("mlbam_id", "yearID"), by.y = c("mlbam_id", "Year"))

# write to file
tjs.merged.complete %>%
  write.csv(file="data/tjs_merged.csv", row.names = FALSE)
cntl.merged.complete %>%
  write.csv(file="data/control_merged.csv", row.names = FALSE)
