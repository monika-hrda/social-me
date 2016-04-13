USE SocialMe;

INSERT INTO Friendship_Status
    (id, name)
VALUES
    (1, 'requested'),
    (2, 'accepted');

#All passwords are 'password' (without quotes)
INSERT INTO User 
    (email, password, first_name, last_name, gender, profile_image_filename, profile_image_filename_thumb, birth_date, created_date)
VALUES 
    ('john.smith@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'John', 'Smith', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('jane.doe@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jane', 'Doe', 'F', NULL, NULL, '1979-04-11', CURRENT_TIMESTAMP()),
    ('michael.connolly@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Michael', 'Connolly', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('paul.johnson@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Paul', 'Johnson', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('ann.lee@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Ann', 'Lee', 'F', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('paddy.robertson@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Paddy', 'Robertson', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('mary.gibbons@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Mary', 'Gibbons', 'F', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('david.jones@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'David', 'Jones', 'M', 'Uploads/Profile/17bbf304-07f3-418e-a148-14f1d485bf14.jpg', 'Uploads/Profile/THUMBNAIL_17bbf304-07f3-418e-a148-14f1d485bf14.jpg', NULL, CURRENT_TIMESTAMP()),
    ('janet.mchugh@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Janet', 'McHugh', 'F', 'Uploads/Profile/0ed90430-536a-4e86-9825-edd1f63fba32.jpg', 'Uploads/Profile/THUMBNAIL_0ed90430-536a-4e86-9825-edd1f63fba32.jpg', '1979-04-11', CURRENT_TIMESTAMP()),
    ('michael.stephens@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Michael', 'Stephens', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('paul.stapleton@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Paul', 'Stapleton', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('neil.lee@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Neil', 'Lee', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('lorraine.brady@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Lorraine', 'Brady', 'F',NULL, NULL,  NULL, CURRENT_TIMESTAMP()),
    ('mary.smith@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Mary', 'Smith', 'F', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('stephen.jacobs@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Stephen', 'Jacobs', 'M', 'Uploads/Profile/5dd18db3-8a56-4c90-bd88-aaf22e8aa96d.jpg', 'Uploads/Profile/THUMBNAIL_5dd18db3-8a56-4c90-bd88-aaf22e8aa96d.jpg', NULL, CURRENT_TIMESTAMP()),
    ('anna.byrne@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Anna', 'Byrne', 'F', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('frank.mooney@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Frank', 'Mooney', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('jimmy.johnson@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Jimmy', 'Johnson', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('laura.stanley@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Laura', 'Stanley', 'F', NULL, NULL, NULL, CURRENT_TIMESTAMP()),
    ('sean.mahon@email.com', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 'Sean', 'Mahon', 'M', NULL, NULL, NULL, CURRENT_TIMESTAMP());

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
    (3, 5, 1, CURRENT_TIMESTAMP(), NULL),
    
    (8, 9, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (8, 10, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (11, 8, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (12, 8, 1, CURRENT_TIMESTAMP(), NULL),
    (8, 13, 1, CURRENT_TIMESTAMP(), NULL),
    (14, 8, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (14, 10, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (15, 8, 2, CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP()),
    (13, 15, 1, CURRENT_TIMESTAMP(), NULL);

INSERT INTO Post 
    (by_user_id, for_user_id, post_text, post_image_filename, post_image_filename_thumb, created_time)
VALUES 
    (8, 8, 'This is my first post on SocialMe!  It\'s great to be here :)', NULL, NULL, '2016-04-13 00:35:18'),
    (8, 8, 'I just thought I would upload a picture of Freddie, my dog.  What do you think of Freddie?', 'Uploads/Post/fdff70cf-1035-407c-903e-e044834daaa4.jpg', 'Uploads/Post/THUMBNAIL_fdff70cf-1035-407c-903e-e044834daaa4.jpg', '2016-04-13 00:37:00'),
    (8, 8, 'What\'s everyone up to at the weekend?', NULL, NULL, '2016-04-13 00:45:34'),
    (15, 15, 'New car!  Pretty chuffed with myself, I must say.  Been saving forever but it\'s great to see her parked on the driveway.  Roll on the summer ;)', 'Uploads/Post/dc516c17-c1ca-476e-a657-c2364c847469.jpg', 'Uploads/Post/THUMBNAIL_dc516c17-c1ca-476e-a657-c2364c847469.jpg', '2016-04-13 00:51:05'),
    (9, 9, 'Heading away this weekend!  Cannot WAIT.  Feels like it\'s been forever since I was away.  #summerhols', 'Uploads/Post/de1a3be7-961d-468c-ab19-30a3febc40f6.jpg', 'Uploads/Post/THUMBNAIL_de1a3be7-961d-468c-ab19-30a3febc40f6.jpg', '2016-04-13 00:53:26'),
    (1, 1, 'Heading to the hospital today - eek!', NULL, NULL, '2016-03-25 07:23:54'),
    (2, 2, 'This is my first post. I love SocialMe!', NULL, NULL, '2016-03-25 20:24:50'),
    (1, 3, 'Michael, check out my x-ray.', NULL, NULL, '2016-03-25 20:40:05'),
    (3, 1, 'Hope you get better soon, John!', NULL, NULL, '2016-03-25 21:30:55'),
    (3, 3, 'I hope I can find some school friends on SocialMe', NULL, NULL, '2016-03-25 22:42:14'),
    (2, 4, 'Hi Paul, glad to have found you on here! Jane', NULL, NULL, '2016-03-25 22:45:24'),
    (2, 2, 'My own wall, la la la.', NULL, NULL, '2016-03-26 00:46:57'),
    (2, 3, 'Hi Michael, long time no see..! Jane', NULL, NULL, '2016-03-26 00:48:58'),
    (3, 2, 'Hi Jane, it has been way too long. What are you up to these days? Miss you!', NULL, NULL, '2016-03-26 09:06:18');
    
INSERT INTO Comments
    (post_id, user_id, comment_text, created_time)
VALUES
    (2, 9, 'Oh my, he\'s adorable!  What a great photo, too.  Love him!', '2016-04-13 00:38:42'),
    (2, 8, 'Thanks, Janet.', '2016-04-13 00:45:03'),
    (3, 15, 'No plans, David.  You?', '2016-04-13 00:46:46'),
    (3, 8, 'Might catch a movie if I can.  Taking it easy apart from that ;)', '2016-04-13 00:48:14'),
    (4, 8, 'You did well!', '2016-04-13 00:51:33'),
    (5, 8, 'Enjoy, Janet!  Well deserved.', '2016-04-13 00:53:52');
    
INSERT INTO Likes
    (post_id, user_id)
VALUES
    (2,	9),
    (3,	15),
    (4,	8),
    (5,	8);
    
