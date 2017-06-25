
candiShelf(S) :- ordered(_,A), onShelf(A,S).
:- carries(R,S,T), not candiShelf(S).
%*
deliShelf(S) :- candiShelf(S), serves(R,_,T), carries(R,S,T).
:- carries(R,S,T), not deliShelf(S).

deliRobot(R) :- isRobot(R), serves(R,_,T).
:- move(R,_,T), not deliRobot(R).
*%

 :-  pickup(R,_,T), { deliver(R,_,T') : T' > T, time(T') } = 0.
 :- deliver(R,_,T), {  pickup(R,_,T') : T' < T, time(T') } = 0.
 :- deliver(R,_,T), { putdown(R,_,T') : T' > T, time(T') } = 0.
 :- putdown(R,_,T), { deliver(R,_,T') : T' < T, time(T') } = 0.	

% :-   move(R,_,T), { deliver(R,_,T') : T'!= T, time(T') } = 0.

