#show.
#show init/2.

#program step(t).

#show occurs(object(robot,R), action(move,D),     t) :    move(robot(R),D,t).
#show occurs(object(robot,R), action(pickup,()),  t) :  pickup(robot(R),_,t).
#show occurs(object(robot,R), action(putdown,()), t) : putdown(robot(R),_,t).

#show occurs(object(robot,R), action(deliver,(O,A  )), t) : process(product(A),order(O),C,t), toShelf(S,C), position(robot(R),C,t-1).
#show occurs(object(robot,R), action(deliver,(O,A  )), t) : process(product(A),order(O),C,t), atShelf(S,C,t-1), carries(robot(R),S,t-1).
#show occurs(object(robot,R), action(deliver,(O,A  )), t) : process(product(A),order(O),C,t), position(S,C,t), carries(robot(R),S,t-1), shelved(S,product(A)).
#show occurs(object(robot,R), action(deliver,(O,A,N)), t) : process(product(A),order(O),S,N,t), carries(robot(R),S,t-1).
