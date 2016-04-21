# script to extract select pitchers and calculate their fip score
# writes a new csv file with the computed data combined
# author: nick seelert

library(dplyr)
library(magrittr)

print(paste("Loading pitchers file and extracting keys..."))
pitchers <- tbl_df(read.csv("data/tjs_pitchers.csv"))
pitchers.keys <- pitchers$key_mlbam
print(paste("Loading fip constants..."))
fipc <- read.csv("data/fip_constants.csv", stringsAsFactors = FALSE)
print(paste("Loading player key lookup table..."))
cwb_register <- tbl_df(read.csv("data/chadwickbureau/register/data/people.csv", stringsAsFactors = FALSE))
print(paste("Loading pitchers stats file..."))
cwb_pitching <- tbl_df(read.csv("data/chadwickbureau/baseballdatabank/core/Pitching.csv", stringsAsFactors = FALSE))

stats_fips <- data.frame()
i = 457733
j <- 0
for (i in pitchers.keys) {
  j <- j + 1
  print(paste("player:", j, "of", nrow(pitchers), ":", i))
  
  name_key <- cwb_register %>%
    filter(key_mlbam == paste(i)) %>%
    select(key_bbref)

  p <- cwb_pitching %>%
    filter(playerID == paste(name_key))

  p$mlbam_id <- rep(i, nrow(p))
  p <- p[,c(1,31,2:30)]

  index_year <- pitchers %>%
    filter(key_mlbam == paste(i)) %>%
    select(index_year)

  yr <- index_year

  while(yr > index_year-3 & yr > 2007) {
    fc <- fipc %>%
      filter(Season == paste(yr)) %>%
      select(cFIP)
    
    stats_fips <- p %>%
      filter(yearID == paste(yr)) %>%
      mutate(FIP = fc[[1]] + ((13 * HR + 3 * (BB + HBP) - 2 * SO) / (IPouts / 3))) %>%
      rbind(stats_fips)
    
    yr <- yr - 1
  }
}

stats_fips %>%
  write.csv(file="data/stats_tjs_pitchers.csv", row.names = FALSE)