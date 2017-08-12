% NON-ANONYMOUS MAPF 



goal(N,T) :- robot(N), shelf(N), position(shelf(N),C,0), position(robot(N),C,T).

% :- goal(N,T-1), move(N,_,T).
 
:- robot(N), shelf(N), not goal(N,horizon).

distance(N,|X-X'|+|Y-Y'|) :- position(shelf(N),(X,Y),0), position(robot(N),(X',Y'),0).
maxdistance(M) :- M = #max{ D : distance(_,D) }.

:- #count { 1,T : move(robot(N),_,T), time(T) } < D, distance(N,D), robot(N), shelf(N).
:- goal(N,T), distance(N,D), T<D.
:- maxdistance(M), horizon < M.
