





processed(O) :- isOrder(O), &sum{ amountMissing(A,O,horizon) : ordered(O,A) } = 0.                  % MAX/Roland?

:- not processed(O), isOrder(O).

:- carrying(R,horizon), isRobot(R).
:- position(S,C), position(_,C,horizon), isStation(S).

