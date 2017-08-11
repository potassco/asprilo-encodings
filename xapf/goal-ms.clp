% NON-ANONYMOUS MAPF 

goal(N,T) :- robot(N), shelf(N), position(shelf(N),(X,Y),0), &sum { positionX(robot(N),T) } = X, &sum { positionY(robot(N),T) } = Y.

% :- goal(N,T-1), move(N,_,T).
 
:- robot(N), shelf(N), not goal(N,horizon).
