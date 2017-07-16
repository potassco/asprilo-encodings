


processed(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,_).


processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).

:- not processed(O), isOrder(O).

:- carries(R,_,horizon),                   isRobot(R).

:- &sum { positionX(R,horizon) } = X,
   &sum { positionY(R,horizon) } = Y, position(P,(X,Y)), isStation(P), isRobot(R).
