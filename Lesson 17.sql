Create table students( 
student_id int primary key,
first_name varchar(20),
last_name varchar(20),
DOB int,
major varchar(255),
GPA int
);


Create table Courses( 
Course_id int primary key,
Course_name varchar(255),
Department varchar(30)
);


Create table Instructors( 
Instuctor_id int primary key,
Instructor_name varchar(255),
Department varchar(255),
Course_id int references Courses(Course_id)
);

Create table Enrollments(  
enrollment_id int primary key,
student_id int references students(student_id), 
Course_id int references Courses(Course_id),
Semester varchar(255),
Grade varchar(255)
);



CREATE VIEW CourseSummary AS
Select 
    c.course_id,
    c.course_name,
    COUNT(e.student_id) AS total_students
From courses c
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY c.course_id, c.course_name;


CREATE VIEW InstructorSchedule AS
Select 
    i.instructor_name,   
    c.course_name,       
    d.department
From 
    instructors i
Join 
    courses c ON i.instructor_id = c.instructor_id
Join 
    departments d ON c.department = d.department;



DROP VIEW IF EXISTS CourseSummary;

CREATE VIEW CourseSummary AS
Select 
    c.course_id,
    c.course_name,
    GROUP_CONCAT(DISTINCT semester) AS semesters_offered,
    SUM(enrollment_id) AS total_enrollment
From 
    Courses
    LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY 
    course_id;




DROP VIEW IF EXISTS InstructorSchedule;

CREATE VIEW InstructorSchedule AS
Select 
    instructor_id,
    instructor_name,
    course_id,
    course_name,
    semester,
    year
From 
    Courses
WHERE 
    semester = 'Fall' 
    AND year = 2026;



CREATE VIEW EligibleGraduates AS
Select student_id, first_name, last_name, GPA
From students
Where GPA >= 3.7;



DROP VIEW IF EXISTS CourseSummary;

CREATE VIEW CourseEnrollmentSummary AS
Select 
    c.course_id,
    c.course_name,
    GROUP_CONCAT(DISTINCT semester) AS semesters_offered,
    SUM(enrollment_id) AS total_enrollment
From 
    Courses
LEFT JOIN enrollments e ON c.course_id = e.course_id
GROUP BY 
    c.course_id;



DROP VIEW IF EXISTS EligibleGraduates;



WITH SemesterCourses AS (
    SELECT 
        course_id, 
        semester 
    FROM 
        Enrollments
    WHERE 
        semester = 'Fall'
)
SELECT * FROM SemesterCourses;


