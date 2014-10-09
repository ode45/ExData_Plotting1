# This script loahdata the hdataset and manipulates it into a variable called hdata
# with the 2 days as specified and additional datetime field

# Function to install package if needed and to then load it
usePackage <- function(p) {
  if (!require(p, character.only = TRUE))
    install.packages(p)
  suppressPackageStartupMessages(library(p,character.only=TRUE))
}

# Create the hdata variable if it doesn't exist in in the global environment
if (!exists("hdata")) {
  
  # Download and unzip the data if it doesn't exist yet
  destfile <- "data.zip"          
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  if (!file.exists(destfile)){
    download.file(url, destfile)
    unzip(destfile)
  }
  
  # Lubridate provides tools that make it easier to parse and manipulate dates
  usePackage(lubridate)
  
  # Read the file
  file <- "household_power_consumption.txt"
  hdata <- read.csv(file, header = TRUE, sep = ";",na.strings = "?",  nrows=550000, as.is = TRUE)
  
  # Merge the date and time to a new field (as POSIXct object)
  hdata$datetime <- dmy_hms(paste(hdata$Date,hdata$Time))
  
  # We will only be using data from the dates 2007-02-01 and 2007-02-02
  range <- hdata$datetime >= ymd("2007-02-01") & hdata$datetime < ymd("2007-02-03")
  hdata <- hdata[range,]
  
}