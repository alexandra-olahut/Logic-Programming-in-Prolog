
%2.
/*
a. Sort a list with keeping double values in resulted list. E.g.: [4 2 6 2 3 4] --> [2 2 3 4 4 6]
*/
%merge_sort(+L:list, -R:list)
merge_sort([], []).
merge_sort([H], [H]):-!.
merge_sort(L, R):-
	split(L, LEFT, RIGHT),
	merge_sort(LEFT, RL),
	merge_sort(RIGHT, RR),
	mymerge(RL, RR, R).

%merge(+A:list, +B:list, -R:list)
mymerge([], B, B).
mymerge(A, [], A).
mymerge([HA|TA], [HB|TB], [HA|R]):-    % add a clause for = where you only keep the tails -> remove duplicates
	HA =< HB,
	mymerge(TA, [HB|TB], R).
mymerge([HA|TA], [HB|TB], [HB|R]):-
	HB < HA,
	mymerge([HA|TA], TB, R).


%split(+L:list, +AUX:list, -LEFT:list, -RIGHT:list)
split_aux(L, AUX, AUX, L):-
	length(L, LEN_L),
	length(AUX, LEN_R),
	DIFF is LEN_R - LEN_L,
	abs(DIFF, ABS),
	ABS =< 1,!.
split_aux([H|T], AUX, L, R):-
	append(AUX, [H], RA),
	split_aux(T, RA, L, R).

%split(+L:list, -LEFT:list, -RIGHT:list)
split([], [], []).
split(LIST, LEFT, RIGHT):-
	split_aux(LIST, [], LEFT, RIGHT).


/*
b. For a heterogeneous list, formed from integer numbers and list of numbers, write a predicate to sort every
sublist, keeping the doubles.
Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
[1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].
*/
sortSublists([],[]).
sortSublists([H|T],[SH|R]):-is_list(H),!,
                            merge_sort(H,SH),
                            sortSublists(T,R).
sortSublists([H|T],[H|R]):-sortSublists(T,R).
