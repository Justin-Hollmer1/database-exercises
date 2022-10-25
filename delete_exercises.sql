USE codeup_test_db;

SELECT 'These are albums after 1991' AS 'Info';
DELETE FROM albums WHERE release_date >= 1991;

SELECT 'These are all albums with genre of Disco' AS 'Info';
DELETE FROM albums WHERE genre = 'Disco';

SELECT 'These are all albums by Michael Jackson' AS 'Info';
DELETE FROM albums WHERE artist = 'Michael Jackson';