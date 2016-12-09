PREDICATES
fib(integer,integer)
CLAUSES
fib(1,1):-!.
%первое число Фибоначчи равно единице 
fib(2,1):-!. 
% второе число Фибоначчи равно единице 
fib(N,F) :-
N1=N-1, fib(N1,F1),
% F1 это N-1-е число Фибоначчи 
N2=N-2, fib(N2,F2), 
% F2 это N-2-е число Фибоначчи 
F=F1+F2. 
% N-е число Фибоначчи равно сумме
