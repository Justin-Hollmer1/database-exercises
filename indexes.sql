SHOW TABLES;
ALTER TABLE albums ADD UNIQUE (name, artist);
DESCRIBE albums;
