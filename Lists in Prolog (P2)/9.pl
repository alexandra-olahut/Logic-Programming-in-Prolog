
%9.
/*
a. For a list of integer number, write a predicate to add in list after 1-st, 3-rd, 7-th, 15-th element a given value
e.
*/
addAfter2_aux([],_,_,_,[]).
addAfter2_aux([H|T],V,Pos,Cp,[H,V|R]):-Pos=:=Cp+1,!,
                                      Pos2 is Pos*2,
                                      Cp2 is Cp+1,
                                      addAfter2_aux(T,V,Pos2,Cp2,R).
addAfter2_aux([H|T],V,Pos,Cp,[H|R]):-Cp2 is Cp+1,
                                    addAfter2_aux(T,V,Pos,Cp2,R).
%addAfter(L,V,R)
addAfter2(L,V,R):-addAfter2_aux(L,V,2,1,R).

/*
b. For a heterogeneous list, formed from integer numbers and list of numbers; add in every sublist after 1-st,
3-rd, 7-th, 15-th element the value found before the sublist in the heterogenous list. The list has the particularity
that starts with a number and there aren’t two consecutive elements lists.
Eg.: [1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5] =>
[1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9, 8, 2, 6, 7], 5].
*/
p9b([],[]).
p9b([E,H|T],[E,Res|R]):-is_list(H),!,addAfter2(H,E,Res),p9b(T,R).
p9b([H|T],[H|R]):-p9b(T,R).
