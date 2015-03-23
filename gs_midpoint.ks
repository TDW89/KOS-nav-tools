declare parameter p1,p2. //point 1 and point 2.
set resultA to cos(p2:lat)*cos(p2:lng-p1:lng).
set resultB to cos(p2:lat)*sin(p2:lng-P1:lng).
Set result to latlng(arctan2(sin(p1:lat)+sin(p2:lat),sqrt((cos(p1:lat)+resultA)^2+resultB^2)),p1:lng+arctan2(resultB,cos(p1:lat)+resultA)).
