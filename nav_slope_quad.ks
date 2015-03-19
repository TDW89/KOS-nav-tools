declare parameter p1,bearing,seperation,incline.

run gs_destination(p1,bearing,seperation,body:radius+p1:terrainheight).
set resultF to result.
run gs_destination(p1,bearing+90,seperation,body:radius+p1:terrainheight).
set resultR to result.
run gs_destination(p1,bearing+180,seperation,body:radius+p1:terrainheight).
set resultB to result.
run gs_destination(p1,bearing+270,seperation,body:radius+p1:terrainheight).
set resultL to result.

set resultAproach to arctan(incline*(resultF:terrainheight-resultB:terrainheight)/seperation).
set resultTangent to arctan(incline*(resultR:terrainheight-resultL:terrainheight))/(seperation).
set resultSlope to sqrt(resultAproach^2+resultTangent^2).
set resultBearing to mod(360+bearing+arctan2(resultTangent,resultAproach),360).
