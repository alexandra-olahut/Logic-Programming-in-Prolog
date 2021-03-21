%1.
/*
     a. Write a predicate to determine the lowest common multiple of a
     list formed from integer numbers.
*/
%gcd(A:integer,B:integer,R:integer)
%(i,i,o)(i,i,i)
gcd(A,A,A).
gcd(A,B,R):-A>B, A1 is A-B, gcd(A1,B,R).
gcd(A,B,R):-A<B, B1 is B-A, gcd(A,B1,R).
lcm(A,B,R):-gcd(A,B,Gcd), R is A*B/Gcd.
%lcmList(L:list, R:integer)
%(i,o)(i,i)
lcmList([A],A).
lcmList([H|T],R):-lcmList(T,Res), lcm(Res,H,R).

/*
     b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th,
      … element in a list.
    f(l1..ln,V,pos,curr) = [], n=0
                         = l1 U V U f(l2..ln,V,pos*2,curr+1),  pos=curr
                         = l1 U f(l2..ln,V,pos,curr+1), otherwise
*/
%addAfter_aux(L:list, V:integer, Pos:integer, Cp:integer, R:list)
%(i,i,i,i,o)
addAfter_aux([],_,_,_,[]).
addAfter_aux([H|T],V,Pos,Cp,[H,V|R]):-Pos=:=Cp,!,
                                      Pos2 is Pos*2,
                                      Cp2 is Cp+1,
                                      addAfter_aux(T,V,Pos2,Cp2,R).
addAfter_aux([H|T],V,Pos,Cp,[H|R]):-Cp2 is Cp+1,
                                    addAfter_aux(T,V,Pos,Cp2,R).
%addAfter(L,V,R)
addAfter(L,V,R):-addAfter_aux(L,V,1,1,R).

