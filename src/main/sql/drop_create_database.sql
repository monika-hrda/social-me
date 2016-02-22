DROP DATABASE SocialMe;

CREATE DATABASE SocialMe;

USE SocialMe;

CREATE TABLE User (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(50) NOT NULL,
    password CHAR(40) NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    gender ENUM('M','F') NOT NULL,
    avatar_filename VARCHAR(200),
    created_date TIMESTAMP,
    last_login_date TIMESTAMP, 
    UNIQUE (email)
);

CREATE TABLE Status (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(20)
);

INSERT INTO Status
    (id, name)
VALUES
    (1, 'requested'),
    (2, 'accepted'),
    (3, 'rejected');

/*This table stores the relationships between pairs of users.
user1_id stores the id of the user who initiated the relationship (made a friend request).
user2_id stores the id of the other party in the relationship.
*/
CREATE TABLE Friendship (
    friendship_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_a_id INT NOT NULL,
    user_b_id INT NOT NULL,
    status TINYINT NOT NULL,
    request_time TIMESTAMP NOT NULL,
    response_time TIMESTAMP NOT NULL,
    FOREIGN KEY (user_a_id) REFERENCES User (id) ON DELETE CASCADE,
    FOREIGN KEY (user_b_id) REFERENCES User (id) ON DELETE CASCADE,
    FOREIGN KEY (status) REFERENCES Status (id)
);

/*
This table stores wall posts created by a user.
A wall post can have either text, or an image, or both.
The web application should validate that one of the two is present (text or image) before saving.
*/
CREATE TABLE Post (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL, --#This is the user who created the post.
    for_user_id INT NOT NULL, --#This is the user the post is for, used in building a user's wall.
    text VARCHAR(500),
    image_filename VARCHAR(200),
    created_date TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES User (id),
    FOREIGN KEY (for_user_id) REFERENCES User (id)
);
