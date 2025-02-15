Database Structure
1. Users Table
Stores user account details.

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email CHAR(128) NOT NULL,
    username CHAR(32) NOT NULL,
    user_password CHAR(255) NOT NULL,
    gender CHAR(40)
);
3. Interests Table
Stores different user interests.

CREATE TABLE interests (
    interest_name CHAR(40) NOT NULL,
    id INT AUTO_INCREMENT PRIMARY KEY
);
3. User Interests Table
Tracks the relationship between users and their interests.

CREATE TABLE user_interests (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    interest_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (interest_id) REFERENCES interests(id)
);
4. Posts Table
Stores posts made by users, including upvotes, downvotes, and recommendations.

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
Sample Data
Example of inserting data into tables:

INSERT INTO users (email, username, user_password, gender) VALUES ('fake@dusttoash.org', 'Database', 'abcdefgh', 'Male');
INSERT INTO interests (interest_name) VALUES ('MySQL'), ('Database Management');
INSERT INTO user_interests (user_id, interest_id) VALUES (1, 2);
Queries
Retrieving all users and interests:
SELECT * FROM users;
SELECT * FROM interests;

