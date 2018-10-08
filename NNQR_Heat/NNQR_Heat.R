
# clear all variables
rm(list = ls(all = TRUE))
graphics.off()
#setwd("")


# install and load packages
libraries = c("lattice")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)


# read data
data  = read.csv(file = "data.csv")
date  = as.Date(data[, 1])
spill_All = as.matrix(read.csv(file = "Spillover_All.csv"))
spill_Leh = as.matrix(read.csv(file = "Spillover_Lehman.csv"))


# all data

names = colnames(data)[-1]
frame = expand.grid(X = names, Y = names)
frame$Z = as.vector(spill_All)

par(mar = c(3, 4, 2, 2))
levelplot(Z ~ X * Y, data = frame, 
          col.regions = heat.colors(100)[length(heat.colors(100)) : 1],
          at = seq(0, 0.7, length.out = 100),
          xlab = "", ylab ="", main = "")


# Lehman period

frame$Z <- as.vector(spill_Leh)

par(mar=c(3,4,2,2))
levelplot(Z ~ X*Y, data=frame, 
          col.regions = heat.colors(100)[length(heat.colors(100)):1],
          at=seq(0,0.7,length.out=100),
          xlab="",ylab="",main="")
