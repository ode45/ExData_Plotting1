# The code to load the dataset (hdata) is in a different file in this repository, called 'loadData.R'
# (Otherwise this code has to be repeated in al plotx.R files,
# which is called duplicate code and is generally considered undesirable) 
source('loadData.R')

# Open the PNG graphics device
png("plot1.png", width=480, height=480, bg="white")

# Create the plot
with(hdata, hist(Global_active_power, 
                 col="red",
                 xlab="Global Active Power (kilowatts)",
                 main="Global Active Power"))

# Shut down the graphics device
dev.off()
