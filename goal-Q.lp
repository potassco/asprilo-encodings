#include "./quantities.lp".






processed(O) :- isOrder(O), #sum { N : ordered(O,A,N,horizon), ordered(O,A) } = 0.
% processed(O,M) :- isOrder(O), #sum { N : ordered(O,A,N,horizon), ordered(O,A) } = M, M=0..10.

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(S,C), position(_,C,horizon), isStation(S).

