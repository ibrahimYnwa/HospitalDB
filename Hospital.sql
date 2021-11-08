CREATE TABLE Departments(
   Id int identity primary key,
   Name nvarchar(250)
)
CREATE TABLE Specialists(
   Id int identity primary key,
   Name nvarchar(250)
)

CREATE TABLE Rooms(
  Id int identity primary key,
  Name nvarchar(250),
  DepartmentId int references Departments(Id)
  )
CREATE TABLE Ilness(
  Id int identity primary key,
  Name nvarchar(250),
  DepartmentId int references Departments(Id)
  )
CREATE TABLE Patients(
  Id int identity primary key,
  Name nvarchar(250)NOT NULL ,
  Surname nvarchar(250),
  Age int,
  Phone nvarchar(250),
  Mail nvarchar(250) UNIQUE,
  Adress nvarchar(250),
  )
  CREATE TABLE Patient_Ilness(
   Id int identity primary key,
   PatientId int references Patients(Id),
   IlnessId int references Ilness(Id)
)
CREATE TABLE Registrations(
   Id int identity primary key,
   EnterTime DATETIME,
   ExitTime DATETIME,
   Expenditure decimal(10,2),
   PatientId int references Patients(Id)
   )
CREATE TABLE Doctors(
   Id int identity primary key,
   [Name] nvarchar(250) NOT NULL,
   Surname nvarchar(250),
   Mail nvarchar(250) UNIQUE,
   Age int,
   EducationDescription nvarchar(250),
   DepartmentId int references Departments(Id),
   SpecialistsId int references Specialists(Id)
 )
 CREATE TABLE Patient_Doctor(
    Id int identity primary key,
	PatientId int references Patients(Id),
	DoctorId int references Doctors(Id)
)
USE HospitalDb

CREATE VIEW HospitalReport
AS 
SELECT dr.Name,
       Surname,
	   Mail,
	   Age,
	   dt.Name 'Department',
	   st.Name 'Specialist'
FROM Doctors dr
JOIN Departments dt
ON
dr.DepartmentId=dt.Id

JOIN Specialists st
ON 
dr.SpecialistsId=st.Id














