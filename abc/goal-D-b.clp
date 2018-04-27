#const rate=1.

toShelf(S,C) :- shelved(S,A), ordered(O,A), target(O,P), position(P,C).



 { process(A,O,C,T) : ordered(O,A), target(O,P), position(P,C) } rate :- time(T).

processed(A,O,T) :- process(A,O,C,T).
processed(A,O,T) :- processed(A,O,T-1), time(T).

:- process(A,O,C,T), processed(A,O,T-1).

atShelf(S,(X,Y),T) :- toShelf(S,(X,Y)), time(T+1), &sum { positionX(S,T) } = X, &sum{ positionY(S,T) } = Y.

process(A,C,T) :- process(A,O,C,T).

:- process(A,C,T), not atShelf(S,C,T-1) : shelved(S,A).

process(C,T) :- process(A,C,T).

:- process(C,T), atShelf(S,C,T-1), not carries(_,S,T-1).
:- process((X,Y),T), isRobot(R), &sum { positionX(R,T-1) } = X, &sum{ positionY(R,T-1) } = Y, not waits(R,T).



:- ordered(O,A), not processed(A,O,horizon).

:- carries(_,_,horizon).

:- position(_,(X,Y)), isRobot(R),
   &sum { positionX(R,horizon) } = X, &sum { positionY(R,horizon) } = Y.
:- position(_,(X,Y)), isShelf(S),
   &sum { positionX(S,horizon) } = X, &sum { positionY(S,horizon) } = Y.
