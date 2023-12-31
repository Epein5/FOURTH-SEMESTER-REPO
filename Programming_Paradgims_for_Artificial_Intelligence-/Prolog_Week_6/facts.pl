% Facts about courses
course(nepali, 'Nepali', 3).
course(gadit, 'Gadit', 4).
course(gk, 'General Knowledge', 3).
course(physics, 'Physics', 4).

% Facts about instructors
instructor(aayushi_gautam, 'Aayushi Gautam', nepali).
instructor(aayushma_rathod, 'Aayushma Rathod', gadit).
instructor(aayushka_rajnmi, 'Aayushka Rajnmi', gk).
instructor(aayu_giri, 'Aayu Giri', physics).

% Facts about students
student(ram_bahadur, 'Ram Bahadur').
student(shyam_pandey, 'Shyam Pandey').
student(aayush_gautam, 'Aayush Gautam').
student(aayusha_timalshina, 'Aayusha Timalshina').

% Graduate Stuedent Relationsip
graduate_student(StudentName) :-
    student(StudentName, _).

% Defineing faculty as a subclass of instructors
faculty(InstructorName) :-
    instructor(InstructorName, _, _).
