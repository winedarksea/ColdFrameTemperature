setwd("C:/Users/Owner/Documents/Personal/Projects/ColdFrameTemp")
temp <- read.csv("ColdFrameTemp.csv")
# I've got to fix a slight difference in dates
winona <- temp[temp$Group == "Winona",]
winona$Date <- as.POSIXct(winona$Date, format = "%m/%d/%y %H:%M")
coldFrame <- temp[temp$Group == "ColdFrame",]
coldFrame$Date <- as.POSIXct(coldFrame$Date, format = "%m/%d/%y %H:%M:%S")
# write.csv(rbind(winona,coldFrame), "ColdFrameTemperatures.csv")

library(ggplot2)
library(ggthemes)
library(dplyr)
temp <- read.csv("ColdFrameTemperatures.csv")
temp$Date <- as.POSIXct(temp$Date, format = "%m/%d/%Y %H:%M")
#filter out the first and last dates (when probe inside, setting up)
temp <- temp %>% filter(Date > "2018-03-18", Date < "2018-06-01")
temp$Date <- as.POSIXct(temp$Date, format = "%Y-%m-%d %H:%M:%S")

g1 <- ggplot(temp, aes(x = Date, y = TemperatureC, group = Group, color = Group)) 
g1 <- g1 + geom_line() + theme_hc()+scale_colour_solarized("blue")
g1
png(filename="OverallGraph.png", width=11, height=8.5, units="in", res=300)
g1
dev.off()


# difference
# other temp