create database quanlysinhvienday3cg;
USE quanlysinhvienday3cg;
create table class(
ClassID int primary key auto_increment,
ClassName varchar(60) not null,
StarDate datetime not null,
Status bit 
);
create table Student(
StudentID int primary key auto_increment,
StudentName varchar(30),
Address varchar(50),
Phone varchar(20),
Status bit,
ClassID int ,
foreign key (ClassID) references class(ClassID)
);
create table subject (
SubID int primary key,
SubName varchar(30) not null,
Credit tinyint not null default 1 check (Credit >= 1),
Status bit default 1

);
create table Mark(
MarkID int primary key auto_increment,
SubID int,
StudentID int ,
Mark float default 0 check (Mark between 0 and 100),
ExamTimes tinyint default 1,
foreign key (SubID) references subject(SubID),
foreign key (StudentID) references student(StudentID)
);
INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO Subject VALUES (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
       
SELECT * from student 
where StudentName like 'h%';
select * from class
WHERE month(StarDate) = '12';
select * from subject
WHERE Credit BETWEEN 3 and 5;

-- vì câu bến dưới nó update mà không thông qua khoá chính
SET SQL_SAFE_UPDATES = 0;
UPDATE 	student set classid = 2
where studentname like 'hung';

select studentname,subname,mark.Mark
from student inner join mark on student.StudentID = mark.StudentID
inner join subject on subject.SubID = mark.SubID
order by Mark desc, StudentName;