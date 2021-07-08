# Using Graphhopper with an R wrapper

[Graphhopper](https://www.graphhopper.com/) is a routing tool, which we can use to calculate travel times for free.

Steps:
1. Follow the instructions from [quickstart-from-source](https://github.com/graphhopper/graphhopper/blob/master/docs/core/quickstart-from-source.md) guide.
```
git clone git://github.com/graphhopper/graphhopper.git
cd graphhopper
git checkout master # if you prefer a less moving branch you can use e.g. 3.x
./graphhopper.sh -a web -i europe_germany_berlin.pbf
# after Server started go to http://localhost:8989/ and you should see something similar to GraphHopper Maps: https://graphhopper.com/maps/

```
2. Download the Open Street Map data for Washington from [here](http://download.geofabrik.de/north-america/us/washington-latest.osm.pbf).

3. Start the routing service:
```
./graphhopper.sh -a web -i washington-latest.osm.pbf
```
4. Now you can run the R script [`run_graphhopper.R`](https://github.com/uwescience/DSSG2021-min-wage/blob/main/sandbox/time_distance_calculation/run_graphhopper.R) which is using the R [grapphopper](https://cran.r-project.org/web/packages/graphhopper/index.html) package to call the api. 
