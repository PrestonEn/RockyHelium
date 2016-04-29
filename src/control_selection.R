library(plyr)


control_stats_merged <- read.csv('data/control_merged.csv')
tjs_stats_merged <-  read.csv('data/tjs_merged.csv')
cplyrs <- read.csv("data/control_pitchers_2_cons.csv")
tjplyrs <- read.csv("data/tjs_pitchers_2_cons.csv")
tjplyrs <- unique(tjplyrs[c('mlbam_id', 'index_year')])
people <- read.csv("data/people_filtered.csv")

set.seed(693)

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

df <- merge(x = control_play,
            y = people,
            by.x = 'mlbam_id',
            by.y = 'key_mlbam',
            all.x = TRUE)

df$prev_yearID <- df$yearID-1


df <- merge(x = df,
            y = control_stats_merged,
            by.x = c('mlbam_id', 'yearID'),
            by.y = c('mlbam_id', 'yearID'),
            all.x = TRUE)


df <- merge(x = df,
            y = control_stats_merged,
            by.x = c('mlbam_id', 'prev_yearID'),
            by.y = c('mlbam_id', 'yearID'),
            all.x = TRUE)

# no tjs player has screwballs, drop any occurence
screw_list <- c("Screwball.bway.x", "Screwball.bway.y", "Screwball.hloc.x",
               "Screwball.hloc.y", "Screwball.maxmph.x", "Screwball.maxmph.y",
               "Screwball.mph.x", "Screwball.mph.y", "Screwball.pfx_x.x",
               "Screwball.pfx_x.y", "Screwball.pfx_z.x", "Screwball.pfx_z.y",
               "Screwball.vloc.x", "Screwball.vloc.y", "Screwball.x", "Screwball.y")


df <- df[ , !(names(df) %in% screw_list)]
df <- df[ , order(names(df))]
df$tjs_label <- 0

write.csv(df,  "data/control_54_examples_1.csv",
          quote = F, row.names = F, col.names = T, sep=",")


tjplyrs$prev_yearID <- tjplyrs$index_year-1

tjplyrs <- merge(x = tjplyrs,
                 y = people,
                 by.x = 'mlbam_id',
                 by.y = 'key_mlbam',
                 all.x = TRUE)

tjplyrs <- merge(x = tjplyrs,
                 y = tjs_stats_merged,
                 by.x = c('mlbam_id', 'index_year'),
                 by.y = c('mlbam_id', 'yearID'),
                 all.x = TRUE)

tjplyrs <- merge(x = tjplyrs,
                 y = tjs_stats_merged,
                 by.x = c('mlbam_id', 'prev_yearID'),
                 by.y = c('mlbam_id', 'yearID'),
                 all.x = TRUE)

# keep same naming convention as control

tjplyrs <- rename(tjplyrs, c("index_year"="yearID"))
tjplyrs <- tjplyrs[ , order(names(tjplyrs))]
tjplyrs$tjs_label <- 1

write.csv(df,  "data/tjs_data_fin.csv",
          quote = F, row.names = F, col.names = T, sep=",")
