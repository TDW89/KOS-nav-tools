declare parameter p1,bearing,seperation,incline. //position,bearing(only necacery for getting slope along and at 90deg to heading, otherwise set to 0.),spacing of points,1=uphillhearing -1 = downhill bearing.

run gs_destination(p1,bearing,seperation,body:radius+p1:terrainheight).
set resultF to result.
run gs_destination(p1,bearing+90,seperation,body:radius+p1:terrainheight).
set resultR to result.

set resultAproach to arctan(incline*(resultF:terrainheight-p1:terrainheight)/seperation).
set resultTangent to arctan(incline*(resultR:terrainheight-p1:terrainheight)/seperation).
set resultSlope to sqrt(resultAproach^2+resultTangent^2).
set resultBearing to mod(360+bearing+arctan2(resultTangent,resultAproach),360).
