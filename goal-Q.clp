





processed(O) :- isOrder(O), &sum{ amountMissing(A,O,horizon) : ordered(O,A) } = 0.

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).
:- position(S,C), position(_,C,horizon), isStation(S).
