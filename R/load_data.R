# load libraries
libs <- c('tidyverse', 'RSocrata')

lapply(libs, require, character.only = T)

rm(libs)

# load data
permits_raw <- as.data.frame(read.socrata("https://data.austintexas.gov/resource/3syk-w9eu.json"))

# save data
write_csv(permits_raw, "data/permits_raw.csv")

# look at residential class
res_class <- permits_raw |> 
  filter(permit_class == "Residential") |> 
  select(permit_class, work_class) |> 
  count(work_class)
  