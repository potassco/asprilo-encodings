% >>> addition to input.lp <<<
ordered(order(O),product(A),number(N)) :- init(object(order,O),   value(line,(A,N))).
onShelf(product(A),shelf(S),number(N)) :- init(object(product,A), value(on,  (S,N))).



amountMissing(A,O,N,0) :- ordered(O,A,number(N)).

amountOnShelf(A,S,N,0) :- onShelf(A,S,number(N)).


{ amountPicked(A,O,S,0..N,T) } = 1 :- ordered(O,A,number(N)), onShelf(A,S), time(T).

{ pick(A,O,S,T) : ordered(O,A), onShelf(A,S) } 1 :- time(T). % pick one article at a time?

pick(  O,  T) :- pick(_,O,_,T).
pick(A,  S,T) :- pick(A,_,S,T).
pick(A,O,  T) :- pick(A,O,_,T).

:- pick(O,T),     target(O,P), not serves(_,P,T).
:- pick(A,O,S,T), target(O,P), serves(R,P,T), not carries(R,S,T).
:- pick(A,O,S,T), amountOnShelf(A,S,N,T-1), amountPicked(A,O,S,M,T), N < M.

amountOnShelf(A,S,N-M,T) :- pick(A,O,S,T), onShelf(A,S), amountOnShelf(A,S,  N,T-1), amountPicked(A,O,S,M,T), time(T).
amountMissing(A,O,N-M,T) :- pick(A,O,S,T), ordered(O,A), amountMissing(A,O,  N,T-1), amountPicked(A,O,S,M,T), time(T).
                         :- pick(A,O,S,T),                amountPicked(A,O,S,0,T  ),                          time(T).


amountOnShelf(A,S, N ,T) :- not pick(A,  S,T), onShelf(A,S), amountOnShelf(A,S,N,T-1), time(T).
amountMissing(A,O, N ,T) :- not pick(A,O,  T), ordered(O,A), amountMissing(A,O,N,T-1), time(T).
 amountPicked(A,O,S,0,T) :- not pick(A,O,S,T), onShelf(A,S), ordered(O,A),             time(T).

%*
#show.
#show pick/4.
#show amountPicked/5.
#show amountMissing/4.
#show amountOnShelf/4.
*%
