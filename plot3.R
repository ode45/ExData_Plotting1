# The code to load the dataset (hdata) is in a different file in this repository, called 'loadData.R'
# (Otherwise this code has to be repeated in al plotx.R files,
# which is called duplicate code and is generally considered undesirable)
source('loadData.R')

# Open the PNG graphics device
png("plot3.png", width=480, height=480, bg="white")

# To make sure the days are in English
Sys.setlocale("LC_TIME", "English")

# Create the plot
with(hdata, plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(hdata, lines(datetime,Sub_metering_1, col="black"))
with(hdata, lines(datetime,Sub_metering_2, col="red"))
with(hdata, lines(datetime,Sub_metering_3, col="blue"))

# Add the legend
legend("topright",lty=c(1,1),col=c("black","red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# Shut down the graphics device
dev.off()
