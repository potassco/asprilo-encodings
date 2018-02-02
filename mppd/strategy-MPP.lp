strategy.

 :- serves(_,S,P,_), not shelved(S,A) : ordered(O,A), target(O,P).

 :- carries(R,S,_), not serves(R,S,_,_).

 :- move(R,_,_), not serves(R,_,_,_).

 :-  pickup(R,S,T), not serves(R,S,_,T') : time(T'), T' > T.
 :- putdown(R,S,T), not serves(R,S,_,T') : time(T'), T' < T.
