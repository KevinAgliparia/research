-- Create the database
CREATE DATABASE thesis_db;
USE thesis_db;

-- Create admin table
CREATE TABLE admin_tbl (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

-- Create department table
CREATE TABLE department_tbl (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100) NOT NULL
);

-- Create program table
CREATE TABLE program_tbl (
    program_id INT AUTO_INCREMENT PRIMARY KEY,
    program_name VARCHAR(100) NOT NULL,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department_tbl(dept_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Create adviser table
CREATE TABLE adviser_tbl (
    adviser_id INT AUTO_INCREMENT PRIMARY KEY,
    adviser_name VARCHAR(100) NOT NULL
);

-- Create research table
CREATE TABLE research_tbl (
    research_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    abstract TEXT,
    adviser_id INT,
    date_publish DATE,
    date_submitted DATE,
    research_file VARCHAR(255) NOT NULL,
    program_id INT,
    FOREIGN KEY (adviser_id) REFERENCES adviser_tbl(adviser_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE,
    FOREIGN KEY (program_id) REFERENCES program_tbl(program_id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);

-- Create author table
CREATE TABLE author_tbl (
    aid INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    research_id INT,
    FOREIGN KEY (research_id) REFERENCES research_tbl(research_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);