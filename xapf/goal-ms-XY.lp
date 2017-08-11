% NON-ANONYMOUS MAPF 



goal(N,T) :- robot(N), shelf(N), position(shelf(N),(X,Y),0), positionX(robot(N),X,T), positionY(robot(N),Y,T).

:- goal(N,T-1), move(N,_,T).
 
:- robot(N), shelf(N), not goal(N,horizon).
