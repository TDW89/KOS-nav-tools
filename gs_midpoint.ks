declare parameter p1,p2. //point 1 and point 2.
Set result to latlng(arctan2(sin(p1:lat)+sin(p2:lat),sqrt((cos(p1:lat)+cos(p2:lat)*cos(p2:lng-p1:lng))^2+(cos(p2:lat)*sin(p2:lng-P1:lng))^2)),p1:lng+arctan2(cos(p2:lat)*sin(p2:lng-P1:lng),cos(p1:lat)+cos(p2:lat)*cos(p2:lng-p1:lng))).
