
 :- serves(_,S,P,_), #count { 1,A : ordered(O,A), target(O,P), shelved(S,A) } = 0.

candiShelf(S) :- ordered(_,A), shelved(S,A).
 :- carries(_,S,_), not candiShelf(S).

 :- carries(_,S,_), not serves(_,S,_,_).

 :-    move(R,_,_), not serves(R,_,_,_).
 :-  pickup(R,S,_), not serves(R,S,_,_).
 :- putdown(R,S,_), not serves(R,S,_,_).

 :-  pickup(R,S,  T), {  serves(R,S,_,T') : T' > T, time(T') } = 0.
 :-  serves(R,S,_,T), {  pickup(R,S,  T') : T' < T, time(T') } = 0.
 :-  serves(R,S,_,T), { putdown(R,S,  T') : T' > T, time(T') } = 0.
 :- putdown(R,S,  T), {  serves(R,S,_,T') : T' < T, time(T') } = 0.	

 :-  pickup(R,S,  T), { putdown(R,S,  T') : T' > T, time(T') } = 0. 
 :- putdown(R,S,  T), {  pickup(R,S,  T') : T' < T, time(T') } = 0.
