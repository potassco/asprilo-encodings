#minimize{ 1@3,R,T :    move(R,_,T) ;
	   1@3,R,T :  pickup(R,_,T) ;
 	   1@3,R,T : putdown(R,_,T) ;
 	   1@3,R,T : deliver(R,_,T) }.

%*
wait(R,T) :- not pickup(R,_,T), not putdown(R,_,T), not deliver(R,_,T), not move(R,_,_,T), isRobot(R), time(T).
#maximize{ 1@2,R,T : wait(R,T) }.

straight(R,T) :- move(R,D,T), move(R,D,T-1).
#maximize{ 1@1,R,T : straight(R,T) }.
*%

