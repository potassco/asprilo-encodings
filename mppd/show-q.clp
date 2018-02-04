
#show.
#show process/4.

&show { ordered(O,A,0)   : ordered(O,A) }.
&show { ordered(O,A,T)   : ordered(O,A), time(T) }.
&show { shelved(S,A,0)   : shelved(S,A,N) }.
&show { shelved(S,A,T)   : shelved(S,A,N), time(T)  }.
&show { process(A,O,S,T) : limit(A,O,S,M), time(T) }.
