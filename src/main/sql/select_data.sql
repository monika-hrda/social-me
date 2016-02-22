USE SocialMe;

--#Get all the users
SELECT * FROM User;

--#Get all the relationships and joins to show the email addresses of each user
SELECT
    UF.user_a_id,
    UF.user_b_id,
    U1.email AS FriendOne,
    U2.email AS FriendTwo,
    UF.status
FROM Friendship UF
JOIN User U1 ON U1.id = UF.user_a_id
JOIN User U2 ON U2.id = UF.user_b_id;

--#Get all the Posts
SELECT * FROM SocialMe.Post;

--#Build a wall for Michael (user_id 3)
SELECT
    P.id,
    U1.first_name AS PostedBy,
    U2.first_name AS ForWallOfUser,
    P.text,
    P.created_date
FROM Post P
JOIN User U1 ON U1.id = P.user_id
JOIN User U2 ON U2.id = P.for_user_id
WHERE P.for_user_id = 3
ORDER BY P.created_date DESC; #Put the most recent posts at the top of the wall
