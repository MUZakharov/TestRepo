CREATE TABLE [HumanResources].[JobCandidate]
(
  [JobCandidateID] int IDENTITY (1, 1) NOT NULL,
  [BusinessEntityID] int NULL,
  [Resume] xml NULL,
  [ModifiedDate] datetime NOT NULL
)
TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[JobCandidate] ADD CONSTRAINT [PK_JobCandidate_JobCandidateID] PRIMARY KEY CLUSTERED 
(
    [JobCandidateID] ASC
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

ALTER TABLE [HumanResources].[JobCandidate] ADD CONSTRAINT [DF_JobCandidate_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate]
GO

INDEX [IX_JobCandidate_BusinessEntityID] NONCLUSTERED ([BusinessEntityID] ASC)
GO

ALTER TABLE [HumanResources].[JobCandidate] ADD CONSTRAINT [FK_JobCandidate_Employee_BusinessEntityID] FOREIGN KEY ([BusinessEntityID]) 
REFERENCES [HumanResources].[Employee]( [BusinessEntityID] ) 