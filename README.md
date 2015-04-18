# Installation
These scripts require kOS to run. kOS can be downloaded here:

http://forum.kerbalspaceprogram.com/threads/68089-0-90-kOS-Scriptable-Autopilot-System-v0-16-2-2015-2-23

Copy all .ks files to ~/Kerbal Space Program/Ships/Script/

#What does this do?
First off these scripts don't do a lot on their own. They are intended to be a tool/equation set for script writers to call from within their own scripts (although there is nothing stopping you just running them if you want).

These scripts make use of Great Circle equations, which I am about to do a rubbish job of explaining. A Great Circle is the circle created by on the surface of a sphere by any plane that passes through it's centre. The equator is on example of this as are the lines of longitude around the earth.
For more information google is your friend :-P

This is useful because these circles are the most direct rout between any two points on the surface of a sphere (in this case a planet or moon).

#How to use
All of these scripts need to be run with their arguments (commented in each script). They each return the variable `result` and the only other variables they use are declared parameters. This is done to minimise conflicts with other scripts.
Tip: When flying a plane using body:radius+ship:altitude will give you a more accurate result for scripts that ask for a radius.

#scripts.

##gs_bearing.ks
Similar to an inclined orbit the baring you are travelling on will change when using great circles. This equation will give you the initial bearing along the great circle path from point 1 to point 2.
Not overly useful when run once but by repeatedly running this with your current position as point 1 you will get a continuously updating bearing along the shortest path to point 2.

##gs_destination.ks
This will tell you the geo-position of a point along a great circle path given a starting position, distance and initial bearing. It can be used for checking the layout of terrain up ahead using:
```
RUN gs_destination(ship:geoposition,(-1)*ship:bearing,1000,body:radius).
```
to give you the latlng() position of a point 1km ahead of you and letting you query it for terrain height. So no more crashing into that cliff because you can only track changes in terrain as you pass over it.

##gs_distance.ks
kOS lets you query the distance to a latlng() position at the moment but it gives you the separation of the points in 3d space so if you ask for the distance to a point directly opposite you on Kerbin it will give tell you the distance is Kerbins diameter. This will give you the surface distance between 2 points. So will tell you the distance is half Kerbins circumference. This is useful if you want to know how far you will actually have to go and how long it will take you at your current surface speed.
It can also be used between a 2 arbitrary points not just your vessel's position and another so for lists of way-points you could use something like:
```
SET current To ship:geoposition.
SET distance TO 0.
FOR point IN waypoints {
 RUN gs_distance(current,point,body:radius).
 SET distance TO distance + result.
 SET current TO point.
}.
PRINT distance.
```
to give the distance total distance of your current rout.

##gs_midpoint.ks
Gives you the midpoint between point 1 and 2 along a great circle path. This is not as obviously useful as the others but I needed it for something I am working on so threw it in as well.

##nav_latlng_move.ks
This is for tweaking geopositions manually. It places an arrow at the declared latlng and then allows you to move it around using action groups. (The action groups are set up with the intention that they are mapped to the number pad).
0 - exits the script.
2 - moves the arrow south.
3 - multiplies the movement by 0.1 (eg m -> cm -> mm).
4 - moves west.
5 - logs the position to a file.
6 - moves east.
8 - moves north.
9 - multiplies the movement by 10 (eg mm -> cm -> m).
NOTE: While changing to map view will increase the size of the arrows. Action groups don’t work so you cant move it.

##nav_slope_quad.ks
This gives the slope of a point and its bearing by sampling 4 points around it in a diamond shape.
By declaring a bearing (otherwise just use 0) you can get the components of the slope along that bearing and at right angles to it. Also by declaring the incline as 1 it will give you a bearing up the slope and -1 will give you down the slope.
By combining this with `gs_destination.ks` it is possible to have the script follow the slope up or down hill to find the flat landing location either at the top of the hill or at the bottom of a gully. (This is not necessarily the closest flat area but it is relatively easy to find by script).

##nav_slope_tri.ks
This works the same way as `nav_slope_quad.ks` except that it speeds up the calculation by using 3 points. The one you declared and 2 others 45deg either side of the declared bearing.
This if the other script lags too mutch try this one. It is faster but the centre of the sample area is not the point you gave it but just past it.

##demo_flight.ks
This was me playing around. It doesn’t do anything useful automation wise but. It shows the relative height of the terrain in front of you as you fly around.

#Creds
Nivekk for creating kOS and Erendrake and Steve Mading for maintaining and advancing it to where it is today.
I should also like to add that the equations are from this site:
http://www.movable-type.co.uk/scripts/latlong.html
Which contains implementations of these equations in various other languages, and although I haven’t copied any of the script it's self it has been an invaluable resource for the base equations.
