
parking(S,C) :- position(S,C,0), not parking(S,C'), C != C', position(C'), isShelf(S). % default parking

   parked(  S,  0)   :-                                                                              isShelf(S).
   parked(  S,  T)   :-  parked(  S,  T-1), not carries(_,S,T),                                    T <= horizon.
   
{ carries(R,S,  T) } :-  parked(  S,  T-1), position(R,C,T), parking(S,C),               isRobot(R), isShelf(S).
  carries(R,S,  T)   :- carries(R,S,  T-1),                  not serves(R,S,_,T), not parked(S,T), T <= horizon.
   serves(R,S,P,T)   :- carries(R,S,  T-1), position(R,C,T), position(P,C),                        isStation(P).
  carries(R,S,  T)   :-  serves(R,S,_,T-1),                                                        T <= horizon.
   parked(  S,  T)   :- carries(R,S,  T-1), position(R,C,T), parking(S,C).

:- carries(R,S,T),  serves(R,S,_,T).  % REDUNDANT?
:- carries(R,S,T),  parked(  S,  T).  % REDUNDANT?

:- isRobot(R), time(T), #count { S : carries(R,S,  T), isShelf(S) ;
                                 S :  serves(R,S,_,T), isShelf(S) } > 1.
:- isShelf(S), time(T), #count { R : carries(R,S,  T), isRobot(R) ;
                                 R :  serves(R,S,_,T), isRobot(R) } > 1.

:- isRobot(R), isShelf(S), isStation(P), #count { T : serves(R,S,P,T) } > 1. % STRATEGY?
                                  
:- isShelf(S), not parked(S,horizon).

processed(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,_).

processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).
:- not processed(O), isOrder(O).

%* --- plain version ---
processed(O,A) :- ordered(O,A), T < T', T'< T'',
                  shelved(S,A), position(S,C ,0), position(R,C, T  ), 
                   target(O,P), position(P,C'  ), position(R,C',T' ),
                                                  position(R,C ,T'').

processed(O  ) :- isOrder(O), processed(O,A) : ordered(O,A).
*%

