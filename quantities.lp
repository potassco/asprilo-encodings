% >>> addition to input.lp <<<
ordered(order(O),product(A),number(N)) :- init(object(order,O),   value(line,(A,N))).
onShelf(product(A),shelf(S),number(N)) :- init(object(product,A), value(on,  (S,N))).



amountMissing(A,O,N,0) :- ordered(O,A,number(N)).

amountOnShelf(A,S,N,0) :- onShelf(A,S,number(N)).


maxPick(A,O,S,M) :- M = #min { N : ordered(O,A,number(N)); N' : onShelf(A,S,number(N')) }, ordered(O,A), onShelf(A,S).

{ pick(A,O,S,1..M,T) : ordered(O,A), onShelf(A,S),maxPick(A,O,S,M) } 1 :- time(T).

:- pick(_,O,_,_,T), target(O,P), not serves(_,P,T).
:- pick(A,O,S,_,T), target(O,P),     serves(R,P,T), not carries(R,S,T).
:- pick(A,O,S,M,T), amountOnShelf(A,S,N,T-1), N < M.

amountOnShelf(A,S,N-M,T) :- pick(A,O,S,M,T), onShelf(A,S), amountOnShelf(A,S,  N,T-1), N >= M.
amountMissing(A,O,N-M,T) :- pick(A,O,S,M,T), ordered(O,A), amountMissing(A,O,  N,T-1), N >= M.


amountOnShelf(A,S, N ,T) :- not pick(A,_,S,_,T), onShelf(A,S), amountOnShelf(A,S,N,T-1), time(T).
amountMissing(A,O, N ,T) :- not pick(A,O,_,_,T), ordered(O,A), amountMissing(A,O,N,T-1), time(T).


%*
#show.
#show pick/4.

#show amountPicked/5.
#show amountMissing/4.
%#show amountOnShelf/4.
% #show mispick/4.
#show deliver/3.
#show processed/1.
#show processed/2.

% clingo action-MPPD-3.lp strategy-MPPD-3.lp examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=6 quantities.lp goal-MPPD.lp show-3.lp --out-ifs='\n'
% clingo action-MPPD-3.lp strategy-MPPD-3.lp examples/x4_y4_n16_r3_s6_ps2_pr6_u12_o6_N50.lp -c horizon=? quantities.lp goal-Q.lp    show-3.lp --out-ifs='\n'
*%
