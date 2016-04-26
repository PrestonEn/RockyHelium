install.packages("plyr", dependencies = TRUE)
library(plyr)

control_pitchers <- read.csv('data/stats_control_pitchers.csv')

# relavant columns
keeps <- c("playerID", "yearID","HR","BB","HBP", "SO","IPouts")
control_pitchers_clean <- control_pitchers[keeps]

dim(control_pitchers)

control_pitchers_clean <- ddply(control_pitchers_clean,
      .(playerID, yearID),
      numcolwise(sum))

dim(control_pitchers)
dim(control_pitchers_clean)
write.table(keeps, "data/stats_control_pitchers_clean.csv", quote = F)
write.table(control_pitchers_clean, "data/stats_control_pitchers_clean.csv", append = TRUE, quote = F, row.names = F, col.names = F)
