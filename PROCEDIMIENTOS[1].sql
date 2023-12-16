---------------------
--PROCEDIMIENTOS
---------------------

--AccreditationControl
--Cargar
CREATE PROCEDURE GetAccreditationData
AS
BEGIN
    SELECT idAccreditation, credits, serviceHours, idStudent, idClub, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AccreditationControl
    WHERE status <> 0; 
END;
GO


--Insertar
CREATE PROCEDURE InsertAccreditation
    @credits INT,
    @serviceHours VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AccreditationControl (credits, serviceHours, idStudent, idClub)
    VALUES (@credits, @serviceHours, @idStudent, @idClub);
END;
GO


--Actualizar
CREATE PROCEDURE UpdateAccreditationData
    @idAccreditation INT,
    @credits INT,
    @serviceHours VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AccreditationControl
    SET credits = @credits,
        serviceHours = @serviceHours,
        idStudent = @idStudent,
        idClub = @idClub
    WHERE idAccreditation = @idAccreditation;
END;
GO

--Eliminar
CREATE PROCEDURE UpdateAccreditationStatus
    @idAccreditation INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AccreditationControl
    SET status = 0
    WHERE idAccreditation = @idAccreditation;
END;
GO

-----------------------------------------------------------
--AttendanceRecord

CREATE PROCEDURE CreateAttendanceRecord
    @date DATE,
    @attended VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AttendanceRecord ([date], attended, idStudent, idClub)
    VALUES (@date, @attended, @idStudent, @idClub);
END;
GO


--Cargar
CREATE PROCEDURE GetAttendanceRecords
AS
BEGIN
    SELECT AttendanceRecordId, [date], attended, idStudent, idClub, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AttendanceRecord
	WHERE status <> 0; 
END;
GO


--Actualizar
CREATE PROCEDURE UpdateAttendanceRecord
    @AttendanceRecordId INT,
    @date DATE,
    @attended VARCHAR(50),
    @idStudent INT,
    @idClub INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AttendanceRecord
    SET [date] = @date,
        attended = @attended,
        idStudent = @idStudent,
        idClub = @idClub
    WHERE AttendanceRecordId = @AttendanceRecordId;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteAttendanceRecord
    @AttendanceRecordId INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.AttendanceRecord
    SET status = 0
    WHERE AttendanceRecordId = @AttendanceRecordId;
END;
GO


--Club
CREATE PROCEDURE InsertClub
    @name VARCHAR(50),
    @classification VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Club (name, classification, idEmployee)
    VALUES (@name, @classification, @idEmployee)
END;
GO 

--Cargar
CREATE PROCEDURE GetClubs
AS
BEGIN
    SELECT idClub, name, classification, idEmployee, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Club
END;
GO 


--Actualizar
CREATE PROCEDURE UpdateClub
    @idClub INT,
    @name VARCHAR(50),
    @classification VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Club
    SET name = @name,
        classification = @classification,
        idEmployee = @idEmployee
    WHERE idClub = @idClub;
END;
GO 


--Eliminar
CREATE PROCEDURE DeleteClub
    @idClub INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Club
    SET status = 0
    WHERE idClub = @idClub;
END;
GO 


--ClubStudent
--Insertar
CREATE PROCEDURE CreateClubStudent
    @idClub INT,
    @idStudent INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubStudent (idClub, idStudent)
    VALUES (@idClub, @idStudent);
END;
GO 

--Cargar
CREATE PROCEDURE GetClubStudents
AS
BEGIN
    SELECT idClubStudent, idClub, idStudent, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubStudent
	WHERE status <> 0;
END;
GO 


--Actualizar
CREATE PROCEDURE UpdateClubStudent
    @idClubStudent INT,
    @idClub INT,
    @idStudent INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubStudent
    SET idClub = @idClub,
        idStudent = @idStudent
    WHERE idClubStudent = @idClubStudent;
END;
GO 


--Eliminar
CREATE PROCEDURE DeleteClubStudent
    @idClubStudent INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubStudent
    SET status = 0
    WHERE idClubStudent = @idClubStudent;
END;
GO 


--ClubSchedule
--Insertar
CREATE PROCEDURE CreateClubSchedule
    @dayOfWeek DATE,
    @startTime DATETIME,
    @endTime DATETIME,
    @idClub INT,
    @idEmployee INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubSchedule (dayOfWeek, startTime, endTime, idClub, idEmployee)
    VALUES (@dayOfWeek, @startTime, @endTime, @idClub, @idEmployee);
END;
GO 

--Cargar
CREATE PROCEDURE GetClubSchedules
AS
BEGIN
    SELECT idClubSchedule, dayOfWeek, startTime, endTime, idClub, idEmployee, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubSchedule
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateClubSchedule
    @idClubSchedule INT,
    @dayOfWeek DATE,
    @startTime DATETIME,
    @endTime DATETIME,
    @idClub INT,
    @idEmployee INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubSchedule
    SET dayOfWeek = @dayOfWeek,
        startTime = @startTime,
        endTime = @endTime,
        idClub = @idClub,
        idEmployee = @idEmployee
    WHERE idClubSchedule = @idClubSchedule;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteClubSchedule
    @idClubSchedule INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ClubSchedule
    SET status = 0
    WHERE idClubSchedule = @idClubSchedule;
END;
GO


--Employee

-- Insertar en el servidor vinculado
CREATE PROCEDURE CreateEmployee
    @firstName VARCHAR(50),
    @lastName VARCHAR(50),
    @middleName VARCHAR(50),
    @specialty VARCHAR(50)
AS
BEGIN
    INSERT INTO [AXEL\SQLEXPRESS].Extracurricular.dbo.Employee (firstName, lastName, middleName, specialty)
    VALUES (@firstName, @lastName, @middleName, @specialty);
END;
GO

-- Obtener desde el servidor vinculado
CREATE PROCEDURE GetEmployees
AS
BEGIN
    SELECT idEmployee, firstName, lastName, middleName, specialty, status
    FROM [AXEL\SQLEXPRESS].Extracurricular.dbo.Employee
    WHERE status <> 0;
END;
GO

-- Actualizar en el servidor vinculado
CREATE PROCEDURE UpdateEmployee
    @idEmployee INT,
    @firstName VARCHAR(50),
    @lastName VARCHAR(50),
    @middleName VARCHAR(50),
    @specialty VARCHAR(50)
AS
BEGIN
    UPDATE [AXEL\SQLEXPRESS].Extracurricular.dbo.Employee
    SET firstName = @firstName,
        lastName = @lastName,
        middleName = @middleName,
        specialty = @specialty
    WHERE idEmployee = @idEmployee;
END;
GO

-- Eliminar en el servidor vinculado
CREATE PROCEDURE DeleteEmployee
    @idEmployee INT
AS
BEGIN
    UPDATE [AXEL\SQLEXPRESS].Extracurricular.dbo.Employee
    SET status = 0
    WHERE idEmployee = @idEmployee;
END;
GO


--Event
CREATE PROCEDURE CreateEvent
    @activityToPerform VARCHAR(50),
    @date DATE,
    @idClub INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Event (activityToPerform, [date], idClub)
    VALUES (@activityToPerform, @date, @idClub);
END;
GO


--Cargar
CREATE PROCEDURE GetEvents
AS
BEGIN
    SELECT idEvent, activityToPerform, [date], idClub, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Event
	WHERE status <> 0;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateEvent
    @idEvent INT,
    @activityToPerform VARCHAR(50),
    @date DATE,
    @idClub INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Event
    SET activityToPerform = @activityToPerform,
        [date] = @date,
        idClub = @idClub
    WHERE idEvent = @idEvent;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteEvent
    @idEvent INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Event
    SET status = 0
    WHERE idEvent = @idEvent;
END;
GO

--Expenses

--insertar
CREATE PROCEDURE CreateExpense
    @expenseDate DATE,
    @amount DECIMAL(10, 2),
    @expenseDescription VARCHAR(50),
    @idExpenseType INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Expenses (expenseDate, amount, expenseDescription, idExpenseType)
    VALUES (@expenseDate, @amount, @expenseDescription, @idExpenseType);
END;
GO


--Cargar
CREATE PROCEDURE GetExpenses
AS
BEGIN
    SELECT idExpenses, expenseDate, amount, expenseDescription, status, idExpenseType
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Expenses
	WHERE status <> 0;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateExpense
    @idExpenses INT,
    @expenseDate DATE,
    @amount DECIMAL(10, 2),
    @expenseDescription VARCHAR(50),
    @idExpenseType INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Expenses
    SET expenseDate = @expenseDate,
        amount = @amount,
        expenseDescription = @expenseDescription,
        idExpenseType = @idExpenseType
    WHERE idExpenses = @idExpenses;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteExpense
    @idExpenses INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Expenses
    SET status = 0
    WHERE idExpenses = @idExpenses;
END;
GO


--ExpenseType

--Insertar
CREATE PROCEDURE CreateExpenseType
    @expenseTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExpenseType (expenseTypeName, [description])
    VALUES (@expenseTypeName, @description);
END;
GO


--Cargar
CREATE PROCEDURE GetExpenseTypes
AS
BEGIN
    SELECT idExpenseType, expenseTypeName, [description], status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExpenseType
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateExpenseType
    @idExpenseType INT,
    @expenseTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExpenseType
    SET expenseTypeName = @expenseTypeName,
        [description] = @description
    WHERE idExpenseType = @idExpenseType;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteExpenseType
    @idExpenseType INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExpenseType
    SET status = 0
    WHERE idExpenseType = @idExpenseType;
END;
GO

--ExtraCurricularScholarship

-- Insertar en el servidor vinculado
CREATE PROCEDURE CreateScholarship
    @scholarshipAmount DECIMAL(10, 2),
    @eligibilityRequirements NVARCHAR(100),
    @scholarshipDuration VARCHAR(50),
    @description NVARCHAR(100)
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExtraCurricularScholarship (scholarshipAmount, eligibilityRequirements, scholarshipDuration, [description])
    VALUES (@scholarshipAmount, @eligibilityRequirements, @scholarshipDuration, @description);
END;
GO

-- Obtener desde el servidor vinculado
CREATE PROCEDURE GetScholarships
AS
BEGIN
    SELECT idScholarship, scholarshipAmount, eligibilityRequirements, scholarshipDuration, [description], status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExtraCurricularScholarship
    WHERE status <> 0;
END;
GO

-- Actualizar en el servidor vinculado
CREATE PROCEDURE UpdateScholarship
    @idScholarship INT,
    @scholarshipAmount DECIMAL(10, 2),
    @eligibilityRequirements NVARCHAR(100),
    @scholarshipDuration VARCHAR(50),
    @description NVARCHAR(100)
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExtraCurricularScholarship
    SET scholarshipAmount = @scholarshipAmount,
        eligibilityRequirements = @eligibilityRequirements,
        scholarshipDuration = @scholarshipDuration,
        [description] = @description
    WHERE idScholarship = @idScholarship;
END;
GO

-- Eliminar en el servidor vinculado
CREATE PROCEDURE DeleteScholarship
    @idScholarship INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.ExtraCurricularScholarship
    SET status = 0
    WHERE idScholarship = @idScholarship;
END;
GO


--Facility

--Insertar
CREATE PROCEDURE CreateFacility
    @facilityName VARCHAR(50),
    @capacity VARCHAR(50),
    @location VARCHAR(50),
    @Availability VARCHAR(50),
    @idClub INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Facility (facilityName, capacity, [location], [Availability], idClub)
    VALUES (@facilityName, @capacity, @location, @Availability, @idClub);
END;
GO


--Cargar
CREATE PROCEDURE GetFacilities
AS
BEGIN
    SELECT idFacility, facilityName, capacity, [location], [Availability], status, idClub
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Facility
	WHERE status <> 0;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateFacility
    @idFacility INT,
    @facilityName VARCHAR(50),
    @capacity VARCHAR(50),
    @location VARCHAR(50),
    @Availability VARCHAR(50),
    @idClub INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Facility
    SET facilityName = @facilityName,
        capacity = @capacity,
        [location] = @location,
        [Availability] = @Availability,
        idClub = @idClub
    WHERE idFacility = @idFacility;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteFacility
    @idFacility INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Facility
    SET status = 0
    WHERE idFacility = @idFacility;
END;
GO


--Material

--Insertar
CREATE PROCEDURE CreateMaterial
    @itemName VARCHAR(50),
    @quantity INT,
    @itemType VARCHAR(50),
    @idMaterialLoan INT,
    @idMaterialType INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Material (itemName, quantity, itemType, idMaterialLoan, idMaterialType)
    VALUES (@itemName, @quantity, @itemType, @idMaterialLoan, @idMaterialType);
END;
GO

--Cargar
CREATE PROCEDURE GetMaterials
AS
BEGIN
    SELECT idMaterial, itemName, quantity, itemType, idMaterialLoan, idMaterialType, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Material
	WHERE status <> 0;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateMaterial
    @idMaterial INT,
    @itemName VARCHAR(50),
    @quantity INT,
    @itemType VARCHAR(50),
    @idMaterialLoan INT,
    @idMaterialType INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Material
    SET itemName = @itemName,
        quantity = @quantity,
        itemType = @itemType,
        idMaterialLoan = @idMaterialLoan,
        idMaterialType = @idMaterialType
    WHERE idMaterial = @idMaterial;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteMaterial
    @idMaterial INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Material
    SET status = 0
    WHERE idMaterial = @idMaterial;
END;
GO


--MaterialLoan

--Insertar
CREATE PROCEDURE CreateMaterialLoan
    @specialty VARCHAR(50),
    @article VARCHAR(50),
    @entryDate DATE,
    @exitDate DATE,
    @materialStatus VARCHAR(50),
    @idStudent INT,
    @idEmployee INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialLoan (specialty, article, entryDate, exitDate, materialStatus, idStudent, idEmployee)
    VALUES (@specialty, @article, @entryDate, @exitDate, @materialStatus, @idStudent, @idEmployee);
END;
GO


--Cargar
CREATE PROCEDURE GetMaterialLoans
AS
BEGIN
    SELECT idMaterialLoan, specialty, article, entryDate, exitDate, materialStatus, idStudent, idEmployee, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialLoan
	WHERE status <> 0;
END;
GO

--Actualizar
CREATE PROCEDURE UpdateMaterialLoan
    @idMaterialLoan INT,
    @specialty VARCHAR(50),
    @article VARCHAR(50),
    @entryDate DATE,
    @exitDate DATE,
    @materialStatus VARCHAR(50),
    @idStudent INT,
    @idEmployee INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialLoan
    SET specialty = @specialty,
        article = @article,
        entryDate = @entryDate,
        exitDate = @exitDate,
        materialStatus = @materialStatus,
        idStudent = @idStudent,
        idEmployee = @idEmployee
    WHERE idMaterialLoan = @idMaterialLoan;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteMaterialLoan
    @idMaterialLoan INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialLoan
    SET status = 0
    WHERE idMaterialLoan = @idMaterialLoan;
END;
GO

--MaterialType

--Insertar
CREATE PROCEDURE CreateMaterialType
    @materialTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialType (materialTypeName, [description])
    VALUES (@materialTypeName, @description);
END;
GO


--Cargar
CREATE PROCEDURE GetMaterialTypes
AS
BEGIN
    SELECT idMaterialType, materialTypeName, [description], status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialType
	WHERE status <> 0;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateMaterialType
    @idMaterialType INT,
    @materialTypeName VARCHAR(50),
    @description VARCHAR(50)
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialType
    SET materialTypeName = @materialTypeName,
        [description] = @description
    WHERE idMaterialType = @idMaterialType;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteMaterialType
    @idMaterialType INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.MaterialType
    SET status = 0
    WHERE idMaterialType = @idMaterialType;
END;
GO


--Student

--Insertar
CREATE PROCEDURE CreateStudent
    @firstName VARCHAR(50),
    @middleName VARCHAR(50),
    @lastName VARCHAR(50),
    @specialty VARCHAR(50),
    @semester INT,
    @registrationNumber VARCHAR(50),
    @idScholarship INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Student (firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship)
    VALUES (@firstName, @middleName, @lastName, @specialty, @semester, @registrationNumber, @idScholarship);
END;
GO


--Cargar
CREATE PROCEDURE GetStudents
AS
BEGIN
    SELECT idStudent, firstName, middleName, lastName, specialty, semester, registrationNumber, idScholarship, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Student;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateStudent
    @idStudent INT,
    @firstName VARCHAR(50),
    @middleName VARCHAR(50),
    @lastName VARCHAR(50),
    @specialty VARCHAR(50),
    @semester INT,
    @registrationNumber VARCHAR(50),
    @idScholarship INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Student
    SET firstName = @firstName,
        middleName = @middleName,
        lastName = @lastName,
        specialty = @specialty,
        semester = @semester,
        registrationNumber = @registrationNumber,
        idScholarship = @idScholarship
    WHERE idStudent = @idStudent;
END;
GO

--Eliminar
CREATE PROCEDURE DeleteStudent
    @idStudent INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.Student
    SET status = 0
    WHERE idStudent = @idStudent;
END;
GO


--TypeofEmployee

--Insertar
CREATE PROCEDURE CreateTypeOfEmployee
    @benefits VARCHAR(50),
    @description VARCHAR(50),
    @categoryemployee VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    INSERT INTO [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.TypeOfEmployee (benefits, [description], categoryemployee, idEmployee)
    VALUES (@benefits, @description, @categoryemployee, @idEmployee);
END;
GO

--Cargar
CREATE PROCEDURE GetTypeOfEmployees
AS
BEGIN
    SELECT idTypeOfEmployee, benefits, [description], categoryemployee, idEmployee, status
    FROM [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.TypeOfEmployee
	WHERE status <> 0;
END;
GO


--Actualizar
CREATE PROCEDURE UpdateTypeOfEmployee
    @idTypeOfEmployee INT,
    @benefits VARCHAR(50),
    @description VARCHAR(50),
    @categoryemployee VARCHAR(50),
    @idEmployee INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.TypeOfEmployee
    SET benefits = @benefits,
        [description] = @description,
        categoryemployee = @categoryemployee,
        idEmployee = @idEmployee
    WHERE idTypeOfEmployee = @idTypeOfEmployee;
END;
GO


--Eliminar
CREATE PROCEDURE DeleteTypeOfEmployee
    @idTypeOfEmployee INT
AS
BEGIN
    UPDATE [LAPTOP-992RQEM3\SQLEXPRESS].Extracurricular.dbo.TypeOfEmployee
    SET status = 0
    WHERE idTypeOfEmployee = @idTypeOfEmployee;
END;
GO
