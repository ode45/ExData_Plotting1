# The code to load the dataset (hdata) is in a different file in this repository, called 'loadData.R'
# (Otherwise this code has to be repeated in al plotx.R files,
# which is called duplicate code and is generally considered undesirable)
source('loadData.R')

# Open the PNG graphics device
# Use a white background, then they look the same as in the Markdown example, although the actuals are transparent
png("plot2.png", width=480, height=480, bg="white")

Sys.setlocale("LC_TIME", "English")

# Create the plot
with(hdata, plot(datetime,Global_active_power,
                 type="l",
                 xlab="",
                 ylab="Global Active Power (kilowatts)"))

# Shut down the graphics device
dev.off()
