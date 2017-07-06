
% #const rate=1. % NOT IMPLEMENTED

ordered(order(O),product(A),N,0) :- init(object(order,O),   value(line,(A,N))).

shelved(shelf(S),product(A),N,0) :- init(object(product,A), value(on,  (S,N))).

limit(A,O,S,M) :- M = #min { N : ordered(O,A,N,0); N' : shelved(S,A,N',0) }, ordered(O,A), shelved(S,A).

 { process(A,O,S,1..M,T) : ordered(O,A), shelved(S,A), limit(A,O,S,M) } 1 :- time(T).

:- process(_,O,_,_,T), target(O,P), not serves(_,P,T).
:- process(A,O,S,_,T), target(O,P),     serves(R,P,T), not carries(R,S,T).
:- process(A,O,S,M,T), shelved(S,A,N,T-1), N < M.

shelved(S,A,N-M,T) :-     process(A,O,S,M,T), shelved(S,A,N,T-1), N >= M.
ordered(O,A,N-M,T) :-     process(A,O,S,M,T), ordered(O,A,N,T-1), N >= M.


shelved(S,A,N,  T) :- not process(A,_,S,_,T), shelved(S,A,N,T-1), time(T).
ordered(O,A,N,  T) :- not process(A,O,_,_,T), ordered(O,A,N,T-1), time(T).

%*
:- shelved(S,A,M,T-1), shelved(S,A,N,T), M > N, time(T).
:- ordered(O,A,M,T-1), shelved(S,A,N,T), M > N, time(T).
*%
