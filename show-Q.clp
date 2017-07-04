
#show.
#show process/4.

%&show {  ordered(O,A,0) : ordered(O,A)                          }.
%&show {  ordered(O,A,T) : ordered(O,A),                 time(T) }.
%&show {  shelved(S,A,0) : shelved(S,A)                         }.
%&show {  shelved(S,A,T) : shelved(S,A),                time(T)  }.
%%%%%&show {  process(A,O,S,0) : ordered(O,A), shelved(S,A)          }.
&show {  process(A,O,S,T) : ordered(O,A), shelved(S,A), time(T) }.

