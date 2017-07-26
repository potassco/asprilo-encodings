#include "./input.lp".

ordered(order(O),product(A),N) :- init(object(order,O),   value(line,(A,N))).
shelved(shelf(S),product(A),N) :- init(object(product,A), value(on,  (S,N))).

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

:- ordered(O,A,N), #sum { M,S : assign(_,S,P), shelved(S,A,M), target(O,P) } < N.

:- isShelf(S), #count{ R : assign(R,S,_) } > 1.                 % Too strong?? :- assign(R,S,P), assign(R',S,P), R<R'.


#minimize { 1@4,R,S   : assign(R,S,_) }.
#minimize { 1@3,S     : assign(_,S,_) }.
#maximize { 1@2,R     : assign(R,_,_) }.
#minimize { 1@1,R,S,P : assign(R,S,P) }.

distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')),   isShelf(S), isStation(P).

#minimize { D+D'@0,R,S,P : assign(R,S,P), distance(R,S,D), distance(S,P,D') }.

#show assign/3.
#show init/2.
% #show distance/3.


