
% NON-ANONYMOUS MAPF 

:- robot(N), shelf(N), position(shelf(N),(X,_),0), not positionX(robot(N),X,horizon).
:- robot(N), shelf(N), position(shelf(N),(_,Y),0), not positionY(robot(N),Y,horizon).
