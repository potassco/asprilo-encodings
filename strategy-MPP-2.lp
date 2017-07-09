
 :- serves(_,S,P,_), #count { 1,A : ordered(O,A), target(O,P), shelved(S,A) } = 0.

candiShelf(S) :- ordered(_,A), shelved(S,A).
 :- carries(_,S,_), not candiShelf(S).

 :- carries(_,S,_), not serves(_,S,_,_).

 :- move(R,_,_),    not serves(R,_,_,_).
 :- pickup(R,_),    not serves(R,_,_,_).
 :- putdown(R,_),   not serves(R,_,_,_).

 :-  pickup(R,    T), {  serves(R,_,_,T') : T' > T, time(T') } = 0.
 :-  serves(R,_,_,T), {  pickup(R,    T') : T' < T, time(T') } = 0.
 :-  serves(R,_,_,T), { putdown(R,    T') : T' > T, time(T') } = 0.
 :- putdown(R,    T), {  serves(R,_,_,T') : T' < T, time(T') } = 0.	

 :-  pickup(R,T), { putdown(R,T') : T' > T, time(T') } = 0. 
 :- putdown(R,T), {  pickup(R,T') : T' < T, time(T') } = 0.
