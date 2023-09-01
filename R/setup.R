# setup 

packages <- c('tidyverse', 'sf', 'renv')

lapply(packages, install.packages)

rm(libs)

install.packages("E:/R/RSocrata_1.7.12-4.tar.gz", repos = NULL, type = "source")

renv::snapshot()

folders <- c("data", "R", "images", "products")

lapply(folders, dir.create)

rm(folders)