# append labels to data sets (control and case)
# 0 indicates no surgery, 1 indicates surgery
#
# Preston Engstrom


cplyrs <- read.csv('data/stats_control_pitchers_clean.csv')
tjplyrs <- read.csv('data/stats_tjs_pitchers_clean.csv')

years <- unique(cplyrs$yearID)

cons_years <- list()

# get list of players who played in consecutive years for each consecutive year

for(i in 1:(length(years)-1)){
  first_y = subset(cplyrs, yearID==years[i])$playerID
  second_y  = subset(cplyrs, yearID==years[i+1])$playerID
  #third_y  = subset(cplyrs, yearID==years[i+2])$playerID

  intersect_1 = intersect(first_y, second_y)
  #final_inter = intersect(intersect_1, third_y)
  cons_years[[paste(i)]] <- intersect_1
}

names <- unique(unlist(cons_years))
cons_names <- data.frame(playerID = names)

cpf <- merge(x = cplyrs,
             y = cons_names,
             by ='playerID',
             all.y = T)




cons_years_tjs <- list()

for(i in 1:(length(years)-1)){
  first_y = subset(tjplyrs, yearID==years[i])$playerID
  second_y  = subset(tjplyrs, yearID==years[i+1])$playerID
  # third_y  = subset(tjplyrs, yearID==years[i+2])$playerID

  intersect_1 = intersect(first_y, second_y)
  # final_inter = intersect(intersect_1, third_y)
  cons_years_tjs[[paste(i)]] <- intersect_1
}

names_tjs <- unique(unlist(cons_years_tjs))
cons_tjs_names <- data.frame(playerID = names_tjs)

tjspf <- merge(x = tjplyrs,
             y = cons_tjs_names,
             by ='playerID',
             all.y = T)

print(length(unique(tjplyrs$playerID)))
write.table(cpf, "data/control_pitchers_2_cons.csv",
            append = F, quote = F, row.names = F, col.names = T, sep=",")

write.table(tjspf, "data/tjs_pitchers_2_cons.csv",
            append = F, quote = F, row.names = F, col.names = T, sep=",")

