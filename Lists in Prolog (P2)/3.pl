
%3.
/*
a. Merge two sorted lists with removing the double values.
      merge(l1..ln,p1..pm) = [],   n=0 and m=0
                           = l1..ln,  m=0
                           = p1..pm,  n=0
                           = l1 U merge(l2..ln, p2..pm), l1=p1
                           = l1 U merge(l2..ln, p1..pm), l1<p1
                           = p1 U merge(l1..ln, p2..pm), otherwise
*/
%mergeLists(L:list,P:list,R:list)
%(i,i,o)
mergeLists([],[],[]):-!.
mergeLists(L,[],L):-!.
mergeLists([],P,P):-!.
mergeLists([L1|L],[P1|P],[L1|R]):-L1=:=P1,!,mergeLists(L,P,R).
mergeLists([L1|L],[P1|P],[L1|R]):-L1<P1,!,mergeLists(L,[P1|P],R).
mergeLists([L1|L],[P1|P],[P1|R]):-mergeLists([L1|L],P,R).

/*
b. For a heterogeneous list, formed from integer numbers and list of numbers, merge all sublists with removing
the double values.
[1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
[1, 2, 3, 4, 6, 7, 9, 10, 11].
*/
mergeSublists([],[]).
mergeSublists([H|T],New):-is_list(H),!,
                          toSet(H,S),
                          mergeSublists(T,R),
                          mergeLists(S,R,New).
mergeSublists([_|T],R):-mergeSublists(T,R).
