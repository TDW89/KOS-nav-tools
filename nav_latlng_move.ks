declare paramiter p1.

set move to 1000.
set arrow to vecdraw().
set exit to false.
set arrow:scale to 1.
set arrow:color to red.
set arrow:show to true.

clearscreen.
print "Current position: ".
Print "Move by: ".

on ag2 {
 run gs_destination(p1,180,move,body:radius+p1:terrainheight).
 set p1 to result.
}.
on ag3 {
 set move to move * 0.1.
}.
on ag4 {
 run gs_destination(p1,270,move,body:radius+p1:terrainheight).
 set p1 to result.
}.
on ag5 {
 set exit to true.
}.
on ag6 {
 run gs_destination(p1,90,move,body:radius+p1:terrainheight).
 set p1 to result.
}.
on ag8 {
 run gs_destination(p1,0,move,body:radius+p1:terrainheight).
 set p1 to result.
}.
on ag9 {
 set move to move * 10.
}.


Until exit {
 if map view {
  set length to 50000.
 }
 else {
  set length to 1000.
 }.
 set start to p1:altitudeposition(p1:terrainheight+length).
 set vec to p1:position - start.
 set arrow:start to start.
 set arrow:vec to vec.
 set arrow:lable to p1.
}.
