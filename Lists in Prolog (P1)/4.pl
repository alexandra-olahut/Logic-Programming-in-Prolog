
%4.
/*
a. Write a predicate to
determine the difference of two sets.
*/
diff([],_,[]).
diff([H|T],S2,R):-belongs(H,S2),!,diff(T,S2,R).
diff([H|T],S2,[H|R]):-diff(T,S2,R).

/*
b. Write a predicate to add value
1 after every even element from a list.
*/
add1After([],[]).
add1After([H|T],[H,1|R]):-H mod 2 =:=0,!,add1After(T,R).
add1After([H|T],[H|R]):-add1After(T,R).
