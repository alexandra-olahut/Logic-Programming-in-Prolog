
%6.
/*
a. Write a predicate to test if a list
is a set.
*/
isSet([]).
isSet([H|T]):-not(belongs(H,T)),isSet(T).

/*
b. Write a predicate to remove the first three occurrences of
an element in a list. If the element occurs less than three times, all
occurrences will be removed.
*/
removeFirstKE([],_,_,[]):-!.
removeFirstKE(L,_,0,L):-!.
removeFirstKE([E|T],E,K,R):-!,K1 is K-1, removeFirstKE(T,E,K1,R).
removeFirstKE([H|T],E,K,[H|R]):-removeFirstKE(T,E,K,R).

