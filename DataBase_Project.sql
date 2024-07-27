CREATE DATABASE EmployeeDB;

USE EmployeeDB;

-- Department Table
CREATE TABLE Department (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(255) NOT NULL,
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employee(EmployeeID)
);

-- Employee Table
CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    Address TEXT,
    Phone VARCHAR(20),
    Email VARCHAR(255),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Project Table
CREATE TABLE Project (
    ProjectID INT AUTO_INCREMENT PRIMARY KEY,
    ProjectName VARCHAR(255) NOT NULL,
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    Status ENUM('Present', 'Absent', 'Leave'),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);

-- Performance Table
CREATE TABLE Performance (
    PerformanceID INT AUTO_INCREMENT PRIMARY KEY,
    EmployeeID INT,
    ReviewDate DATE,
    Rating INT CHECK (Rating >= 1 AND Rating <= 5),
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
