
candiShelf(S) :- ordered(_,A), onShelf(A,S).
:- carries(R,S,T), not candiShelf(S).
%*
deliShelf(S) :- candiShelf(S), serves(_,S,_,_).
:- carries(R,S,T), not deliShelf(S).

deliRobot(R) :- isRobot(R), serves(R,_,_,_).
:- move(R,_,T), not deliRobot(R).
*%

 :-  pickup(R,S,  T), {  serves(R,S,_,T') : T' > T, time(T') } = 0.
 :-  serves(R,S,_,T), {  pickup(R,S,  T') : T' < T, time(T') } = 0.
 :-  serves(R,S,_,T), { putdown(R,S,  T') : T' > T, time(T') } = 0.
 :- putdown(R,S,  T), {  serves(R,S,_,T') : T' < T, time(T') } = 0.

 :-  pickup(R,S,T), { putdown(R,S,T') : T' > T,                  time(T') } = 0.
 :- putdown(R,S,T), {  pickup(R,S,T') : T' < T,                  time(T') } = 0.
%*
 :-    move(R,_,T), {  serves(R,_,_,T') : T'!= T, time(T') } = 0.
*%
