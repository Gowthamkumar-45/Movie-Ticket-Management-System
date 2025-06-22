												-- DRL(Data Retrival Language) --
                                                            
                                                            
use project_2;
                                                            
 -- 1.Find users who are older than 30 years?
 
SELECT first_name, last_name, date_of_birth 
FROM users 
WHERE YEAR(CURDATE()) - YEAR(date_of_birth) > 30;

-- 2.List all showtimes with price between ₹180 and ₹220?

SELECT * FROM showtimes 
WHERE base_price BETWEEN 180 AND 220;

-- 3.Find movies in English OR Hindi language?

SELECT title, language FROM movies 
WHERE language = 'English' OR language = 'Hindi';

-- 4.Find seats that are not available?

SELECT seat_id, seat_number FROM seats  where is_available = False;


												-- DDL (Data Definition Language) --

-- 1.Add a new column is_blockbuster to the movies table?

ALTER TABLE movies ADD COLUMN is_blockbuster BOOLEAN DEFAULT FALSE;

-- 2.Rename column email to user_email in users?

ALTER TABLE users CHANGE email user_email VARCHAR(150);

-- 3.Drop column description from genres?

ALTER TABLE genres DROP COLUMN description;

-- 4.Change the data type of phone in users to BIGINT?
ALTER TABLE users MODIFY phone BIGINT;


											-- Aggregated Functions + GROUP BY --
                                            
-- 1.Total bookings made by each user?

SELECT user_id, COUNT(*) AS total_bookings 
FROM bookings 
GROUP BY user_id;

-- 2.Total revenue generated per movie?

SELECT s.movie_id, m.title, SUM(b.total_amount) AS total_revenue
FROM bookings b
JOIN showtimes s ON b.showtime_id = s.showtime_id
JOIN movies m ON s.movie_id = m.movie_id
GROUP BY s.movie_id;

-- 3.Count of movies per genre?

SELECT genre, COUNT(*) AS movie_count 
FROM movies 
GROUP BY genre;

-- 4.Average price per seat type?

SELECT st.seat_type_name, AVG(bd.price) AS avg_price
FROM booking_details bd
JOIN seat_types st ON bd.seat_type_id = st.seat_type_id
GROUP BY st.seat_type_name;


													-- ORDER BY--

-- 1.List top 10 users by total amount spent?

SELECT user_id, SUM(total_amount) AS total_spent
FROM bookings 
GROUP BY user_id
ORDER BY total_spent DESC
LIMIT 10;

-- 2. List movies ordered by release date (newest first)?

SELECT title, release_date FROM movies 
ORDER BY release_date DESC;

-- 3.List payments in order of payment amount?

SELECT * FROM payments 
ORDER BY amount_paid DESC;

-- 4. Show reviews ordered by rating (high to low)?ALTER

SELECT * FROM reviews 
ORDER BY rating DESC;


														-- joins--

-- 1.Get movie name, screen name and theater name for each showtime?

SELECT m.title, sc.screen_name, th.theater_name
FROM showtimes st
JOIN movies m ON st.movie_id = m.movie_id
JOIN screens sc ON st.screen_id = sc.screen_id
JOIN theaters th ON sc.theater_id = th.theater_id;

-- 2.List users and their booking status?

SELECT u.first_name, b.booking_id, b.status
FROM users u
JOIN bookings b ON u.user_id = b.user_id;

-- 3.List all payments with booking and user info?

SELECT p.payment_id, b.booking_id, u.first_name, p.amount_paid
FROM payments p
JOIN bookings b ON p.booking_id = b.booking_id
JOIN users u ON b.user_id = u.user_id;

-- 4.Get discount info with bookings using discounted codes (if implemented)?

SELECT b.booking_id, d.discount_code, d.discount_percent
FROM bookings b
JOIN discounts d ON b.discount_id = d.discount_id;


												-- Subqueries --

-- 1.Get users who booked the most expensive show?

SELECT * FROM users 
WHERE user_id IN (
    SELECT user_id FROM bookings 
    WHERE total_amount = (SELECT MAX(total_amount) FROM bookings)
);

-- 2.Movies with bookings more than average?

SELECT m.title FROM movies m 
WHERE movie_id IN (
    SELECT s.movie_id FROM showtimes s
    JOIN bookings b ON s.showtime_id = b.showtime_id
    GROUP BY s.movie_id
    HAVING COUNT(*) > (
        SELECT AVG(cnt) FROM (
            SELECT COUNT(*) AS cnt FROM bookings 
            GROUP BY showtime_id
        ) AS avg_counts
    )
);

-- 3.Users who have made more than 2 bookings?

SELECT first_name FROM users 
WHERE user_id IN (
    SELECT user_id FROM bookings 
    GROUP BY user_id HAVING COUNT(*) > 2
);


-- 4.Seat types with average price more than ₹200?

SELECT seat_type_name FROM seat_types 
WHERE seat_type_id IN (
    SELECT seat_type_id FROM booking_details 
    GROUP BY seat_type_id HAVING AVG(price) > 200
);


													-- Stored Procedures --
-- 1. Procedure to get booking summary by user?

DELIMITER $$
CREATE PROCEDURE GetBookingSummary(IN uid INT)
BEGIN
    SELECT b.booking_id, s.movie_id, m.title, b.total_amount
    FROM bookings b
    JOIN showtimes s ON b.showtime_id = s.showtime_id
    JOIN movies m ON s.movie_id = m.movie_id
    WHERE b.user_id = uid;
END $$
DELIMITER ;

-- call
CALL GetBookingSummary(1101);


-- 2.Procedure to list payments between dates?

DELIMITER $$
CREATE PROCEDURE PaymentsByDate(IN from_date DATE, IN to_date DATE)
BEGIN
    SELECT * FROM payments 
    WHERE payment_date BETWEEN from_date AND to_date;
END $$
DELIMITER ;

-- Call
CALL PaymentsByDate('2024-06-01', '2024-06-08');


												-- Functions --

-- 1.Create a function to calculate age from DOB?

DELIMITER $$
CREATE FUNCTION GetUserAge(dob DATE) RETURNS INT
DETERMINISTIC
BEGIN
  RETURN YEAR(CURDATE()) - YEAR(dob);
END $$
DELIMITER ;

-- Usage:
SELECT first_name, GetUserAge(date_of_birth) AS age FROM users;

-- 2.Create function to calculate discounted price?

DELIMITER $$
CREATE FUNCTION DiscountedPrice(original DECIMAL(10,2), discount DECIMAL(5,2)) RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  RETURN original - (original * discount / 100);
END $$
DELIMITER ;

-- Usage
SELECT DiscountedPrice(400, 10);


													-- Triggers --

-- 1.Prevent booking if the total amount is zero (maybe due to pricing or error)?

DELIMITER $$

CREATE TRIGGER before_insert_booking
BEFORE INSERT ON bookings
FOR EACH ROW
BEGIN
    -- Prevent booking if total amount is zero or negative
    IF NEW.total_amount <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Booking amount must be greater than zero';
    END IF;
END $$

DELIMITER ;

-- test 
INSERT INTO bookings (booking_id, user_id, showtime_id, booking_time, total_amount, status)
VALUES (3001, 1101, 1001, NOW(), 0.00, 'Confirmed');

-- 2.Prevent deletion of movies that are already scheduled in showtimes?
DELIMITER $$

CREATE TRIGGER prevent_delete_scheduled_movies
BEFORE DELETE ON movies
FOR EACH ROW
BEGIN
    DECLARE movie_count INT;
    SELECT COUNT(*) INTO movie_count 
    FROM showtimes 
    WHERE movie_id = OLD.movie_id;

    IF movie_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Cannot delete movie scheduled in showtimes';
    END IF;
END $$

DELIMITER ;
-- test
DELETE FROM movies WHERE movie_id = 901;





























 