
candiShelf(S) :- ordered(_,A), onShelf(A,S).
:- carries(R,S,T), not candiShelf(S).
%*
deliShelf(S) :- candiShelf(S), serves(R,S,T), carries(R,S,T).
:- carries(R,S,T), not deliShelf(S).

deliRobot(R) :- isRobot(R), serves(R,_,T).
:- move(R,_,T), not deliRobot(R).
*%

 :-  pickup(R,S,T), { deliver(R,P,T') : T' > T, carries(R,S,T'), time(T') } = 0.
 :- deliver(R,P,T), {  pickup(R,S,T') : T' < T,                  time(T') } = 0, carries(R,S,T).
 :- deliver(R,P,T), { putdown(R,S,T') : T' > T,                  time(T') } = 0, carries(R,S,T).
 :- putdown(R,S,T), { deliver(R,P,T') : T' < T, carries(R,S,T'), time(T') } = 0.	

 :-  pickup(R,S,T), { putdown(R,S,T') : T' > T,                  time(T') } = 0. 
 :- putdown(R,S,T), {  pickup(R,S,T') : T' < T,                  time(T') } = 0.
%*
 :-   move(R,_,T), { deliver(R,_,T') : T'!= T, time(T') } = 0.
*%
