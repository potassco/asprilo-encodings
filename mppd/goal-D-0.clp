
instant(shelf(S)) :- position(shelf(S),C,0), position(_,C), strategy.



processed(A,(X,Y)) :- ordered(O,A), target(O,P), position(P,(X,Y)), shelved(S,A), time(T), not position(S,(X,Y),0),
                      &sum { positionX(S,T) } = X, &sum{ positionY(S,T) } = Y.
processed(A,C)     :- ordered(O,A), target(O,P), position(P,C), shelved(S,A), position(S,C,0),
                      carries(_,S,T).




:- ordered(O,A), target(O,P), position(P,C), not processed(A,C).

:- carries(_,_,horizon).

:- position(_,(X,Y)), isRobot(R),
   &sum { positionX(R,horizon) } = X, &sum { positionY(R,horizon) } = Y.
:- position(_,(X,Y)), isShelf(S),
   &sum { positionX(S,horizon) } = X, &sum { positionY(S,horizon) } = Y.
