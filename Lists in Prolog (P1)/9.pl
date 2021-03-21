
%9.
/*
a. Insert an
element on the position n in a list.
*/
%insertOnN(L,E,N,R)
insertOnN([],_,N,[]):-N<1.
insertOnN([],E,N,[E]):-N>1.  %N>length insert last
insertOnN(L,E,1,[E|L]):-!.
insertOnN([H|T],E,N,[H|R]):-N1 is N-1,insertOnN(T,E,N1,R).

/*
b. Define a predicate to determine
the greatest common divisor of all numbers from a list.
*/
gcdList([A],A).
gcdList([H|T],R):-gcdList(T,Res), gcd(Res,H,R).
