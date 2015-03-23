declare parameter p1.
set action2 to false.
set action3 to false.
set action4 to false.
set action5 to false.
set action6 to false.
set action8 to false.
set action9 to false.
set action10 to false.
set move to 1000.
set arrow to vecdraw().
set exit to false.
set arrow:scale to 1.
set arrow:color to red.
set arrow:show to true.
clearscreen.
print "Current position:".
Print "Move by:".
Print "Height:".
on ag10 {
set exit to true.
}.
on ag2 {
set action2 to true.
preserve.
}.
on ag3 {
set action3 to true.
preserve.
}.
on ag4 {
set action4 to true.
preserve.
}.
on ag5 {
set action5 to true.
preserve.
}.
on ag6 {
set action6 to true.
preserve.
}.
on ag8 {
set action8 to true.
preserve.
}.
on ag9 {
set action9 to true.
preserve.
}.
on ag10 {
set action10 to true.
preserve.
}.

Until exit {
if action2 {
run gs_destination(p1,180,move,body:radius+p1:terrainheight).
set p1 to result.
set action2 to false.
}.
if action3 {
set move to move * 0.1.
set action3 to false.
}.
if action4 {
run gs_destination(p1,270,move,body:radius+p1:terrainheight).
set p1 to result.
set action4 to false.
}.
if action5 {
log p1 to point_log.
set action5 to false.
}.
if action6 {
run gs_destination(p1,90,move,body:radius+p1:terrainheight).
set p1 to result.
set action6 to false.
}.
if action8 {
run gs_destination(p1,0,move,body:radius+p1:terrainheight).
set p1 to result.
set action8 to false.
}.
if action9 {
set move to move * 10.
set action9 to false.
}.
if action10 {
set exit to true.
set action10 to false.
}.

if mapview {
set length to 50000.
}
else {
set length to 20.
}.
set start to p1:altitudeposition(p1:terrainheight+length).
set vec to p1:position - start.
set arrow:start to start.
set arrow:vec to vec.
//set arrow:lable to "(" +p1:lat +"," +p1:lng +")".
print "("+round(p1:lat,4)+","+round(p1:lng,4)+")   " at (18,0).
print move+"m " at (9,1).
print round(p1:terrainheight,1)+"m    " at (8,2).
}.
