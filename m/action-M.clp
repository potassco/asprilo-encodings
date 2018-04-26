#include "../input.lp".
#include <csp>.

%#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.

maxXposition(M) :- M = #max { X : position((X,_))}.
minXposition(M) :- M = #min { X : position((X,_))}.
maxYposition(M) :- M = #max { Y : position((_,Y))}.
minYposition(M) :- M = #min { Y : position((_,Y))}.

&dom{X..X} = positionX(R,0) :- position(R,(X,_),0), isRobot(R).
&dom{Y..Y} = positionY(R,0) :- position(R,(_,Y),0), isRobot(R).
&dom{M..N} = positionX(R,T) :- minXposition(M), maxXposition(N), isRobot(R), time(T).
&dom{M..N} = positionY(R,T) :- minYposition(M), maxYposition(N), isRobot(R), time(T).

{ move(R,D,T) : direction(D) } 1 :- isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
 :-     move(R,(D,0),T), &sum { positionX(R,T-1); D } != positionX(R,T).
 :-     move(R,(0,D),T), &sum { positionY(R,T-1); D } != positionY(R,T).

% - inertia ---------------------------------------------------------------------
 :- not move(R,(_,0),T), &sum { positionX(R,T-1)    } != positionX(R,T), isRobot(R), time(T).
 :- not move(R,(0,_),T), &sum { positionY(R,T-1)    } != positionY(R,T), isRobot(R), time(T).

% - edge collision --------------------------------------------------------------
:- &sum { positionX(R ,T-1) } = positionX(R',T), &sum { positionY(R ,T-1) } = positionY(R',T),
   &sum { positionX(R',T-1) } = positionX(R ,T), &sum { positionY(R',T-1) } = positionY(R ,T),
   R  > R', isRobot(R), isRobot(R'), time(T).

% - vertex collision ------------------------------------------------------------
:- &sum { positionX(R,T) } = positionX(R',T), &sum { positionY(R,T) } = positionY(R',T),
   R  > R', isRobot(R), isRobot(R'), time(T).
