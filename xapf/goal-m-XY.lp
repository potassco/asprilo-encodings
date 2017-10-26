



processed(O,A) :- ordered(O,A), shelved(S,A), position(S,(X,Y),0),
                  positionX(R,X,horizon), positionY(R,Y,horizon), isRobot(R).

processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).
