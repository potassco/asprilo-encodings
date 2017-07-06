#show.
#show init/2.



#show occurs(object(robot,R), action(move,D),     T) :    move(robot(R),D,T).
#show occurs(object(robot,R), action(pickup,()),  T) :  pickup(robot(R),  T).
#show occurs(object(robot,R), action(putdown,()), T) : putdown(robot(R),  T).
% #show occurs(object(robot,R), action(deliver,()), T) : deliver(robot(R),  T).
#show occurs(object(robot,R), action(deliver,(O,A  )), T) : deliver(robot(R),T), ordered(order(O),product(A)), target(order(O),P), shelved(S,product(A)), serves(robot(R),P,T), carries(robot(R),S,T).

