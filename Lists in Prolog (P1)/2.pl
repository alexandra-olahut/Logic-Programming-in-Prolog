
%2.
/*
     a. Write a predicate to remove all occurrences of a certain atom
     from a list.
*/
%removeE(L:list,E:element,R:list)
%(i,i,o) (i,i,i)
removeE([],_,[]).
removeE([H|T],E,R):-H=:=E,!,removeE(T,E,R).
removeE([H|T],E,[H|R]):-removeE(T,E,R).

/*
     b. Define a predicate to produce a list of pairs (atom n) from an
     initial list of atoms. In this initial list atom has n occurrences.
       Eg.: numberatom([1, 2, 1, 2, 1, 3, 1], X) => X = [[1, 4], [2,2], [3,1]].
*/
%nrOc(L:list,E:element,N:integer)
%(i,i,o) (i,i,i)
nrOc([],_,0).
nrOc([E|T],E,Nr):-!,nrOc(T,E,N), Nr is N+1.
nrOc([_|T],E,N):-nrOc(T,E,N).

%frequency(L:list, C:initialList, P:pair) (i,i,o)(i,i,i)
%frequencies(L:list, R:list)
frequency([H|_],L,[H,Nr]):-nrOc(L,H,Nr).
frequency([_|T],L,P):-frequency(T,L,P).
frequencies(L,R):-toSet(L,S),findall(P, frequency(S,L,P), R).
