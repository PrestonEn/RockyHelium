control_stats_merged <- read.csv('data/control_merged.csv')
cplyrs <- read.csv("data/control_pitchers_2_cons.csv")
tjplyrs <- read.csv("data/tjs_pitchers_2_cons.csv")
tjplyrs <- unique(tjplyrs[c('mlbam_id', 'index_year')])
people <- read.csv("data/people.csv")

years <- sort(unique(control_stats_merged$yearID))

control_players <- list()

# list of lists of mlbam_ids by year that have an entry in the previous year
for(i in 2:length(years)){
  curr_y = subset(control_stats_merged, yearID==years[i])$mlbam_id
  prev_y  = subset(control_stats_merged, yearID==years[i-1])$mlbam_id
  intersect_y = intersect(curr_y, prev_y)

  tmp <- subset(control_stats_merged[c("mlbam_id", "yearID")], yearID==years[i] & mlbam_id %in% intersect_y)

  tmp <- tmp[sample(1:nrow(tmp), length(subset(tjplyrs, index_year==years[i])$index_year),replace=FALSE),]
  control_players[[paste(years[i])]] <- tmp

}

control_play <- do.call(rbind, control_players)
rownames(control_play) <- NULL
