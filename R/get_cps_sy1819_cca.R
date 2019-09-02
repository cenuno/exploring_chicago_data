#
# Author:   Cristian E. Nuno
# Purpose:  Retrieve Chicago community areas from CPS SY1819 locations
# Date:     September 2, 2019
#

# load necessary libraries ----
library(pointdexter)
library(sf)

# load necessary data ----
data("cps_sy1819")
data("community_areas_sf")

# create list of coordinate pair matrices for each community area ----
ca_bounds <-
  GetPolygonBoundaries(my.polygon = community_areas_sf
                       , labels = community_areas_sf$community)

# identify the community that each cps school lies in ----
cps_sy1819$community <-
  LabelPointsWithinPolygons(lng = cps_sy1819$school_longitude
                            , lat = cps_sy1819$school_latitude
                            , polygon.boundaries = ca_bounds)

# export data as csv ----
write.csv(cps_sy1819
          , "../write_data/cps_sy1819_cca.csv"
          , row.names = FALSE)

# end of script #
