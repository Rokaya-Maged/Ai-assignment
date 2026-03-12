%%%%%%%%%%%%%%%%%%%%%%%%%%%% Students Info %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% student(Name, Year)

student(ali, first).
student(sara, second).
student(omar, third).
student(mona, second).
student(yousef, first).
student(nour, fourth).
student(karim, third).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Books Info %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% book(Title, Author)

book(prolog_fundamentals, dr_hassan).
book(recursion_in_depth, dr_sara).
book(list_programming, dr_ahmed).
book(ai_intro, dr_mona).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Borrow Info %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% borrowed(Student, Book)

borrowed(ali, prolog_fundamentals).
borrowed(ali, list_programming).

borrowed(sara, recursion_in_depth).
borrowed(sara, ai_intro).

borrowed(omar, recursion_in_depth).

borrowed(mona, prolog_fundamentals).
borrowed(mona, recursion_in_depth).
borrowed(mona, list_programming).

borrowed(yousef, list_programming).

borrowed(nour, ai_intro).

borrowed(karim, recursion_in_depth).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Topics Info %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% topics(Book, TopicsList)

topics(prolog_fundamentals, [facts, rules, queries, unification]).
topics(recursion_in_depth, [base_case, recursive_case, tracing, termination]).
topics(list_programming, [head_tail, member, append, length,prefix, suffix]).
topics(ai_intro, [search, logic, knowledge_representation]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Ratings Info %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rating(Student, Book, Score)

rating(ali, prolog_fundamentals, 85).
rating(ali, list_programming, 90).

rating(sara, recursion_in_depth, 95).
rating(sara, ai_intro, 88).

rating(omar, recursion_in_depth, 80).

rating(mona, prolog_fundamentals, 92).
rating(mona, recursion_in_depth, 89).
rating(mona, list_programming, 91).

rating(yousef, list_programming, 60).

rating(nour, ai_intro, 78).

rating(karim, recursion_in_depth, 83).

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Solution %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% task 1
books_borrowed_by_student(Student, L):-
    add_books(Student,[],L).
    
add_books(Student,Acc,L):-
    borrowed(Student,Book),
    not_in_list(Book,Acc),
    !,
    add_books(Student,[Book|Acc],L).   

add_books(_,L,L).  

not_in_list(_,[]).
not_in_list(X,[H|T]):-
    X\=H,
    not_in_list(X,T).

%%%% task 2 

%%%% task 3 

%%%% task 4 

%%%% task 5

%%%% task 6     

most_common_topic_for_student(Student, Topic):-
    books_borrowed_by_student(Student, L),
    get_all_topics(L,[],AllTopics),
    find_most_common(AllTopics,Topic),
    !.

get_all_topics([],AllTopics,AllTopics).
get_all_topics([Book|Rest],Acc,Final):-
    topics(Book,TopicsList),
    append_topics(TopicsList,Acc,NewAcc),
    get_all_topics(Rest,NewAcc,Final).

find_most_common([],_):- fail.
find_most_common(List,MostCommon):-
    count_occurence(List,Counts),
    get_max(Counts,-1,'',MostCommon).

count_occurence([],[]).
count_occurence([H|T],[[H,Count]|Rest]):-
    count_and_remove(H,[H|T],Count,Remaining),
    count_occurence(Remaining,Rest).

count_and_remove(_,[],0,[]).
count_and_remove(X,[X|T],Count,Remaining):-
    !,
    count_and_remove(X,T,NewCount,Remaining),
    Count is NewCount +1.

count_and_remove(X,[H|T],Count,[H|Remaining]):-
        count_and_remove(X,T,Count,Remaining).

get_max([],_,CurrentMax,CurrentMax).
get_max([[Topic, Count]|T], MaxSoFar, _, FinalTopic) :-
    Count > MaxSoFar,
    !,
    get_max(T,Count,Topic,FinalTopic).

get_max([_|T],MaxSoFar,TopicSoFar,FinalTopic):-
    get_max(T,MaxSoFar,TopicSoFar,FinalTopic).


 append_topics([],L,L).
 append_topics([H|T],L,[H|Res]):-
     append_topics(T,L,Res).







    

