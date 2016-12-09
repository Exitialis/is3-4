domains
list=string*
predicates
	sportsmen(string,string,symbol,string,list)
	%Спротсмен(Фамилия, год рождения, пол, страна,мероприятия)
	sportevent(string,string,string)
	%Спортивное мероприятие(Вид, Дата, Место проведения)
	result(string,string,string,string,string)
	question1(symbol,symbol)
	%Кто из спорсменок выступает на заданном мероприятии
	question2(symbol,symbol)
	%Занимали ли указанное призовое место спорсмены определенного возраста
	question3(symbol,symbol,symbol)
	%Спортсмены взявшие определенную высоту
	question4(symbol)
	%Какие еще спортивные мероприятия проводились в том же году
clauses
	sportsmen("Hrom","1994","m","Russia",[s1,s2,s3]).
	sportsmen("Lipeneva","1996","w","Canada", [s1,s2]).
	sportsmen("Gromov","1993","m","Norway",[s2,s3]).
	sportevent("s1","2016","Norway").
	sportevent("s2","2016","Norway").
	sportevent("s3","2015","Canada").
	result("Hrom","23.10.2016","s1","125","3").
		
	result("Gromov","23.10.2016","s1","139","1").
	result("Lipeneva","15.10.2016","s2","115","2").	
	question1(Type,Gender):-sportsmen(Fam,_,Gender,Country,_),result(Fam,_,Type,_,_),write(Fam," - ", Country),nl,fail.
	
	question2(Birth,Res):-sportsmen(Fam,Birth,_,_,_),result(Fam,_,_,_,Res),write(Fam,Birth),nl,fail.
	
	question3(Country,Hight,Type):-sportsmen(Fam,Birth,_,Country,_),result(Fam,_,Type,Hight,_),write(Fam," - ",Birth).
	question4(Year):-sportevent(Type,Year,_), write(Type),nl,fail.
	