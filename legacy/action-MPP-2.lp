#include "../input.lp".

#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')).



 {    move(R,D,T) : direction(D) ;
    pickup(R,  T)                ;
   putdown(R,  T)                } 1 :- isRobot(R), time(T).

waits(R,T) :- not pickup(R,T), not putdown(R,T), not move(R,_,T), isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
position(R,C,T) :- move(R,D,T),    position(R,C',T-1),     nextto(C',D,C).
                :- move(R,D,T),    position(R,C ,T-1), not nextto(C, D,_).

% - pickup/2 --------------------------------------------------------------------
 carries(R,S,T) :- pickup(R,T),    position(R,C,T-1),   position(S,C ,T-1),  isShelf(S).
                :- pickup(R,T),     carries(R,_,T-1).
                :- pickup(R,T),    position(R,C,T-1), { position(S,C ,T-1) : isShelf(S) } = 0.              % UNSPECIFIC
                :- pickup(R,T),    position(R,C,T-1),   position(S,C',T-1), carries(R,S,T), C != C'.        % NEEDED?

% - putdown/2 -------------------------------------------------------------------
                :- putdown(R,T), not carries(R,_,T-1).                                                      % UNSPECIFIC

% - serves/4 --------------------------------------------------------------------
serves(R,S,P,T) :- position(R,C,T), carries(R,S,T),  position(P,C), isStation(P).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not    move(R,_,T), isRobot(R), time(T).
 carries(R,S,T) :-  carries(R,S,T-1), not putdown(R,  T),             time(T).

position(S,C,T) :- position(R,C,T  ),     carries(R,S,T).
position(S,C,T) :- position(S,C,T-1), not carries(_,S,T), isShelf(S), time(T).

% - (state) constraints ---------------------------------------------------------
 :- position(R, C, T-1), position(R, C',T), nextto(C,_,C'), R != R',
    position(R',C',T-1), position(R',C, T).

 :- { position(R,C,T) : isRobot(R)                                   }  > 1, position(C), time(T).
 :- { position(S,C,T) : isShelf(S)                                   }  > 1, position(C), time(T).
%*
 :- { position(R,C,T) : position(C)                                  } != 1, isRobot(R), time(T).
 :- { position(R,C,T) ; position(R,C',T) : nextto(C,_,C')            } != 1, position(R,C,T-1), isRobot(R), time(T).

 :- { carries(R,S,T)  : isShelf(S)                                   }  > 1, isRobot(R), time(T).
 :- { carries(R,S,T)  : isRobot(R)                                   }  > 1, isShelf(S), time(T).
*%
