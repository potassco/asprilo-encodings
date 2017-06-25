#include "./input.lp".

% ===============================================================================
% ACTION DESCRIPTION

#const horizon=1.
time(1..horizon).

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(X',Y'),(X+X',Y+Y')) :- position((X,Y)), direction((X',Y')), position((X+X',Y+Y')).



 {    move(R,D,T) : direction(D) ;
    pickup(R,  T)                ;
   putdown(R,  T)                ;
   deliver(R,  T)                } 1 :- isRobot(R), time(T).

% - move/3 ----------------------------------------------------------------------
   position(R,C',T) :- move(R,D,T),     position(R,C,T-1),     nextto(C,D,C').
                    :- move(R,D,T),     position(R,C,T-1), not nextto(C,D,_ ).
% :- position(R,C',T),   move(R,D,T), not position(R,C,T-1),     nextto(C,D,C').

% - pickup/2 --------------------------------------------------------------------
   carries(R,S, T) :- pickup(R,T),     position(R,C,T-1),   position(S,C,T-1),  isShelf(S).
                   :- pickup(R,T),     carrying(R,  T-1).
                   :- pickup(R,T),     position(R,C,T-1), { position(S,C,T-1) : isShelf(S) } = 0.   % UNSPECIFIC
:- carries(R,S, T),   pickup(R,T), not position(R,C,T-1),   position(S,C,T-1),  isShelf(S).

% - putdown/2 -------------------------------------------------------------------
   position(S,C, T) :- putdown(R,T),     position(R,C,T-1), carries(R,S,T-1).
                    :- putdown(R,T), not carrying(R,  T-1).                                         % UNSPECIFIC
:- position(S,C, T),   putdown(R,T), not position(R,C,T-1), carries(R,S,T-1).

% - deliver/2 -------------------------------------------------------------------
   serves(R,P,T) :- deliver(R,T),     position(R,C,T-1),     position(P,C    ), isStation(P).
                 :- deliver(R,T), not carrying(R,  T  ).
                 :- deliver(R,T), {   position(R,C,T-1) :    position(P,C    ), isStation(P) } = 0. % UNSPECIFIC
:- serves(R,P,T),   deliver(R,T),     position(R,C,T-1), not position(P,C    ), isStation(P).

% - inertia ---------------------------------------------------------------------
position(R,C,T) :- position(R,C,T-1), not    move(R,T), isRobot(R), time(T).
position(S,C,T) :- position(S,C,T-1), not carried(S,T), isShelf(S), time(T).
 carries(R,S,T) :-  carries(R,S,T-1), not putdown(R,T),             time(T).

% - (state) constraints ---------------------------------------------------------
 :- position(R, C, T-1), position(R, C',T), nextto(C,_,C'), R!=R',
    position(R',C',T-1), position(R',C, T).

 :- { position(R,C,T) : isRobot(R)                                  }  > 1, position(C), time(T).
 :- { position(R,C,T) : carrying(R,T); position(S,C,T) : isShelf(S) }  > 1, position(C), time(T).

% :- { position(R,C,T) : position(C)                                 } != 1, isRobot(R), time(T).
% :- { position(R,C,T) ; position(R,C',T) : nextto(C,_,C')           } != 1, position(R,C,T-1), isRobot(R), time(T).

% ===============================================================================
% AUXILIARIES

move(R,T) :- move(R,_,T).




carrying(R,T) :- carries(R,_,T).
 carried(S,T) :- carries(_,S,T).
