/* 
DO NOT RUN THIS SCRIPT.
This script was used to create the table in azure sql database already.
It is meant to be used as an example only. 
*/

CREATE TABLE [dbo].[User] (
    [Id]             UNIQUEIDENTIFIER NOT NULL,
    [Username]       NVARCHAR (50)    NOT NULL,
    [HashedPassword] NVARCHAR (170)   NOT NULL,
    [Salt]           UNIQUEIDENTIFIER NOT NULL
);