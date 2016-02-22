USE SocialMe;

INSERT INTO User 
    (email, password, first_name, last_name, gender, created_date, last_login_date)
VALUES 
    ('john.smith@email.com', 'password1', 'John', 'Smith', 'M', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('jane.doe@email.com', 'password2', 'Jane', 'Doe', 'F', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('michael.connolly@email.com', 'password3', 'Michael', 'Connolly', 'M', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

INSERT INTO Friendship 
    (user_a_id, user_b_id, status)
VALUES 
    (1, 2, 1), --#John has requested to be Jane's friend
    (1, 3, 2); --#John and Michael are friends (Michael accepted John's request)

INSERT INTO Post 
    (user_id, for_user_id, text, created_date)
VALUES 
    (1, 1, 'Heading to the hospital today - eek!', CURRENT_TIMESTAMP()),
    (2, 2, 'This is my first post!', CURRENT_TIMESTAMP()),
    (2, 2, 'This is my second post. I love SocialMe!', CURRENT_TIMESTAMP()),
    (1, 3, 'Check out my x-ray.', CURRENT_TIMESTAMP()),
    (3, 1, 'Hope you get better soon, John!', CURRENT_TIMESTAMP()),
    (3, 3, 'I hope I can find some school friends on SocialMe', CURRENT_TIMESTAMP());
