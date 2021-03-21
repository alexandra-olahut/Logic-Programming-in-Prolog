
%11.
/*
a. Write a predicate to substitute an element from a list with another
element in the list.
*/
%(i,i,i,o)(i,i,i,i)(i,o,i,i)(i,i,o,i)(i,o,o,i)(o,i,i,i)
replace([],_,_,[]).
replace([E|T],E,E1,[E1|R]):-!,replace(T,E,E1,R).
replace([H|T],E,E1,[H|R]):-!,replace(T,E,E1,R).

/*
b. Write a predicate to create the sublist (lm, …,
ln) from the list (l1,…, lk).
    sublist(l1..lk,m,n) =
*/
sublistMN([],_,_,[]):-!.
sublistMN(_,_,0,[]):-!.
sublistMN([H|T],1,N,[H|R]):-!,N1 is N-1,sublistMN(T,1,N1,R).
sublistMN([_|T],M,N,R):-M1 is M-1,N1 is N-1,sublistMN(T,M1,N1,R).

