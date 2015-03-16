declare parameter p1, p2, radius. //(point1,point2,radius(planet/moon)).
set result to radius*constant():PI*arctan2(sqrt(sin((p1:lat-p2:lat)/2)^2 + cos(p1:lat)*cos(p2:lat)*sin((p1:lng-p2:lng)/2)^2),sqrt(1-sin((p1:lat-p2:lat)/2)^2 + cos(p1:lat)*cos(p2:lat)*sin((p1:lng-p2:lng)/2)^2))/90.
