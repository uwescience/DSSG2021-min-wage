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
# King = 033
# Pierce = 053
# Snohomish = 061
project_county_fp <- c("033", "061", "053")

# only get tracts we need for the project
sub_tracts <- census_tract_10_sf %>%
  filter(COUNTYFP10 %in% project_county_fp)

# visualize tracts
sub_tracts %>%
  mutate(black_pct = POPBLACK/POP10,
         white_pct = POPWHITE/POP10,
         latinx = POPHISP/POP10) %>%
  select(black_pct,white_pct,latinx, geometry) %>%
  gather(., race, value, black_pct:latinx) %>%
  ggplot(.) +
  geom_sf(aes(fill = value)) +
  scale_fill_distiller(palette = "Spectral") +
  facet_grid(~ race)



