/* 
This script can be executed ONCE only.
After doing so, run the updated, followed by the delete script to ensure the database remains clean
*/

INSERT INTO [dbo].[User] ([Id], [Username], [HashedPassword], [Salt]) 
VALUES ('4a0ec243-78ff-4461-8696-c41e7d64e108', 'test@gmail.com', '2d2ee7bee3ae4795ba886ceffa3f03d0b1eeaf75fc9c19c4b22c06956e2d6d54a5a6b798a70758f6aae5918bbc42d91b44cd1ea2f6a445669cc3a5acc852f255', '53dfd42f-5394-46d7-a917-11b7da15816d')