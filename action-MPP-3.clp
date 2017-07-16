#include "./input.lp".
#include <csp>. 

#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.

maxXposition(M) :- M = #max { X : position((X,_))}.
minXposition(M) :- M = #min { X : position((X,_))}.
maxYposition(M) :- M = #max { Y : position((_,Y))}.
minYposition(M) :- M = #min { Y : position((_,Y))}.

&dom{X..X} = positionX(robot(R),0) :- init(object(robot,R), value(at,(X,_))).
&dom{Y..Y} = positionY(robot(R),0) :- init(object(robot,R), value(at,(_,Y))).
&dom{M..N} = positionX(      R ,T) :- minXposition(M), maxXposition(N), isRobot(R), time(T).
&dom{M..N} = positionY(      R ,T) :- minYposition(M), maxYposition(N), isRobot(R), time(T).

&dom{X..X} = positionX(shelf(S),0) :- init(object(shelf,S), value(at,(X,_))).
&dom{Y..Y} = positionY(shelf(S),0) :- init(object(shelf,S), value(at,(_,Y))).
&dom{M..N} = positionX(      S ,T) :- minXposition(M), maxXposition(N), isShelf(S), time(T).
&dom{M..N} = positionY(      S ,T) :- minYposition(M), maxYposition(N), isShelf(S), time(T).

 {    move(R,D,T) : direction(D) ;
    pickup(R,S,T) : isShelf(S)   ;
   putdown(R,S,T) : isShelf(S)   } 1 :- isRobot(R), time(T).

waits(R,T) :- not pickup(R,_,T), not putdown(R,_,T), not move(R,_,T), isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
 :-     move(R,(D,0),T), &sum { positionX(R,T-1); D } != positionX(R,T).
 :-     move(R,(0,D),T), &sum { positionY(R,T-1); D } != positionY(R,T).

% - pickup/3 --------------------------------------------------------------------
 carries(R,S,T) :- pickup(R,S,T), &sum { positionX(R,T-1) }  = positionX(S,T-1),
		                  &sum { positionY(R,T-1) }  = positionY(S,T-1).
                :- pickup(R,S,T),   carries(R,_,T-1).
                :- pickup(R,S,T),   carries(_,S,T-1).                                                    % NEEDED!?
                :- pickup(R,S,T), &sum { positionX(R,T-1) } != positionX(S,T-1).
                :- pickup(R,S,T), &sum { positionY(R,T-1) } != positionY(S,T-1).

% - putdown/3 -------------------------------------------------------------------
                :- putdown(R,S,T), not carries(R,S ,T-1).

% - serves/4 --------------------------------------------------------------------
serves(R,S,P,T) :- carries(R,S,T), &sum { positionX(R,T) } = X,  &sum{ positionY(R,T) } = Y, position(P,(X,Y)), isStation(P).

% - inertia ---------------------------------------------------------------------
 :- not move(R,(_,0),T), &sum { positionX(R,T-1) } != positionX(R,T), isRobot(R), time(T).
 :- not move(R,(0,_),T), &sum { positionY(R,T-1) } != positionY(R,T), isRobot(R), time(T).

carries(R,S,T) :- carries(R,S,T-1), not putdown(R,_,T), time(T).

 :-     carries(R,S,T), &sum { positionX(R,T  ) } != positionX(S,T),             time(T).
 :-     carries(R,S,T), &sum { positionY(R,T  ) } != positionY(S,T),             time(T).
 :- not carries(_,S,T), &sum { positionX(S,T-1) } != positionX(S,T), isShelf(S), time(T).
 :- not carries(_,S,T), &sum { positionY(S,T-1) } != positionY(S,T), isShelf(S), time(T).

% - (state) constraints ---------------------------------------------------------
:- &sum { positionX(R ,T-1) } = positionX(R',T), &sum { positionY(R ,T-1) } = positionY(R',T),
   &sum { positionX(R',T-1) } = positionX(R ,T), &sum { positionY(R',T-1) } = positionY(R ,T), R != R', isRobot(R), isRobot(R'), time(T).

:- &sum { positionX(R,T) } = positionX(R',T),
   &sum { positionY(R,T) } = positionY(R',T), R > R', isRobot(R), isRobot(R'), time(T).
:- &sum { positionX(S,T) } = positionX(S',T),
   &sum { positionY(S,T) } = positionY(S',T), S > S', isShelf(S), isShelf(S'), time(T).


