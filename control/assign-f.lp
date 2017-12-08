#include "../input.lp".

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

:- ordered(O,A), #count { S : assign(_,S,P), shelved(S,A), target(O,P) } = 0.

:- isShelf(S), #count{ R : assign(R,S,_) } > 1.                 % Too strong?? :- assign(R,S,P), assign(R',S,P), R<R'.


#minimize { 1@4,R,S   : assign(R,S,_) }.
#minimize { 1@3,S     : assign(_,S,_) }.
#maximize { 1@2,R     : assign(R,_,_) }.
#minimize { 1@1,R,S,P : assign(R,S,P) }.

distance(R,S,|X-X'|+|Y-Y'|) :- position(R,(X,Y),0), position(S,(X',Y'),0), isRobot(R), isShelf(S).
distance(S,P,|X-X'|+|Y-Y'|) :- position(S,(X,Y),0), position(P,(X',Y')),   isShelf(S), isStation(P).

#minimize { D+D'@0,R,S,P : assign(R,S,P), distance(R,S,D), distance(S,P,D') }.

ignore(object(         robot,R),       P) :- init(object(  robot,R),              P), not assign(robot(R),_,_).
ignore(object(pickingStation,S),       P) :- init(object(pickingStation,S),       P), not target(_,station(S)).

ignore(object(product,A),value(on,(S,N))) :- init(object(product,A),value(on,(S,N))), not  assign(_,shelf(S),_).
ignore(object(product,A),              P) :- init(object(product,A),              P), not ordered(_,product(A)).

% BUGFIX
ignore(object(highway,N),value(at,    C)) :- init(object(highway,N),value(at,    C)), init(object(pickingStation,_),value(at,C)).

#show.
#show init(X,Y) : init(X,Y), not ignore(X,Y).
% #show ignore/2.
#show assign/3.
