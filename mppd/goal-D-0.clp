


processed(P,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,_).




:- ordered(O,A), target(O,P), not processed(P,A).

:- carries(R,_,horizon), isRobot(R).

:- position(P,(X,Y)), isStation(P), isRobot(R),
   &sum { positionX(R,horizon) } = X, &sum { positionY(R,horizon) } = Y.
:- position(P,(X,Y)), isStation(P), isShelf(S),
   &sum { positionX(S,horizon) } = X, &sum { positionY(S,horizon) } = Y.
