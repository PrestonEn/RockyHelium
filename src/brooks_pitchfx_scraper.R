library(XML)
library(tidyr)
library(dplyr)
library(magrittr)
library(reshape2)

pitchers <- tbl_df(read.csv("data/tjs_pitchers.csv"))
pitchers.keys <- pitchers$key_mlbam
#pitchers.keys <- c(506560)
var_list <- c("mph", "maxmph", "pfx_x", "pfx_z", "hloc", "vloc", "bway")
#var_list <- c("mph", "maxmph")
pitchfx <- data.frame()
j <- 0
# for each pitcher
for (i in pitchers.keys) {
  j <- j + 1
  print(paste("player:", j, "of", nrow(pitchers), ":", i))
  # for each pitchf/x variable
  for (v in var_list) {
    # data table is returned as a list
    p <- pitchers.keys[i]
    var <- var_list[v]
    data <- function(p,var) {
      url <- paste0("http://www.brooksbaseball.net/velo.php?player=",p,"&b_hand=-1&gFilt=&pFilt=FA|SI|FC|CU|SL|CS|KN|CH|FS|SB&time=year&minmax=ci&var=",var,"&s_type=2&startDate=01/01/2008&endDate=12/31/2015")
      d <- readHTMLTable(url, header = TRUE, skip.rows = 1, as.data.frame = TRUE, stringsAsFactors = FALSE)
      d <- d[[1]]
      d <- d[complete.cases(d),]
      d
    }

    stats <- function(i,v) {
      # index_year <- pitchers %>%
      #   filter(key_mlbam == paste(i)) %>%
      #   select(index_year)
      # s <- data(i,v) %>%
      #   filter(Year == paste(index_year) |
      #            Year == paste(index_year-1) |
      #            Year == paste(index_year-2)) %>%
      #   gather(pitchType, value, -Year) %>%
      #   rename(year = Year)
      s <- data(i,v)
      s$pfx_var <- rep(v, nrow(s))
      s$mlbam_id <- rep(i, nrow(s))
      s
    }

    pitchfx <- stats(i,v) %>%
      bind_rows(pitchfx)
  }
}

pitchfx %<>%
  + dcast(mlbam_id + year + pfx_var ~ pitchType)

pitchfx %>%
  write.csv(file="data/pitchfx_tjs_pitchers2.csv", row.names = FALSE)
