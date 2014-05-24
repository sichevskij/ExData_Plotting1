# The goal here is simply to examine how household energy usage varies over a 
# 2-day period in February, 2007. Namely, the function plots the histogram of 
# household global minute-averaged active power (in kilowatt).

source("load.R")

# This function produces PNG graphic.
plot1 <- function(...) {
        
        epc <- load(...)
                
        png( filename = "plot1.png", bg = NA )
        
        mk.plot1( epc )
        
        dev.off()
}

mk.plot1 <- function( epc ) {
        hist( epc$Global_active_power
              , main = "Global Active Power"
              , xlab = "Global Active Power (kilowatts)"
              , col = "red" )   
}