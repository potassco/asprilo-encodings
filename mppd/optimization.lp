#minimize{ 1@3,R,T :    move(R,_,T) ;
	   1@3,R,T :  pickup(R,_,T) ;
 	   1@3,R,T : putdown(R,_,T) }.

%*
#maximize{ 1@2,R,T : waits(R,T) }.

straight(R,T) :- move(R,D,T), move(R,D,T-1).
#maximize{ 1@1,R,T : straight(R,T) }.
*%
