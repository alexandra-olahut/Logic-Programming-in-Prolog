
%12.
/*
a. Write a predicate to substitute in
a list a value with all the elements of another list.
*/
%(i,i,i,o)(i,o,i,i)
replaceList(L,V,L2,R):-replace(L,V,L2,R).
replaceListElements([],_,_,[]).
replaceListElements([E|T],E,L2,R):-!,replaceListElements(T,E,L2,Res),concatt(L2,Res,R).
replaceListElements([H|T],E,L2,[H|R]):-replaceListElements(T,E,L2,R).

/*
b. Remove the n-th
element of a list.
*/
removeNth([],_,[]).
removeNth([_|T],1,T):-!.
removeNth([H|T],N,[H|R]):-N1 is N-1,removeNth(T,N1,R).
