CREATE TABLE students (
    student_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    enrollment_date DATE
);

INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('John', 'Doe', 'john.doe@example.com', '2023-09-01'),
('Jane', 'Smith', 'jane.smith@example.com', '2023-09-01'),
('Jim', 'Beam', 'jim.beam@example.com', '2023-09-02');

CREATE FUNCTION getAllStudents()
returns table(
student_id integer, 
first_name varchar, 
last_name varchar,
email varchar, 
enrollement_date date)
language plpgsql
AS
$$
begin
   return query 
   select * 
   from students;
end;
$$;

CREATE FUNCTION addStudent(first_ varchar,last_ varchar,email_ varchar,enrollment_date_ date)
returns table(
student_id integer, 
first_name varchar, 
last_name varchar,
email varchar, 
enrollement_date date)
language plpgsql
AS
$$
begin 
   insert into students (first_name,last_name,email,enrollment_date)
   values
   (first_,last_,email_,enrollment_date_);
end;
$$;

CREATE FUNCTION updateStudentEmail(id_ integer, new_email varchar)
returns table(
student_id_ integer, 
first_name_ varchar, 
last_name_ varchar,
email_ varchar, 
enrollement_date_ date)
language plpgsql
AS
$$
begin 
   update students 
   Set email = new_email
   where student_id = id_;
end;
$$;

CREATE FUNCTION deleteStudent(id_ integer)
returns table(
student_id_ integer, 
first_name_ varchar, 
last_name_ varchar,
email_ varchar, 
enrollement_date_ date)
language plpgsql
AS
$$
begin 
   delete from students 
   where student_id = id_;
end;
$$;

