tjs_stats_merged <- read.csv('data/tjs_merged.csv')
tjs_2_con <- read.csv('data/tjs_pitchers_2_cons.csv')


years <- sort(unique(tjs_stats_merged$yearID))


# list of lists of mlbam_ids by year that have an entry in the previous year
tjs_stat_years <- list()
for(i in 2:length(years)){
  curr_y = subset(tjs_stats_merged, yearID==years[i])$mlbam_id
  prev_y  = subset(tjs_stats_merged, yearID==years[i-1])$mlbam_id
  intersect_y = intersect(curr_y, prev_y)

  tjs_stat_years[[paste(years[i])]] <- intersect_y

}


#
