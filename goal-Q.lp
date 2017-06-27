





processed(O) :- isOrder(O), #sum { N : amountMissing(A,O,N,horizon), ordered(O,A) } = 0.
processed(O,T) :- isOrder(O), #sum { N : amountMissing(A,O,N,T), ordered(O,A) } = 0, time(T).

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(S,C), position(_,C,horizon), isStation(S).

