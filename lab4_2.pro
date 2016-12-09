domains
list=integer*
predicates
member(integer,list)
union(list,list)
deduction(list,list)
add(list,list,list)
except(list,list,list)
cross(list,list)
del(list,integer,list)

clauses
/*принадлежность элемента к множеству*/
member(X,[X|_]).
    member(X,[_|L]) :- member(X,L).
/*удаление элемента из множества */
del([],_,[]):-!.
del(L,X,Lres):-L=[X|Tail],Lres=Tail,!.
del(L,X,Lres):-L=[Head|Tail],del(Tail,X,Lres1),Lres=[Head|Lres1]. 
    
/*добавление всех элементов одного множества в  другое */
add([],L,L).
    add([X|L1],L2,[X|L3]) :- add(L1,L2,L3).
    
/*удаление из второго множества, всех элементов первого множества*/
except([],L,L).
    except([X|L1],L2,Result) :- 
                      member(X,L2),!, 
                      del(L2,X,L),
                      except(L1,L,Result);
                      except(L1,L2,Result).
    
    /* объединение двух множеств */
union(L1,L2) :- 
                      add(L1,L2,Result),
                      write("union="),write(Result),nl.   
 
    /*пересечение двух множеств*/
cross(L1,L2) :- 
                        except(L1,L2,L3),  
                    except(L3,L2,Result), 
                    write("cross ="),write(Result). 
    
    /*вычитание множеств*/
deduction(L1,L2) :- 
                 except(L2,L1,Result),
                 write("deduction= "),write(Result),nl.
        
 
