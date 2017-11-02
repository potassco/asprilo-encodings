% ToDo: one sequence per robot
go(R,S,C,0) :- assign(R,S,_), position(S,C,0), isShelf(S).
go(R,S,C,1) :- assign(R,S,P), position(P,C),   isStation(P), distance(S,P,D), isStation(P), distance(S,P',D'), D<=D'.
% go(R,S,C,N) :- assign(R,S,P), position(P,C),   isStation(P), go(R,S,C',N-1), position(P',C'), isStation(P'), P>P'.

#show go/4.
#show distance/3.
