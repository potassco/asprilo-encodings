#include "./input.lp".

#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.


positionX(robot(R),X,0) :- init(object(robot,R), value(at,(X,_))).
positionY(robot(R),Y,0) :- init(object(robot,R), value(at,(_,Y))).

positionX(Min..Max) :- Min = #min { X : position((X,_))}, Max = #max { X : position((X,_))}.
positionY(Min..Max) :- Min = #min { Y : position((_,Y))}, Max = #max { Y : position((_,Y))}.

 { move(R,D,T) : direction(D) } 1 :- isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
positionX(R,X+D,T) :- move(R,(D,0),T), positionX(R,X,T-1), positionX(X+D).
positionY(R,Y+D,T) :- move(R,(0,D),T), positionY(R,Y,T-1), positionY(Y+D).
                   :- move(R,(D,0),T), positionX(R,X,T-1), not positionX(X+D).
                   :- move(R,(0,D),T), positionY(R,Y,T-1), not positionY(Y+D).

% - inertia ---------------------------------------------------------------------
positionX(R,X,T) :- positionX(R,X,T-1), not move(R,_,T), isRobot(R), time(T).
positionY(R,Y,T) :- positionY(R,Y,T-1), not move(R,_,T), isRobot(R), time(T).

% - (state) constraints ---------------------------------------------------------
 :- positionX(R, X, T-1), positionY(R, Y, T-1), positionY(R, Y',T), positionY(R, Y',T), 
    positionX(R',X',T-1), positionY(R',Y',T-1), positionX(R',X, T), positionY(R',Y, T),
    R != R', isRobot(R), isRobot(R').

 :- #count { R : isRobot(R), positionX(R,X,T), positionY(R,Y,T) }  > 1, position((X,Y)), time(T).
