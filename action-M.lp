#include "./input.lp".

#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')).



 { move(R,D,T) : direction(D) } 1 :- isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T), position(R,C',T-1),     nextto(C',D,C).
                :- move(R,D,T), position(R,C ,T-1), not nextto(C ,D,_).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not move(R,_,T), isRobot(R), time(T).

% - (state) constraints ---------------------------------------------------------
 :- position(R, C, T-1), position(R, C',T), nextto(C,_,C'), R != R',
    position(R',C',T-1), position(R',C, T).

 :- { position(R,C,T) : isRobot(R)                                  }  > 1, position(C), time(T).
%*
 :- { position(R,C,T) : position(C)                                 } != 1, isRobot(R), time(T).
 :- { position(R,C,T) ; position(R,C',T) : nextto(C,_,C')           } != 1, position(R,C,T-1), isRobot(R), time(T).
*%
