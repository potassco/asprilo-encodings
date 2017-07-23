#minimize{ 1@3,R,T :    move(R,_,T) ;
	   1@3,R,T :  pickup(R,  T) ;
 	   1@3,R,T : putdown(R,  T) ;
 	   1@3,R,T : deliver(R,  T) }.

%*
wait(R,T) :- not pickup(R,T), not putdown(R,T), not deliver(R,T), not move(R,_,T), isRobot(R), time(T).
#maximize{ 1@2,R,T : wait(R,T) }.

straight(R,T) :- move(R,D,T), move(R,D,T-1).
#maximize{ 1@1,R,T : straight(R,T) }.
*%

