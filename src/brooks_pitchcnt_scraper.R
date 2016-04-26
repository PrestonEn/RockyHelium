library(XML)
library(tidyr)
library(dplyr)
library(magrittr)
library(reshape2)

pitchfx <- data.frame()

#pitchers <- tbl_df(read.csv("data/tjs_pitchers.csv", stringsAsFactors = FALSE))
pitchers <- tbl_df(read.csv("data/control_pitchers_mlbamid.csv", stringsAsFactors = FALSE))
pitchers.keys <- pitchers$key_mlbam
#pitchers.keys <- c(572140)

#start_year = 2013
#end_year = 2014

j <- 0
# for each pitcher
for (p in pitchers.keys) {
  
  j <- j + 1
  print(paste("player:", j, "of", nrow(pitchers), ":", p))
  #index_year <- pitchers %>%
  #  filter(key_mlbam == paste(p)) %>%
  #  select(index_year)
  #start_year <- index_year-2
  #while (start_year <= index_year) {
  for (start_year in c(2010:2015)) {
    end_year = start_year + 1
    url <- paste0("http://www.brooksbaseball.net/tabs.php?player=",p,"&p_hand=-1&ppos=-1&cn=200&compType=none&risp=0&1b=0&2b=0&3b=0&rType=perc&balls=-1&strikes=-1&b_hand=-1&time=month&minmax=ci&var=traj&s_type=2&gFilt=&startDate=01/01/",start_year,"&endDate=01/01/",end_year)
    e <- readHTMLTable(url, header = FALSE, skip.rows=1, as.data.frame = TRUE, stringsAsFactors = FALSE)
    e <- e[[1]]
    if (nrow(e) > 0) {
      e <- e[complete.cases(e),]
      e <- e[,1:2]
      colnames(e) <- c("pitch_type","count")
      e$mlbam_id <- rep(p, nrow(e))
      e.count <- e %>%
        dcast(mlbam_id ~ pitch_type, value.var="count")
      e.count$year <- start_year[[1]]
      pitchfx <- bind_rows(e.count, pitchfx)
    }
    # start_year <- start_year + 1
  }
}

pitchfx %>%
  write.csv(file="data/pitchcnt_control_pitchers.csv", row.names = FALSE)