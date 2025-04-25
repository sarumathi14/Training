USE University;
GO

-- Example for modifying an existing table
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'Student')
BEGIN
    -- Add new column if it doesn't exist
    IF NOT EXISTS (SELECT * FROM sys.columns WHERE name = 'email' AND object_id = OBJECT_ID('Student'))
    ALTER TABLE Student ADD email VARCHAR(100);
    
    -- Other modifications...
END
ELSE
BEGIN
    -- Create table if it doesn't exist
    CREATE TABLE Student (
        student_id VARCHAR(10) PRIMARY KEY,
        first_name VARCHAR(50) NOT NULL,
        last_name VARCHAR(50) NOT NULL,
        dept_id VARCHAR(10),
        enrollment_date DATE,
        total_credits INT DEFAULT 0,
        FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
    );
END
