
processed(O,A) :- ordered(O,A), T < T', T'< T'',
	       	  shelved(S,A), position(S,C ,0), position(R,C, T  ), 
                   target(O,P), position(P,C'  ), position(R,C',T' ),
		                                  position(R,C ,T'').

processed(O  ) :- isOrder(O), processed(O,A) : ordered(O,A).

%*
processed1(O,A,S,R,T) :- ordered(O,A), shelved(S,A), position(S,C,0), position(R,C,T).
processed1(O,A,S,R,T) :- processed1(O,A,S,R,T-1), not processed2(O,A,S,R,T-1), T <= horizon.
processed2(O,A,S,R,T) :- ordered(O,A),  target(O,P), position(P,C  ), position(R,C,T), processed1(O,A,S,R,T).
processed2(O,A,S,R,T) :- processed2(O,A,S,R,T-1), not processed3(O,A,S,R,T-1), T <= horizon.
processed3(O,A,S,R,T) :- ordered(O,A), shelved(S,A), position(S,C,0), position(R,C,T), processed2(O,A,S,R,T).

processed(O  ) :- isOrder(O), processed3(O,A,_,_,_) : ordered(O,A).
*%

:- not processed(O), isOrder(O).
