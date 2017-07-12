
carries(R,S,  T) :-                     position(R,C,T), position(S,C,0), isRobot(R), isShelf(S).
carries(R,S,  T) :- carries(R,S,  T-1), not serves(R,S,_,T),                        T <= horizon.
 serves(R,S,P,T) :- carries(R,S,  T-1), position(R,C,T), position(P,C),             isStation(P).
returns(R,S,  T) :-  serves(R,S,_,T-1),                                             T <= horizon.
returns(R,S,  T) :- returns(R,S,  T-1), not parked(R,S,T),                          T <= horizon.
 parked(R,S,  T) :- returns(R,S,  T-1), position(R,C,T), position(S,C,0).

:- isRobot(R), time(T), #count { S : carries(R,S,  T), isShelf(S);
                                 S :  serves(R,S,_,T), isShelf(S);
                                 S : returns(R,S,  T), isShelf(S) } > 1.

:- isRobot(R), isShelf(S), isStation(P), #count { T : serves(R,S,P,T) } > 1.
                                  
:- isShelf(S), not parked(_,S,horizon).

processed(O,A) :- ordered(O,A), target(O,P), shelved(S,A), serves(R,S,P,_).

processed(O) :- isOrder(O), processed(O,A) : ordered(O,A).
:- not processed(O), isOrder(O).

%*
processed(O,A) :- ordered(O,A), T < T', T'< T'',
                  shelved(S,A), position(S,C ,0), position(R,C, T  ), 
                   target(O,P), position(P,C'  ), position(R,C',T' ),
                                                  position(R,C ,T'').

processed(O  ) :- isOrder(O), processed(O,A) : ordered(O,A).

processed1(O,A,S,R,T) :- ordered(O,A), shelved(S,A), position(S,C,0), position(R,C,T).
processed1(O,A,S,R,T) :- processed1(O,A,S,R,T-1), not processed2(O,A,S,R,T-1), T <= horizon.
processed2(O,A,S,R,T) :- ordered(O,A),  target(O,P), position(P,C  ), position(R,C,T), processed1(O,A,S,R,T).
processed2(O,A,S,R,T) :- processed2(O,A,S,R,T-1), not processed3(O,A,S,R,T-1), T <= horizon.
processed3(O,A,S,R,T) :- ordered(O,A), shelved(S,A), position(S,C,0), position(R,C,T), processed2(O,A,S,R,T).

processed(O  ) :- isOrder(O), processed3(O,A,_,_,_) : ordered(O,A).
*%

