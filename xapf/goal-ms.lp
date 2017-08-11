% NON-ANONYMOUS MAPF 



goal(N,T) :- robot(N), shelf(N), position(shelf(N),C,0), position(robot(N),C,T).

:- goal(N,T-1), move(N,_,T).
 
:- robot(N), shelf(N), not goal(N,horizon).
