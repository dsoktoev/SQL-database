DROP TABLE IF EXISTS movie_insert_log;
DROP TABLE IF EXISTS movie_update_log;
DROP TABLE IF EXISTS movie_delete_log;

CREATE TABLE movie_insert_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(100),
    release_year INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE movie_update_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    old_title VARCHAR(255),
    new_title VARCHAR(255),
    old_genre VARCHAR(100),
    new_genre VARCHAR(100),
    old_release_year INT,
    new_release_year INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE movie_delete_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(100),
    release_year INT,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TRIGGER log_movie_insert
AFTER INSERT ON movies
FOR EACH ROW
    INSERT INTO movie_insert_log (title, genre, release_year)
    VALUES (NEW.title, NEW.genre, NEW.release_year);

CREATE TRIGGER log_movie_update
AFTER UPDATE ON movies
FOR EACH ROW
    INSERT INTO movie_update_log (
        old_title, new_title, old_genre, new_genre, old_release_year, new_release_year
    ) VALUES (
        OLD.title, NEW.title, OLD.genre, NEW.genre, OLD.release_year, NEW.release_year
    );

CREATE TRIGGER log_movie_delete
AFTER DELETE ON movies
FOR EACH ROW
    INSERT INTO movie_delete_log (title, genre, release_year)
    VALUES (OLD.title, OLD.genre, OLD.release_year);