
candiShelf(S) :- ordered(_,A), onShelf(A,S).
:- carries(R,S,T), not candiShelf(S).
%*
deliShelf(S) :- candiShelf(S), serves(R,_,T), carries(R,S,T).
:- carries(R,S,T), not deliShelf(S).

deliRobot(R) :- isRobot(R), serves(R,_,T).
:- move(R,T), not deliRobot(R).
*%

 :-  pickup(R,T), { deliver(R,T') : T' > T, time(T') } = 0.
 :- deliver(R,T), {  pickup(R,T') : T' < T, time(T') } = 0.
 :- deliver(R,T), { putdown(R,T') : T' > T, time(T') } = 0.
 :- putdown(R,T), { deliver(R,T') : T' < T, time(T') } = 0.	
%*
 :-  pickup(R,T), { putdown(R,T') : T' > T, time(T') } = 0. 
 :- putdown(R,T), {  pickup(R,T') : T' < T, time(T') } = 0.

 :-    move(R,T), { deliver(R,T') : T'!= T, time(T') } = 0.
*%
