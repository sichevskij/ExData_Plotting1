# The goal here is simply to examine how household energy usage varies over a 
# 2-day period in February, 2007.

source("load.R")

plot3 <- function( file ) {
        epc <- NULL
        
        if ( ! exists("epc_cache") ) {
                load( file )
        }
        epc <- epc_cache
        
        png( filename = "plot3.png", bg = NA )
        
        mk.plot3( epc )
        
        dev.off()
}

mk.plot3 <- function( epc, ...) {
        
        with( epc, {
                plot( Date, Sub_metering_1
                      , main = NA
                      , xlab = NA
                      , ylab = "Energy sub metering"
                      , type = "l",
                      , col  = "black")
                
                lines( Date, Sub_metering_2, col="red" )
                lines( Date, Sub_metering_3, col="blue" )     
        })
        
        legend( "topright"
                , c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                , col = c("black", "red", "blue")
                , lty = 1
                , ... )  
}