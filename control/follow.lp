#include "../input.lp".



goal(R,N,T) :- goal(R,N,T-1), time(T).

goal(R,1,T) :- go(R,C,1), position(R,C,T).
goal(R,N,T) :- go(R,C,N), position(R,C,T), goal(R,N-1,T), N>1.

:- not goal(R,N,T), T=horizon, go(R,_,N), not go(R,_,N+1).

% #heuristic goal(R,C,N). [10-N,factor]

