predicates
	man(string)
	woman(string)
	parent(string,string)
	married(string,string)
	child(string,string)
	father(string,string)
	mother(string,string)
	son(string,string)
	daughter(string,string)
	brother(string,string)
	sister(string, string)
	granddaughter(string, string)
	uncle(string, string)
	husbands_mother(string, string)
	wife_of_brother(string, string)
	m
	f
	c
	s
	d
	b
	gd
	u
	hm
	wob
clauses
%мужчины
	man("ivan").
	man("pavel").
	man("vladimirF").
	man("vladimirM").
	man("alexander").
	man("dmitry").
	man("georgy").
%женщины
	woman("olga").
	woman("zinaida").
	woman("galina").
	woman("elena").
	woman("irina").
	woman("victoria").
%пары
	married("pavel","olga").
	married("vladimirF","zinaida").
	married("vladimirM","galina").
	married("dmitry","irina").
	married("alexander", "elena").
%дети и родители
	%zinaida,vladimirF родители pavel
		parent("zinaida","pavel").
		parent("vladimirF","pavel").
	%zinaida, vladimirF родители dmitry
		parent("zinaida", "dmitry").
		parent("vladimirF", "dmitry").
	%galina,vladimirM родители olga
		parent("galina","olga").
		parent("vladimirM","olga").
	%galina, vladimirM родители elena
		parent("galina","elena").
		parent("vladimirM","elena").
	%olga,pavel родители ivan	
		parent("olga","ivan").
		parent("pavel","ivan").
	%irina,dmitry родители victoria
		parent("irina","victoria").
		parent("dmitry","victoria").
	%elena,alexander родители georgy
		parent("elena", "georgy").
		parent("alexander", "georgy").
%Чей ребенок
	child(X,Y):-parent(Y,X).
	c:-child(X,Y),write(X," is child ",Y),nl,fail.
%Кто отец?
	father(X,Y):-man(X),parent(X,Y).
	f:-father(X,Y),write(X," is father ",Y),nl,fail.
%Кто мать?
	mother(X,Y):-woman(X),parent(X,Y).
	m:-mother(X,Y),write(X," is mother ",Y),nl,fail.
%Как зовут дочь?
	daughter(X,Y):-woman(X),child(X,Y).
	d:-daughter(X,Y),write(X," is daughter ",Y),nl,fail.
%Как зовут сына?
	son(X,Y):-man(X),child(X,Y).
	s:-son(X,Y),write(X," is son ",Y),nl,fail.
%Имя внучки
	granddaughter(X,Y):-child(G, X),child(H,G),woman(H), X=H.
	gd:-granddaughter(X,Y),write(Y," is granddaughter ",X),nl,fail.
%Находим брата
	brother(X,Y):-parent(G,X),parent(G,Y),man(X), X<>Y.
	b:-brother(X,Y),write(X," is brother ",Y),nl,fail.
%Кто Дядя?
	uncle(X,Y):-child(X,G),brother(G,H),man(H), Y=H.
	u:-uncle(X,Y),write(Y," is uncle ",X),nl,fail.
%Свекровь
	husbands_mother(X,Y):-married(X,G),parent(H,G), woman(H), Y=H.
	hm:-husbands_mother(X,Y),write(Y," is husband mother ",X),nl,fail.
%Ищем невестку
	wife_of_brother(X,Y):-brother(G,Y),married(H,G), X=H.
	h:-wife_of_brother(X,Y),write(X," is wife_of_brother ",Y),nl,fail.