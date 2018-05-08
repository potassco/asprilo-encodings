#include "../input.lp".

%#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')).

{ position(R,C,T) } :- isRobot(R), position(C), time(T).
{ position(S,C,T) } :- isShelf(S), position(C), time(T).
{  carries(R,S,T) } :- isRobot(R), isShelf(S),  time(T).

% - (state) constraints ---------------------------------------------------------
 :- { position(R,C,T) } != 1, isRobot(R), time(T).
 :- { position(S,C,T) } != 1, isShelf(S), time(T).

 :- { carries(R,S,T) } > 1, isRobot(R), time(T).
 :- { carries(R,S,T) } > 1, isShelf(S), time(T).

% - move/3 ----------------------------------------------------------------------
move(R,C',C,D,T) :- isRobot(R), position(R,C',T-1), position(R,C,T), nextto(C',D,C).
move(R,D,T)      :- move(R,C',C,D,T).
 :- position(R,C,T), not position(R,C,T-1), isRobot(R), time(T),
    not position(R,C',T-1) : nextto(C',D,C).
 :- position(R,C,T-1), not position(R,C,T), isRobot(R), time(T),
    not position(R,C',T) : nextto(C,D,C').

% - pickup/3 --------------------------------------------------------------------
pickup(R,S,T)  :- carries(R,S,T), not carries(R,S,T-1).
 :- pickup(R,S,T), carries(R,_,T-1).
 :- pickup(R,S,T), carries(_,S,T-1).
 :- pickup(R,S,T), position(R,C,T-1), not position(S,C,T-1).
 :- pickup(R,S,T), position(S,C,T-1), not position(R,C,T-1).

% - putdown/3 -------------------------------------------------------------------
putdown(R,S,T) :- carries(R,S,T-1), not carries(R,S,T), time(T).

:- isRobot(R), time(T), #count{ m : move(R,_,T); p : pickup(R,_,T); p : putdown(R,_,T) } > 1.

waits(R,T) :- not pickup(R,_,T), not putdown(R,_,T), not move(R,_,T), isRobot(R), time(T).

% - serves/4 --------------------------------------------------------------------
serves(R,S,P,T) :- position(R,C,T), carries(R,S,T), position(P,C), strategy.

% - (in)direct effects ----------------------------------------------------------
 :- carries(R,S,T), position(R,C,T), not position(S,C,T).
 :- carries(R,S,T), position(S,C,T), not position(R,C,T).

% - inertia ---------------------------------------------------------------------
 :- position(S,C,T), not position(S,C,T-1), isShelf(S), time(T), not carries(_,S,T).
 :- position(S,C,T-1), not position(S,C,T), isShelf(S), time(T), not carries(_,S,T).

% - edge collision --------------------------------------------------------------
moveto(C',C,T) :- move(R,C',C,D,T).
 :- moveto(C',C,T), moveto(C,C',T), C < C'.

% - vertex collision ------------------------------------------------------------
 :- { position(R,C,T) : isRobot(R) }  > 1, position(C), time(T).
 :- { position(S,C,T) : isShelf(S) }  > 1, position(C), time(T).
