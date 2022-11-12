
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/24/2017 21:14:57
-- Generated from EDMX file: E:\Projects\TFSOnline_Sumit\Darbhanaga_Portal\Dekhlo\Dekhlo.Dal\Portal.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PORTAL];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK__Cateogry__Status__4316F928]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cateogry] DROP CONSTRAINT [FK__Cateogry__Status__4316F928];
GO
IF OBJECT_ID(N'[dbo].[FK__Post__Status__4BAC3F29]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Post] DROP CONSTRAINT [FK__Post__Status__4BAC3F29];
GO
IF OBJECT_ID(N'[dbo].[FK__PostCateo__Cateo__5070F446]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostCateogryMapping] DROP CONSTRAINT [FK__PostCateo__Cateo__5070F446];
GO
IF OBJECT_ID(N'[dbo].[FK__PostCateo__PostI__4F7CD00D]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostCateogryMapping] DROP CONSTRAINT [FK__PostCateo__PostI__4F7CD00D];
GO
IF OBJECT_ID(N'[dbo].[FK__PostImage__PostI__5441852A]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PostImage] DROP CONSTRAINT [FK__PostImage__PostI__5441852A];
GO
IF OBJECT_ID(N'[dbo].[FK__SubCateog__Child__46E78A0C]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubCateogry] DROP CONSTRAINT [FK__SubCateog__Child__46E78A0C];
GO
IF OBJECT_ID(N'[dbo].[FK__SubCateog__Paren__47DBAE45]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SubCateogry] DROP CONSTRAINT [FK__SubCateog__Paren__47DBAE45];
GO
IF OBJECT_ID(N'[dbo].[FK__UserRegis__Statu__3E52440B]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserRegistration] DROP CONSTRAINT [FK__UserRegis__Statu__3E52440B];
GO
IF OBJECT_ID(N'[dbo].[FK__VisitorCa__Cateo__5812160E]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VisitorCateogry] DROP CONSTRAINT [FK__VisitorCa__Cateo__5812160E];
GO
IF OBJECT_ID(N'[dbo].[FK__VisitorCa__Visit__571DF1D5]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[VisitorCateogry] DROP CONSTRAINT [FK__VisitorCa__Visit__571DF1D5];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cateogry]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cateogry];
GO
IF OBJECT_ID(N'[dbo].[Post]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Post];
GO
IF OBJECT_ID(N'[dbo].[PostCateogryMapping]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostCateogryMapping];
GO
IF OBJECT_ID(N'[dbo].[PostImage]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PostImage];
GO
IF OBJECT_ID(N'[dbo].[StatusCondition]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StatusCondition];
GO
IF OBJECT_ID(N'[dbo].[SubCateogry]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SubCateogry];
GO
IF OBJECT_ID(N'[dbo].[UserRegistration]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserRegistration];
GO
IF OBJECT_ID(N'[dbo].[VisitorCateogry]', 'U') IS NOT NULL
    DROP TABLE [dbo].[VisitorCateogry];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cateogries'
CREATE TABLE [dbo].[Cateogries] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [CateogryName] nvarchar(100)  NULL,
    [IsVisitorCateogry] bit  NULL,
    [Status] int  NULL,
    [CreatedOn] datetime  NULL,
    [CreatedBy] bigint  NULL,
    [UpdatedOn] datetime  NULL,
    [UpdateBy] bigint  NULL
);
GO

-- Creating table 'Posts'
CREATE TABLE [dbo].[Posts] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [PostTitle] nvarchar(200)  NOT NULL,
    [PostContent] nvarchar(300)  NOT NULL,
    [Status] int  NOT NULL,
    [CreatedOn] datetime  NULL,
    [CreatedBy] bigint  NULL,
    [UpdatedOn] datetime  NULL,
    [UpdateBy] bigint  NULL
);
GO

-- Creating table 'PostCateogryMappings'
CREATE TABLE [dbo].[PostCateogryMappings] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [PostId] bigint  NULL,
    [CateogryId] bigint  NULL,
    [CreatedOn] datetime  NULL,
    [CreatedBy] bigint  NULL,
    [UpdatedOn] datetime  NULL,
    [UpdateBy] bigint  NULL
);
GO

-- Creating table 'PostImages'
CREATE TABLE [dbo].[PostImages] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [PostId] bigint  NULL,
    [ImageUrl] varchar(300)  NULL
);
GO

-- Creating table 'StatusConditions'
CREATE TABLE [dbo].[StatusConditions] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [StatusName] varchar(50)  NOT NULL
);
GO

-- Creating table 'SubCateogries'
CREATE TABLE [dbo].[SubCateogries] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [ChildCateogry] bigint  NULL,
    [ParentCateogry] bigint  NULL,
    [CreatedOn] datetime  NULL,
    [CreatedBy] bigint  NULL,
    [UpdatedOn] datetime  NULL,
    [UpdateBy] bigint  NULL
);
GO

-- Creating table 'UserRegistrations'
CREATE TABLE [dbo].[UserRegistrations] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(100)  NULL,
    [MiddleName] nvarchar(100)  NULL,
    [LastName] nvarchar(100)  NULL,
    [Address] nvarchar(300)  NULL,
    [EmailId] varchar(100)  NULL,
    [MobileNo] varchar(13)  NULL,
    [UserName] varchar(100)  NOT NULL,
    [Password] nvarchar(50)  NOT NULL,
    [ProfilePic] varbinary(max)  NULL,
    [IsVisitor] bit  NULL,
    [Status] int  NULL,
    [CreatedOn] datetime  NULL,
    [CreatedBy] bigint  NULL,
    [UpdatedOn] datetime  NULL,
    [UpdateBy] bigint  NULL
);
GO

-- Creating table 'VisitorCateogries'
CREATE TABLE [dbo].[VisitorCateogries] (
    [Id] bigint IDENTITY(1,1) NOT NULL,
    [VisitorId] bigint  NOT NULL,
    [CateogryId] bigint  NOT NULL,
    [CreatedOn] datetime  NULL,
    [CreatedBy] bigint  NULL,
    [UpdatedOn] datetime  NULL,
    [UpdateBy] bigint  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cateogries'
ALTER TABLE [dbo].[Cateogries]
ADD CONSTRAINT [PK_Cateogries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [PK_Posts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostCateogryMappings'
ALTER TABLE [dbo].[PostCateogryMappings]
ADD CONSTRAINT [PK_PostCateogryMappings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'PostImages'
ALTER TABLE [dbo].[PostImages]
ADD CONSTRAINT [PK_PostImages]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StatusConditions'
ALTER TABLE [dbo].[StatusConditions]
ADD CONSTRAINT [PK_StatusConditions]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'SubCateogries'
ALTER TABLE [dbo].[SubCateogries]
ADD CONSTRAINT [PK_SubCateogries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UserRegistrations'
ALTER TABLE [dbo].[UserRegistrations]
ADD CONSTRAINT [PK_UserRegistrations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'VisitorCateogries'
ALTER TABLE [dbo].[VisitorCateogries]
ADD CONSTRAINT [PK_VisitorCateogries]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Status] in table 'Cateogries'
ALTER TABLE [dbo].[Cateogries]
ADD CONSTRAINT [FK__Cateogry__Status__4316F928]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[StatusConditions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Cateogry__Status__4316F928'
CREATE INDEX [IX_FK__Cateogry__Status__4316F928]
ON [dbo].[Cateogries]
    ([Status]);
GO

-- Creating foreign key on [CateogryId] in table 'PostCateogryMappings'
ALTER TABLE [dbo].[PostCateogryMappings]
ADD CONSTRAINT [FK__PostCateo__Cateo__5070F446]
    FOREIGN KEY ([CateogryId])
    REFERENCES [dbo].[Cateogries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__PostCateo__Cateo__5070F446'
CREATE INDEX [IX_FK__PostCateo__Cateo__5070F446]
ON [dbo].[PostCateogryMappings]
    ([CateogryId]);
GO

-- Creating foreign key on [ChildCateogry] in table 'SubCateogries'
ALTER TABLE [dbo].[SubCateogries]
ADD CONSTRAINT [FK__SubCateog__Child__46E78A0C]
    FOREIGN KEY ([ChildCateogry])
    REFERENCES [dbo].[Cateogries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SubCateog__Child__46E78A0C'
CREATE INDEX [IX_FK__SubCateog__Child__46E78A0C]
ON [dbo].[SubCateogries]
    ([ChildCateogry]);
GO

-- Creating foreign key on [ParentCateogry] in table 'SubCateogries'
ALTER TABLE [dbo].[SubCateogries]
ADD CONSTRAINT [FK__SubCateog__Paren__47DBAE45]
    FOREIGN KEY ([ParentCateogry])
    REFERENCES [dbo].[Cateogries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__SubCateog__Paren__47DBAE45'
CREATE INDEX [IX_FK__SubCateog__Paren__47DBAE45]
ON [dbo].[SubCateogries]
    ([ParentCateogry]);
GO

-- Creating foreign key on [CateogryId] in table 'VisitorCateogries'
ALTER TABLE [dbo].[VisitorCateogries]
ADD CONSTRAINT [FK__VisitorCa__Cateo__5812160E]
    FOREIGN KEY ([CateogryId])
    REFERENCES [dbo].[Cateogries]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__VisitorCa__Cateo__5812160E'
CREATE INDEX [IX_FK__VisitorCa__Cateo__5812160E]
ON [dbo].[VisitorCateogries]
    ([CateogryId]);
GO

-- Creating foreign key on [Status] in table 'Posts'
ALTER TABLE [dbo].[Posts]
ADD CONSTRAINT [FK__Post__Status__4BAC3F29]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[StatusConditions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__Post__Status__4BAC3F29'
CREATE INDEX [IX_FK__Post__Status__4BAC3F29]
ON [dbo].[Posts]
    ([Status]);
GO

-- Creating foreign key on [PostId] in table 'PostCateogryMappings'
ALTER TABLE [dbo].[PostCateogryMappings]
ADD CONSTRAINT [FK__PostCateo__PostI__4F7CD00D]
    FOREIGN KEY ([PostId])
    REFERENCES [dbo].[Posts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__PostCateo__PostI__4F7CD00D'
CREATE INDEX [IX_FK__PostCateo__PostI__4F7CD00D]
ON [dbo].[PostCateogryMappings]
    ([PostId]);
GO

-- Creating foreign key on [PostId] in table 'PostImages'
ALTER TABLE [dbo].[PostImages]
ADD CONSTRAINT [FK__PostImage__PostI__5441852A]
    FOREIGN KEY ([PostId])
    REFERENCES [dbo].[Posts]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__PostImage__PostI__5441852A'
CREATE INDEX [IX_FK__PostImage__PostI__5441852A]
ON [dbo].[PostImages]
    ([PostId]);
GO

-- Creating foreign key on [Status] in table 'UserRegistrations'
ALTER TABLE [dbo].[UserRegistrations]
ADD CONSTRAINT [FK__UserRegis__Statu__3E52440B]
    FOREIGN KEY ([Status])
    REFERENCES [dbo].[StatusConditions]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__UserRegis__Statu__3E52440B'
CREATE INDEX [IX_FK__UserRegis__Statu__3E52440B]
ON [dbo].[UserRegistrations]
    ([Status]);
GO

-- Creating foreign key on [VisitorId] in table 'VisitorCateogries'
ALTER TABLE [dbo].[VisitorCateogries]
ADD CONSTRAINT [FK__VisitorCa__Visit__571DF1D5]
    FOREIGN KEY ([VisitorId])
    REFERENCES [dbo].[UserRegistrations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK__VisitorCa__Visit__571DF1D5'
CREATE INDEX [IX_FK__VisitorCa__Visit__571DF1D5]
ON [dbo].[VisitorCateogries]
    ([VisitorId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------