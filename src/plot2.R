# The goal here is simply to examine how household energy usage varies over a 
# 2-day period in February, 2007. Namely, the function plots the scatterplot of 
# household global minute-averaged active power (in kilowatt).

source("load.R")

plot2 <- function(...) {
        
        epc <- load(...)
        
        png( filename = "plot2.png", bg = NA )
        
        mk.plot2( epc )
        
        dev.off()
}

mk.plot2 <- function( epc ) {
        plot( epc$Datetime, epc$Global_active_power
              , main = NA
              , xlab = NA
              , ylab = "Global Active Power (kilowatts)"
              , type = "l" )  
}