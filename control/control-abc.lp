% - Control for Domains A,B,C -----------------------------------------------------------------------

:-    move(R,_,_), not assign(R,_,_).
:-  pickup(R,S,_), not assign(R,S,_).
:- putdown(R,S,_), not assign(R,S,_).

:- process(A,O,C,T), target(O,P), shelved(S,A), position(S,C,T), not assign(_,S,P).
