# The goal here is simply to examine how household energy usage varies over a 
# 2-day period in February, 2007. This function reads the dataset from given file.

library(data.table)

epc_cache <- NULL

load <- function( file ="../household_power_consumption.txt" ) {
        
        
        if ( is.null( epc_cache ) ) {
                
                epc <- fread( file
                              , sep = ";"
                              , na.strings = "?"
                              , header = TRUE
                              , colClasses = "character" 
#                              , verbose = TRUE
                )
                
                # Select data from the dates 2007-02-01 and 2007-02-02
                epc <- subset(epc, Date == "1/2/2007" | Date == "2/2/2007")
                
                # Convert character representations.
                epc[, Datetime := as.POSIXct( paste(as.Date(Date, "%d/%m/%Y"), Time) )]
                epc[, Global_active_power := as.numeric(Global_active_power)]
                
                # Set the cache.
                epc_cache <<- epc
        }
        
        return( epc_cache )
}