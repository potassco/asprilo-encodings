



processed(A) :- ordered(O,A), shelved(S,A), isRobot(R), position(S,(X,Y),0),
                positionX(R,X,horizon), positionY(R,Y,horizon).

:- ordered(O,A), not processed(A).
