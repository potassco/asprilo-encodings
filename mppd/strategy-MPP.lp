strategy.

candoShelf(S,P,C) :- shelved(S,A), ordered(O,A), target(O,P), position(P,C).
candoShelf(S)     :- candoShelf(S,_,_).
cannoShelf(S,C)   :- candoShelf(S), position(P,C), not candoShelf(S,P,C).

candiShelf(S,P) :- candoShelf(S,P,C), not cannoShelf(S,C).
candiShelf(S)   :- candiShelf(S,P), position(S,C,0), not cannoShelf(S,C).



 :- carries(_,S,_), not candiShelf(S).

 :- serves(_,S,P,_), candiShelf(S), not candiShelf(S,P).

 :- move(R,_,_), not serves(R,_,_,_).

 :- pickup(R,S,T), not instant(S), not serves(R,S,_,T') : time(T'), T' > T.
 :- serves(R,S,_,T), not instant(S), not pickup(R,S,T') : time(T'), T' < T.

 :- putdown(R,S,T), not serves(R,S,_,T') : time(T'), T' < T.
 :- putdown(R,S,T), not   pickup(R,S,T') : time(T'), T' < T.
