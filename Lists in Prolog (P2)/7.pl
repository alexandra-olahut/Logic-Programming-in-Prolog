
%7.
/*
a. Determine the position of the maximal element of a linear list.
Eg.: maxpos([10,14,12,13,14], L) produces L = [2,5].
*/
% findPos_aux(L:list, E:element, Cp:integer(current position),
% L:list of positions)
findPos_aux([],_,_,[]).
findPos_aux([E|T],E,Cp,[Cp|R]):-!,Cp1 is Cp+1,findPos_aux(T,E,Cp1,R).
findPos_aux([_|T],E,Cp,R):-Cp1 is Cp+1,findPos_aux(T,E,Cp1,R).
findPos(L,E,Res):-findPos_aux(L,E,1,Res).
p7a(L,Pos):-maxi(L,M),findPos(L,M,Pos).

/*
b. For a heterogeneous list, formed from integer numbers and list of numbers, replace every sublist with the
position of the maximum element from that sublist.
[1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]
*/
p7b([],[]).
p7b([H|T],[Pos|R]):-is_list(H),!,p7a(H,Pos),p7b(T,R).
p7b([H|T],[H|R]):-p7b(T,R).
