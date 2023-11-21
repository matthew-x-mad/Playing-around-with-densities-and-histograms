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
meanVal     <-    6
stDev       <-    3


#-------------------------------------------------------------------------------
# Generate a set of approximately normal distributed pseudo-random numbers
#-------------------------------------------------------------------------------

# Set a seed for reproducibility
set.seed(1)   # Comment out to watch different examples!

# Generate a (pseudo-)random Gauss distribution
varRndGauss <- rnorm(nRndNumbers, mean = meanVal, sd = stDev)

# Create a histogram
hGauss <- hist(varRndGauss, breaks = 30, ylim = c(0, 80))

# Place the counts above the histogram bars
text(hGauss$mids, hGauss$counts, labels=hGauss$counts, adj=c(0.5, -0.5))


#-------------------------------------------------------------------------------
# Calculate the total area of the histogram bars
#-------------------------------------------------------------------------------

# Calculate the width of the individual bars
barsWidth <- diff(hGauss$breaks)   # This is a vector containing the diffs of consecutive breaks

# Calculate the area of the individual bars
barsArea <- barsWidth * hGauss$counts

# Calculate the total area of the histogram's bars
areaHistTotal <- sum(barsArea)


#-------------------------------------------------------------------------------
# Generate a plot of the corresponding density
#-------------------------------------------------------------------------------

# Generate some value pairs for the density
xVals <- seq(min(varRndGauss), max(varRndGauss), length = 500)   # 500 points should be smooth enough
yVals <- areaHistTotal * dnorm(xVals, mean = meanVal, sd = stDev)

# Draw the plot
lines(xVals, yVals, lwd = 4, col="blue")


# - - -  E N D   O F   S C R I P T  - - -