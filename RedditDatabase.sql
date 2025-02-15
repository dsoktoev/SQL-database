CREATE DATABASE IF NOT EXISTS Reddit;

CREATE TABLE users (
	id INT AUTO_INCREMENT PRIMARY KEY,
    email CHAR(128) NOT NULL,
    username CHAR(32) NOT NULL,
    user_password CHAR(255) NOT NULL,
    gender CHAR(40)
);

INSERT users (email, username, user_password, gender) VALUE ("fake@dusttoash.org", "Database", "abcdefgh", "Male");

CREATE TABLE interests (
    interest_name CHAR(40) NOT NULL,
    id INT AUTO_INCREMENT PRIMARY KEY
);

INSERT interests (interest_name) VALUE ("MySQL");
INSERT interests (interest_name) VALUE ("Database Management");

CREATE TABLE user_interests (
	id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    interest_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (interest_id) REFERENCES interests(id)
);

SELECT * FROM interests;
SELECT * FROM users;

INSERT user_interests (user_id, interest_id) VALUE (1, 2);

CREATE TABLE posts (
	id INT AUTO_INCREMENT PRIMARY KEY,
    title CHAR(255) NOT NULL,
    content TEXT NOT NULL,
    next_recommended_post INT NOT NULL,
    image_url TEXT NULL,
    upvotes INT,
    downvotes INT,
    creation_date DATETIME NOT NULL,
    poster_id INT NOT NULL,
    FOREIGN KEY (poster_id) REFERENCES users(id),
    FOREIGN KEY (next_recommended_post) REFERENCES posts(id)
);
