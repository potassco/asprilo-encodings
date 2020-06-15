#include "../input.lp".

#const max=1.

direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto(N,N') :-      node(N,(X,Y)),     node(N',(X+X',Y+Y')), direction((X',Y')),
                not highway((X,Y)), not highway((X+X',Y+Y')).

node(N,C) :- init(object(node,N), value(at,C)).
node(N) :- node(N,_).

zone(1).
{ zone(Z+1) } :- zone(Z), Z < max.
:- not zone(Z+1), zone(Z), not inZone(#sup,Z), Z < max.
:-     zone(Z+1), zone(Z),     inZone(#sup,Z), Z < max.

maxInZone(M,Z) :- M = #max{ N : node(N), inZone(N,Z) }, zone(Z).

minNode(N) :- N = #min { N' : node(N',C), not highway(C) }.

inZone(N,1) :- minNode(N).
inZone(N,Z) :- Z > 1, maxInZone(N',Z-1), N = #min { N'' : node(N'',C), not highway(C), N''>N' }.

inZone(N,Z) :- inZone(M,Z), nextto(M,N).
inZone(N,Z) :- inZone(M,Z), nextto(N,M).

#show zone/1.
#show inZone/2.
