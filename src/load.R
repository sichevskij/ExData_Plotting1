# The goal here is simply to examine how household energy usage varies over a 
# 2-day period in February, 2007. This function reads the dataset from given file.

library(data.table)

load <- function( file ="../household_power_consumption.txt" ) {
        
        epc <- fread( file
                      , sep = ";"
                      , na.strings = "?"
                      , colClasses = "character"
        )
                
        # Convert character representations to objects of Date classes.
        epc[,  Date := as.Date(Date, "%d/%m/%Y")]
        

        # Select data from the dates 2007-02-01 and 2007-02-02.
        epc <- epc[ "2007-02-01" <= epc$Date & "2007-02-02" >= epc$Date , ]
        
        # Convert character representations.
        epc <- transform(epc
                         , Datetime = as.POSIXct( paste(Date, Time) )
                         , Global_active_power = as.numeric(Global_active_power)
                         , Global_reactive_power = as.numeric(Global_reactive_power)
                         , Global_intensity = as.numeric(Global_intensity)
                         , Voltage = as.numeric(Voltage)
                         , Sub_metering_1 = as.numeric(Sub_metering_1)
                         , Sub_metering_2 = as.numeric(Sub_metering_2)
                         , Sub_metering_3 = as.numeric(Sub_metering_3)
        )

        # Set the cache.
        epc_cache <<- epc
        
        return( epc )
}