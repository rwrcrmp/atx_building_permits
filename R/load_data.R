# load libraries
libs <- c('tidyverse', 'RSocrata')

lapply(libs, require, character.only = T)

rm(libs)

## huge file, only run when initializing ###

# # extract data
# permits_raw <- as.data.frame(read.socrata("https://data.austintexas.gov/resource/3syk-w9eu.json"))
# 
# # save data
# write_csv(permits_raw, "data/extracted_files/permits_raw.csv")

# load data
permits_raw <- read_csv("data/extracted_files/permits_raw.csv")

# look at residential class
res_class <- permits_raw |> 
  filter(permit_class == "Residential") |> 
  select(permit_class, work_class) |> 
  count(work_class)

# for some reason demolitions "permit class" are not included
demo_class <- permits_raw |> 
  filter(str_detect(work_class, "Demo")) |> 
  select(permit_class, work_class) |> 
  count(permit_class)

# just one year
year_22 <- permits_raw |> 
  filter(year(issue_date) == 2022)
