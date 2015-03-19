declare parameter p1,bearing,seperation,incline.

run gs_destination(p1,bearing,seperation,body:radius+p1:terrainheight).
set resultF to result.
run gs_destination(p1,bearing+90,seperation,body:radius+p1:terrainheight).
set resultR to result.

set resultAproach to arctan(incline*(resultF:terrainheight-p1:terrainheight)/seperation).
set resultTangent to arctan(incline*(resultR:terrainheight-p1:terrainheight))/(seperation).
set resultSlope to sqrt(slopeAproch^2+slopeTangent^2).
set resultBearing to mod(360+bearing+arctan2(slopeTangent,slopeAproach),360).
