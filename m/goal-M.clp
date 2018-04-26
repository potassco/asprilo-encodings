processed(A,R) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,(X,Y),0),
                  &sum { positionX(R,horizon) } = X, &sum { positionY(R,horizon) } = Y.
processed(A)   :- processed(A,R).

:- ordered(O,A), not processed(A).
