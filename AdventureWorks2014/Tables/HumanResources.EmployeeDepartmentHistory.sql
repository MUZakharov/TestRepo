CREATE TABLE [HumanResources].[EmployeeDepartmentHistory]
(
  [BusinessEntityID] int NOT NULL,
  [DepartmentID] smallint NOT NULL,
  [ShiftID] tinyint NOT NULL,
  [StartDate] date NOT NULL,
  [EndDate] date NULL,
  [ModifiedDate] datetime NOT NULL
)
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] ADD CONSTRAINT [PK_EmployeeDepartmentHistory_BusinessEntityID_StartDate_DepartmentID] PRIMARY KEY CLUSTERED 
(
    [BusinessEntityID] ASC, [StartDate] ASC, [DepartmentID] ASC, [ShiftID] ASC
)
WITH
(
    PAD_INDEX = OFF, 
    IGNORE_DUP_KEY = OFF, 
    STATISTICS_NORECOMPUTE = OFF,
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON
)
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] ADD CONSTRAINT [CK_EmployeeDepartmentHistory_EndDate] CHECK ([EndDate]>=[StartDate] OR [EndDate] IS NULL)
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] ADD CONSTRAINT [DF_EmployeeDepartmentHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate]
GO

INDEX [IX_EmployeeDepartmentHistory_DepartmentID] NONCLUSTERED ([DepartmentID] ASC)
GO

INDEX [IX_EmployeeDepartmentHistory_ShiftID] NONCLUSTERED ([ShiftID] ASC)
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Department_DepartmentID] FOREIGN KEY ([DepartmentID]) 
REFERENCES [HumanResources].[Department]( [DepartmentID] ) 
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) 
REFERENCES [HumanResources].[Employee]( [BusinessEntityID] ) 
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistory] ADD CONSTRAINT [FK_EmployeeDepartmentHistory_Shift_ShiftID] FOREIGN KEY ([ShiftID]) 
REFERENCES [HumanResources].[Shift]( [ShiftID] ) 