% #const rate=1. % NOT IMPLEMENTED
#include <csp>. 

&dom{N..N} =   ordered(order(O),product(A),0) :- init(object(order,O),   value(line,(A,N))).
&dom{0..N} =   ordered(order(O),product(A),T) :- init(object(order,O),   value(line,(A,N))), time(T).
&dom{N..N} =   shelved(shelf(S),product(A),0) :- init(object(product,A), value(on,  (S,N))).
&dom{0..N} =   shelved(shelf(S),product(A),T) :- init(object(product,A), value(on,  (S,N))), time(T).

&dom{0..N} = process(product(A),order(O),S,T) :- init(object(order,O),   value(line,(A,N))), shelved(S,product(A)), time(T).

 { process(A,O,S,T) : ordered(O,A), shelved(S,A) } 1 :- time(T).

:- process(_,O,S,T), target(O,P), not serves(_,S,P,T).
:- process(_,O,S,T), target(O,P),     serves(R,S,P,T), not waits(R,T).
:- process(A,O,S,T), &sum{ shelved(S,A,T-1); -process(A,O,S,T) } < 0.

:- process(A,O,_,T), &sum{ ordered(O,A,T-1) } = 0.

:-     process(A,O,S,T), shelved(S,A),               &sum{  shelved(S,A,T); process(A,O,S,T) } != shelved(S,A,T-1).
:-     process(A,O,S,T),               ordered(O,A), &sum{  ordered(O,A,T); process(A,O,S,T) } != ordered(O,A,T-1).

:- not process(A,_,S,T), shelved(S,A),               &sum{  shelved(S,A,T)                   } != shelved(S,A,T-1), time(T).
:- not process(A,O,_,T),               ordered(O,A), &sum{  ordered(O,A,T)                   } != ordered(O,A,T-1), time(T).

:-     process(A,O,S,T),                             &sum{                  process(A,O,S,T) }  = 0.
:- not process(A,O,S,T), shelved(S,A), ordered(O,A), &sum{                  process(A,O,S,T) } != 0, time(T).
%*
:-                       shelved(S,A),               &sum{ shelved(S,A,T)                    }  > shelved(S,A,T-1), time(T).
:-                                     ordered(O,A), &sum{ ordered(O,A,T)                    }  > ordered(O,A,T-1), time(T).
*%
