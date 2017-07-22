#include "./input.lp".

{ assign(R,S,P) } :- isRobot(R), isShelf(S), isStation(P).

:- ordered(O,A), #count { S : assign(_,S,P), shelved(S,A), target(O,P) } = 0.

:- isShelf(S), #count{ R : assign(R,S,_) } > 1.                 % :- assign(R,S,P), assign(R',S,P), R<R'.


#minimize { 1@3,R,S   : assign(R,S,_) }.
#minimize { 1@2,S     : assign(_,S,_) }.
#maximize { 1@1,R     : assign(R,_,_) }.
#minimize { 1@0,R,S,P : assign(R,S,P) }.

#show assign/3.
#show init/2.
