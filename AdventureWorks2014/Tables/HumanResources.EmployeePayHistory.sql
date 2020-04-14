CREATE TABLE [HumanResources].[EmployeePayHistory]
(
  [BusinessEntityID] int NOT NULL,
  [RateChangeDate] datetime NOT NULL,
  [Rate] money NOT NULL,
  [PayFrequency] tinyint NOT NULL,
  [ModifiedDate] datetime NOT NULL
)
GO

ALTER TABLE [HumanResources].[EmployeePayHistory] ADD CONSTRAINT [PK_EmployeePayHistory_BusinessEntityID_RateChangeDate] PRIMARY KEY CLUSTERED 
(
    [BusinessEntityID] ASC, [RateChangeDate] ASC
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

ALTER TABLE [HumanResources].[EmployeePayHistory] ADD CONSTRAINT [CK_EmployeePayHistory_PayFrequency] CHECK ([PayFrequency]=(2) OR [PayFrequency]=(1))
GO

ALTER TABLE [HumanResources].[EmployeePayHistory] ADD CONSTRAINT [CK_EmployeePayHistory_Rate] CHECK ([Rate]>=(6.50) AND [Rate]<=(200.00))
GO

ALTER TABLE [HumanResources].[EmployeePayHistory] ADD CONSTRAINT [DF_EmployeePayHistory_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate]
GO

ALTER TABLE [HumanResources].[EmployeePayHistory] ADD CONSTRAINT [FK_EmployeePayHistory_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) 
REFERENCES [HumanResources].[Employee]( [BusinessEntityID] ) 