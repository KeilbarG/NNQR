
# clear all variables
rm(list = ls(all = TRUE))
graphics.off()
#setwd("")


# install and load packages
libraries = c("quantreg","qrnn","NeuralNetTools","quantmod","h2o","igraph")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)


# read data
data  = read.csv(file = "data.csv")
date  = as.Date(data[,1])
Tot   = as.matrix(read.csv(file = "Tot.csv"))


# plot of SNRI

par(mar = c(2, 2, 1, 1))

plot(y = Tot, x = date, type = "l", ylab = "", xlab = "", col = "gray50")
lines(x = date, y = smooth.spline(Tot, spar = 0.7)$y, lwd = 3, col = "navy")
