

:- highway((X,Y)), not carries(_,S,T), &sum { positionX(S,T) } = X, &sum { positionY(S,T) } = Y, isShelf(S), time(T).
:- highway((X,Y)),         waits(R,T), &sum { positionX(R,T) } = X, &sum { positionY(R,T) } = Y, isRobot(R), time(T).

