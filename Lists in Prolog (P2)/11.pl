
%11.
/*
a. Replace all occurrences of an element from a list with another element e.
*/
%replace
/*
b. For a heterogeneous list, formed from integer numbers and list of numbers, define a predicate to determine
the maximum number of the list, and then to replace this value in sublists with the maximum value of sublist.
Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, [1, 3, 5, 8, 5, 4], 5, [5, 9, 1], 2] =>
[1, [2, 7, 7], 4, 5, [1, 4], 3, [1, 3, 8, 8, 8, 4], 5, [9, 9, 1], 2]
*/
max(A,B,A):-A>B,!.
max(_,B,B).
maxHeter([],-999).
maxHeter([H|T],Max):-number(H),!,maxHeter(T,M),max(M,H,Max).
% maxHeter([H|T],Max):-is_list(H),!,maxHeter(H,M),maxHeter(T,M2),max(M,M2,Max).
%     for all levels
maxHeter([_|T],M):-maxHeter(T,M).

p11b([],_,[]).
p11b([H|T],M,[Res|R]):-is_list(H),!,maxi(H,Mx),replace(H,M,Mx,Res),p11b(T,M,R).
p11b([H|T],M,[H|R]):-p11b(T,M,R).
p11bMain(L,R):-maxHeter(L,M),p11b(L,M,R).
