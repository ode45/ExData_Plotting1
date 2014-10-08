# The code to load the dataset (hdata) is in a different file in this repository, called 'loadData.R'
# (Otherwise this code has to be repeated in al plotx.R files,
# which is called duplicate code and is generally considered undesirable)
source('loadData.R')

# Open the PNG graphics device
png("plot2.png", width=480, height=480, bg="white")

Sys.setlocale("LC_TIME", "English")

# Create the plot
with(hdata, plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(hdata, lines(datetime,Global_active_power))

# Shut down the graphics device
dev.off()
