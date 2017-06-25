
candiShelf(S) :- ordered(_,A), onShelf(A,S).
:- carries(R,S,T), not candiShelf(S).
%*
deliShelf(S) :- candiShelf(S), serves(_,S,_,_).
:- carries(R,S,T), not deliShelf(S).

deliRobot(R) :- isRobot(R), serves(R,_,_,T).
:- move(R,T), not deliRobot(R).
*%

 :-  pickup(R,_,  T), {  serves(R,_,_,T') : T' > T, time(T') } = 0.
 :-  serves(R,_,_,T), {  pickup(R,_,  T') : T' < T, time(T') } = 0.
 :-  serves(R,_,_,T), { putdown(R,_,  T') : T' > T, time(T') } = 0.
 :- putdown(R,_,  T), {  serves(R,_,_,T') : T' < T, time(T') } = 0.	

%:-    move(R,_,  T), {  serves(R,_,_,T') : T'!= T, time(T') } = 0.

