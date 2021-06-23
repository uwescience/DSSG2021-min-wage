library(tidyverse)
library(sf)

# create a couple temp files
temp <- tempfile()
temp2 <- tempfile()

# download the zip folder from the internet save to 'temp'
download.file(
  "https://ofm.wa.gov/sites/default/files/public/legacy/pop/geographic/tiger10/tract10.zip",
  temp)

# unzip the contents in 'temp' and save unzipped content in 'temp2'
unzip(zipfile = temp, exdir = temp2)

# finds the filepath of the shapefile (.shp) file in the temp2 unzip folder
census_tract10_shp <- list.files(temp2, pattern = ".shp$", full.names = TRUE)

# read the shapefile as simple features
# see: https://r-spatial.github.io/sf/
census_tract_10_sf <- sf::read_sf(census_tract10_shp)

names(census_tract_10_sf)
glimpse(census_tract_10_sf)

# subset to what we want
# King = 003
# Pierce = 061
# Snohomish = 053
project_county_fp <- c("033", "061", "053")

# only get tracts we need for the project
sub_tracts <- census_tract_10_sf %>%
  filter(COUNTYFP10 %in% project_county_fp)

# visualize tracts
ggplot() +
  geom_sf(data = sub_tracts)
