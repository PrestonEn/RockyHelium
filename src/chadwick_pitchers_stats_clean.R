# drop unneeded columns
#
#

library(plyr)

control_pitchers <- read.csv('data/stats_control_pitchers.csv')
tjs_pitchers <- read.csv('data/stats_tjs_pitchers.csv')

fips_vals <- read.csv('data/fip_constants.csv')

# relavant columns
keeps <- c("playerID", "yearID","HR","BB","HBP", "SO","IPouts")
cpf <- control_pitchers[keeps]

# sum players stats if more than 1 record in a year
cpf <- ddply(cpf,
      .(playerID, yearID),
      numcolwise(sum))

# join control pitcher with fip constant
cpf <- merge(x = cpf,
              y = fips_vals,
              by.x = 'yearID',
              by.y = 'Season',
              all.x = T)

# calculate fip score
cpf$FIP = cpf$cFIP  + ((13 * cpf$HR + 3 * (cpf$BB + cpf$HBP) - 2 * cpf$SO) / (cpf$IPouts / 3))

# drop fip constant
cpf <- cpf[ , !(names(cpf) %in% c('cFIP'))]




# have to also aggregate tjs players if more than 1 record per year
keeps <- c("playerID", "mlbam_id", "yearID","HR","BB","HBP", "SO","IPouts")
tjs_pitchers <- tjs_pitchers[keeps]
tjs_pitchers <- ddply(tjs_pitchers,
             .(playerID, mlbam_id, yearID),
             numcolwise(sum))


# write tables to file
write.table(tjs_pitchers, "data/stats_tjs_pitchers_clean.csv",
            append = F, quote = F, row.names = F, col.names = T, sep=",")

write.table(cpf, "data/stats_control_pitchers_clean.csv",
            append = F, quote = F, row.names = F, col.names = T, sep=",")
