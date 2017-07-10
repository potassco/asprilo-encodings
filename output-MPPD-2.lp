#show.
#show init/2.



#show occurs(object(robot,R), action(move,   D      ), T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup, ()     ), T) :  pickup(robot(R),  T).
#show occurs(object(robot,R), action(putdown,()     ), T) : putdown(robot(R),  T).

#show occurs(object(robot,R), action(deliver,(O,A  )), T) : serves(robot(R),S,P,T), processed(order(O),product(A)), target(order(O),P), shelved(S,product(A)).
#show occurs(object(robot,R), action(deliver,(O,A  )), T) : serves(robot(R),S,P,T), process(product(A),order(O),S,  T).
#show occurs(object(robot,R), action(deliver,(O,A,N)), T) : serves(robot(R),S,P,T), process(product(A),order(O),S,N,T).

