% NON-ANONYMOUS MAPF 

:- robot(N), shelf(N), position(shelf(N),(X,_),0), &sum { positionX(robot(N),horizon) } != X.
:- robot(N), shelf(N), position(shelf(N),(_,Y),0), &sum { positionY(robot(N),horizon) } != Y.
