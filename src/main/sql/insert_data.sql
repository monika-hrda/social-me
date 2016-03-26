USE SocialMe;

INSERT INTO User 
    (email, password, first_name, last_name, gender, created_date, last_login_date)
VALUES 
    ('john.smith@email.com', 'pass', 'John', 'Smith', 'M', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('jane.doe@email.com', 'pass', 'Jane', 'Doe', 'F', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('michael.connolly@email.com', 'pass', 'Michael', 'Connolly', 'M', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('paul.johnson@email.com', 'pass', 'Paul', 'Johnson', 'M', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('ann.lee@email.com', 'pass', 'Ann', 'Lee', 'F', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('paddy.robertson@email.com', 'pass', 'Paddy', 'Robertson', 'M', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    ('mary.gibbons@email.com', 'pass', 'Mary', 'Gibbons', 'F', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP());

INSERT INTO Friendship 
    (user_a_id, user_b_id, friendship_status_id, request_time, response_time)
VALUES 
    (1, 2, 1, CURRENT_TIMESTAMP(), NULL), #John has requested to be Jane's friend
    (1, 3, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()), #John and Michael are friends (Michael accepted John's request)
    (4, 2, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (2, 3, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (2, 5, 1, CURRENT_TIMESTAMP(), NULL),
    (1, 4, 1, CURRENT_TIMESTAMP(), NULL),
	  (5, 1, 1, CURRENT_TIMESTAMP(), NULL);

INSERT INTO Post 
    (by_user_id, for_user_id, post_text, created_time)
VALUES 
    (1, 1, 'Heading to the hospital today - eek!', CURRENT_TIMESTAMP()),
    (2, 2, 'This is my first post. I love SocialMe!', CURRENT_TIMESTAMP()),
    (1, 3, 'Check out my x-ray.', CURRENT_TIMESTAMP()),
    (3, 1, 'Hope you get better soon, John!', CURRENT_TIMESTAMP()),
    (3, 3, 'I hope I can find some school friends on SocialMe', CURRENT_TIMESTAMP());
