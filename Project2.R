library(lpSolve)

path <-'C:/Users/Family/OneDrive/Desktop/Semester1/Optimization for engineers/files/R-Notebooks/TOPSIS'
setwd(path)
getwd()

model <- read.csv('Project2.csv',skip=1, header= FALSE)

#bind constraints into a matrix
mat <- cbind(model[2:98,1:48])

#set up our binary program
obj <- c(model[1,1:48])
con <- as.matrix(mat)
dir <- c(model[2:98,50])
rhs <-c(model[2:98,49])
zz <-lp(direction="min",obj, con, dir, rhs, all.bin = FALSE)

print(zz)
zz$solution

#This will save the Rki/Rski values in a separate .csv file
write.csv(zz$solution, file = "LP_solution6.csv", row.names = FALSE)


