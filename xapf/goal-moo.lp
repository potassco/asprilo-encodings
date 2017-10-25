

processed(O,A) :- ordered(O,A), shelved(S,A), position(S,C,0), position(R,C,T), isRobot(R).

processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).
