





processed(O) :- isOrder(O), #sum { N : ordered(A,O,N,horizon), ordered(O,A) } = 0.


:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(S,C), position(_,C,horizon), isStation(S).

