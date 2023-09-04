# this script installs all required packages
# and builds out a repo directory structure
# for an initial commit. delete temp.txt files
# after first git commit

# install packages
packages <- c('tidyverse', 'sf', 'renv')

lapply(packages, install.packages)

rm(packages)

install.packages("E:/R/RSocrata_1.7.12-4.tar.gz", repos = NULL, type = "source")

renv::snapshot()

# build repo directory
folders <- c("data", "data/extracted_files", "data/created_files", "data/archive", 
             "R", "R/archive", 
             "assets", "assets/images", 
             "products", "products/documents", "products/html")

lapply(folders, dir.create)

for (i in folders){
  x <- paste0(i, "/temp.txt")
  file.create(x)
}

rm(folders)
