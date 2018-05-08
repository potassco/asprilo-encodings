#include "../input.lp".

%#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.


positionX(Min..Max) :- Min = #min { X : position((X,_))}, Max = #max { X : position((X,_))}.
positionY(Min..Max) :- Min = #min { Y : position((_,Y))}, Max = #max { Y : position((_,Y))}.

positionX(R,X,0) :- position(R,(X,_),0), isRobot(R).
positionY(R,Y,0) :- position(R,(_,Y),0), isRobot(R).

{ move(R,D,T) : direction(D) } 1 :- isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
positionX(R,X+D,T) :- move(R,(D,0),T), positionX(R,X,T-1), positionX(X+D).
positionY(R,Y+D,T) :- move(R,(0,D),T), positionY(R,Y,T-1), positionY(Y+D).
                   :- move(R,(D,0),T), positionX(R,X,T-1), not positionX(X+D).
                   :- move(R,(0,D),T), positionY(R,Y,T-1), not positionY(Y+D).

% - inertia ---------------------------------------------------------------------
positionX(R,X,T) :- positionX(R,X,T-1), not move(R,(_,0),T), isRobot(R), time(T).
positionY(R,Y,T) :- positionY(R,Y,T-1), not move(R,(0,_),T), isRobot(R), time(T).

% - edge collision --------------------------------------------------------------
moveto((X,Y),(X+D,Y  ),T) :- positionX(R,X,T-1), positionY(R,Y,T-1), move(R,(D,0),T), positionX(X+D).
moveto((X,Y),(X  ,Y+D),T) :- positionX(R,X,T-1), positionY(R,Y,T-1), move(R,(0,D),T), positionY(Y+D).
 :- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
 :- #count { R : isRobot(R), positionX(R,X,T), positionY(R,Y,T) }  > 1, position((X,Y)), time(T).

% - auxiliaries -----------------------------------------------------------------
 :- { positionX(R,X,T) } != 1, isRobot(R), time(T).   % REDUNDANT but PERFORMANT?
 :- { positionY(R,Y,T) } != 1, isRobot(R), time(T).   % REDUNDANT but PERFORMANT?
