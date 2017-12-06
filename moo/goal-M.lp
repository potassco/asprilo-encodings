


processed(A) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,C,0),
                position(R,C,horizon).

:- ordered(O,A), not processed(A).
