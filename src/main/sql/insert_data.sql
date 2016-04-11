USE SocialMe;

#All passwords are 'password' (without quotes)
INSERT INTO User 
    (email, password, first_name, last_name, gender, birth_date, created_date)
VALUES 
    ('john.smith@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'John', 'Smith', 'M', NULL, CURRENT_TIMESTAMP()),
    ('jane.doe@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jane', 'Doe', 'F', '1979-04-11', CURRENT_TIMESTAMP()),
    ('michael.connolly@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Michael', 'Connolly', 'M', NULL, CURRENT_TIMESTAMP()),
    ('paul.johnson@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Paul', 'Johnson', 'M', NULL, CURRENT_TIMESTAMP()),
    ('ann.lee@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ann', 'Lee', 'F', NULL, CURRENT_TIMESTAMP()),
    ('paddy.robertson@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Paddy', 'Robertson', 'M', NULL, CURRENT_TIMESTAMP()),
    ('mary.gibbons@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Mary', 'Gibbons', 'F', NULL, CURRENT_TIMESTAMP());

INSERT INTO Friendship 
    (user_a_id, user_b_id, friendship_status_id, request_time, response_time)
VALUES 
    (1, 2, 1, CURRENT_TIMESTAMP(), NULL), #John has requested to be Jane's friend
    (1, 3, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()), #John and Michael are friends (Michael accepted John's request)
    (4, 2, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (2, 3, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (2, 5, 1, CURRENT_TIMESTAMP(), NULL),
    (1, 4, 1, CURRENT_TIMESTAMP(), NULL),
	  (5, 1, 1, CURRENT_TIMESTAMP(), NULL),
    (2, 7, 1, CURRENT_TIMESTAMP(), NULL),
    (3, 5, 1, CURRENT_TIMESTAMP(), NULL);

INSERT INTO Post 
    (by_user_id, for_user_id, post_text, created_time)
VALUES 
    (1, 1, 'Heading to the hospital today - eek!', '2016-03-25 07:23:54'),
    (2, 2, 'This is my first post. I love SocialMe!', '2016-03-25 20:24:50'),
    (1, 3, 'Michael, check out my x-ray.', '2016-03-25 20:40:05'),
    (3, 1, 'Hope you get better soon, John!', '2016-03-25 21:30:55'),
    (3, 3, 'I hope I can find some school friends on SocialMe', '2016-03-25 22:42:14'),
    (2, 4, 'Hi Paul, glad to have found you on here! Jane', '2016-03-25 22:45:24'),
    (2, 2, 'My own wall, la la la.', '2016-03-26 00:46:57'),
    (2, 3, 'Hi Michael, long time no see..! Jane', '2016-03-26 00:48:58'),
    (3, 2, 'Hi Jane, it has been way too long. What are you up to these days? Miss you!', '2016-03-26 09:06:18');
