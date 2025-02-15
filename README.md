1. Users Table:
Stores user account details.
2. Interests Table:

Stores different user interests.

3. User Interests Table:

Tracks the relationship between users and their interests.
4. Posts Table:

Stores posts made by users, including upvotes, downvotes, and recommendations.

Sample Data:
Example of inserting data into tables:

INSERT INTO users (email, username, user_password, gender) VALUES ('fake@dusttoash.org', 'Database', 'abcdefgh', 'Male');
INSERT INTO interests (interest_name) VALUES ('MySQL'), ('Database Management');
INSERT INTO user_interests (user_id, interest_id) VALUES (1, 2);

Queries:

Retrieving all users and interests:
