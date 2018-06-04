setwd("C:/Users/Owner/Documents/Personal/Projects/ColdFrameTemp/ColdFrameTemperature")

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

# Mins
min(temp[temp$Group == "Winona", "TemperatureC"], na.rm = T)
min(temp[temp$Group == "ColdFrame", "TemperatureC"], na.rm = T)
# Zoom in
temp2 <- temp %>% filter(Date > "2018-04-20", Date < "2018-05-10")
g4 <- ggplot(temp2, aes(x = Date, y = TemperatureC, group = Group, color = Group)) 
g4 <- g4 + geom_line() + theme_hc()+scale_colour_solarized("blue")
g4
png(filename="ZoomInGraph.png", width=11, height=8.5, units="in", res=300)
g4
dev.off()

