#program step(t).

:-    move(R,_,t), not assign(R,_,_).
:-  pickup(R,S,t), not assign(R,S,_).
:- putdown(R,S,t), not assign(R,S,_).

:- process(A,O,C,t), target(O,P), shelved(S,A), position(S,C,t), not assign(_,S,P).
