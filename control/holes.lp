#include "../input.lp".




direction((X,Y)) :- X=-1..1, Y=-1..1, |X+Y|=1.
nextto((X,Y),(DX,DY),(X',Y')) :- direction((DX,DY)), position((X,Y)), position((X',Y')),
                                 (X,Y)=(X'-DX,Y'-DY), (X',Y')=(X+DX,Y+DY).

% hole(C) :- highway(C), #count { C' : nextto(C,D,C'), highway(C'), direction(D) } > 2.
hole(C) :- highway(C), nextto(C,(X',Y'),C'), highway(C'), nextto(C,(X'',Y''),C''), highway(C''), X'*X''+Y'*Y''=0.

hole((X,Y),(0,Y'-Y),(X,Y')) :- hole((X,Y)), hole((X,Y')), |Y'-Y|>0.
hole((X,Y),(X'-X,0),(X',Y)) :- hole((X,Y)), hole((X',Y)), |X'-X|>0.
distance(D) :- hole(_,D,_).

#show.
#show hole/1.
#show corner/1.
