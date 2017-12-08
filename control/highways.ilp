#program step(t).

position(R,(X,Y),t) :- positionX(R,X,t), positionY(R,Y,t).
:- highway(C), not carries(_,S,t), position(S,C,t), isShelf(S).
:- highway(C),         waits(R,t), position(R,C,t).

