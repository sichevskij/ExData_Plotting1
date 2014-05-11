# The goal here is simply to examine how household energy usage varies over a 
# 2-day period in February, 2007.

source("load.R")
source("plot2.R")
source("plot3.R")

plot4 <- function( file ) {
        
        epc <- NULL
        
        if ( ! exists("epc_cache") ) {
                load( file )
        }
        epc <- epc_cache
        
        png( filename = "plot4.png", bg = NA )
        
        mk.plot4( epc )
        
        dev.off()
}

mk.plot4 <- function(epc) {
        
        par( mfcol=c(2, 2) )
        
        mk.plot2(epc)
        mk.plot3(epc, box.lwd = 0)
        
        with( epc, {
                plot( Datetime, Voltage
                      , main = NA
                      , xlab = "datetime"
                      , ylab = "Voltage"
                      , type = "l",
                      , col  = "black")
                
                plot( Datetime, Global_reactive_power
                      , main = NA
                      , xlab = "datetime"
                      , ylab = "Global_reactive_power"
                      , type = "l",
                      , col  = "black")   
        })


}