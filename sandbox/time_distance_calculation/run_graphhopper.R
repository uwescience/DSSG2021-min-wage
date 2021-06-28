# Demonstration of R's Graphhpper wrapper. In order for this wrapper to work,
# one needs to start a graphhopper server locally with the corresponding files.

# Follow the instructions here first:
# https://github.com/graphhopper/graphhopper/blob/master/docs/core/quickstart-from-source.md


# installing and loading the R wrapper for graphhopper
install.packages(graphhopper)
library(graphhopper)

# calculating distance between two points

# Berlin points: europe_germany_berlin.pbf
start_point <- c(52.59, 13.41)
end_point <- c(52.53, 13.36)

# Seattle points: use washington-latest.osm.pbf
start_point <- c(47.6050, -122.3344)
end_point <- c(47.655548, -122.303200)

# get the route between start and end points
route <- gh_get_route(list(start_point, end_point)) # route is an object with the routing info 

# extract the time and distance from the route object
d <- gh_time_distance(route)

# distance is in meters and time is in milliseconds?
print(d)

# use gh_get_routes with multiple pairs of points
# ...


