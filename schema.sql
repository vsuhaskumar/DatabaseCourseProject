USE db_cjhoffman;

/*DROP TABLE Students;
DROP TABLE Courses;
DROP TABLE Universities;
DROP TABLE Instructors;
DROP TABLE Transactions;
DROP TABLE CreditCards;
DROP TABLE Ratings;
*/

CREATE TABLE Students (
	StudentEmailAddress varchar(255),
	StudentName varchar(255) NOT NULL,
	StudentDOB date,
	StudentLocation varchar(255),
	StudentGender char(1),
	PRIMARY KEY (StudentEmailAddress)
);

CREATE TABLE Courses (
	CourseID int,
	CourseName varchar(255) NOT NULL,
	CourseOverview varchar(255),
	CourseDuration varchar(255) NOT NULL,
	CourseDifficulty varchar(255),
	CourseCategory varchar(255),
	CourseFAQ varchar(255),
	PRIMARY KEY (CourseID)
);


CREATE TABLE Universities (
	UniversityID int,
	UniversityName varchar(255) NOT NULL,
	UniversityDescription varchar(255),
	PRIMARY KEY (UniversityID)
);


CREATE TABLE Instructors (
	InstructorID int,
	InstructorName varchar(255) NOT NULL,
	InstructorGender char(1),
	InstructorSpecialization varchar(255),
	PRIMARY KEY (InstructorID)
);

CREATE TABLE Transactions (
	TransactionID int,
	TransactionTimeStamp DATETIME NOT NULL,
	TransactionStatus varchar(255) NOT NULL,
	PRIMARY KEY (TransactionID)
);

CREATE TABLE CreditCards (
	CreditCardNo int,
	ExpDate varchar(255) NOT NULL,
	NameOnCard varchar(255) NOT NULL,
	CVV int NOT NULL,
	PRIMARY KEY (CreditCardNo)
);

CREATE TABLE Ratings (
	StudentID varchar(255),
	CourseID int,
	RateStars int,
	Comments varchar(255),
	FOREIGN KEY (StudentID) REFERENCES Students (StudentEmailAddress) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CourseID) REFERENCES Courses (CourseID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE UnivCourses (
	UniversityID int,
	CourseID int,
	FOREIGN KEY (CourseID) REFERENCES Courses (CourseID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (UniversityID) REFERENCES Universities (UniversityID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE UnivInstructors (
	UniversityID int,
	InstructorID int,
	FOREIGN KEY (InstructorID) REFERENCES Instructors (InstructorID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (UniversityID) REFERENCES Universities (UniversityID) ON UPDATE CASCADE ON DELETE CASCADE
	
);

CREATE TABLE CourseInstructors (
	CourseID int,
	InstructorID int,
	FOREIGN KEY (InstructorID) REFERENCES Instructors (InstructorID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CourseID) REFERENCES Courses (CourseID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE StudentCourses (
	StudentID varchar(255),
	CourseID int,
	FOREIGN KEY (StudentID) REFERENCES Students (StudentEmailAddress) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CourseID) REFERENCES Courses (CourseID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE StudentCourseTrans (
	StudentID varchar(255),
	CourseID int,
	TransactionID int,
	FOREIGN KEY (StudentID) REFERENCES Students (StudentEmailAddress) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CourseID) REFERENCES Courses (CourseID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (TransactionID) REFERENCES Transactions (TransactionID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE StudentCards (
	StudentID varchar(255),
	CreditCardNo int,
	FOREIGN KEY (StudentID) REFERENCES Students (StudentEmailAddress) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CreditCardNo) REFERENCES CreditCards (CreditCardNo) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE CardTrans (
	CreditCardNo int,
	TransactionID int,
	FOREIGN KEY (TransactionID) REFERENCES Transactions (TransactionID) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (CreditCardNo) REFERENCES CreditCards (CreditCardNo) ON UPDATE CASCADE ON DELETE CASCADE
);





