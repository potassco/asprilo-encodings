


processed(O,A) :- ordered(O,A), shelved(S,A), position(S,(X,Y),0),
                  &sum { positionX(R,horizon) } = X, &sum { positionY(R,horizon) } = Y, isRobot(R).

processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).
