#include "./input.lp".

#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')).

{ position(R,C,T) } :- isRobot(R), position(C),  time(T).
{ position(S,C,T) } :- isShelf(S), position(C),  time(T).
{  carries(R,S,T) } :- isRobot(R), isShelf(S),   time(T).
{   serves(R,P,T) } :- isRobot(R), isStation(P), time(T).

% - (state) constraints -------------------------------------------------------------------

:- { position(R,C,T) : position(C)   } != 1, isRobot(R), time(T).

:- { position(R,C,T) : isRobot(R)    }  > 1, position(C), time(T).
:- { position(S,C,T) : isShelf(S);
     position(R,C,T) : carrying(R,T) }  > 1, position(C), time(T).

:- position(R, C, T-1), position(R, C',T), nextto(C,_,C'), R!=R',
   position(R',C',T-1), position(R',C, T).

:- {  carries(R,S,T) : isShelf(S)    }  > 1, isRobot(R), time(T).
:- {  carries(R,S,T) : isRobot(R)    }  > 1, isShelf(S), time(T).

:- {   serves(R,P,T) : isRobot(R)    }  > 1, isStation(P), time(T).
:- {   serves(R,P,T) : isStation(P)  }  > 1, isRobot(R),   time(T).

   move(R,D,T) :- position(R,C,T-1), nextto(C,D,C'),  position(R,C',T).
 pickup(R,S,T) :- position(R,C,T-1), position(S,C,T-1), carries(R,S,T).
putdown(R,S,T) :- position(R,C,T-1), carries(R,S,T-1), position(S,C,T).
deliver(R,P,T) :- position(R,C,T-1), position(P,C),      serves(R,P,T).

    move(R,T) :-    move(R,_,T).
 putdown(R,T) :- putdown(R,_,T).
  pickup(R,T) :-  pickup(R,_,T).
 deliver(R,T) :- deliver(R,_,T).

carrying(R,T) :- carries(R,_,T).
 carried(S,T) :- carries(_,S,T).

:- deliver(R,T), not carrying(R,T  ).
:- putdown(R,T), not carrying(R,T-1).

:- { move(R,T); pickup(R,T); putdown(R,T); deliver(R,T) } > 1, isRobot(R), time(T).

:-     position(R,C,T), not position(R,C,T-1), not    move(R,  T), isRobot(R),               time(T).
:-     position(S,C,T), not position(S,C,T-1), not putdown(R,S,T), isRobot(R), isShelf(S),   time(T).
:- not position(S,C,T),     position(S,C,T-1), not  pickup(R,S,T), isRobot(R), isShelf(S),   time(T).
:-      carries(R,S,T), not  carries(R,S,T-1), not  pickup(R,S,T), isRobot(R), isShelf(S),   time(T).
:- not  carries(R,S,T),      carries(R,S,T-1), not putdown(R,S,T), isRobot(R), isShelf(S),   time(T).
:-       serves(R,P,T), not   serves(R,P,T-1), not deliver(R,P,T), isRobot(R), isStation(P), time(T).

%*
:- not move(robot(1),(0,1),1).
:- not pickup(robot(1),shelf(2),2).
:- not move(robot(1),(0,-1),3).
:- not move(robot(1),(1,0),4). :- not position(robot(1),(2,1),4).
:- not deliver(robot(1),5).    :- not serves(robot(1),station(1),5).
*%

:- not move(robot(2),(0,1),1).  :- not position(robot(2),(2,2),1).
                                :- not position(shelf(1),(2,2),1).
%                                :- not carries(robot(2),shelf(1),2).
      % pickup(robot(2),shelf(1),2).
% :- not deliver(robot(2),4).


% ================================================================================
% GOAL DESCRIPTION



delivered(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,P,T), carries(R,S,T). % No time, no resources


processed(O  ) :- isOrder(O), delivered(O,A) : ordered(O,A).                              % No ordering

:- not processed(O), isOrder(O).

%:- carrying(R,horizon), isRobot(R).
%:- position(S,C), position(_,C,horizon), isStation(S).
