domains
list=integer*
predicates
delete_all(integer,list,list)
list_set(list,list)
clauses
delete_all(_,[],[]).
delete_all(X,[X|L],L1):-
                  delete_all (X,L,L1).
delete_all (X,[Y|L],[Y|L1]):-
                  X<>Y,
                  delete_all (X,L,L1).
list_set([],[]). 
list_set ([H|T],[H|T1]) :-
        delete_all(H,T,T2), 
        list_set (T2,T1).