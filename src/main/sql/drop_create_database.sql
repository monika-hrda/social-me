DROP DATABASE SocialMe;

CREATE DATABASE SocialMe;

USE SocialMe;

CREATE TABLE User (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password CHAR(40) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender ENUM('M','F') NOT NULL, #Consider changing to is_male BIT(1)
    profile_image_filename VARCHAR(500),
    profile_image_filename_thumb VARCHAR(500),
    created_date TIMESTAMP,
    last_login_date TIMESTAMP, 
    UNIQUE (email)
);

CREATE TABLE Friendship_Status (
    id INT NOT NULL PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO Friendship_Status
    (id, name)
VALUES
    (1, 'requested'),
    (2, 'accepted');

/*This table stores the relationships between pairs of users.
user_a_id stores the id of the user who initiated the relationship (made a friend request).
user_b_id stores the id of the other party in the relationship.
*/
CREATE TABLE Friendship (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_a_id INT NOT NULL,
    user_b_id INT NOT NULL,
    friendship_status_id INT NOT NULL,
    request_time TIMESTAMP NOT NULL,
    response_time TIMESTAMP,
    FOREIGN KEY (user_a_id) REFERENCES User (id) ON DELETE CASCADE,
    FOREIGN KEY (user_b_id) REFERENCES User (id) ON DELETE CASCADE,
    FOREIGN KEY (friendship_status_id) REFERENCES Friendship_Status (id)
);

/*
This table stores wall posts created by a user.
A wall post can have either text, or an image, or both.
The web application should validate that one of the two is present (text or image) before saving.
*/
CREATE TABLE Post (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    by_user_id INT NOT NULL, #This is the user who created the post.
    for_user_id INT NOT NULL, #This is the user the post is for, used in building a user's wall.
    post_text VARCHAR(500),
    post_image_filename VARCHAR(500),
    post_image_filename_thumb VARCHAR(500),
    created_time TIMESTAMP NOT NULL,
    FOREIGN KEY (by_user_id) REFERENCES User (id),
    FOREIGN KEY (for_user_id) REFERENCES User (id)
);

/*
This table stores comments made by users on posts.
It is purposely plural because 'comment' is a reserved keyword.
Only text comments are available for now.
*/
CREATE TABLE Comments (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text VARCHAR(500) NOT NULL,
    created_time TIMESTAMP NOT NULL,
    FOREIGN KEY (post_id) REFERENCES Post (id),
    FOREIGN KEY (user_id) REFERENCES User (id)
);
