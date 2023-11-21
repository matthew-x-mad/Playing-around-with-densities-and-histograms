################################################################################
# PLAYING AROUND WITH DENSITIES AND HISTOGRAMS
#
# It seems, imho, that the transition from histograms to densities corresponds,
# in statistics, to the transition from empiricism (reality) to theory. 
#
# Thus, I want to get a feeling for the relation between histograms and the
# corresponding probability densities.
#
# Author:  Xerxes
# Created: 21.11.2023
# Updated: -
#
################################################################################

# Use tidyverse
library(tidyverse, lib.loc = "C:/Program Files/R/R-4.3.2/library")

#-------------------------------------------------------------------------------
# Some parameters
#-------------------------------------------------------------------------------

nRndNumbers <- 1000
shape       <-    1.7   # (= k)
scale       <-    1.0   # (= lambda; apparently just compressing or stretching the graph along the x-axis)


#-------------------------------------------------------------------------------
# Generate a set of approximately normal distributed pseudo-random numbers
#-------------------------------------------------------------------------------

# Set a seed for reproducibility
#set.seed(1)   # Comment out to watch different examples!

# Generate a (pseudo-)random Weibull distribution
varRndWeibull <- rweibull(nRndNumbers, shape = shape, scale = scale)

# Create a histogram
hWeibull <- hist(varRndWeibull, breaks = 30) #, ylim = c(0, 80))

# Place the counts above the histogram bars
text(hWeibull$mids, hWeibull$counts, labels=hWeibull$counts, adj=c(0.5, -0.5))


#-------------------------------------------------------------------------------
# Calculate the total area of the histogram bars
#-------------------------------------------------------------------------------

# Calculate the width of the individual bars
barsWidth <- diff(hWeibull$breaks)   # This is a vector containing the diffs of consecutive breaks

# Calculate the area of the individual bars
barsArea <- barsWidth * hWeibull$counts

# Calculate the total area of the histogram's bars
areaHistTotal <- sum(barsArea)


#-------------------------------------------------------------------------------
# Generate a plot of the corresponding density
#-------------------------------------------------------------------------------

# Generate some value pairs for the density
xVals <- seq(min(varRndWeibull), max(varRndWeibull), length = 500)   # 500 points should be smooth enough
yVals <- areaHistTotal * dweibull(xVals, shape = shape, scale = scale)

# Draw the plot
lines(xVals, yVals, lwd = 4, col="purple")


# - - -  E N D   O F   S C R I P T  - - -