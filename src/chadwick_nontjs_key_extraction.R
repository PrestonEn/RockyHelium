library(dplyr)
library(magrittr)

print(paste("Loading pitchers file and extracting keys..."))
pitchers <- tbl_df(read.csv("data/tjs_pitchers.csv"))
pitchers.keys <- pitchers$key_mlbam
print(paste("Loading player key lookup table..."))
cwb_register <- tbl_df(read.csv("data/chadwickbureau/register/data/people.csv", stringsAsFactors = FALSE))
print(paste("Loading pitchers stats file..."))
cwb_pitching <- tbl_df(read.csv("data/chadwickbureau/baseballdatabank/core/Pitching.csv", stringsAsFactors = FALSE))

eligible <- cwb_pitching %>%
  subset(yearID >= 2010 & yearID <=2015)

tjs.id <- cwb_register[cwb_register$key_mlbam %in% pitchers.keys,"key_bbref"]
tjs.id <- as.list(tjs.id$key_bbref)
eligible.rmtjs <- eligible[! eligible$playerID %in% tjs.id,]
control.id <- as.list(eligible.rmtjs$playerID)
eligible.id <- cwb_register[cwb_register$key_bbref %in% control.id, c("key_mlbam", "key_bbref")]
eligible.id
eligible.rmtjs

eligible.id %>%
  write.csv(file="data/control_pitchers_mlbamid.csv", row.names = FALSE)