control_stats_merged <- read.csv('data/control_merged.csv')
cplyrs <- read.csv("data/control_pitchers_2_cons.csv")
tjplyrs <- read.csv("data/tjs_pitchers_2_cons.csv")


years <- sort(unique(control_stats_merged$yearID))


# list of lists of mlbam_ids by year that have an entry in the previous year
control_stat_years <- list()
for(i in 2:length(years)){
  curr_y = subset(control_stats_merged, yearID==years[i])$mlbam_id
  prev_y  = subset(control_stats_merged, yearID==years[i-1])$mlbam_id
  intersect_y = intersect(curr_y, prev_y)
  print(paste(years[i], " ", length(intersect_y)))
  control_stat_years[[paste(years[i])]] <- intersect_y
}


